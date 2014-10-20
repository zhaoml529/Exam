/**
 * Project Name:ExamDemo
 * File Name:BaseController.java
 * Package Name:com.rjxy.action
 * Date:2014-5-21����1:08:58
 *
 */
package com.rjxy.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName: BaseController
 * @Description:TODO(������һ�仰��������������)
 * @author: zml
 * @date: 2014-5-21 ����1:08:58
 *
 */
public class BaseController {
	@Autowired  
	protected  HttpServletRequest request;
	
	protected static final Log LOG = LogFactory.getLog(BaseController.class);
	
	// AJAX���������null
    public String ajax(String content, String type, HttpServletResponse response) {
        try {
            response.setContentType(type + ";charset=UTF-8");
            response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.getWriter().write(content);
            response.getWriter().flush();
        } catch (IOException e) {
            LOG.error("ajax", e);
        }
        return null;
    }
	
	/**AJAX���HTML������null**/
    public String ajaxHtml(String html, HttpServletResponse response) {
        return ajax(html, "text/html", response);
    }
    
    /**AJAX���json������null**/
    public String ajaxJson(String json, HttpServletResponse response) {
        return ajax(json, "application/json", response);
    }
}
