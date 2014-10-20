package com.rjxy.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.biz.ExamineService;
import com.rjxy.biz.JudgeService;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.exam.AutomaticExtract;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.ManualExtract;
import com.rjxy.entity.exam.QuestionType;
import com.rjxy.entity.exam.Score;
import com.rjxy.entity.exam.SerializablePaper;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.page.PageBean;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/judge")
public class JudgeAction {
	@Autowired
	private JudgeService judgeService;
	@Autowired
	private ExamineService judgeExamineService;
	
	
	@RequestMapping("/listExamTask/pageNum/{pageNum}")
	public String listExamTask(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		judgeService.initTaskPageBean(pageNum_, tea_id, "ENDED");
		PageBean<ExamTask> pageBean_end = judgeService.getExamTaskByTeaId();
		List<ExamTask> endTaskList = pageBean_end.getList();
		modelMap.addAttribute("pageBean_end",pageBean_end);
		modelMap.addAttribute("examTaskList", endTaskList);
		return "JudgeExam/list_endTask";
	}
	
	@RequestMapping("/showScore/{examTask_id}")
	public String showScore(@PathVariable("examTask_id") String examTask_id,ModelMap modelMap){
		List<Score> scoreList=judgeService.getScoreListByExamTask(examTask_id);
		modelMap.addAttribute("scoreList", scoreList);
		return "JudgeExam/list_score";
	}
	@RequestMapping("/judgeScore/{stu_id}/{examTask_id}")
	public String judgeScore(@PathVariable("stu_id") String stu_id,@PathVariable("examTask_id") String examTask_id,ModelMap modelMap,HttpServletRequest request) throws IOException, ClassNotFoundException{
		HttpSession session=request.getSession();
		ExamTask examTask=judgeService.getExamTaskById(examTask_id);
		StudentInformation student=judgeService.getStudentById(stu_id);
		String exam_id=examTask.getExamPaper().getExam_id();
		String grade_name=examTask.getExamPaper().getGradeInformation().getGrade_name();
		String user_name=student.getStu_name();
		String stu_class=student.getClassInformation().getClass_name();
		String fileName=user_name+"-"+stu_id+"-"+examTask.getExamNature().getNature_id()+".obj";
		FileInputStream in;
		in = new FileInputStream("d:/score/"+exam_id+"/"+examTask_id+"/"+grade_name+"/"+stu_class+"/"+fileName);
		ObjectInputStream s = new ObjectInputStream(in);  
		SerializablePaper serializablePaper = (SerializablePaper)s.readObject();
		modelMap.addAttribute("serializablePaper",serializablePaper);
		session.setAttribute("serializablePaper", serializablePaper);
		return "JudgeExam/judgeExam";
	}
	
	@RequestMapping("/downloadFile/{num}")
	public void downloadFile(@PathVariable("num") String num, HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=UTF-8");  
        request.setCharacterEncoding("UTF-8");  
		HttpSession session=request.getSession();
		BufferedInputStream bis = null;  
        BufferedOutputStream bos = null;  
		SerializablePaper serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
		String paper_id = serializablePaper.getPaper_id();
		String task_id = serializablePaper.getTask_id();
		String stu_class = serializablePaper.getStu_class();
		String grade_name = serializablePaper.getGrade_name();
		String filePath = "d:/score/"+paper_id+"/"+task_id+"/"+grade_name+"/"+stu_class;
		String fileName = serializablePaper.getStu_name()+"-"+serializablePaper.getStu_id()+"-Num"+num+".rar";
		String realPath = filePath+"/"+fileName;
		File obj = new File(realPath);
		if (!obj.exists()) {
			fileName = serializablePaper.getStu_name()+"-"+serializablePaper.getStu_id()+"-Num"+num+".zip";
			realPath = filePath+"/"+fileName;
		}
		obj = new File(realPath);
		if(!obj.exists()){
			response.getWriter().print( "<script>alert('学生未提交此试题!');</script>" );
		}else{
			long fileLength = new File(realPath).length();  
			  
	        response.setContentType("application/octet-stream");  
	        response.setHeader("Content-disposition", "attachment; filename=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));  
	        response.setHeader("Content-Length", String.valueOf(fileLength));  
	        bis = new BufferedInputStream(new FileInputStream(realPath));  
	        bos = new BufferedOutputStream(response.getOutputStream());  
	        byte[] buff = new byte[2048];  
	        int bytesRead;  
	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
	            bos.write(buff, 0, bytesRead);  
	        }  
	        bis.close();  
	        bos.close();  
		}
	}
	
	@RequestMapping("/saveJudgeScore/{stu_id}/{examTask_id}")
	public ModelAndView saveJudgeScore(@PathVariable("stu_id") String stu_id,@PathVariable("examTask_id") String examTask_id,ModelMap modelMap,HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		SerializablePaper serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
		Score score=judgeService.getScoreById(stu_id, examTask_id);
		String[] shortAnswers=request.getParameterValues("shortAnswer");
		float[] eachShortAnswer= new float[50];
		float shortAnswerScore=0;
		if(shortAnswers!=null){
		for(int i=0;i<shortAnswers.length;i++){
			if(StringUtils.isBlank(shortAnswers[i])){
				shortAnswers[i]="0";
			}
			eachShortAnswer[i]=Float.valueOf(shortAnswers[i]);
			shortAnswerScore+=eachShortAnswer[i];
		}}
		String[] comprehensive=request.getParameterValues("comprehensive");
		float[] eachComprehensive =new float[50];
		float comprehensiveScore=0;
		if(comprehensive!=null){
		for(int i=0;i<comprehensive.length;i++){
			if(StringUtils.isBlank(comprehensive[i])){
				comprehensive[i]="0";
			}
			eachComprehensive[i]=Float.valueOf(comprehensive[i]);
			comprehensiveScore+=eachComprehensive[i];
		}}
		serializablePaper.setEachShortAnswer(eachShortAnswer);
		serializablePaper.setEachComprehensive(eachComprehensive);
		serializablePaper.setShortAnswerScore(shortAnswerScore);
		serializablePaper.setEachShortAnswer(eachShortAnswer);
		serializablePaper.setComprehensiveScore(comprehensiveScore);
		score.setShortAnswerScore(shortAnswerScore);
		score.setComprehensiveScore(comprehensiveScore);
		score.setTotalScore(score.getChoiceScore()+score.getClozeScore()+score.getShortAnswerScore()+score.getComprehensiveScore());
		score.setJudge(1);
		judgeExamineService.serializableExamPaper(serializablePaper);
		judgeService.updateScore(score);
		return new ModelAndView("redirect:/judge/showScore/"+examTask_id);
	}
	
	@RequestMapping("/statisticsScore/{task_id}/{paper_id}")
	public String statisticsScore(@PathVariable("task_id") String task_id, @PathVariable("paper_id") String paper_id, ModelMap modelMap){
		//统计通过人数
		int passNum = judgeService.getPassScoreByTaskId(task_id);
		int noPassNum = judgeService.getnoPassScoreByTaskId(task_id);
		modelMap.addAttribute("passNum", passNum);
		modelMap.addAttribute("noPassNum", noPassNum);
		return "JudgeExam/statisticsPaper";
	}

}
