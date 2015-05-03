package com.rjxy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.biz.ExamService;
import com.rjxy.biz.ExamineService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.AutomaticExtract;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.ManualExtract;
import com.rjxy.entity.exam.QuestionType;
import com.rjxy.entity.exam.Subject;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.page.PageBean;
import com.rjxy.util.BeanUtils;
import com.rjxy.util.DateUtil;
import com.rjxy.util.ID;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/exam")
public class ExamAction {
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamineService exam_ExamineService;
	private ExamPaper examPaper;
	private ExamTask examTask;
	
	@RequestMapping("/listExamPaper/pageNum/{pageNum}")
	public String listExamPaper(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		examService.initPaperPageBean(pageNum_, tea_id);
		PageBean<ExamPaper> pageBean = examService.getExamPaperByTeaId();
		List<ExamPaper> list = pageBean.getList();
		List<Course> courseList = examService.getCourseListByTeaId(tea_id);
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("paperList",list);
		modelMap.addAttribute("courseList",courseList);
		return "ExamPaper/list_paper";
	}
	
	
	/*
	 *  @PathVariable的变量名name必须与@RequestMapping里面的{name}名称一样
	 *  @RequestMapping(value = "/addExamPaper/{user_id}", method = RequestMethod.GET)
	 */
	@RequestMapping("/addExamPaper/user_id/{user_id}")
	public String addExamPaper(@PathVariable("user_id") String user_id, HttpServletRequest request, ModelMap modelMap){
		List<Course> courseList = examService.getCourseListByTeaId(user_id);
			Set<GradeInformation> gradeSet = new HashSet<GradeInformation>();
			Set<Subject> subjectSet = new HashSet<Subject>();
			for(int i=0;i<courseList.size();i++){
				gradeSet.add(courseList.get(i).getGradeInformation());
				subjectSet.add(courseList.get(i).getSubject());
			}
			modelMap.addAttribute("subjectSet", subjectSet);
			modelMap.addAttribute("gradeSet", gradeSet);
			return "ExamPaper/add_paper";
	}
	@RequestMapping("/saveExamPaper")
	public ModelAndView saveExamPaper(@ModelAttribute("examPaper") ExamPaper examPaper,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) throws Exception{
		HttpSession session = request.getSession();
		int examWay = Integer.valueOf(examPaper.getExam_way());
		examPaper.setExam_id(ID.getRandomID());
		examPaper.setExam_way(examWay);
		TeacherInformation teacherInformation = (TeacherInformation) session.getAttribute("LoginUser");
		examPaper.setTeacherInformation(teacherInformation);
		examService.saveExamPaper(examPaper);
		modelMap.addAttribute("exam_id", examPaper.getExam_id());
		modelMap.addAttribute("examPaper", examPaper);
		if(examPaper.getExam_way() == 1){
			//response.sendRedirect("addAutomaticExtract.action?exam_id="+examPaper.getExam_id());
			return new ModelAndView("redirect:/exam/addAutomaticExtract",modelMap);
		}else{
			//response.sendRedirect("addManualExtract.action");
			
			return new ModelAndView("redirect:/exam/addManualExtract",modelMap);
		}
	}
	
	@RequestMapping("/updateExamPaperById/exam_id/{exam_id}")
	public String updateExamPaperById(@PathVariable("exam_id") String exam_id, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		List<Course> courseList = examService.getCourseListByTeaId(tea_id);
		Set<GradeInformation> gradeSet = new HashSet<GradeInformation>();
		Set<Subject> subjectSet = new HashSet<Subject>();
		for(int i=0;i<courseList.size();i++){
			gradeSet.add(courseList.get(i).getGradeInformation());
			subjectSet.add(courseList.get(i).getSubject());
		}
		modelMap.addAttribute("subjectSet", subjectSet);
		modelMap.addAttribute("gradeSet", gradeSet);
		//String exam_id = request.getParameter("exam_id");
		//List<ExamPaper> list = examService.getExamPaperByPaperId(exam_id);
		examPaper = examService.getExamPaperById(exam_id);
		modelMap.addAttribute("examPaper", examPaper);
		return "ExamPaper/update_paper";
	}
	
	@RequestMapping("/updateExamPaper")
	public ModelAndView updateExamPaper(@ModelAttribute("examPaper") ExamPaper examPaper,HttpServletResponse response,ModelMap modelMap) throws Exception{
		examService.updateExamPaper(examPaper);
		return new ModelAndView("redirect:/exam/listExamPaper/pageNum/1");
		
	}
	
