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
 * 解决springMVC与kindEditor文件上传时的问题
 * org.springframework.web.multipart.commons.CommonsMultipartResolver是spring默认提供的,
 * 它具有一个public boolean isMultipart(HttpServletRequest request) 接口,
 * 这个接口用于判断哪些request用spring的CommonsMultipartResolver处理.
 * 于是,自己写一个CommonsMultipartResolver的子类,覆盖isMultipart方法,在spring中重新配置.
 * 这样的话就特定的请求就可以绕过spring框架中的解决方案,
 * @author Administrator
 *
 */
public class DefaultMultipartResolver extends CommonsMultipartResolver {
	//com.rjxy.action.KindEditorController方法中的保存路径
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
    	// 获取到request,要用到session  
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
