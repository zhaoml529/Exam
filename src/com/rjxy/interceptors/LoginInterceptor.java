package com.rjxy.interceptors;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -5718204L;

	public String intercept(ActionInvocation invocation) throws Exception {

		ActionContext actionContext = invocation.getInvocationContext();
		Object username = actionContext.getSession().get("LoginUser");
		
		// 获取HttpServletRequest对象         
		//HttpServletRequest req = ServletActionContext.getRequest();      
		// 获取此请求的地址，请求地址包含application name，进行subString操作，去除application name          
		//String path = req.getRequestURI(); 
		if( null != username ) {
			//actionContext.put("tip","Login");
			return invocation.invoke();
		}
		//actionContext.put("tip", "You have not login yet or already logoff, please login first!");
		return "/user/login_view";
	}
}
