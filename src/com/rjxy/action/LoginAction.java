package com.rjxy.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.biz.LoginService;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.role.Action;
import com.rjxy.entity.role.GroupRAM;
import com.rjxy.entity.role.TeaRole;
import com.rjxy.util.BeanUtils;

@Controller
@RequestMapping("/view")
public class LoginAction {
	protected final transient Log log = LogFactory.getLog(LoginAction.class);
	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping("/login_view")
	public  String loginView(HttpServletRequest request,ModelMap modelMap){
		return "Login";
	}
	@RequestMapping("/noRights")
	public String noRights(HttpServletRequest request,ModelMap modelMap){
		return "ErrorPage/NoRights";
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws Exception{
		HttpSession session = request.getSession();
		session.removeAttribute("LoginUser");
		session.removeAttribute("user_id");
		session.removeAttribute("user_name");
		session.removeAttribute("serializablePaper");
//		session.removeAttribute("modelName");
		session.invalidate();
		return new ModelAndView("redirect:/view/login_view");
	}
	//1.教师 2.学生 3.管理员 4.超级管理员
	@RequestMapping("/login")
	public String login(HttpServletRequest request,ModelMap modelMap){
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		HttpSession session = request.getSession();
		session.setAttribute("role", role);
		if("学生".equals(role)){
			List<StudentInformation> studentList = loginService.getStudentById(userid);
			if(studentList==null || studentList.size()==0){
				modelMap.addAttribute("errorMessage", "用户名不存在");
				return "Login";
			}else{
				if(!password.equals(studentList.get(0).getStu_password())){
					modelMap.addAttribute("errorMessage", "密码错误");
					return "Login";
				}else{
//					List<GroupRAM> list = loginService.getGroupRAMListByRoleId("2");
//					String actionName[] = new String[list.size()];
//					String modelName[] = new String[list.size()];
//					for(int i=0;i<list.size();i++){
//						actionName[i] = list.get(i).getGroupAM().getAction().getAction_name();
//						modelName[i] = list.get(i).getGroupAM().getModule().getModule_URL();
//					}
					session.setAttribute("LoginUser", studentList.get(0));
					session.setAttribute("user_id", studentList.get(0).getStu_id());
					session.setAttribute("user_name", studentList.get(0).getStu_name());
//					session.setAttribute("actionName", actionName);
//					session.setAttribute("modelName", modelName);
					return "student_index";
				}
			}
		}else{
			List<TeacherInformation> teacherList = loginService.getTeacherById(userid);
			if(teacherList==null || teacherList.size()==0){
				modelMap.addAttribute("errorMessage", "用户名不存在");
				return "Login";
			}else{
				if(!password.equals(teacherList.get(0).getTea_password())){
					modelMap.addAttribute("errorMessage", "密码错误");
					return "Login";
				}else{
//					List<GroupRAM> list = loginService.getGroupRAMListByRoleId("1");
//					String actionName[] = new String[list.size()];
//					String modelName[] = new String[list.size()];
//					for(int i=0;i<list.size();i++){
//						System.out.println(list.get(i).getGroupAM().getAction().getAction_name());
//						actionName[i]=list.get(i).getGroupAM().getAction().getAction_name();
//						modelName[i] = list.get(i).getGroupAM().getModule().getModule_URL();
//					}
					session.setAttribute("LoginUser", teacherList.get(0));
					session.setAttribute("user_id", teacherList.get(0).getTea_id());
					session.setAttribute("user_name", teacherList.get(0).getTea_name());
//					session.setAttribute("actionName", actionName);
//					session.setAttribute("modelName", modelName);
					List<TeaRole> teaRoleList = loginService.getTeaRoleById(userid);
					if("教师".equals(role)){
						if(BeanUtils.isBlank(teaRoleList)){
							modelMap.addAttribute("errorMessage", "您没有教师角色");
						}else{
							for(int i=0;i<teaRoleList.size();i++){
								TeaRole teaRole = teaRoleList.get(i);
								if(role.equals(teaRole.getRole().getRole_name())){
									return "teacher_index";
								}
							}
						}
						return "Login";
					}else if("管理员".equals(role)){
						if(BeanUtils.isBlank(teaRoleList)){
							modelMap.addAttribute("errorMessage", "您没有管理员角色");
						}else{
							for(int i=0;i<teaRoleList.size();i++){
								TeaRole teaRole = teaRoleList.get(i);
								if(role.equals(teaRole.getRole().getRole_name())){
									return "manager_index";
								}
							}
						}
						return "Login";
					}
				}
			}
		}
		return role;
		
	}
}
