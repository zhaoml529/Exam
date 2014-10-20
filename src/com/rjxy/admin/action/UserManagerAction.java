package com.rjxy.admin.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.admin.biz.UserManagerService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.EduBackGround;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.PeopleAge;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.entity.exam.Subject;
import com.rjxy.page.PageBean;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/usermanager")

public class UserManagerAction {
	@Autowired
	private UserManagerService userManagerService;
	//教师############################################################################################
	@RequestMapping("/listTeacher/pageNum/{pageNum}")
	public  String listTeacher(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		String dept_id = request.getParameter("dept_id");
		if(StringUtils.isBlank(dept_id)) dept_id = "1";
		userManagerService.initTeacherPageBean(pageNum_, dept_id);
		PageBean<TeacherInformation> pageBean = userManagerService.getTeacherPageList();
		List<TeacherInformation> teaList = pageBean.getList();
		List<DepartmentInformation> deptList = userManagerService.getDepartmentList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("teacherinformation", teaList);
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("department_id", dept_id);
		return "Admin/userManager/list_teacher";
	}
	
	@RequestMapping("/showTeacherInfo/{tea_id}")
	public String showTeacherInfo(@PathVariable("tea_id") String tea_id, HttpServletRequest request,ModelMap modelMap){
		TeacherInformation teacherinformation = userManagerService.showTeacherById(tea_id);
		modelMap.addAttribute("teacherinformation",teacherinformation);;
		return  "Admin/userManager/show_teacherInfo";
	}
	//修改教师--------------------------------------------------------------------------
	@RequestMapping("/updateTeacherById/{tea_id}")
	public String updateTeacherById(@PathVariable("tea_id") String tea_id,ModelMap modelMap){
		TeacherInformation teacherinformation = userManagerService.getTeacherInfoById(tea_id);
		List<PeopleAge> ageList = userManagerService.getAgelist();
		List<EduBackGround> eduList = userManagerService.getEdulist();
		List<DepartmentInformation> deptList = userManagerService.getDeptlist();
		modelMap.addAttribute("ageList", ageList);
		modelMap.addAttribute("eduList", eduList);
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("teacherinformation", teacherinformation);
		return "Admin/userManager/update_teacherInfo";
	}
	@RequestMapping("/updateTeacherInfo")
	public ModelAndView updateTeacherInfo(@ModelAttribute("teacherinformation") TeacherInformation teacherinformation){
		int dept_id = teacherinformation.getDepartmentInformation().getDepartment_id();		
		userManagerService.updateTeacherInfo(teacherinformation);
		return new ModelAndView("redirect:/usermanager/listTeacher/pageNum/1","dept_id",dept_id);
    }
	
	//添加教师----------------------------------------------------------------
	@RequestMapping("/addTeacher")
	public String addTeacher(ModelMap modelMap){
		List<PeopleAge> ageList = userManagerService.getAgelist();
		List<EduBackGround> eduList = userManagerService.getEdulist();
		List<DepartmentInformation> deptList = userManagerService.getDeptlist();
		modelMap.addAttribute("ageList", ageList);
		modelMap.addAttribute("eduList", eduList);
		modelMap.addAttribute("deptList", deptList);
		return "Admin/userManager/add_teacher";
	}
	@RequestMapping("/saveTeacher")
		public ModelAndView saveTeacher(@ModelAttribute("teacherinformation") TeacherInformation teacherinformation){
		userManagerService.saveTeacher(teacherinformation);
		int dept_id = teacherinformation.getDepartmentInformation().getDepartment_id();		
		return new ModelAndView("redirect:/usermanager/listTeacher/pageNum/1","dept_id",dept_id);
		}		
	