	@RequestMapping("/updateExamTaskById/examTask_id/{examTask_id}")
	public String updateExamTaskById(@PathVariable("examTask_id") String examTask_id, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		List<ExamTask> list = examService.getExamTaskByTaskId(examTask_id);
		modelMap.addAttribute("examTask", list.get(0));
		String subject_id = String.valueOf(list.get(0).getSubject().getSubject_id());
		List<ClassInformation> courseList = examService.getClassListByTeaID(tea_id,subject_id);
		modelMap.addAttribute("courseList", courseList);
		List<ExamNature> natureList = examService.getExamNatureList();
		modelMap.addAttribute("natureList", natureList);
		return "ExamTask/update_task";
	}
	
	
	@RequestMapping("/updateExamTask")
	public ModelAndView updateExamTask(@ModelAttribute("examTask") ExamTask examTask, HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) throws Exception{
		String examTask_start = examTask.getExamTask_start()+" "+ request.getParameter("shh")+":"+request.getParameter("smm")+":00";
		String examTask_end = examTask.getExamTask_end() + " " + request.getParameter("ehh")+":"+request.getParameter("emm")+":00";
		Date sdate = DateUtil.StringToDate(examTask_start, "yyyy-MM-dd HH:mm:ss");
		examTask_start = DateUtil.DateToString(sdate, "yyyy-MM-dd HH:mm:ss");
		Date edate = DateUtil.StringToDate(examTask_end, "yyyy-MM-dd HH:mm:ss");
		examTask_end = DateUtil.DateToString(edate, "yyyy-MM-dd HH:mm:ss");
		examTask.setExamTask_start(examTask_start);
		examTask.setExamTask_end(examTask_end);
		examService.updateExamTask(examTask);
		return new ModelAndView("redirect:/exam/listExamTask/pageNum/1");
	}
	
	@RequestMapping("/deleteExamPaper/exam_id/{exam_id}")
	public ModelAndView deleteExamPaper(@PathVariable("exam_id") String exam_id, HttpServletRequest request,HttpServletResponse response) throws Exception{
		examPaper = examService.getExamPaperById(exam_id);
		examService.deleteExamPaper(examPaper);
		return new ModelAndView("redirect:/exam/listExamPaper/pageNum/1");
	}
	
	@RequestMapping("/deleteExamTask/examTask_id/{examTask_id}")
	public ModelAndView deleteExamTask(@PathVariable("examTask_id") String examTask_id, HttpServletResponse response) throws Exception{
		examTask = examService.getExamTaskById(examTask_id);
		examService.deleteExamTask(examTask);
		return new ModelAndView("redirect:/exam/listExamTask/pageNum/1");
		
	}
	
	@RequestMapping("/addExamTask/exam_id/{exam_id}")
	public String addExamTask(@PathVariable("exam_id") String exam_id, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		List<ExamPaper> list = (List<ExamPaper>) examService.getExamPaperByPaperId(exam_id);
		modelMap.addAttribute("examPaper", list.get(0));
		String subject_id = String.valueOf(list.get(0).getSubject().getSubject_id());
		List<ClassInformation> courseList = examService.getClassListByTeaID(tea_id,subject_id);
		modelMap.addAttribute("courseList", courseList);
		List<ExamNature> natureList = examService.getExamNatureList();
		modelMap.addAttribute("natureList", natureList);
		return "ExamTask/add_task";
	}
	@RequestMapping("/showExamPaper/examPaper_id/{examPaper_id}")
	public String show_paper(@PathVariable("examPaper_id") String examPaper_id, HttpServletRequest request,ModelMap modelMap){
		examPaper = examService.getExamPaperById(examPaper_id);
		modelMap.addAttribute("examPaper", examPaper);
		return "ExamPaper/show_paper";
	}
	
