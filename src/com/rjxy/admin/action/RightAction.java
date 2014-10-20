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

import com.rjxy.admin.biz.RightService;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.role.Action;
import com.rjxy.entity.role.GroupAM;
import com.rjxy.entity.role.GroupRAM;
import com.rjxy.entity.role.Module;
import com.rjxy.entity.role.Role;
import com.rjxy.entity.role.TeaRole;
import com.rjxy.page.PageBean;
import com.rjxy.util.BeanUtils;
import com.rjxy.util.StringUtils;

@Controller
@RequestMapping("/right")
public class RightAction {
	@Autowired
	private RightService rightService;
	
	@RequestMapping("/listAction/pageNum/{pageNum}")
	public  String listAction(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		rightService.initActionPageBean(pageNum_);
		PageBean<Action> pageBean = rightService.getActionPageList();
		List<Action> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("actionList",list);
		return "Admin/roleManager/list_action";
	}
	
	@RequestMapping("/addAction")
	public String addAction(){
		return "Admin/roleManager/add_action";
		
	}
	
	@RequestMapping("/saveAction")
	public ModelAndView saveAction(@ModelAttribute("action") Action action){
		rightService.save(action);
		
		return new ModelAndView("redirect:/right/listAction/pageNum/1");
	}
	
	@RequestMapping("/deleteAction/{action_id}")
	public ModelAndView deleteAction(@PathVariable("action_id") String action_id){
		Action action = rightService.getActionById(Integer.parseInt(action_id));
		rightService.deleteAction(action);
		return new ModelAndView("redirect:/right/listAction/pageNum/1");
	}
	
	@RequestMapping("/updateActionById/{action_id}")
	public String updateActionById(@PathVariable("action_id") String action_id,ModelMap modelMap){
		Action action = rightService.getActionById(Integer.parseInt(action_id));
		modelMap.addAttribute("action", action);
		return "Admin/roleManager/update_action";
	}
	
	@RequestMapping("/updateAction")
	public ModelAndView updateAction(@ModelAttribute("action") Action action){
		rightService.updateAction(action);
		return new ModelAndView("redirect:/right/listAction/pageNum/1");
	}
	
	@RequestMapping("/listModule/pageNum/{pageNum}")
	public String listModule(@PathVariable("pageNum") String pageNum, ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		rightService.initModulePageBean(pageNum_);
		PageBean<Action> pageBean = rightService.getModulePageList();
		List<Action> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("moduleList",list);
		return "Admin/roleManager/list_module";
		
	}
	
	@RequestMapping("/addModule")
	public String addModule(){
		return "Admin/roleManager/add_module";
	}
	
	@RequestMapping("/saveModule")
	public ModelAndView saveModule(@ModelAttribute("module") Module module){
		rightService.save(module);
		return new ModelAndView("redirect:/right/listModule/pageNum/1");
	} 
	
	@RequestMapping("/deleteModule/{module_id}")
	public ModelAndView deleteModule(@PathVariable("module_id") String module_id){
		Module module = rightService.getModuleById(Integer.parseInt(module_id));
		rightService.deleteModule(module);
		return new ModelAndView("redirect:/right/listModule/pageNum/1");
	}
	
	@RequestMapping("/updateModuleById/{module_id}")
	public String updateModuleById(@PathVariable("module_id") String module_id,ModelMap modelMap){
		Module module = rightService.getModuleById(Integer.parseInt(module_id));
		modelMap.addAttribute("module", module);
		return "Admin/roleManager/update_module";
	}
	
	@RequestMapping("/updateModule")
	public ModelAndView updateModule(@ModelAttribute("module") Module module){
		rightService.updateModule(module);
		return new ModelAndView("redirect:/right/listModule/pageNum/1");
	}
	
	@RequestMapping("/revokeModuleById/{module_id}")
	public String revokeModule(@PathVariable("module_id") String module_id, ModelMap modelMap){
		List<Action> actionList = rightService.getActionList();
		List<GroupAM> groupAMList = rightService.getGroupAMListById(module_id);
		modelMap.addAttribute("actionList", actionList);
		modelMap.addAttribute("groupAMList", groupAMList);
		modelMap.addAttribute("module_id", module_id);
		return "Admin/roleManager/add_ModuleAction";
	}
	
