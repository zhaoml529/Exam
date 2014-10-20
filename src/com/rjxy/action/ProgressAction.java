/**
 * Project Name:ExamDemo
 * File Name:ProgressAction.java
 * Package Name:com.rjxy.action
 * Date:2014-5-21����12:32:05
 *
 */
package com.rjxy.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rjxy.entity.Progress;


/**
 * @ClassName: ProgressAction
 * @Description:TODO(��ȡ�ϴ��ļ�����controller)
 * @author: zml
 * @date: 2014-5-21 ����12:32:05
 *
 */
@Controller
@RequestMapping("/fileStatus")
public class ProgressAction {
	
	@RequestMapping("/file_manager/progress")
	@ResponseBody
	public String initCreateInfo(HttpServletRequest request) {
		Progress status = (Progress) request.getSession().getAttribute("upload_ps");
		if(status==null){
			return "{}";
		}else{
			System.out.println("�Ѿ���ȡ�ֽ�����"+status.getBytesRead());
		}
		return status.toString();
	}
}