	@RequestMapping("/showExamTask/examTask_id/{examTask_id}")
	public String showExamTask(@PathVariable("examTask_id") String examTask_id, HttpServletRequest request,ModelMap modelMap){
		examTask = examService.getExamTaskById(examTask_id);
		List<ClassInformation> classList = new ArrayList<ClassInformation>();
		String[] class_id = examTask.getClass_id().split(",");
		for(String c:class_id){
			ClassInformation classInformation = examService.getClassById(Integer.parseInt(c));
			classList.add(classInformation);
		}
		modelMap.addAttribute("classList", classList);
		modelMap.addAttribute("examTask", examTask);
		return "ExamTask/show_task";
	}
	
	
	@RequestMapping("/listExamTask/pageNum/{pageNum}")
	public String listExamTask(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		examService.initTaskPageBean(pageNum_, tea_id, "ENDED");
		PageBean<ExamTask> pageBean_end = examService.getExamTaskByTeaId();
		
		List<ExamTask> PENDINGList = examService.getExamTaskByStatus("PENDING",tea_id);
		List<ExamTask> RUNNINGList = examService.getExamTaskByStatus("RUNNING",tea_id);
		List<ExamTask> BEGINTaskList = new ArrayList<ExamTask>();
		if(!BeanUtils.isBlank(PENDINGList)){ BEGINTaskList.addAll(PENDINGList);};
		if(!BeanUtils.isBlank(RUNNINGList)){ BEGINTaskList.addAll(RUNNINGList);};
		
		String leftTime = null;
		List<ExamTask> beginTaskList = new ArrayList<ExamTask>();
		List<ExamTask> endTaskList = pageBean_end.getList();
		if(BEGINTaskList != null){
			for(ExamTask examTask:BEGINTaskList){
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
				beginTaskList.add(examTask);
				examService.updateExamTask(examTask);
			}
		}
		modelMap.addAttribute("pageBean_end", pageBean_end);
		modelMap.addAttribute("beginTaskList", beginTaskList);
		modelMap.addAttribute("endTaskList", endTaskList);
		return "ExamTask/list_task";
	}
	
	@RequestMapping("/saveExamTask")
	public ModelAndView saveExamTask(@ModelAttribute("examTask") ExamTask examTask,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) throws Exception{
		String examTask_start = examTask.getExamTask_start()+" "+ request.getParameter("shh")+":"+request.getParameter("smm")+":00";
		String examTask_end = examTask.getExamTask_end() + " " + request.getParameter("ehh")+":"+request.getParameter("emm")+":00";
		Date sdate = DateUtil.StringToDate(examTask_start, "yyyy-MM-dd HH:mm:ss");
		examTask_start = DateUtil.DateToString(sdate, "yyyy-MM-dd HH:mm:ss");
		Date edate = DateUtil.StringToDate(examTask_end, "yyyy-MM-dd HH:mm:ss");
		examTask_end = DateUtil.DateToString(edate, "yyyy-MM-dd HH:mm:ss");	
		examTask.setExamTask_start(examTask_start);
		examTask.setExamTask_end(examTask_end);
		examTask.setExamTask_id(ID.getRandomID());
		examTask.setExamTask_status("PENDING");	// PENDING-等待 RUNNING-开始 ENDED 结束
		examService.saveExamTask(examTask);
		return new ModelAndView("redirect:/exam/listExamTask/pageNum/1");
	}
	
	
	
