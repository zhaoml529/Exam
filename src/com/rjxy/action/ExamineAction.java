package com.rjxy.action;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjxy.biz.ExamService;
import com.rjxy.biz.ExamineService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.exam.AutomaticExtract;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.ManualExtract;
import com.rjxy.entity.exam.SerializablePaper;
import com.rjxy.entity.question.*;
import com.rjxy.util.IP;
import com.rjxy.util.DateUtil;


@Controller
@RequestMapping("/examine")
public class ExamineAction {
	@Autowired
	private ExamineService examineService;
	@Autowired
	private ExamService examService;
		
	@RequestMapping("/searchExamine")
	public String searchExamine(HttpServletRequest request,ModelMap modelMap) throws Exception{
		HttpSession session = request.getSession();
		StudentInformation student = (StudentInformation) session.getAttribute("LoginUser");
		//1.学生登录根据自己的年级.专业.班级  查找fw_course中的 科目（科目会有多个科目） 和老师  
		String grade = String.valueOf(student.getGradeInformation().getGrade_id());
		String profession = String.valueOf(student.getProfessionInformation().getProfession_id());
		String classes = String.valueOf(student.getClassInformation().getClass_id());
		String leftTime = null;
		List<ExamTask> examTaskList_ = new ArrayList<ExamTask>();
		List<ClassInformation> class_List = examineService.getClassInformationList();
		List<Course> courseList = examineService.getCourseList(grade, profession, classes);
		if(courseList == null){
			throw new Exception("您没有任何科目可考试，请联系管理员！");
		}else for(int i=0;i<courseList.size();i++){
			//2.根据科目ID和教师ID和年级ID和班级 去exam_information 里查找是否有考试任务
			Course course= courseList.get(i);
			String subject_id = String .valueOf(course.getSubject().getSubject_id());
			String tea_id = String .valueOf(course.getTeacherInformation().getTea_id());
			String grade_id = String.valueOf(student.getGradeInformation().getGrade_id());
			String class_id = String .valueOf(student.getClassInformation().getClass_id());
			List<ExamTask> examTaskList = examineService.getExamTaskList(subject_id, tea_id, grade_id);
			if(examTaskList!=null){
				//3.对比时间 检查是否可以进行考试
				for(ExamTask examTask:examTaskList){
					String[] class_ = examTask.getClass_id().split(",");
					for(String classList:class_){
						if(class_id.equals(classList)){
							//此学生所在班级有考试任务
							if(!"ENDED".equals(examTask.getExamTask_status())){
								Date examTask_start = DateUtil.StringToDate(examTask.getExamTask_start(), "yyyy-MM-dd HH:mm:ss");
								Date examTask_end = DateUtil.StringToDate(examTask.getExamTask_end(), "yyyy-MM-dd HH:mm:ss");
								if(examTask_start.getTime()>new Date().getTime()){
									//还有leftTime时间开始考试
									leftTime = DateUtil.secondToString((examTask_start.getTime()-new Date().getTime())/1000);
									examTask.setExamTask_leftTime(leftTime);
								}else if(examTask_start.getTime()<new Date().getTime() && examTask_end.getTime()>new Date().getTime()){
									leftTime = DateUtil.secondToString((examTask_end.getTime()-new Date().getTime())/1000);
									examTask.setExamTask_leftTime(leftTime);
									examTask.setExamTask_status("RUNNING");
								}else if(examTask_end.getTime()<new Date().getTime()){
									examTask.setExamTask_status("ENDED");//考试结束标志
								}
								examTaskList_.add(examTask);
								examService.updateExamTask(examTask);
							}
						}
					}
				}
			}
		}
		//未开始的考试任务
		modelMap.addAttribute("examTaskList", examTaskList_);
		modelMap.addAttribute("classList", class_List);
		return "OnlineExam/showExam";
	}
	
	
	@RequestMapping("/createExamine/{examTask_id}")
	public String createExamine(@PathVariable("examTask_id") String examTask_id,HttpServletRequest request,ModelMap modelMap) throws Exception{
		HttpSession session = request.getSession();
		String stu_id = (String)session.getAttribute("user_id");
		SerializablePaper serializablePaper=(SerializablePaper)session.getAttribute("SerializablePaper");
		if(serializablePaper==null){
			serializablePaper=new SerializablePaper();
		}
	
		long leftTime = 0;	//考试剩余时间
		float paperScore = 0;
		ExamTask examTask = examineService.getExamTaskById(examTask_id);
		StudentInformation student = examineService.getStudentById(stu_id);
		ExamPaper examPaper = examTask.getExamPaper();
		String exam_id = examPaper.getExam_id();
		String task_id = examTask.getExamTask_id();
		int exam_way = examPaper.getExam_way();
		String user_name = (String) session.getAttribute("user_name");
		String user_id = (String) session.getAttribute("user_id");
		String stu_class = student.getClassInformation().getClass_name();
		String grade_name = student.getGradeInformation().getGrade_name();
		String fileName=user_name+"-"+user_id+"-"+examTask.getExamNature().getNature_id()+".obj";
		int checkExam=0;
		FileInputStream in;
		try {
			in = new FileInputStream("d:/score/"+exam_id+"/"+task_id+"/"+grade_name+"/"+stu_class+"/"+fileName);
			ObjectInputStream s = new ObjectInputStream(in);  
			serializablePaper = (SerializablePaper)s.readObject();
		    checkExam=1;
		    //找到序列化文件
		} catch (Exception e) {
			checkExam=0;
		} 
		
		//Begin--计算考试剩余时间
		Date nowTime = new Date();
		Date examTask_start = DateUtil.StringToDate(examTask.getExamTask_start(), "yyyy-MM-dd HH:mm:ss");
		Date examTask_end = DateUtil.StringToDate(examTask.getExamTask_end(), "yyyy-MM-dd HH:mm:ss");
	
		if(nowTime.getTime() < examTask_start.getTime()){
			leftTime = -1;
		}else if(nowTime.getTime() > examTask_end.getTime()){
			leftTime = 0;
		}else{
			leftTime = (examTask_end.getTime()-nowTime.getTime())/1000;
		}
		//End
		if(checkExam == 0){
			//没找到序列化文件
			List<Choice> choiceList = new ArrayList<Choice>(100);
			List<Cloze> clozeList = new ArrayList<Cloze>(100);
			List<ShortAnswer> shortList = new ArrayList<ShortAnswer>(50);
			List<Comprehensive> compreList = new ArrayList<Comprehensive>(50);
			List<Integer> questionType = new ArrayList<Integer>();
			
			if(exam_way == 0){
				//手动抽提
				List<ManualExtract> list = examineService.getManualExtractByExamId(exam_id);
				for(int i=0;i<list.size();i++){
					ManualExtract me = list.get(i);
					String questionId[] = me.getQuestion_id().split("-");
					int type = me.getQuestionType().getType_id();
					questionType.add(type);
					switch (type) {
						case 1:{
							for(int j=0;j<questionId.length;j++){
								Choice choice = examineService.getChoiceById(Integer.parseInt(questionId[j]));
								choiceList.add(choice);
							}
							paperScore += me.getQuestion_score();
							break;
						}
						case 2:{
							for(int j=0;j<questionId.length;j++){
								Cloze cloze = examineService.getClozeById(Integer.parseInt(questionId[j]));
								clozeList.add(cloze);
							}
							paperScore += me.getQuestion_score();
							break;
						}
						case 3:{
							for(int j=0;j<questionId.length;j++){
								ShortAnswer shortAnswer = examineService.getShortAnswerById(Integer.parseInt(questionId[j]));
								shortList.add(shortAnswer);
							}
							paperScore += me.getQuestion_score();
							break;
						}
						case 4:{
							for(int j=0;j<questionId.length;j++){
								Comprehensive compre = examineService.getComperById(Integer.parseInt(questionId[j]));
								compreList.add(compre);
							}
							paperScore += me.getQuestion_score();
							break;
						}
					}
				}
			}else{
				//自动抽题
				String subject_id = String.valueOf(examPaper.getSubject().getSubject_id());
				String grade_id = String.valueOf(examPaper.getGradeInformation().getGrade_id());
				List<AutomaticExtract> autoList = examineService.getAutomaticExtractByExamId(exam_id);
				for(AutomaticExtract auto: autoList){
					int type = auto.getQuestionType().getType_id();
					switch(type){
						case 1:{//科目，年级，难度，数量
							choiceList = examineService.getAutoChoiceList(subject_id, grade_id, String.valueOf(auto.getDifficulty()), auto.getQuestion_num());
							if(choiceList!=null&&choiceList.size()!=0){
							for(Choice choice:choiceList){
								paperScore+=choice.getQuestion_score();
							}
							}
							break;
						}
						case 2:{
							clozeList = examineService.getAutoClozeList(subject_id, grade_id, String.valueOf(auto.getDifficulty()), auto.getQuestion_num());
							if(clozeList!=null&&clozeList.size()!=0){
							for(Cloze cloze:clozeList){
								paperScore+=cloze.getQuestion_score();
							}
							}
							break;
						}
						case 3:{
							shortList = examineService.getAutoShortAnswerList(subject_id, grade_id, String.valueOf(auto.getDifficulty()), auto.getQuestion_num());
							if(shortList!=null&&shortList.size()!=0){
							for(ShortAnswer shortAnswer:shortList){
								paperScore+=shortAnswer.getQuestion_score();
							}
							}
							break;
						}
						case 4:{
							compreList = examineService.getAutoComprehensiveList(subject_id, grade_id, String.valueOf(auto.getDifficulty()), auto.getQuestion_num());
							if(compreList!=null&&compreList.size()!=0){
							for(Comprehensive compre:compreList){
								paperScore+=compre.getQuestion_score();
							}
							}
							break;
						}
					
					}
				}
				
			}
			serializablePaper.setStu_name(user_name);
			serializablePaper.setStu_id(user_id);
			serializablePaper.setGrade_name(grade_name);
			serializablePaper.setStu_class(stu_class);
			String ip = IP.getIpAddr(request);
			serializablePaper.setIpAddress(ip);
			serializablePaper.setPaper_id(exam_id);
			serializablePaper.setTask_id(task_id);
			serializablePaper.setTotScore(0);
			serializablePaper.setPaperScore(paperScore);
			serializablePaper.setPassScore(examPaper.getPassScore());
			serializablePaper.setPaper_start(examTask.getExamTask_start());
			serializablePaper.setPaper_end(examTask.getExamTask_end());
			serializablePaper.setAddress(examTask.getExamTask_address());
			serializablePaper.setChackteacher(examTask.getExamTask_teacher());
			serializablePaper.setPaper_leftTime(leftTime);
			serializablePaper.setPaper_name(examPaper.getExam_name());
			serializablePaper.setPaper_subject(examPaper.getSubject().getSubject_name());
			serializablePaper.setExamNature(examTask.getExamNature().getNature_id());
			serializablePaper.setQuedtionType(questionType);
			serializablePaper.setCommitDate("0");
			serializablePaper.setChoiceList(choiceList);
			serializablePaper.setClozeList(clozeList);
			serializablePaper.setShortAnswerList(shortList);
			serializablePaper.setComprehensiveList(compreList);
			boolean flag = false;
			flag = examineService.serializableExamPaper(serializablePaper);
			if(flag){
				modelMap.addAttribute("serializablePaper", serializablePaper);
				session.setAttribute("serializablePaper", serializablePaper);
				modelMap.addAttribute("examTask", examTask);
				return "OnlineExam/OnlineExam";
			}
		}else{
			//找到序列化文件
			modelMap.addAttribute("serializablePaper", serializablePaper);
			session.setAttribute("serializablePaper", serializablePaper);
			return "OnlineExam/OnlineExam";
			
		}
		
		return null;
		
	}
	
	@RequestMapping("showExamineResult.action")
	public String showExamineResult(HttpServletRequest request,ModelMap modelMap) throws Exception{
		return null;	
	}
	
}
