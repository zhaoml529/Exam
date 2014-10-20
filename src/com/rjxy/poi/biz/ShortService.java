/**
 * Project Name:ExamDemo
 * File Name:ShortService.java
 * Package Name:com.rjxy.poi.biz
 * Date:2014-5-23下午4:07:04
 *
 */
package com.rjxy.poi.biz;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.admin.biz.CourseService;
import com.rjxy.core.BaseService;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.exam.Subject;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.poi.util.ChoiceLayouter;
import com.rjxy.poi.util.EmptyLayouter;
import com.rjxy.poi.util.FillExcelManager;
import com.rjxy.poi.util.ShortLayouter;
import com.rjxy.poi.util.Writer;

/**
 * @ClassName: ShortService
 * @Description:TODO(poi操作简答)
 * @author: zml
 * @date: 2014-5-23 下午4:07:04
 *
 */
@Service
@Transactional
public class ShortService extends BaseService<ShortAnswer>{
	@Autowired
	private CourseService courseService;
	
	public void exportXLS(HttpServletResponse response) {  
		  
        // 1.创建一个 workbook  
        HSSFWorkbook workbook = new HSSFWorkbook();  
  
        // 2.创建一个 worksheet  
        HSSFSheet worksheet = workbook.createSheet("填空题");  
  
        // 3.定义起始行和列  
        int startRowIndex = 0;  
        int startColIndex = 0;  
  
        // 4.创建title,data,headers  
        ShortLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
  
        // 5.填充数据  
  
        FillExcelManager.fillShortReport(worksheet, startRowIndex, startColIndex,  
        		getShortAnswerAllList());  
  
        // 6.设置reponse参数  
        String fileName = "ShortsReport.xls";  
        response.setHeader("Content-Disposition", "inline; filename="  
                + fileName);  
        // 确保发送的当前文本格式  
        response.setContentType("application/vnd.ms-excel");  
  
        // 7. 输出流  
        Writer.write(response, workbook);  
  
    }  
	/**
	 * 
	 * @Title: exportEmptyXLS
	 * @Description: TODO(空报表上传用)
	 * @param: @param response   
	 * @return: void   
	 * @throws
	 */
	public void exportEmptyXLS(HttpServletResponse response) {  
		  
        // 1.创建一个 workbook  
        HSSFWorkbook workbook = new HSSFWorkbook();  
        // 2.创建两个 worksheet  
        for(int i=0;i<2;i++){
        	String str = "简答题";
        	HSSFSheet worksheet = workbook.createSheet(); 
        	if(i == 1) str = "说明";
        	workbook.setSheetName(i, str);
        	// 3.定义起始行和列  
        	int startRowIndex = 0;  
            int startColIndex = 0; 
            // 4.创建title,data,headers  
            if(i == 0){
            	ShortLayouter.buildReport(worksheet, startRowIndex, startColIndex);
            }else{
            	EmptyLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
            	// 5.填充数据  
            	List<Subject> subjectList = courseService.getSubjectList();
            	List<GradeInformation> gradeList = courseService.getGradeInformationList();
                FillExcelManager.fillEmptyReport(worksheet, startRowIndex, startColIndex, subjectList, gradeList);  
            }
        }
     // 6.设置reponse参数  
        String fileName = "ShortReport.xls";  
        response.setHeader("Content-Disposition", "inline; filename="  
                + fileName);  
        // 确保发送的当前文本格式  
        response.setContentType("application/vnd.ms-excel");  
        // 7. 输出流  
        Writer.write(response, workbook);
    } 
	 /** 
     * 读取报表 
     */  
    public List<ShortAnswer> readReport(InputStream inp) {  
  
        List<ShortAnswer> shortList = new ArrayList<ShortAnswer>();  
  
        try {  
            String cellStr = null;  
  
            Workbook wb = WorkbookFactory.create(inp);  
  
            Sheet sheet = wb.getSheetAt(0);// 取得第一个sheets  
  
            //从第四行开始读取数据  
            for (int i = 3; i <= sheet.getLastRowNum(); i++) {  
  
                ShortAnswer shortAnswer = new ShortAnswer();  
                ShortAnswer addShort = new ShortAnswer();  
  
                Row row = sheet.getRow(i); // 获取行(row)对象  
                if (row == null) {  
                    // row为空的话,不处理  
                    continue;  
                }  
  
                for (int j = 0; j < row.getLastCellNum(); j++) {  
  
                    Cell cell = row.getCell(j); // 获得单元格(cell)对象  
                    // 转换接收的单元格  
                    cellStr = ConvertCellStr(cell, cellStr);  
  
                    // 将单元格的数据添加至一个对象  
                    addShort = addingShort(j, shortAnswer, cellStr);  
  
                }  
                // 将添加数据后的对象填充至list中  
                shortList.add(addShort);  
            }  
  
        } catch (InvalidFormatException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            if (inp != null) {  
                try {  
                    inp.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
            } else {  
                
            }  
        }  
        return shortList;  
  
    }  
	
    /** 
     * 把单元格内的类型转换至String类型 
     */  
    private String ConvertCellStr(Cell cell, String cellStr) {  
    	
        switch (cell.getCellType()) {  
  
        case Cell.CELL_TYPE_STRING:  
            // 读取String  
            cellStr = cell.getStringCellValue().toString();  
            break;  
  
        case Cell.CELL_TYPE_BOOLEAN:  
            // 得到Boolean对象的方法  
            cellStr = String.valueOf(cell.getBooleanCellValue());  
            break;  
  
        case Cell.CELL_TYPE_NUMERIC:  
  
            // 先看是否是日期格式  
            if (DateUtil.isCellDateFormatted(cell)) {  
  
                // 读取日期格式  
                cellStr = cell.getDateCellValue().toString();  
  
            } else {  
                // 读取数字  
                cellStr = String.valueOf((int) cell.getNumericCellValue());  
            }  
            break;  
  
        case Cell.CELL_TYPE_FORMULA:  
            // 读取公式  
            cellStr = cell.getCellFormula().toString();  
            break;  
        }  
        return cellStr;  
    }
    
    private ShortAnswer addingShort(int j, ShortAnswer shortAnswer, String cellStr) {  
        switch (j) {  
        case 0:  
           // choice.setId(0);  
            break;  
        case 1:  
        	shortAnswer.setQuestion_title(cellStr);
            break;  
        case 2:  
        	shortAnswer.setQuestion_body(cellStr);
            break;  
        case 3:  
        	shortAnswer.setQuestion_answer(cellStr);
            break;  
        case 4:  
            shortAnswer.setDifficulty(Integer.parseInt(cellStr));  
            break;  
        case 5:  
        	shortAnswer.setQuestion_score(Float.valueOf(cellStr));
            break;
        case 6:
        	Subject subject = new Subject();
        	subject.setSubject_id(Integer.parseInt(cellStr));
        	shortAnswer.setSubject(subject);
        	break;
        case 7:
        	GradeInformation grade = new GradeInformation();
        	grade.setGrade_id(Integer.parseInt(cellStr));
        	shortAnswer.setGrade(grade);
        	break;
        case 8:
        	shortAnswer.setAdd_person(cellStr);
        	break;
        case 9:
        	shortAnswer.setAdd_time(cellStr);
        	break;
        case 10:
        	shortAnswer.setQuestion_remark(cellStr);
        	break;
        }  
        return shortAnswer;  
    }  
    /** 
     * 从数据库获得所有的shortAnswer信息. 
     */   
    public List<ShortAnswer> getShortAnswerAllList(){
		List<ShortAnswer> list = getAllList("com.rjxy.entity.question.ShortAnswer");
		return list;
	}
    
    /** 
     * 读取报表的数据后批量插入 
     */  
    public boolean insertShort(List<ShortAnswer> list) {  
    	for(ShortAnswer shortAnswer:list){
    		save(shortAnswer);
    	}
    	return true;
    }
}