	@RequestMapping("/saveAutomaticExtract")
	public ModelAndView saveAutomaticExtract(@ModelAttribute("automaticExtract") AutomaticExtract automaticExtract,HttpServletRequest request,HttpServletResponse response,ModelMap modelMap) throws Exception{
		examService.saveAutomatic(automaticExtract);
		modelMap.addAttribute("exam_id", automaticExtract.getExamPaper().getExam_id());
		return new ModelAndView("redirect:addAutomaticExtract",modelMap);
	}
	@RequestMapping("/updateAutomaticExtractById/auto_id/{auto_id}")
	public String updateAutomaticExtractById(@PathVariable("auto_id") String auto_id, HttpServletRequest request,ModelMap modelMap){
		List<AutomaticExtract> autoMaticList = examService.getAutomaticById(auto_id);
		String subject_id = Integer.toString(autoMaticList.get(0).getExamPaper().getSubject().getSubject_id());
		List<QuestionType> typeList = examService.getQuestionTypeList();
		modelMap.addAttribute("autoMatic",autoMaticList.get(0));
		modelMap.addAttribute("typeList", typeList);
		return "ExamPaper/update_automatic";
	}
	@RequestMapping("/updateAutomaticExtract")
	public ModelAndView updateAutomaticExtract(@ModelAttribute("atuomaticExtract") AutomaticExtract automaticExtract,HttpServletResponse response,ModelMap modelMap) throws Exception{
		examService.updateAutoMatic(automaticExtract);
		modelMap.addAttribute("exam_id", automaticExtract.getExamPaper().getExam_id());
		return new ModelAndView("redirect:addAutomaticExtract.action",modelMap);
		
	}
	@RequestMapping("/deleteAutomaticExtract/auto_id/{auto_id}/exam_id/{exam_id}")
	public ModelAndView deleteAutomaticExtract(@PathVariable("auto_id") String auto_id,@PathVariable("exam_id") String exam_id ,HttpServletResponse response, ModelMap modelMap) throws Exception{
//		AutomaticExtract automaticExtract = new AutomaticExtract();
//		automaticExtract.setAuto_id(Integer.parseInt(auto_id));
//		automaticExtract.setExamPaper(examService.getExamPaperById(exam_id));
		List<AutomaticExtract> autoList =  examService.getAutomaticById(auto_id);
		examService.deleteAtuoMatic(autoList.get(0));
		modelMap.addAttribute("exam_id",exam_id);
		return new ModelAndView("redirect:/exam/addAutomaticExtract");
	}
	@RequestMapping("/addSetExamPaper/exam_id/{exam_id}/exam_way/{exam_way}")
	public ModelAndView addSetExamPaper(@PathVariable("exam_id") String exam_id, @PathVariable("exam_way") String exam_way,HttpServletRequest request,HttpServletResponse response, ModelMap modelMap) throws Exception{
		modelMap.addAttribute("exam_id",exam_id);
		if("1".equals(exam_way)){
			//自动组卷
			return new ModelAndView("redirect:/exam/addAutomaticExtract",modelMap);
		}else{
			//手动组卷
			return new ModelAndView("redirect:/exam/listQuestion/pageNum/1",modelMap);
		}
	}
	
	@RequestMapping("/addAutomaticExtract")
	public String addAutomaticExtract(HttpServletRequest request,ModelMap modelMap){
		String exam_id = request.getParameter("exam_id");
		List<ExamPaper> examPaper = examService.getExamPaperByPaperId(exam_id);
		List<AutomaticExtract> automaticList= examService.getAutomaticByExamId(exam_id);
		List<QuestionType> typeList = examService.getQuestionTypeList();
		String subject_id = Integer.toString(examPaper.get(0).getSubject().getSubject_id());
		String subject_name = examPaper.get(0).getSubject().getSubject_name();
		List<Choice> choiceList = examService.getChoiceCount();
		List<Cloze> clozeList = examService.getClozeCount();
		List<ShortAnswer> shortList = examService.getShortCount();
		List<Comprehensive> compreList = examService.getCompreCount();
		modelMap.addAttribute("choiceCount", choiceList.get(0));
		modelMap.addAttribute("clozeCount", clozeList.get(0));
		modelMap.addAttribute("shortCount", shortList.get(0));
		modelMap.addAttribute("compreCount", compreList.get(0));
		modelMap.addAttribute("automaticList", automaticList);
		modelMap.addAttribute("typeList", typeList);
		modelMap.addAttribute("exam_id", exam_id);
		modelMap.addAttribute("subject_name", subject_name);
		return "ExamPaper/add_automatic";
	}
	
	//没用了
	@RequestMapping("/addManualExtract")
	public String addanualExtract(HttpServletRequest request,HttpServletResponse response,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		String exam_id = request.getParameter("exam_id");
		examPaper = examService.getExamPaperById(exam_id);
//		List<Course> courseList = examService.getCourseListByTeaId(tea_id);
		List<QuestionType> typeList = examService.getQuestionTypeList();
//		Set<GradeInformation> gradeSet = new HashSet<GradeInformation>();
//		Set<Subject> subjectSet = new HashSet<Subject>();
		String subject=examPaper.getSubject().getSubject_name();
		String grade=examPaper.getGradeInformation().getGrade_name();
		modelMap.addAttribute("subject",subject);
		modelMap.addAttribute("grade",grade);
//		for(int i=0;i<courseList.size();i++){
//			gradeSet.add(courseList.get(i).getGradeInformation());
//			subjectSet.add(courseList.get(i).getSubject());
//		}
//		modelMap.addAttribute("subjectSet", subjectSet);
//		modelMap.addAttribute("gradeSet", gradeSet);
		modelMap.addAttribute("typeList", typeList);
//		modelMap.addAttribute("courseList", courseList);
		modelMap.addAttribute("exam_id",exam_id);
		return "ExamPaper/add_manualExtract";
	}
	
