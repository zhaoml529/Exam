/**
 * Project Name:ExamDemo
 * File Name:ExcelAction.java
 * Package Name:com.rjxy.action
 * Date:2014-5-20下午4:57:39
 *
 */
package com.rjxy.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.poi.biz.ChoiceService;
import com.rjxy.poi.biz.ClozeService;
import com.rjxy.poi.biz.ComprehensiveService;
import com.rjxy.poi.biz.ShortService;
import com.rjxy.util.JsonUtil;

/**
 * @ClassName: ExcelAction
 * @Description:TODO(上传、导出题库)
 * @author: zml
 * @date: 2014-5-20 下午4:57:39
 *
 */
@Controller
@RequestMapping("/excelAction")
public class ExcelAction extends BaseController{
	
	@Autowired
	private ChoiceService choiceService;
	@Autowired
	private ClozeService clozeService;
	@Autowired
	private ShortService shortService;
	@Autowired
	private ComprehensiveService compreService;
	
	@RequestMapping("/addUpload")
	public String uploadChoice(){
		return "QuestionManager/batchUpload";
	}
	
	@RequestMapping("/exportChoice")
	public void exportChoice(HttpServletResponse response){
		choiceService.exportXLS(response);
	}
	
	@RequestMapping("/exportCloze")
	public void exportCloze(HttpServletResponse response){
		clozeService.exportXLS(response);
	}
	
	@RequestMapping("/exportShort")
	public void exportShort(HttpServletResponse response){
		shortService.exportXLS(response);
	}
	
	@RequestMapping("/exportCompre")
	public void exportCompre(HttpServletResponse response){
		compreService.exportXLS(response);
	}
	
	@RequestMapping("/exportChoiceEmptyXLS")
	public void exportChoiceEmptyXLS(HttpServletResponse response){
		choiceService.exportEmptyXLS(response);
	}
	@RequestMapping("/exportClozeEmptyXLS")
	public void exportClozeEmptyXLS(HttpServletResponse response){
		clozeService.exportEmptyXLS(response);
	}
	@RequestMapping("/exportShortEmptyXLS")
	public void exportShortEmptyXLS(HttpServletResponse response){
		shortService.exportEmptyXLS(response);
	}
	@RequestMapping("/exportCompreEmptyXLS")
	public void exportCompreEmptyXLS(HttpServletResponse response){
		compreService.exportEmptyXLS(response);
	}
	
	@RequestMapping("/readChoice")
	public String readChoice(@RequestParam MultipartFile file, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		Map<String, Object> result = new HashMap<String, Object>();
		List<Choice> list = choiceService.readReport(file.getInputStream());  
		if(choiceService.insertChoice(list)){
			result.put("status", "success");
			result.put("message", "上传选择题成功！");
		}  
		return ajaxHtml(JsonUtil.getJsonString4JavaPOJO(result), response);
	}
	@RequestMapping("/readCloze")
	public String readCloze(@RequestParam MultipartFile file, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		Map<String, Object> result = new HashMap<String, Object>();
		List<Cloze> list = clozeService.readReport(file.getInputStream());  
		if(clozeService.insertCloze(list)){
			result.put("status", "success");
			result.put("message", "上传填空题成功！");
		}  
		return ajaxHtml(JsonUtil.getJsonString4JavaPOJO(result), response);
	}
	@RequestMapping("/readShort")
	public String readShort(@RequestParam MultipartFile file, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		Map<String, Object> result = new HashMap<String, Object>();
		List<ShortAnswer> list = shortService.readReport(file.getInputStream());  
		if(shortService.insertShort(list)){
			result.put("status", "success");
			result.put("message", "上传简答题成功！");
		}  
		return ajaxHtml(JsonUtil.getJsonString4JavaPOJO(result), response);
	}
	@RequestMapping("/readCompre")
	public String readCompre(@RequestParam MultipartFile file, MultipartHttpServletRequest request, HttpServletResponse response) throws IOException{
		Map<String, Object> result = new HashMap<String, Object>();
		List<Comprehensive> list = compreService.readReport(file.getInputStream());  
		if(compreService.insertComprehensive(list)){
			result.put("status", "success");
			result.put("message", "上传综合题成功！");
		}  
		return ajaxHtml(JsonUtil.getJsonString4JavaPOJO(result), response);
	}
}