	@RequestMapping("/addGroupAM/{action_id}/{module_id}")
	public ModelAndView addGroupAM(@PathVariable("action_id") String action_id, 
			@PathVariable("module_id") String module_id,ModelMap modelMap){
		Action action = rightService.getActionById(Integer.parseInt(action_id));
		Module module = rightService.getModuleById(Integer.parseInt(module_id));
		GroupAM groupAM = new GroupAM();
		groupAM.setAction(action);
		groupAM.setModule(module);
		rightService.addGroupAM(groupAM);
		return new ModelAndView("redirect:/right/revokeModuleById/"+module_id);
	}
	
	@RequestMapping("/addGroupRAM/{role_id}/{am_id}")
	public ModelAndView addGroupRAM(@PathVariable("role_id") String role_id, @PathVariable("am_id") String am_id){
		Role role = rightService.getRoleById(Integer.parseInt(role_id));
		GroupAM groupAM = rightService.getGroupAMById(Integer.parseInt(am_id));
		GroupRAM groupRAM = new GroupRAM();
		groupRAM.setGroupAM(groupAM);
		groupRAM.setRole(role);
		rightService.addGroupRAM(groupRAM);
		return new ModelAndView("redirect:/right/revokeRoleById/"+role_id);
		
	}
	
	
	@RequestMapping("/deleteGroupAM/{action_id}/{module_id}")
	public ModelAndView deleteGroupAM(@PathVariable("action_id") String action_id, 
								@PathVariable("module_id") String module_id,ModelMap modelMap){
		List<GroupAM> groupAMList = rightService.getGroupAMListById(action_id, module_id);
		rightService.deleteGroupAM(groupAMList.get(0));
		return new ModelAndView("redirect:/right/revokeModuleById/"+module_id);
	}
	
	@RequestMapping("/deleteGroupRAM/{role_id}/{am_id}")
	public ModelAndView deleteGroupRAM(@PathVariable("role_id") String role_id, @PathVariable("am_id") String am_id){
		List<GroupRAM> ramList = rightService.getGroupRAMById(role_id, am_id);
		GroupRAM groupRAM = new GroupRAM();
		if(!BeanUtils.isBlank(ramList)){
			groupRAM = ramList.get(0);
		}
		rightService.deleteGroupRAM(groupRAM);
		return new ModelAndView("redirect:/right/revokeRoleById/"+role_id);
	}
	
	@RequestMapping("/listRole/pageNum/{pageNum}")
	public String listRole(@PathVariable("pageNum") String pageNum, ModelMap modelMap){
		if(StringUtils.isBlank(pageNum)){
			pageNum = "1";
		}
		int pageNum_ = Integer.parseInt(pageNum); 
		rightService.initRolePageBean(pageNum_);
		PageBean<Role> pageBean = rightService.getRolePageList();
		List<Role> list = pageBean.getList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("roleList",list);
		return "Admin/roleManager/list_role";
	}
	
	@RequestMapping("/addRole")
	public String addRole(){
		return "Admin/roleManager/add_role";
	}
	
	@RequestMapping("/saveRole")
	public ModelAndView saveRole(@ModelAttribute("role") Role role){
		rightService.saveRole(role);
		return new ModelAndView("redirect:/right/listRole/pageNum/1");
	} 
	
	@RequestMapping("/deleteRole/{role_id}")
	public ModelAndView deleteRole(@PathVariable("role_id") String role_id){
		Role role = rightService.getRoleById(Integer.parseInt(role_id));
		rightService.deleteRole(role);
		return new ModelAndView("redirect:/right/listRole/pageNum/1");
	}
	
	@RequestMapping("/updateRoleById/{role_id}")
	public String updateRoleById(@PathVariable("role_id") String role_id,ModelMap modelMap){
		Role role = rightService.getRoleById(Integer.parseInt(role_id));
		modelMap.addAttribute("role", role);
		return "Admin/roleManager/update_role";
	}
	
	@RequestMapping("/updateRole")
	public ModelAndView updateRole(@ModelAttribute("role") Role role){
		rightService.updateRole(role);
		return new ModelAndView("redirect:/right/listRole/pageNum/1");
	}
	