	@RequestMapping("/listQuestion/pageNum/{pageNum}")
	public String listQuestion(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String teacher_id = (String) session.getAttribute("user_id");
		String exam_id = request.getParameter("exam_id");
		ExamPaper examPaper=examService.getExamPaperById(exam_id);
		String subject=examPaper.getSubject().getSubject_name();
		String grade=examPaper.getGradeInformation().getGrade_name();
		String subjectId=String.valueOf(examPaper.getSubject().getSubject_id());
		String gradeId=String.valueOf(examPaper.getGradeInformation().getGrade_id());
//		List<Course> courseList = examService.getCourseListByTeaId(teacher_id);
		List<QuestionType> typeList = examService.getQuestionTypeList();
//		List<TeacherInformation> teaList=exam_ExamineService.get
//		Set<GradeInformation> gradeSet = new HashSet<GradeInformation>();
		//Set<Subject> subjectSet = new HashSet<Subject>();
//		for(int i=0;i<courseList.size();i++){
//			gradeSet.add(courseList.get(i).getGradeInformation());
//			subjectSet.add(courseList.get(i).getSubject());
//		}
		modelMap.addAttribute("subject", subject);
		modelMap.addAttribute("grade", grade);
		modelMap.addAttribute("typeList", typeList);
//		modelMap.addAttribute("courseList", courseList);
		modelMap.addAttribute("exam_id",exam_id);
		//String subject=request.getParameter("subject");
//		String grade=request.getParameter("grade");
		String difficulty=request.getParameter("difficulty");
		String add_time=request.getParameter("add_time");
		String questionID=request.getParameter("questionID");
		String questionKey=request.getParameter("questionKey");
		String questionType=request.getParameter("questionType");
		if(StringUtils.isBlank(questionType)){
			questionType="1";
		}
		String columns[] = new String[]{"subject","grade","add_time","difficulty","question_id","question_body"};
		String values[] = new String[]{subjectId,gradeId,add_time,difficulty,questionID,questionKey};
		//分页
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		String[] queList = null;
		List<ManualExtract> questionStringList = examService.getManualExtractQuestionID(exam_id, questionType);
		if(questionStringList != null){
			queList = questionStringList.get(0).getQuestion_id().split("-");
    	}
		modelMap.addAttribute("queList", queList);
		switch(Integer.parseInt(questionType)){
		case 1:{
			examService.initChoicePageBean(pageNum_, columns, values);
			PageBean pageBean = examService.getQuestionByDim();
			List list = pageBean.getList();
			modelMap.addAttribute("pageBean",pageBean);
			modelMap.addAttribute("choiceList",list);
			break;
		}
		case 2:{
			examService.initClozePageBean(pageNum_, columns, values);
			PageBean pageBean = examService.getQuestionByDim();
			List list = pageBean.getList();
			modelMap.addAttribute("pageBean",pageBean);
			modelMap.addAttribute("clozeList",list);
			break;
		}
		case 3:{
			examService.initShortAnswerPageBean(pageNum_, columns, values);
			PageBean pageBean = examService.getQuestionByDim();
			List list = pageBean.getList();
			modelMap.addAttribute("pageBean",pageBean);
			modelMap.addAttribute("shortAnswerList",list);
			break;
		}
		case 4:{
			examService.initComprehensivePageBean(pageNum_, columns, values);
			PageBean pageBean = examService.getQuestionByDim();
			List list = pageBean.getList();
			modelMap.addAttribute("pageBean",pageBean);
			modelMap.addAttribute("comprehensiveList",list);
			break;
		}
		}
		return "ExamPaper/add_manualExtract";
		//return new ModelAndView("redirect:/exam/addManualExtract","modelMap",modelMap);
	}
	
	@RequestMapping("/listManaualChoicePage")
	public String listManaualChoicePage(){
		return "QuestionManager/show_M_choice";
	}
	@RequestMapping("/listManaualClozePage")
	public String listManaualPage(){
		return "QuestionManager/show_M_cloze";
	}
	@RequestMapping("/listManaualShortAnswerPage")
	public String listManaualShortAnswerPage(){
		return "QuestionManager/show_M_shortAnswer";
	}
	@RequestMapping("/listManaualComprehensivePage")
	public String listManaualComprehensivePage(){
		return "QuestionManager/show_M_comprehensive";
	}
	
