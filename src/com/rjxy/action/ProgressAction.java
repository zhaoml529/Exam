/**
 * Project Name:ExamDemo
 * File Name:ProgressAction.java
 * Package Name:com.rjxy.action
 * Date:2014-5-21下午12:32:05
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
 * @Description:TODO(获取上传文件进度controller)
 * @author: zml
 * @date: 2014-5-21 下午12:32:05
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
			System.out.println("已经读取字节数："+status.getBytesRead());
		}
		return status.toString();
	}
}