	//删除------------------------------------------------------------------
	@RequestMapping("/deleteTeacher/{tea_id}")
	public ModelAndView deleteTeacher(@PathVariable("tea_id") String tea_id){
		TeacherInformation teacherinformation = userManagerService.getTeacherInfoById(tea_id);
		userManagerService.deleteTeacher(teacherinformation);
		int dept_id = teacherinformation.getDepartmentInformation().getDepartment_id();		
		return new ModelAndView("redirect:/usermanager/listTeacher/pageNum/1","dept_id",dept_id);
	}
	//学生############################################################################################
	@RequestMapping("/listStudent/pageNum/{pageNum}")
	public String listStudent(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		String department_id = request.getParameter("dept_id");
		if(StringUtils.isBlank(department_id)) department_id = "0";
		String profession_id = request.getParameter("pro_id");
		userManagerService.initStudentPageBean(pageNum_, department_id, profession_id);
		PageBean<StudentInformation> pageBean = userManagerService.getStudentPageList();
		List<StudentInformation> studentList = pageBean.getList();
		List<DepartmentInformation> deptList = userManagerService.getDepartmentList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("studentList",studentList);
		modelMap.addAttribute("department_id", department_id);
		modelMap.addAttribute("profession_id", profession_id);
		return "Admin/userManager/list_student";

	}	
	@RequestMapping("/getProfessionById")
	public @ResponseBody Map<String,List> getProfessionById(HttpServletRequest request,ModelMap modelMap){
		String department_id = request.getParameter("department_id");
		List<ProfessionInformation> proList = userManagerService.getProfessionById(department_id);
		Map<String,List> listMap=new HashMap<String,List>();
		listMap.put("proList", proList);
		return listMap;
	}
	@RequestMapping("/getClassById")
	public @ResponseBody List<ClassInformation> getClassById(HttpServletRequest request){
		String grade_id = request.getParameter("grade_id");
		List<ClassInformation> classList = userManagerService.getClassById(grade_id);
		return classList;
	}
	@RequestMapping("/showStudentInfo/{stu_id}")
	public String showStudentInfo(@PathVariable("stu_id") String stu_id, HttpServletRequest request,ModelMap modelMap){
		StudentInformation studentinformation = userManagerService.showStudentById(stu_id);
		modelMap.addAttribute("studentInformation",studentinformation);;
		return  "Admin/userManager/show_studentInfo";
	}
	//修改学生-----------------------------------------------------------------------------------------------
	@RequestMapping("/updateStudentById/{stu_id}")
	public String updateStudentById(@PathVariable("stu_id") String stu_id,ModelMap modelMap){
		StudentInformation studentinformation = userManagerService.getStudentInfoById(stu_id);
		List<DepartmentInformation> deptList = userManagerService.getDeptlist();
		List<GradeInformation> gradeList = userManagerService.getGradelist();
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("gradeList", gradeList);
		modelMap.addAttribute("studentinformation", studentinformation);
		return "Admin/userManager/update_studentInfo";
	}
	@RequestMapping("/updateStudentInfo")
	public ModelAndView updateStudentInfo(@ModelAttribute("studentinformation") StudentInformation studentinformation){
		//int dept_id = studentinformation.getDepartmentInformation().getDepartment_id();		
		userManagerService.updateStudentInfo(studentinformation);
		return new ModelAndView("redirect:/usermanager/listStudent/pageNum/1");
    }
	@RequestMapping("/saveStudent")
	public ModelAndView saveStudent(@ModelAttribute("studentinformation") StudentInformation studentinformation){
		userManagerService.saveStudent(studentinformation);
		return new ModelAndView("redirect:/usermanager/listStudent/pageNum/1");
	}
	//添加学生-----------------------------------------------------------------------------------------------
	@RequestMapping("/addStudent")
	public String addStudent(ModelMap modelMap){
		List<DepartmentInformation> deptList = userManagerService.getDeptlist();
		List<GradeInformation> gradeList = userManagerService.getGradelist();
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("gradeList", gradeList);
		return "Admin/userManager/add_student";
	}
	//删除学生-----------------------------------------------------------------------------------------------
	@RequestMapping("/deleteStudent/{stu_id}")
	public ModelAndView deleteStudent(@PathVariable("stu_id") String stu_id){
		StudentInformation studentinformation = userManagerService.getStudentInfoById(stu_id);
		userManagerService.deleteStudent(studentinformation);
		int dept_id = studentinformation.getDepartmentInformation().getDepartment_id();	
		return new ModelAndView("redirect:/usermanager/listStudent/pageNum/1","dept_id",dept_id);
		}

