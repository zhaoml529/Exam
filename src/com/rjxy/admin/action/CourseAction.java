package com.rjxy.admin.action;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.admin.biz.CourseService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.Subject;
import com.rjxy.page.PageBean;
import com.rjxy.util.DateUtil;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/courseAction")
public class CourseAction {
	@Autowired
	private CourseService courseService;
	public static String TASK_STATUS_RUNNING="RUNNING";
	public static String TASK_STATUS_PENDING="PENDING";
	
	@RequestMapping("/listExamNature/pageNum/{pageNum}")
	public String listExamNature(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		courseService.initExamNaturePageBean(pageNum_);
		PageBean<ExamNature> pageBean = courseService.getExamNaturePageList();
		List<ExamNature> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("natureList",list);
		return "Admin/courseManger/list_nature";
		
	}
	@RequestMapping("/addExamNature")
	public String addAction(){
		return "Admin/courseManger/add_nature";
		
	}
	@RequestMapping("/saveExamNature")
	public ModelAndView saveAction(@ModelAttribute("examnature") ExamNature examnature){
		courseService.saveExamNature(examnature);
		return new ModelAndView("redirect:/courseAction/listExamNature/pageNum/1");
	}
	@RequestMapping("/deleteExamNature/{nature_id}")
	public ModelAndView deleteNature(@PathVariable("nature_id") String nature_id){
		ExamNature examnature = courseService.updateNatureById(Integer.parseInt(nature_id));
		courseService.deleteExamNature(examnature);
		return new ModelAndView("redirect:/courseAction/listExamNature/pageNum/1");
	}
	@RequestMapping("/updateExamNatureById/{nature_id}")
	public String updateNatureById(@PathVariable("nature_id") String nature_id,ModelMap modelMap){
		ExamNature examnature = courseService.updateNatureById(Integer.parseInt(nature_id));
		modelMap.addAttribute("examnature", examnature);
		return "Admin/courseManger/update_nature";
	}
	
	@RequestMapping("/updateExamNature")
	public ModelAndView updateNature(@ModelAttribute("examnature") ExamNature examnature){
		courseService.updateExamNature(examnature);
		return new ModelAndView("redirect:/courseAction/listExamNature/pageNum/1");
	}
	//专业#################################################################
	//-------------------------------------------------------------------------------------------
	@RequestMapping("/listProfession/pageNum/{pageNum}")
	public String listProfession(@PathVariable("pageNum") String pageNum, HttpServletRequest request, ModelMap modelMap){
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		modelMap.addAttribute("deptList", deptList);
		String department_id = request.getParameter("department_id");
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		if(StringUtils.isBlank(department_id)) department_id = "0";
		courseService.initProfessionPageBean(pageNum_, department_id);
		PageBean<ProfessionInformation> pageBean = courseService.getProfessionPageList();
		List<ProfessionInformation> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("professionList",list);
		modelMap.addAttribute("department_id", department_id);
		return "Admin/courseManger/list_profession";
	}
	@RequestMapping("/addProfession")
	public String addProfession(HttpServletRequest reqeust, ModelMap modelMap){
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		modelMap.addAttribute("deptList", deptList);
		return "Admin/courseManger/add_profession";
	}
	@RequestMapping("/saveProfession")
	public ModelAndView saveProfession(@ModelAttribute("professionInformation") ProfessionInformation professionInformation,HttpServletRequest request){
		courseService.saveProfession(professionInformation);
		int department_id = professionInformation.getDepartmentInformation().getDepartment_id();	
		return new ModelAndView("redirect:/courseAction/listProfession/pageNum/1","department_id",department_id);
	}
	@RequestMapping("/deleteProfession/{profession_id}")
	public ModelAndView deleteProfession(@PathVariable("profession_id") String profession_id){
		ProfessionInformation professionInformation = courseService.updateProfessionById(Integer.parseInt(profession_id));
		courseService.deleteProfession(professionInformation);
		int department_id = professionInformation.getDepartmentInformation().getDepartment_id();	
		return new ModelAndView("redirect:/courseAction/listProfession/pageNum/1","department_id",department_id);
	}
	@RequestMapping("/updateProfessionById/{profession_id}")
	public String updateProfessionById(@PathVariable("profession_id") int profession_id,ModelMap modelMap){
		ProfessionInformation professionInformation = courseService.getProfessionById(profession_id);
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("professionInformation", professionInformation);
		return "Admin/courseManger/update_profession";
	}
	@RequestMapping("/updateProfession")
	public ModelAndView updateProfession(@ModelAttribute("professionInformation") ProfessionInformation professionInformation){
		courseService.updateProfession(professionInformation);
		int department_id = professionInformation.getDepartmentInformation().getDepartment_id();	
		return new ModelAndView("redirect:/courseAction/listProfession/pageNum/1","department_id",department_id);
    }
	
	
	
