package com.rjxy.interceptors;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.rjxy.biz.LoginService;
import com.rjxy.entity.role.Action;
import com.rjxy.entity.role.GroupRAM;
import com.rjxy.util.BeanUtils;

public class RightInterceptor implements HandlerInterceptor {

	@Autowired
	private LoginService roleService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		// TODO Auto-generated method stub
		Object user = request.getSession().getAttribute("LoginUser");
		String path = request.getContextPath();
		if(BeanUtils.isBlank(user)){
			request.getSession().setAttribute("LoginUser", 1);
			 PrintWriter out = response.getWriter(); 
             StringBuilder builder = new StringBuilder(); 
             builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">"); 
             builder.append("alert(\"Long time no operation,please login again.\");"); 
             builder.append("window.top.location.href=\""); 
             builder.append(path); 
             builder.append("/view/login_view\";</script>"); 
             out.print(builder.toString()); 
             out.close(); 
			return false;
		}else{
			String role = (String) request.getSession().getAttribute("role");
//			String actionName[] = (String[]) request.getSession().getAttribute("actionName");
//			String modelName[] = (String[]) request.getSession().getAttribute("modelName");
//			
			List<GroupRAM> list = new ArrayList<GroupRAM>();
			String url=request.getRequestURL().toString();
			boolean isSafe = false;
			if("学生".equals(role)){
				 list = roleService.getGroupRAMListByRoleId("2");
			}else if("教师".equals(role)){
				 list = roleService.getGroupRAMListByRoleId("1");
			}else{
				 list = roleService.getGroupRAMListByRoleId("3");
			}
			if(!BeanUtils.isBlank(list)){
				for(GroupRAM ram:list){
					String m_url = ram.getGroupAM().getModule().getModule_URL();
					String action = ram.getGroupAM().getAction().getAction_name();
					//http://ExamDemo/exam/addExamPaper 先比较模块exam是否存在url中，在比较动作add是否存在/exam后面的字符串中
					if(url.indexOf(m_url)!=-1 && url.indexOf(action, url.indexOf(m_url)+m_url.length())!=-1){
						isSafe = true;
						break;
					}
				}
				if(isSafe){
					return true;
				}else{
					response.sendRedirect(path+"/view/noRights");
					return false;
				}
			}else{
				response.sendRedirect(path+"/view/noRights");
				return false;
			}
		}
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView mav) throws Exception {
		// TODO Auto-generated method stub
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exception)
			throws Exception {
		// TODO Auto-generated method stub
	}

}
