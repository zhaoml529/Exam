package com.rjxy.action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/uploadJson")
public class KindEditorController {

	private static final ObjectMapper objectMapper = new ObjectMapper();
	private  PrintWriter writer = null;
	@SuppressWarnings("rawtypes")
	@RequestMapping("/file_upload")
	public void fileUpload(HttpServletRequest  request,
			HttpServletResponse response) throws ServletException, IOException,
			FileUploadException {
		ServletContext application = request.getSession().getServletContext();
		//�ļ�����Ŀ¼·��
		String savePath = application.getRealPath("/") + "UploadFile/";

		// �ļ�����Ŀ¼URL
		String saveUrl = request.getContextPath() + "/UploadFile/";

		// ���������ϴ����ļ���չ��
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

		// ����ļ���С
		long maxSize = 1000000;

		response.reset();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        writer = response.getWriter();
       // writer.println(json);  //��취��mapת��json
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			writer.println(objectMapper.writeValueAsString(getError("��ѡ���ļ���")));
			return;
			
		}
		// ���Ŀ¼
		File uploadDir = new File(savePath);
		if (!uploadDir.isDirectory()) {
			writer.println(objectMapper.writeValueAsString(getError("�ϴ�Ŀ¼�����ڡ�")));
			return;
		}
		// ���Ŀ¼дȨ��
		if (!uploadDir.canWrite()) {
			writer.println(objectMapper.writeValueAsString(getError("�ϴ�Ŀ¼û��дȨ�ޡ�")));
			return;
		}

		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "image";
		}
		if (!extMap.containsKey(dirName)) {
			writer.println(objectMapper.writeValueAsString(getError("Ŀ¼������ȷ��")));
			return;
		}
		// �����ļ���
		savePath += dirName + "/";
		saveUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl += ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List items = upload.parseRequest(request);
		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			String fileName = item.getName();
			if (!item.isFormField()) {
				// ����ļ���С
				if (item.getSize() > maxSize) {
					writer.println(objectMapper.writeValueAsString(getError("�ϴ��ļ���С�������ơ�")));
				}
				// �����չ��
				String fileExt = fileName.substring(
						fileName.lastIndexOf(".") + 1).toLowerCase();
				if (!Arrays.<String> asList(extMap.get(dirName).split(","))
						.contains(fileExt)) {
					writer.println(objectMapper.writeValueAsString(getError("�ϴ��ļ���չ���ǲ��������չ����\nֻ����"+ extMap.get(dirName) + "��ʽ��")));
					return;
				}

				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_"
						+ new Random().nextInt(1000) + "." + fileExt;
				try {
					File uploadedFile = new File(savePath, newFileName);
					item.write(uploadedFile);
				} catch (Exception e) {
					writer.println(objectMapper.writeValueAsString(getError("�ϴ��ļ�ʧ�ܡ�")));
				}

				Map<String, Object> msg = new HashMap<String, Object>();
				msg.put("error", 0);
				msg.put("url", saveUrl + newFileName);
				writer.println(objectMapper.writeValueAsString(msg));
				return;
			}
		}
		return;
	}

	private Map<String, Object> getError(String message) {
		Map<String, Object> msg = new HashMap<String, Object>();
		msg.put("error", 1);
		msg.put("message", message);
		return msg;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/file_manager")
	public void fileManager(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getSession().getServletContext();
		ServletOutputStream out = response.getOutputStream();
		// ��Ŀ¼·��������ָ������·�������� /var/www/attached/
		String rootPath = application.getRealPath("/") + "UploadFile/";
		// ��Ŀ¼URL������ָ������·�������� http://www.yoursite.com/attached/
		String rootUrl = request.getContextPath() + "/UploadFile/";
		// ͼƬ��չ��
		String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };

		String dirName = request.getParameter("dir");
		if (dirName != null) {
			if (!Arrays.<String> asList(
					new String[] { "image", "flash", "media", "file" })
					.contains(dirName)) {
				out.println("Invalid Directory name.");
				return;
			}
			rootPath += dirName + "/";
			rootUrl += dirName + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		// ����path���������ø�·����URL
		String path = request.getParameter("path") != null ? request
				.getParameter("path") : "";
		String currentPath = rootPath + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0,
					currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0,
					str.lastIndexOf("/") + 1) : "";
		}

		// ������ʽ��name or size or type
		String order = request.getParameter("order") != null ? request
				.getParameter("order").toLowerCase() : "name";

		// ������ʹ��..�ƶ�����һ��Ŀ¼
		if (path.indexOf("..") >= 0) {
			out.println("Access is not allowed.");
			return;
		}
		// ���һ���ַ�����/
		if (!"".equals(path) && !path.endsWith("/")) {
			out.println("Parameter is not valid.");
			return;
		}
		// Ŀ¼�����ڻ���Ŀ¼
		File currentPathFile = new File(currentPath);
		if (!currentPathFile.isDirectory()) {
			out.println("Directory does not exist.");
			return;
		}
		// ����Ŀ¼ȡ���ļ���Ϣ
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if (currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if (file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if (file.isFile()) {
					String fileExt = fileName.substring(
							fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String> asList(fileTypes)
							.contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file
								.lastModified()));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		Map<String, Object> msg = new HashMap<String, Object>();
		msg.put("moveup_dir_path", moveupDirPath);
		msg.put("current_dir_path", currentDirPath);
		msg.put("current_url", currentUrl);
		msg.put("total_count", fileList.size());
		msg.put("file_list", fileList);
		response.setContentType("application/json; charset=UTF-8");
		String msgStr = objectMapper.writeValueAsString(msg);
		out.println(msgStr);
	}

	@SuppressWarnings("rawtypes")
	class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir"))
					&& !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir"))
					&& ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filename"))
						.compareTo((String) hashB.get("filename"));
			}
		}
	}

	@SuppressWarnings("rawtypes")
	class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir"))
					&& !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir"))
					&& ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long) hashA.get("filesize")) > ((Long) hashB
						.get("filesize"))) {
					return 1;
				} else if (((Long) hashA.get("filesize")) < ((Long) hashB
						.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}

	@SuppressWarnings("rawtypes")
	class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable) a;
			Hashtable hashB = (Hashtable) b;
			if (((Boolean) hashA.get("is_dir"))
					&& !((Boolean) hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean) hashA.get("is_dir"))
					&& ((Boolean) hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String) hashA.get("filetype"))
						.compareTo((String) hashB.get("filetype"));
			}
		}
	}
}
