/**
 * Project Name:ExamDemo
 * File Name:FileUploadProgressListener.java
 * Package Name:com.rjxy.interceptors
 * Date:2014-5-21下午12:29:41
 *
 */
package com.rjxy.interceptors;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

import com.rjxy.entity.Progress;


/**
 * @ClassName: FileUploadProgressListener
 * @Description:TODO(这里用一句话描述这个类的作用)
 * @author: zml
 * @date: 2014-5-21 下午12:29:41
 *
 */
public class FileUploadProgressListener implements ProgressListener {

	/* (non-Javadoc)
	 * @see org.apache.commons.fileupload.ProgressListener#update(long, long, int)
	 */
	private HttpSession session;

	public FileUploadProgressListener() {  }  
	
    public FileUploadProgressListener(HttpSession session) {
        this.session=session;  
        Progress status = new Progress();
        session.setAttribute("upload_ps", status);  
    }  
	
	/**
	 * pBytesRead 到目前为止读取文件的比特数 pContentLength 文件总大小 pItems 目前正在读取第几个文件
	 */
	public void update(long pBytesRead, long pContentLength, int pItems) {
		// TODO Auto-generated method stub
		Progress status = (Progress) session.getAttribute("upload_ps");
		status.setBytesRead(pBytesRead);
		status.setContentLength(pContentLength);
		status.setItems(pItems);
		session.setAttribute("upload_ps", status);
	}

}