	@RequestMapping("/revokeRoleById/{role_id}")
	public String revokeRoleById(@PathVariable("role_id") String role_id, ModelMap modelMap){
		List<GroupRAM> groupRAMList = rightService.getGroupRAMListById(role_id);
		List<Module> moduleList = rightService.getModuleList();
		List<GroupAM> groupAMList = rightService.getGroupAMList();
		modelMap.addAttribute("groupRAMList", groupRAMList);
		modelMap.addAttribute("moduleList", moduleList);
		modelMap.addAttribute("groupAMList", groupAMList);
		modelMap.addAttribute("role_id", role_id);
		return "Admin/roleManager/add_RoleModuleAction";
	}
	
	@RequestMapping("/revokeTeaRoleById/{tea_id}")
	public String revokeTeaRoleById(@PathVariable("tea_id") String tea_id, ModelMap modelMap){
		List<Role> roleList = rightService.getRoleList();
		List<TeaRole> teaRoleList = rightService.getTeaRoleById(tea_id);
		modelMap.addAttribute("roleList", roleList);
		modelMap.addAttribute("teaRoleList", teaRoleList);
		modelMap.addAttribute("tea_id", tea_id);
		return "Admin/roleManager/add_teaRole";
		
	}
	@RequestMapping("/deleteTeaRole/{tea_id}/{role_id}")
	public ModelAndView deleteTeaRole(@PathVariable("tea_id") String tea_id, @PathVariable("role_id") String role_id){
		List<TeaRole> teaRole = rightService.getTeaRoleById(tea_id, role_id);
		if(!BeanUtils.isBlank(teaRole)){
			rightService.deleteTeaRole(teaRole.get(0));
		}
		return new ModelAndView("redirect:/right/revokeTeaRoleById/"+tea_id);
	}
	
	@RequestMapping("/addTeaRole/{tea_id}/{role_id}")
	public ModelAndView addTeaRole(@PathVariable("tea_id") String tea_id, @PathVariable("role_id") String role_id){
		Role role = rightService.getRoleById(Integer.parseInt(role_id));
		TeacherInformation teacher = rightService.getTeacherInformationById(tea_id);
		TeaRole teaRole = new TeaRole();
		teaRole.setTeacherInformation(teacher);
		teaRole.setRole(role);
		rightService.addTeaRole(teaRole);
		return new ModelAndView("redirect:/right/revokeTeaRoleById/"+tea_id);
	}
	
	//教师权限管理
//	@RequestMapping("/listTeaRole/{dept_id}")
//	public String listTeaRole(@PathVariable("dept_id") String dept_id, ModelMap modelMap){
//		List<DepartmentInformation> deptList = rightService.getDepartmentList();
//		List<TeacherInformation> teaList = rightService.getTeaInformationByDeptId(dept_id);
//		modelMap.addAttribute("teacherinformation", teaList);
//		modelMap.addAttribute("deptList", deptList);
//		return "Admin/roleManager/list_teaRole";
//	}
	
	
	@RequestMapping("/listTeaRole/pageNum/{pageNum}")
	public  String listTeaRole(@PathVariable("pageNum") String pageNum, HttpServletRequest request,ModelMap modelMap){
		int pageNum_ = Integer.parseInt(pageNum); 
		String dept_id = request.getParameter("dept_id");
//		if(StringUtils.isBlank(dept_id)){ 
//			dept_id = "1";
//		}
		if(StringUtils.isBlank(dept_id)){
			dept_id = request.getParameter("department_id");
			if(StringUtils.isBlank(dept_id)){
				dept_id = "1";
			}
		}
		rightService.initTeacherPageBean(pageNum_, dept_id);
		PageBean<TeacherInformation> pageBean = rightService.getTeacherPageList();
		List<TeacherInformation> teaList = pageBean.getList();
		List<DepartmentInformation> deptList = rightService.getDepartmentList();
		modelMap.addAttribute("pageBean",pageBean);
		modelMap.addAttribute("teacherinformation", teaList);
		modelMap.addAttribute("deptList", deptList);
		modelMap.addAttribute("department_id", dept_id);
		return "Admin/roleManager/list_teaRole";
	}
	
	@RequestMapping("/listTeaRoleBydeptID")
	public String listTeaRoleBydeptID(HttpServletRequest request, ModelMap modelMap){
		return "Admin/roleManager/list_deptTeacher";
	}
	
}