	//年龄############################################################################################
	@RequestMapping("/listAge/pageNum/{pageNum}")
	public String listAge(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		userManagerService.initAgePageBean(pageNum_);
		PageBean<PeopleAge> pageBean = userManagerService.getAgePageList();
		List<PeopleAge> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("peopleAge",list);
		return "Admin/userManager/list_age";
		
	}
	@RequestMapping("/addAge")
	public String addAction(){
		return "Admin/userManager/add_age";
		
	}
	@RequestMapping("/saveAge")
	public ModelAndView saveAge(@ModelAttribute("peopleage") PeopleAge peopleage){
		userManagerService.saveAge(peopleage);
		return new ModelAndView("redirect:/usermanager/listAge/pageNum/1");
	}
	@RequestMapping("/deleteAge/{age_id}")
	public ModelAndView deleteAge(@PathVariable("age_id") String age_id){
		PeopleAge peopleage = userManagerService.updateAgeById(Integer.parseInt(age_id));
		userManagerService.deleteAge(peopleage);
		return new ModelAndView("redirect:/usermanager/listAge/pageNum/1");
	}

	@RequestMapping("/updateAgeById/{age_id}")
	public String updateAgeById(@PathVariable("age_id") String age_id,ModelMap modelMap){
		PeopleAge peopleage = userManagerService.updateAgeById(Integer.parseInt(age_id));
		modelMap.addAttribute("peopleage", peopleage);
		return "Admin/userManager/update_age";
	}

	@RequestMapping("/updateAge")
	public ModelAndView updateAge(@ModelAttribute("peopleage") PeopleAge peopleage){
		userManagerService.updateAge(peopleage);
		return new ModelAndView("redirect:/usermanager/listAge/pageNum/1");
    }
	//学历##########################################################################
	@RequestMapping("/listEduction/pageNum/{pageNum}")
	public String listEduction(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		userManagerService.initEductionBean(pageNum_);
		PageBean<EduBackGround> pageBean = userManagerService.getEductionList();
		List<EduBackGround> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("eduBackGround",list);
		return "Admin/userManager/list_eduction";
    }
	@RequestMapping("/addEduction")
	public String addEduction(){
		return "Admin/userManager/add_eduction";
		
	}
	@RequestMapping("/saveEduction")
	public ModelAndView saveEduction(@ModelAttribute("edubackground") EduBackGround edubackground){
		userManagerService.saveEduction(edubackground);
		return new ModelAndView("redirect:/usermanager/listEduction/pageNum/1");
	}
	@RequestMapping("/updateEductionById/{eduBackGround_id}")
	public String updateEductionById(@PathVariable("eduBackGround_id") String eduBackGround_id,ModelMap modelMap){
		EduBackGround edubackground = userManagerService.updateEductionById(Integer.parseInt(eduBackGround_id));
		modelMap.addAttribute("edubackground", edubackground);
		return "Admin/userManager/update_eduction";
	}
	
	@RequestMapping("/updateEduction")
	public ModelAndView updateEduction(@ModelAttribute("edubackground") EduBackGround edubackground){
		userManagerService.updateEduction(edubackground);
		return new ModelAndView("redirect:/usermanager/listEduction/pageNum/1");
  
	}
	@RequestMapping("/deleteEduction/{eduBackGround_id}")
	public ModelAndView deleteEduction(@PathVariable("eduBackGround_id") String eduBackGround_id){
		EduBackGround edubackground = userManagerService.updateEductionById(Integer.parseInt(eduBackGround_id));
		userManagerService.deleteEduction(edubackground);
		return new ModelAndView("redirect:/usermanager/listEduction/pageNum/1");
	}

	}
