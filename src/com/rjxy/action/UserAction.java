package com.rjxy.action;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjxy.biz.UserService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.entity.exam.Subject;
import com.rjxy.page.PageBean;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/user")
public class UserAction {
	@Autowired
	private UserService userService;
	@RequestMapping("/showStudent")
	public  String showStudent(HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String stu_id = (String) session.getAttribute("user_id");
		StudentInformation studentInformation=userService.getStudentById(stu_id);
		modelMap.addAttribute("studentInformation",studentInformation);
		return "User/showStudent";
	}
	@RequestMapping("/showTeacher")
	public  String showTeacher(HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		TeacherInformation teacherInformation = userService.getTeacherById(tea_id);
		modelMap.addAttribute("teacherInformation", teacherInformation);
		return "User/showTeacher";
	}
	@RequestMapping("/updateStudentPassword")
	public String updateStudentPassword(HttpServletRequest request,ModelMap modelMap){
		return "User/updateStudentPassword";
	}
	
	@RequestMapping("/saveStudentPassword")
	public  String saveStudentPassword(HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String stu_id = (String) session.getAttribute("user_id");
		StudentInformation studentInformation=userService.getStudentById(stu_id);
		String oldPass=request.getParameter("oldpass");
		String password = request.getParameter("newpass");
		if (oldPass .equals(studentInformation.getStu_password())) {
			studentInformation.setStu_password(password);
			userService.updateStudentPassword(studentInformation);
			modelMap.addAttribute("message","修改密码成功!");
		}else{
			modelMap.addAttribute("message","当前密码输入错误,请重新输入！");
		}		
		return "User/updateStudentPassword";
	}
	@RequestMapping("/updateTeacherPassword")
	public String updateTeacherPassword(HttpServletRequest request,ModelMap modelMap){
		return "User/updateTeacherPassword";
	}
	@RequestMapping("/saveTeacherPassword")
	public String saveTeacherPassword(HttpServletRequest request,ModelMap modelMap){
			HttpSession session = request.getSession();
			String tea_id = (String) session.getAttribute("user_id");
			TeacherInformation teacherInformation = userService.getTeacherById(tea_id);
			String oldPass=request.getParameter("oldpass");
			String password = request.getParameter("newpass");
			if (oldPass .equals(teacherInformation.getTea_password())) {
				teacherInformation.setTea_password(password);
				userService.updateTeacherPassword(teacherInformation);
				modelMap.addAttribute("message","修改密码成功!");
			}else{
				modelMap.addAttribute("message","当前密码输入错误,请重新输入！");
			}		
			return "User/updateTeacherPassword";
		}
	@RequestMapping("/listCourse/pageNum/{pageNum}")
	public String listCourse(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		int pageNum_ = Integer.parseInt(pageNum); 
		userService.initCoursePageBean(pageNum_,tea_id);
		PageBean<Course> pageBean = userService.getCoursePageList();
		List<Course> courselist = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("courselist",courselist);
		return "/User/list_course";
		
	}
	
	@RequestMapping("/listTeaStudent/{class_id}")
	public String listTeaStudent(@PathVariable("class_id") String class_id, HttpServletRequest request,ModelMap modelMap){
		HttpSession session = request.getSession();
		String tea_id = (String) session.getAttribute("user_id");
		List<Course> courseList = userService.getCourseListByTeaId(tea_id);
		List<StudentInformation> stuList = userService.getStudentList(class_id);
		Set<GradeInformation> gradeSet = new HashSet<GradeInformation>();
		Set<ClassInformation> classSet = new HashSet<ClassInformation>();
		Set<Subject> subjectSet = new HashSet<Subject>();
		if (courseList != null && courseList.size() != 0) {
			for (int i = 0; i < courseList.size(); i++) {
				gradeSet.add(courseList.get(i).getGradeInformation());
				classSet.add(courseList.get(i).getClassInformation());
			}
		}
		modelMap.addAttribute("classSet", classSet);
		modelMap.addAttribute("gradeSet", gradeSet);
		modelMap.addAttribute("studentList", stuList);
		return "/User/list_teaStudent";
	}
	
}	
	