	//课程#################################################################
	@RequestMapping("/listCourse/pageNum/{pageNum}")
	public String listCourse(@PathVariable("pageNum") String pageNum, HttpServletRequest request, ModelMap modelMap){
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		modelMap.addAttribute("deptList", deptList);
		String department_id = request.getParameter("department_id");
		String professional_id = request.getParameter("professional_id");
		String subject_id = request.getParameter("subject_id");
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		if(StringUtils.isBlank(department_id)) department_id = "0";
		courseService.initCoursePageBean(pageNum_, department_id, professional_id, subject_id);
		PageBean<Course> pageBean = courseService.getCoursePageList();
		List<Course> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("courseList",list);
		modelMap.addAttribute("department_id", department_id);
		modelMap.addAttribute("professional_id", professional_id);
		modelMap.addAttribute("subject_id", subject_id);
		return "Admin/courseManger/list_course";
	}
	@RequestMapping("/getProfessionById")
	public @ResponseBody Map<String,List> getProfessionById(HttpServletRequest request,ModelMap modelMap){
		String department_id = request.getParameter("department_id");
		List<ProfessionInformation> proList = courseService.getProfessionById(department_id);
		List<TeacherInformation> teaList = courseService.getTeacherById(department_id);
		Map<String,List> listMap=new HashMap<String,List>();
		listMap.put("proList", proList);
		listMap.put("teaList", teaList);
		return listMap;
	}
	@RequestMapping("/getSubjectById")
	public @ResponseBody List<Subject> getSubjectById(HttpServletRequest request,ModelMap modelMap){
		String profession_id = request.getParameter("profession_id");
		List<Subject> proList = courseService.getSubjectById(profession_id);
        return proList;
	}