	//没用
	@RequestMapping("/searchQuestion")
	public String searchQuestion(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws IOException{
		PrintWriter out = response.getWriter();
		String subject=request.getParameter("subject");
	    String grade=request.getParameter("grade");
	    String tea_name=request.getParameter("tea_name");
	    String chapter=request.getParameter("chapter");
	    String difficulty=request.getParameter("difficulty");
	    String startTime=request.getParameter("startTime");
	    String endTime=request.getParameter("endTime");
	    String questionType=request.getParameter("questionType");
	    String page = request.getParameter("pageNum");
	    String questionID=request.getParameter("questionID");
	    String questionKey=request.getParameter("questionKey");
	    String exam_id=request.getParameter("exam_id");
	    String columns[] = new String[9];
	    String values[] = new String[9];
	    int i=0;
	    if(!StringUtils.isBlank(subject)){
	    	columns[i]="subject";
	    	values[i]=subject;
	    }
	    if(!StringUtils.isBlank(grade)){
	    	i++;
	    	columns[i]="grade";
	    	values[i]=grade;
	    }
	    if(!StringUtils.isBlank(tea_name)){
	    	i++;
	    	columns[i]="tea_name";
	    	values[i]=tea_name;
	    }
	    if(!StringUtils.isBlank(chapter)){
	    	i++;
	    	columns[i]="chapter";
	    	values[i]=chapter;
	    }
	    if(!StringUtils.isBlank(difficulty)){
	    	i++;
	    	columns[i]="difficulty";
	    	values[i]=difficulty;
	    }
	    if(!StringUtils.isBlank(startTime)){
	    	i++;
	    	columns[i]="startTime";
	    	values[i]=startTime;
	    }
	    if(!StringUtils.isBlank(endTime)){
	    	i++;
	    	columns[i]="endTime";
	    	values[i]=endTime;
	    }
	    if(!StringUtils.isBlank(questionID)){
	    	i++;
	    	columns[i]="questionID";
	    	values[i]=questionID;
	    }
	    if(!StringUtils.isBlank(questionKey)){
	    	i++;
	    	columns[i]="questionKey";
	    	values[i]=questionKey;
	    }
	    int qType = Integer.parseInt(questionType);
	    int pageNum = Integer.parseInt(page);
	    String queList[] = null;
	    switch(qType){
		    case 1:{
		    	List<ManualExtract> questionStringList = examService.getManualExtractQuestionID(exam_id, questionType);
		    	examService.initManualChoicePageBean(pageNum, columns, values);
		    	PageBean<Choice> pageBean = examService.getChoiceById();
		    	List<Choice> choiceList = pageBean.getList();
		    	if(questionStringList != null){
		    		queList = questionStringList.get(0).getQuestion_id().split("-");
		    	}
		    	if(queList == null ){System.out.println("这个为空！");}
		    	//System.out.println(queList.length+"  这个需要验证。");
		    	modelMap.addAttribute("choiceList", choiceList);
		    	modelMap.addAttribute("queList", queList);
		    	modelMap.addAttribute("exam_id", exam_id);
		    	modelMap.addAttribute("pageBean", pageBean);
		    	return "ExamPaper/show_choice";
		    }
		    case 2:{
		    	System.out.println("填空题");
		    }
		    case 3:{
		    	System.out.println("简答题");
		    }
		    case 4:{
		    	System.out.println("综合题");
		    }
	    }
		out.flush();
		out.close();
		return null;
	} 
	@RequestMapping("/saveQuestion/qtype/{qtype}/qID/{qID}/scores/{scores}/exam_id/{exam_id}")
	public void saveQuestion(
			@PathVariable("qtype") String q_type,
			@PathVariable("qID") String q_id,
			@PathVariable("scores") String q_score,
			@PathVariable("exam_id") String exam_id,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
//		String q_type = request.getParameter("type_id");
//		String q_id = request.getParameter("question_id");
//		String q_score = request.getParameter("question_score");
//		String exam_id = request.getParameter("exam_id");
		
//		System.out.println(manualExtract.getQuestionType().getType_id()+"-"+manualExtract.getQuestion_id()+"-"+manualExtract.getQuestion_score()+"-"+manualExtract.getExamPaper().getExam_id());
//		List<ManualExtract> list = new ArrayList<ManualExtract>();
//		String q_type = String.valueOf(manualExtract.getQuestionType().getType_id());
//		String q_id = manualExtract.getQuestion_id();
//		String q_score = String.valueOf(manualExtract.getQuestion_score());
//		String exam_id = manualExtract.getExamPaper().getExam_id();
		
		List<ManualExtract> questionStringList = examService.getManualExtractQuestionID(exam_id, q_type);
		StringBuffer sb = new StringBuffer();
		ManualExtract me =new ManualExtract();
		if(!BeanUtils.isBlank(questionStringList)){
			sb.append(questionStringList.get(0).getQuestion_id()+q_id+"-");
			//更新试题串
			me = questionStringList.get(0);
			me.setQuestion_id(sb.toString());
			me.setQuestion_num(me.getQuestion_num()+1);
			me.setQuestion_score(me.getQuestion_score()+Float.valueOf(q_score));
			examService.updateManualExtract(me);
			
    	}else{
    		//添加试题串
    		sb.append(q_id+"-");
    		examPaper = examService.getExamPaperById(exam_id);
    		QuestionType qType = examService.getQuestionTypeById(Integer.parseInt(q_type));
    		me.setExamPaper(examPaper);
    		me.setQuestion_id(sb.toString());
    		me.setQuestion_num(1);
    		me.setQuestion_score(Float.valueOf(q_score));
    		me.setQuestionType(qType);
    		examService.saveManualExtract(me);
    	}	
		out.print("true");
		out.flush();
		out.close();
	}
	@RequestMapping("/deleteQuestion/qtype/{qtype}/qID/{qID}/scores/{scores}/exam_id/{exam_id}")
	public void deleteQuestion(
			@PathVariable("qtype") String qtype,
			@PathVariable("qID") String qID,
			@PathVariable("scores") String scores,
			@PathVariable("exam_id") String exam_id,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		List<ManualExtract> questionStringList = examService.getManualExtractQuestionID(exam_id, qtype);
		ManualExtract me = questionStringList.get(0);
		String str = me.getQuestion_id().replace(qID+"-", "");
		if(str.length() != 0){
			me.setQuestion_id(str);
			me.setQuestion_num(me.getQuestion_num()-1);
			me.setQuestion_score(me.getQuestion_score()-Float.valueOf(scores));
			examService.updateManualExtract(me);
		}else{
			examService.deleteManualExtract(me);
		}
		
		out.print("false");
		out.flush();
		out.close();
	}

	//基础数据用-暂时没用
	@RequestMapping("changeProfessionInformation.action")
	public @ResponseBody List<ProfessionInformation> getProfessionByAreaId(HttpServletRequest request){
		String area_id = request.getParameter("area_id");
		List<ProfessionInformation> list = examService.getProfessionByAreaId(area_id);
		return list;
	}
	
	@RequestMapping("/statisticsScore/{paper_id}")
	public String statisticsScore(@PathVariable("paper_id") String paper_id, ModelMap modelMap){
		int choiceCount = 0;
		int clozeCount = 0;
		int compCount = 0;
		int shortCount = 0;
		int easyChoice = 0;
		int normalChoice = 0;
		int hardChoice = 0;
		int easyCloze = 0;
		int normalCloze = 0;
		int hardCloze = 0;
		int easyShort = 0;
		int normalShort = 0;
		int hardShort = 0;
		int easyCompre = 0;
		int normalCompre = 0;
		int hardCompre = 0;
		//通过paper_id 去查是手动组卷还是 自动组卷，从而统计试题的个数
		List<ExamPaper> examPaper = examService.getExamPaperByPaperId(paper_id);
		int exam_way = examPaper.get(0).getExam_way();
		//自动
		if(exam_way == 1){
			List<AutomaticExtract> automatic = examService.getAutomaticByExamId(paper_id);
			if(!BeanUtils.isBlank(automatic)){
				for(AutomaticExtract list:automatic){
					QuestionType q_type = list.getQuestionType();
					switch(q_type.getType_id()){
						case 1:{
							choiceCount += list.getQuestion_num();
							int difficult = list.getDifficulty();
							if(difficult == 1){
								easyChoice+=list.getQuestion_num();
							}else if(difficult == 2){
								normalChoice+=list.getQuestion_num();;
							}else{
								hardChoice+=list.getQuestion_num();;
							}
							break;
						}
						case 2:{
							clozeCount += list.getQuestion_num();
							int difficult = list.getDifficulty();
							if(difficult == 1){
								easyCloze+=list.getQuestion_num();;
							}else if(difficult == 2){
								normalCloze+=list.getQuestion_num();;
							}else{
								hardCloze+=list.getQuestion_num();;
							}
							break;
						}
						case 3:{
							shortCount += list.getQuestion_num();
							int difficult = list.getDifficulty();
							if(difficult == 1){
								easyShort+=list.getQuestion_num();;
							}else if(difficult == 2){
								normalShort+=list.getQuestion_num();;
							}else{
								hardShort+=list.getQuestion_num();;
							}
							break;
						}
						case 4:{
							compCount += list.getQuestion_num();
							int difficult = list.getDifficulty();
							if(difficult == 1){
								easyCompre+=list.getQuestion_num();;
							}else if(difficult == 2){
								normalCompre+=list.getQuestion_num();;
							}else{
								hardCompre+=list.getQuestion_num();;
							}
							break;
						}
					}
				}
			}
		}else{
		//手动
			List<ManualExtract> manual = examService.getManualExtractById(paper_id);
			if(!BeanUtils.isBlank(manual)){
				for(ManualExtract list:manual){
					String questionId[] = list.getQuestion_id().split("-");
					QuestionType q_type = list.getQuestionType();
					switch(q_type.getType_id()){
						case 1:{
							choiceCount += list.getQuestion_num();
							for(int j=0;j<questionId.length;j++){
								Choice choice = exam_ExamineService.getChoiceById(Integer.parseInt(questionId[j]));
								int difficult = choice.getDifficulty();
								if(difficult == 1){
									easyChoice++;
								}else if(difficult == 2){
									normalChoice++;
								}else{
									hardChoice++;
								}
							}
							break;
						}
						case 2:{
							clozeCount += list.getQuestion_num();
							for(int j=0;j<questionId.length;j++){
								Cloze cloze = exam_ExamineService.getClozeById(Integer.parseInt(questionId[j]));
								int difficult = cloze.getDifficulty();
								if(difficult == 1){
									easyCloze++;
								}else if(difficult == 2){
									normalCloze++;
								}else{
									hardCloze++;
								}
							}
							break;
						}
						case 3:{
							shortCount += list.getQuestion_num();
							for(int j=0;j<questionId.length;j++){
								ShortAnswer shortAnswer = exam_ExamineService.getShortAnswerById(Integer.parseInt(questionId[j]));
								int difficult = shortAnswer.getDifficulty();
								if(difficult == 1){
									easyShort++;
								}else if(difficult == 2){
									normalShort++;
								}else{
									hardShort++;
								}
							}
							break;
						}
						case 4:{
							compCount += list.getQuestion_num();
							for(int j=0;j<questionId.length;j++){
								Comprehensive compre = exam_ExamineService.getComperById(Integer.parseInt(questionId[j]));
								int difficult = compre.getDifficulty();
								if(difficult == 1){
									easyCompre++;
								}else if(difficult == 2){
									normalCompre++;
								}else{
									hardCompre++;
								}
							}
							break;
						}
					}
				}
			}
		}
		modelMap.addAttribute("choice", choiceCount);
		modelMap.addAttribute("cloze", clozeCount);
		modelMap.addAttribute("compre", compCount);
		modelMap.addAttribute("shortCount", shortCount);
		modelMap.addAttribute("easyChoice", easyChoice);
		modelMap.addAttribute("normalChoice", normalChoice);
		modelMap.addAttribute("hardChoice", hardChoice);
		modelMap.addAttribute("easyCloze", easyCloze);
		modelMap.addAttribute("normalCloze", normalCloze);
		modelMap.addAttribute("hardCloze", hardCloze);
		modelMap.addAttribute("easyShort", easyShort);
		modelMap.addAttribute("normalShort", normalShort);
		modelMap.addAttribute("hardShort", hardShort);
		modelMap.addAttribute("easyCompre", easyCompre);
		modelMap.addAttribute("normalCompre", normalCompre);
		modelMap.addAttribute("hardCompre", hardCompre);
		return "ExamPaper/statisticsPaper";
	}
	
	@RequestMapping("/showGradeBySubject")
	public @ResponseBody List<GradeInformation> getGradeBySubject(HttpServletRequest request){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		String subId = request.getParameter("subId");
		List<Course> courseList = examService.getCourseListBysubID(subId, tea_id);
		List<GradeInformation> gradeList=new ArrayList<GradeInformation>();
		for(int i=0;i<courseList.size();i++){
			gradeList.add(courseList.get(i).getGradeInformation());
		}
        return gradeList;
	}
	
}
