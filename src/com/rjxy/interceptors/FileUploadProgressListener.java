/**
 * Project Name:ExamDemo
 * File Name:FileUploadProgressListener.java
 * Package Name:com.rjxy.interceptors
 * Date:2014-5-21����12:29:41
 *
 */
package com.rjxy.interceptors;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

import com.rjxy.entity.Progress;


/**
 * @ClassName: FileUploadProgressListener
 * @Description:TODO(������һ�仰��������������)
 * @author: zml
 * @date: 2014-5-21 ����12:29:41
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
	 * pBytesRead ��ĿǰΪֹ��ȡ�ļ��ı����� pContentLength �ļ��ܴ�С pItems Ŀǰ���ڶ�ȡ�ڼ����ļ�
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