	@RequestMapping("/getClassById")
	public @ResponseBody List<ClassInformation> getClassById(HttpServletRequest request){
		String grade_id = request.getParameter("grade_id");
		List<ClassInformation> classList = courseService.getClassById(grade_id);
		return classList;
	}
	
	
	@RequestMapping("/addCourse")
	public String addCourse(HttpServletRequest reqeust, ModelMap modelMap){
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		List<GradeInformation> gradeList = courseService.getGradeInformationList();
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("gradeList", gradeList);
		//若出错，下拉列表不更新，则查看exam.js文件里的changeGrade方法，error返回信息
		return "Admin/courseManger/add_course";
	}
	@RequestMapping("/saveCourse")
	public ModelAndView saveCourse(@ModelAttribute("chourse") Course course,HttpServletRequest request){
		courseService.saveCourse(course);
		return new ModelAndView("redirect:/courseAction/listCourse/pageNum/1");
	}
	@RequestMapping("/updateCourseById/{course_id}")
	public String updateCourseById(@PathVariable("course_id") String course_id, ModelMap modelMap){
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		List<GradeInformation> gradeList = courseService.getGradeInformationList();
		Course course = courseService.getCourseById(Integer.parseInt(course_id));
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("gradeList", gradeList);
		modelMap.addAttribute("course", course);
		return "Admin/courseManger/update_course";
	}
	@RequestMapping("/updateCourse")
	public ModelAndView updateCourse(@ModelAttribute("course") Course course){
		courseService.updateCourse(course);
		return new ModelAndView("redirect:/courseAction/listCourse/pageNum/1");
	}
	@RequestMapping("/deleteCourse/{course_id}")
	public ModelAndView deleteCourse(@PathVariable("course_id") String course_id,ModelMap modelMap){
		Course course = courseService.getCourseById(Integer.parseInt(course_id));
		courseService.deleteCourse(course);
		int department_id=course.getDepartmentInformation().getDepartment_id();
		int subject_id=course.getSubject().getSubject_id();
		int professional_id=course.getProfessionInformation().getProfession_id();
		modelMap.addAttribute("department_id",department_id);
		modelMap.addAttribute("subject_id",subject_id);
		modelMap.addAttribute("professional_id",professional_id);
		return new ModelAndView("redirect:/courseAction/listCourse/pageNum/1");
	}
	//科目+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	@RequestMapping("/listSubject/pageNum/{pageNum}")
	public String listSubject(@PathVariable("pageNum") String pageNum, HttpServletRequest request, ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		String professional_id = request.getParameter("professional_id");
		if(StringUtils.isBlank(professional_id)) professional_id = "0";
		courseService.initSubjectPageBean(pageNum_, professional_id);
		PageBean<Subject> pageBean = courseService.getSubjectPageList();
		List<Subject> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("subjectList",list);
		modelMap.addAttribute("deptList", deptList);
		//modelMap.addAttribute("department_id", department_id);
		modelMap.addAttribute("professional_id", professional_id);
		return "Admin/courseManger/list_subject";
	}
	@RequestMapping("/addSubject")
	public String addSubject(ModelMap modelMap){
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		modelMap.addAttribute("deptList", deptList);
		return "Admin/courseManger/add_subject";
	}
	@RequestMapping("/updateSubjectById/{subject}")
	public String updateSubjectById(@PathVariable("subject") String subject_id, ModelMap modelMap){
		Subject subject = courseService.getSubjectById(Integer.parseInt(subject_id));
		List<DepartmentInformation> deptList = courseService.getDepartmentList();
		modelMap.addAttribute("subject", subject);
		modelMap.addAttribute("deptList", deptList);
		return "Admin/courseManger/update_subject";
	}
	@RequestMapping("/updateSubject")
	public ModelAndView updateSubject(@ModelAttribute("subject") Subject subject, HttpServletRequest request){
		courseService.updateSubject(subject);
		return new ModelAndView("redirect:/courseAction/listSubject/pageNum/1");
	}
	
	@RequestMapping("/saveSubject")
	public ModelAndView saveSubject(@ModelAttribute("subject") Subject subject, HttpServletRequest request){
		courseService.saveSubject(subject);
		return new ModelAndView("redirect:/courseAction/listSubject/pageNum/1");
	}
	@RequestMapping("/deleteSubject/{subject_id}")
	public ModelAndView deleteSubject(@PathVariable("subject_id") String subject_id){
		Subject subject = courseService.getSubjectById(Integer.parseInt(subject_id));
		courseService.deleteSubject(subject);
		int professional_id=subject.getProfessionInformation().getProfession_id();
		return new ModelAndView("redirect:/courseAction/listSubject/pageNum/1","professional_id",professional_id);
	}
	
	@RequestMapping("/listRUNNINGExamTask/pageNum/{pageNum}")
	public String listRUNNINGExamTask(@PathVariable("pageNum") String pageNum, HttpServletRequest request, ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		courseService.initExamTaskPageBean(pageNum_, TASK_STATUS_RUNNING);
		PageBean<ExamTask> pageBean = courseService.getExamTaskPageList();
		List<ExamTask> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("taskList",list);
		return "Admin/courseManger/list_task";
		
	}
	@RequestMapping("/updateExamTaskById/{task_id}")
	public ModelAndView updateExamTaskById(@PathVariable("task_id") String task_id, HttpServletRequest request){
		List<ExamTask> taskList = courseService.getExamTaskById(task_id);
		ExamTask examTask= taskList.get(0);
		Date now = new Date();
		Calendar calendar = new GregorianCalendar(); 
	    calendar.setTime(now); 
	    calendar.add(Calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动 
	    now=calendar.getTime();   //这个时间就是日期往后推一天的结果 
		String examTask_start = DateUtil.DateToString(now, "yyyy-MM-dd HH:mm:ss");
		examTask.setExamTask_start(examTask_start);
		examTask.setExamTask_status(TASK_STATUS_PENDING);
		courseService.updateExamTask(examTask);
		return new ModelAndView("redirect:/courseAction/listRUNNINGExamTask/pageNum/1");
	}
}
