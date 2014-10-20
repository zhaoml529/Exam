package com.rjxy.admin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.admin.biz.DepartmentService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.page.PageBean;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/department")
public class DepartmentAction {
	@Autowired
	private DepartmentService departmentservice;	
	@RequestMapping("/listDepartment/pageNum/{pageNum}")
	public String listDepartment(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		departmentservice.initDepartmentPageBean(pageNum_);
		PageBean<DepartmentInformation> pageBean = departmentservice.getDepartmentPageList();
		List<DepartmentInformation> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("departmentInformation",list);
		return "Admin/departmentManager/list_department";
		
	}
	@RequestMapping("/addDepartment")
	public String addAction(){
		return "Admin/departmentManager/add_department";
		
	}
	@RequestMapping("/saveDepartment")
	public ModelAndView saveDepartment(@ModelAttribute("departmentinformation") DepartmentInformation departmentinformation){
		departmentservice.saveDepartment(departmentinformation);
		return new ModelAndView("redirect:/department/listDepartment/pageNum/1");
	}
	@RequestMapping("/deleteDepartment/{department_id}")
	public ModelAndView deleteDepartment(@PathVariable("department_id") String department_id){
		DepartmentInformation departmentinformation = departmentservice.getDepartmentById(Integer.parseInt(department_id));
		departmentservice.deleteDepartment(departmentinformation);
		return new ModelAndView("redirect:/department/listDepartment/pageNum/1");
	}

	@RequestMapping("/getDepartmentById/{department_id}")
	public String getDepartmentById(@PathVariable("department_id") String department_id,ModelMap modelMap){
		DepartmentInformation departmentInformation = departmentservice.getDepartmentById(Integer.parseInt(department_id));
		modelMap.addAttribute("departmentInformation", departmentInformation);
		return "Admin/departmentManager/update_department";
	}
	
	@RequestMapping("/updateDepartment")
	public ModelAndView updateAge(@ModelAttribute("departmentinformation") DepartmentInformation departmentinformation){
		departmentservice.updateDepartment(departmentinformation);
		return new ModelAndView("redirect:/department/listDepartment/pageNum/1");
  
	}

//Äê¼¶#########################################################################################
	@RequestMapping("/listGrade/pageNum/{pageNum}")
	public String listGrade(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		departmentservice.initGradePageBean(pageNum_);
		PageBean<GradeInformation> pageBean = departmentservice.getGradePageList();
		List<GradeInformation> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("gradeInformation",list);
		return "Admin/departmentManager/list_grade";
		
	}
	@RequestMapping("/getGradeById/{grade_id}")
	public String getGradeById(@PathVariable("grade_id") int grade_id,ModelMap modelMap){
		GradeInformation gradeInformation = departmentservice.getGradeById(grade_id);
		modelMap.addAttribute("gradeInformation", gradeInformation);
		return "Admin/departmentManager/update_grade";
	}
	
	@RequestMapping("/updateGrade")
	public ModelAndView updateGrade(@ModelAttribute("gradeInformation") GradeInformation gradeInformation){
		departmentservice.updateGrade(gradeInformation);
		return new ModelAndView("redirect:/department/listGrade/pageNum/1");
  
	}
	@RequestMapping("/addGrade")
	public String addGrade(){
		return "Admin/departmentManager/add_grade";
		
	}
	@RequestMapping("/saveGrade")
	public ModelAndView saveGrade(@ModelAttribute("gradeInformation") GradeInformation gradeInformation){
		departmentservice.saveGrade(gradeInformation);
		return new ModelAndView("redirect:/department/listGrade/pageNum/1");
	}
	@RequestMapping("/deleteGrade/{grade_id}")
	public ModelAndView deleteGrade(@PathVariable("grade_id") int grade_id){
		GradeInformation gradeInformation = departmentservice.getGradeById(grade_id);
		departmentservice.deleteGrade(gradeInformation);
		return new ModelAndView("redirect:/department/listGrade/pageNum/1");
	}
	//°à¼¶###################################################################################
	@RequestMapping("/listClass/pageNum/{pageNum}")
	public  String listClass(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		String grade_id = request.getParameter("grade_id");
		if(StringUtils.isBlank(grade_id)) grade_id = "1";
		departmentservice.initClassPageBean(pageNum_, grade_id);
		PageBean<ClassInformation> pageBean = departmentservice.getClassPageList();
		List<ClassInformation> classList = pageBean.getList();
		List<GradeInformation> gradeList = departmentservice.getGradeList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("classinformation", classList);
		modelMap.addAttribute("gradeList", gradeList);
		return "Admin/departmentManager/list_class";
	}
	
	@RequestMapping("/listClassBygradeID")
	public String listClassBydeptID(HttpServletRequest request, ModelMap modelMap){
		return "Admin/departmentManager/list_classInfo";
	}
	@RequestMapping("/updateClassById/{class_id}")
	public String updateClassById(@PathVariable("class_id") String class_id,ModelMap modelMap){
		ClassInformation classInformation = departmentservice.getClassInfoById(class_id);
		List<GradeInformation> gradeList = departmentservice.getGradeList();
		modelMap.addAttribute("gradeList", gradeList);
		modelMap.addAttribute("classinformation", classInformation);
		return "Admin/departmentManager/update_class";
	}
	@RequestMapping("/updateClass")
	public ModelAndView updateClass(@ModelAttribute("classInformation") ClassInformation classinformation){
		int grade_id = classinformation.getGradeInforMation().getGrade_id();		
		departmentservice.updateClass(classinformation);
		return new ModelAndView("redirect:/department/listClass/pageNum/1","grade_id",grade_id);
    }
	@RequestMapping("/addClass")
	public String addClass(ModelMap modelMap){
		List<GradeInformation> gradeList = departmentservice.getGradeList();
		modelMap.addAttribute("gradeList", gradeList);
		return "Admin/departmentManager/add_class";
	}
	@RequestMapping("/saveclass")
		public ModelAndView saveClass(@ModelAttribute("classInformation") ClassInformation classinformation){
		departmentservice.saveClass(classinformation);		
		int grade_id = classinformation.getGradeInforMation().getGrade_id();		
		return new ModelAndView("redirect:/department/listClass/pageNum/1","grade_id",grade_id);
		}	
	@RequestMapping("/deleteClass/{class_id}")
	public ModelAndView deleteClass(@PathVariable("class_id") String class_id){
		ClassInformation classinformation = departmentservice.getClassInfoById(class_id);
		departmentservice.deleteClass(classinformation);
		return new ModelAndView("redirect:/department/listClass/pageNum/1");
	}
}
