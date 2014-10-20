package com.rjxy.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.biz.QuestionService;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.Subject;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;

@Controller
@RequestMapping("/question")
public class QuestionAction {
	@Autowired
	private QuestionService questionService;
	private Choice choice;
	private Cloze cloze;
	private Comprehensive comprehensive;
	private ShortAnswer shortAnswer;
	
	@RequestMapping("/showInformation")
	public String showInformation(HttpServletRequest request,ModelMap modelMap){
		
		List<Subject> subjectList=questionService.getSubjectList();
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		request.setAttribute("sysdate", df.format(new Date()));
		modelMap.addAttribute("subjectList",subjectList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		//Batch add
		return "QuestionManager/batchAddQuestion";
	}
	
	@RequestMapping("/addChoice")
	public String addChoice(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		List<Course> courseList=questionService.getCourseList(tea_id);
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		request.setAttribute("sysdate", df.format(new Date()));
		modelMap.addAttribute("courseList",courseList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		return "QuestionManager/add_choice";
	}
	@RequestMapping("/addCloze")
	public String addCloze(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		List<Course> courseList=questionService.getCourseList(tea_id);
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		request.setAttribute("sysdate", df.format(new Date()));
		modelMap.addAttribute("courseList",courseList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		return "QuestionManager/add_cloze";
	}
	@RequestMapping("/addComprehensive")
	public String addComprehensive(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		List<Course> courseList=questionService.getCourseList(tea_id);
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		request.setAttribute("sysdate", df.format(new Date()));
		modelMap.addAttribute("courseList",courseList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		return "QuestionManager/add_comprehensive";
	}
	@RequestMapping("/addShortAnswer")
	public String addShortAnswer(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		List<Course> courseList=questionService.getCourseList(tea_id);
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		request.setAttribute("sysdate", df.format(new Date()));
		modelMap.addAttribute("courseList",courseList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		return "QuestionManager/add_shortAnswer";
	}
	

	@RequestMapping("/showQuestionPage")
	public String showQuestionPage(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		List<Course> courseList=questionService.getCourseList(tea_id);
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		List<TeacherInformation> teaList=questionService.getTeacherList();
		modelMap.addAttribute("courseList",courseList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		modelMap.addAttribute("teaList", teaList);
		return "QuestionManager/list_question";
	}
	
	@RequestMapping("/getQuestionList")
	public String getQuestionList(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		List<Subject> subjectList=questionService.getSubjectList();
		List<Course> courseList=questionService.getCourseList(tea_id);
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		List<TeacherInformation> teaList=questionService.getTeacherList();
		modelMap.addAttribute("courseList",courseList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		modelMap.addAttribute("teaList", teaList);
	//	String tea_id=request.getParameter("tea_id");
		String questionType=request.getParameter("QuestionType");
		if(questionType==null||questionType==""){
			questionType="1";
		}
		int QuestionType=Integer.parseInt(questionType);
		String subject=request.getParameter("subject");
		String grade=request.getParameter("grade");
		String difficulty=request.getParameter("difficulty");
		String add_time=request.getParameter("add_time");
		String questionID=request.getParameter("questionID");
		String questionKey=request.getParameter("questionKey");
		modelMap.addAttribute("QuestionType",QuestionType);
		switch (QuestionType) {
		case 1:
			List<Choice> choiceList = questionService.getChoiceList(subject,grade, add_time, tea_id, difficulty,questionID,questionKey);
			modelMap.addAttribute("choiceList", choiceList);
			break;
		case 2:
			List<Cloze> clozeList = questionService.getClozeList(subject,grade, add_time, tea_id, difficulty,questionID,questionKey);
			modelMap.addAttribute("clozeList", clozeList);
			break;
		case 3:
			List<Comprehensive> comprehensiveList = questionService.getComprehensiveList(subject, grade, add_time, tea_id,difficulty,questionID,questionKey);
			modelMap.addAttribute("comprehensiveList", comprehensiveList);
			break;
		case 4:
			List<ShortAnswer> shortAnswerList = questionService.getShortAnswerList(subject, grade, add_time, tea_id,difficulty,questionID,questionKey);
			modelMap.addAttribute("shortAnswerList", shortAnswerList);
			break;
		}
		return "QuestionManager/list_question";
	}
	
	@RequestMapping("/showQuestion/question_id/{question_id}/question_type/{question_type}")
	public String showQuestionInfo(@PathVariable("question_id") int question_id,@PathVariable("question_type") String question_type,HttpServletRequest request,ModelMap modelMap){
		int QuestionType=Integer.parseInt(question_type);
		switch (QuestionType) {
		case 1:
			choice = questionService.getChoiceById(question_id);
			modelMap.addAttribute("choice", choice);
			return "QuestionManager/show_choice";
		case 2:
			cloze = questionService.getClozeById(question_id);
			modelMap.addAttribute("cloze", cloze);
			return "QuestionManager/show_cloze";
		case 3:
			comprehensive = questionService.getComprehensiveById(question_id);
			modelMap.addAttribute("comprehensive", comprehensive);
			return "QuestionManager/show_comprehensive";
		case 4:
			shortAnswer = questionService.getShortAnswerById(question_id);
			modelMap.addAttribute("shortAnswer", shortAnswer);
			return "QuestionManager/show_shortAnswer";
		}
		return null;
	}
	
	@RequestMapping("/deleteQuestion/question_id/{question_id}/question_type/{question_type}")
	public ModelAndView deleteQuestion(@PathVariable("question_id") int question_id,@PathVariable("question_type") String question_type,HttpServletRequest request,ModelMap modelMap){
		int QuestionType=Integer.parseInt(question_type);
		switch (QuestionType) {
		case 1:
			choice = questionService.getChoiceById(question_id);
			questionService.deleteChoice(choice);
			break;
		case 2:
			cloze = questionService.getClozeById(question_id);
			questionService.deleteCloze(cloze);
			break;
		case 3:
			comprehensive = questionService.getComprehensiveById(question_id);
			questionService.deleteComprehensive(comprehensive);
			break;
		case 4:
			shortAnswer = questionService.getShortAnswerById(question_id);
			questionService.deleteShortAnswer(shortAnswer);
			break;
		}
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	
	@RequestMapping("/updateChoiceById/question_id/{question_id}")
	public String updateChoiceById(@PathVariable("question_id") int question_id,HttpServletRequest request,ModelMap modelMap){
		choice=questionService.getChoiceById(question_id);
		List<Subject> subjectList=questionService.getSubjectList();
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		modelMap.addAttribute("subjectList",subjectList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		modelMap.addAttribute("choice",choice);
		return "QuestionManager/update_choice";
	}
	@RequestMapping("/updateClozeById/question_id/{question_id}")
	public String updateClozeById(@PathVariable("question_id") int question_id,HttpServletRequest request,ModelMap modelMap){
		cloze=questionService.getClozeById(question_id);
		List<Subject> subjectList=questionService.getSubjectList();
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		modelMap.addAttribute("subjectList",subjectList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		modelMap.addAttribute("cloze",cloze);
		return "QuestionManager/update_cloze";
	}
	@RequestMapping("/updateComprehensiveById/question_id/{question_id}")
	public String updateComprehensiveById(@PathVariable("question_id") int question_id,HttpServletRequest request,ModelMap modelMap){
		comprehensive=questionService.getComprehensiveById(question_id);
		List<Subject> subjectList=questionService.getSubjectList();
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		modelMap.addAttribute("subjectList",subjectList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		modelMap.addAttribute("comprehensive",comprehensive);
		return "QuestionManager/update_comprehensive";
	}
	@RequestMapping("/updateShortAnswerById/question_id/{question_id}")
	public String updateShortAnswerById(@PathVariable("question_id") int question_id,HttpServletRequest request,ModelMap modelMap){
		shortAnswer=questionService.getShortAnswerById(question_id);
		List<Subject> subjectList=questionService.getSubjectList();
		List<GradeInformation> gradeInfoList=questionService.getGradeInformationList();
		modelMap.addAttribute("subjectList",subjectList);
		modelMap.addAttribute("gradeInfoList",gradeInfoList);
		modelMap.addAttribute("shortAnswer",shortAnswer);
		return "QuestionManager/update_shortAnswer";
	}
	
	@RequestMapping("/updateChoice")
	public ModelAndView updateChoice(@ModelAttribute("choice") Choice choice,HttpServletResponse response,ModelMap modelMap) throws Exception{
		questionService.updateChoice(choice);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	@RequestMapping("/updateCloze")
	public ModelAndView updateCloze(@ModelAttribute("cloze") Cloze cloze,HttpServletResponse response,ModelMap modelMap) throws Exception{
		questionService.updateCloze(cloze);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	@RequestMapping("/updateComprehensive")
	public ModelAndView updateComprehensive(@ModelAttribute("comprehensive") Comprehensive comprehensive,HttpServletResponse response,ModelMap modelMap) throws Exception{
		questionService.updateComprehensive(comprehensive);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	@RequestMapping("/updateShortAnswer")
	public ModelAndView updateShortAnswer(@ModelAttribute("shortAnswer") ShortAnswer shortAnswer,HttpServletResponse response,ModelMap modelMap) throws Exception{
		questionService.updateShortAnswer(shortAnswer);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	
	
	
	@RequestMapping("/saveChoice")
	public ModelAndView saveChoice(@ModelAttribute("choice") Choice choice,HttpServletRequest request,ModelMap modelMap) throws Exception{
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		choice.setAdd_person(tea_id);
		questionService.saveChoice(choice);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	@RequestMapping("/saveCloze")
	public ModelAndView saveCloze(@ModelAttribute("cloze") Cloze cloze,HttpServletRequest request,ModelMap modelMap) throws Exception{
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		cloze.setAdd_person(tea_id);
		questionService.saveCloze(cloze);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	@RequestMapping("/saveComprehensive")
	public ModelAndView saveComprehensive(@ModelAttribute("comprehensive") Comprehensive comprehensive,HttpServletRequest request,ModelMap modelMap) throws Exception{
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		comprehensive.setAdd_person(tea_id);
		questionService.saveComprehensive(comprehensive);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	@RequestMapping("/saveShortAnswer")
	public ModelAndView saveShortAnswer(@ModelAttribute("shortAnswer") ShortAnswer shortAnswer,HttpServletRequest request,ModelMap modelMap) throws Exception{
		HttpSession session=request.getSession();
		String tea_id=(String)session.getAttribute("user_id");
		shortAnswer.setAdd_person(tea_id);
		questionService.saveShortAnswer(shortAnswer);
		return new ModelAndView("redirect:/question/getQuestionList");
	}
	
	@RequestMapping("/saveManualQuestion")
	public String saveManualQuestion(@ModelAttribute("comprehensive") Comprehensive comprehensive, HttpServletRequest request   ){
		String body = request.getParameter("question_body");
		questionService.saveComprehensive(comprehensive);
		return "QuestionManager/manualAddQuestion";
	}
	//试题类型统计
	@RequestMapping("/showHighchartsModel")
	public String showHighchartsModel(ModelMap modelMap){
		int choiceCount = questionService.getChoiceAllList().size();
		int clozeCount = questionService.getClozeAllList().size();
		int compCount = questionService.getComprehensiveAllList().size();
		int shortCount = questionService.getShortAnswerAllList().size();
		modelMap.addAttribute("choice", choiceCount);
		modelMap.addAttribute("cloze", clozeCount);
		modelMap.addAttribute("compre", compCount);
		modelMap.addAttribute("short", shortCount);
		return "QuestionManager/hightchartsModel";
	}
	
}
