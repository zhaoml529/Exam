package com.rjxy.interceptors;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


/**
 * ���springMVC��kindEditor�ļ��ϴ�ʱ������
 * org.springframework.web.multipart.commons.CommonsMultipartResolver��springĬ���ṩ��,
 * ������һ��public boolean isMultipart(HttpServletRequest request) �ӿ�,
 * ����ӿ������ж���Щrequest��spring��CommonsMultipartResolver����.
 * ����,�Լ�дһ��CommonsMultipartResolver������,����isMultipart����,��spring����������.
 * �����Ļ����ض�������Ϳ����ƹ�spring����еĽ������,
 * @author Administrator
 *
 */
public class DefaultMultipartResolver extends CommonsMultipartResolver {
	//com.rjxy.action.KindEditorController�����еı���·��
	private static final String ATTACHED = "file_upload";
	private HttpServletRequest request;
    @Override
    public boolean isMultipart(HttpServletRequest request) {
        if (request.getRequestURI().contains(ATTACHED)) {
            return false;
        }
        return super.isMultipart(request);
    }
	
    protected FileUpload newFileUpload(FileItemFactory fileItemFactory) {  
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);  
        upload.setSizeMax(-1);  
        if (request != null) {  
        	HttpSession session = request.getSession();
        	FileUploadProgressListener progressListener = new FileUploadProgressListener(session);
            upload.setProgressListener(progressListener);  
        }  
        return upload;  
    }  
    
    public MultipartHttpServletRequest resolveMultipart(HttpServletRequest request) throws MultipartException {  
    	// ��ȡ��request,Ҫ�õ�session  
        this.request = request;
        return super.resolveMultipart(request);  
    }  
	
	@Override
	public MultipartParsingResult parseRequest(HttpServletRequest request) throws MultipartException {
		HttpSession session = request.getSession(); 
		String encoding = determineEncoding(request);
		FileUpload fileUpload = prepareFileUpload(encoding);
		FileUploadProgressListener progressListener = new FileUploadProgressListener(session);
		fileUpload.setProgressListener(progressListener);  
		try {
			List<FileItem> fileItems = ((ServletFileUpload) fileUpload).parseRequest(request);
			return parseFileItems(fileItems, encoding);
		} catch (FileUploadBase.SizeLimitExceededException ex) {
			throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(), ex);
		} catch (FileUploadException ex) {
			throw new MultipartException("Could not parse multipart servlet request", ex);
		}
	}
}
