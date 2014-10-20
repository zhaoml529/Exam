/**
 * Project Name:ExamDemo
 * File Name:ChoiceService.java
 * Package Name:com.rjxy.poi.biz
 * Date:2014-5-20下午5:25:45
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
import com.rjxy.entity.question.Choice;
import com.rjxy.poi.util.ChoiceLayouter;
import com.rjxy.poi.util.EmptyLayouter;
import com.rjxy.poi.util.FillExcelManager;
import com.rjxy.poi.util.Writer;

/**
 * @ClassName: ChoiceService
 * @Description:TODO(poi操作选择题)
 * @author: zml
 * @date: 2014-5-20 下午5:25:45
 *
 */

@Service
@Transactional
public class ChoiceService extends BaseService<Choice>{

	@Autowired
	private CourseService courseService;
	public void exportXLS(HttpServletResponse response) {  
		  
        // 1.创建一个 workbook  
        HSSFWorkbook workbook = new HSSFWorkbook();  
  
        // 2.创建一个 worksheet  
        HSSFSheet worksheet = workbook.createSheet("选择题");  
  
        // 3.定义起始行和列  
        int startRowIndex = 0;  
        int startColIndex = 0;  
  
        // 4.创建title,data,headers  
        ChoiceLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
  
        // 5.填充数据  
  
        FillExcelManager.fillChoiceReport(worksheet, startRowIndex, startColIndex,  
        		getChoiceAllList());  
  
        // 6.设置reponse参数  
        String fileName = "ChoicesReport.xls";  
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
        	String str = "选择题";
        	HSSFSheet worksheet = workbook.createSheet(); 
        	if(i == 1) str = "说明";
        	workbook.setSheetName(i, str);
        	// 3.定义起始行和列  
        	int startRowIndex = 0;  
            int startColIndex = 0; 
            // 4.创建title,data,headers  
            if(i == 0){
            	ChoiceLayouter.buildReport(worksheet, startRowIndex, startColIndex);
            }else{
            	EmptyLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
            	// 5.填充数据  
            	List<Subject> subjectList = courseService.getSubjectList();
            	List<GradeInformation> gradeList = courseService.getGradeInformationList();
                FillExcelManager.fillEmptyReport(worksheet, startRowIndex, startColIndex, subjectList, gradeList);  
            }
        }
     // 6.设置reponse参数  
        String fileName = "ChoicesReport.xls";  
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
    public List<Choice> readReport(InputStream inp) {  
  
        List<Choice> choiceList = new ArrayList<Choice>();  
  
        try {  
            String cellStr = null;  
  
            Workbook wb = WorkbookFactory.create(inp);  
  
            Sheet sheet = wb.getSheetAt(0);// 取得第一个sheets  
  
            //从第四行开始读取数据  
            for (int i = 3; i <= sheet.getLastRowNum(); i++) {  
  
                Choice choice = new Choice();  
                Choice addChoice = new Choice();  
  
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
                    addChoice = addingChoice(j, choice, cellStr);  
  
                }  
                // 将添加数据后的对象填充至list中  
                choiceList.add(addChoice);  
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
        return choiceList;  
  
    }  
  
    /** 
     * 从数据库获得所有的Choice信息. 
     */   
    public List<Choice> getChoiceAllList(){
		List<Choice> list = getAllList("com.rjxy.entity.question.Choice");
		return list;
	}
    
//    public List<Subject> getSubjectAllList(){
//    	List<Subject> list = getAllList("com.rjxy.entity.exam.Subject");
//    }
    /** 
     * 读取报表的数据后批量插入 
     */  
    public boolean insertChoice(List<Choice> list) {  
    	for(Choice choice:list){
    		save(choice);
    	}
    	return true;
    }  
  
    /** 
     * 获得单元格的数据添加至choice 
     *  
     * @param j 
     *            列数 
     * @param choice 
     *            添加对象 
     * @param cellStr 
     *            单元格数据 
     * @return 
     */  
    private Choice addingChoice(int j, Choice choice, String cellStr) {  
        switch (j) {  
        case 0:  
           // choice.setId(0);  
            break;  
        case 1:  
        	choice.setQuestion_body(cellStr);
            break;  
        case 2:  
        	choice.setAnswer_A(cellStr);
            break;  
        case 3:  
        	choice.setAnswer_B(cellStr);
            break;  
        case 4:  
            choice.setAnswer_C(cellStr);  
            break;  
        case 5:  
            choice.setAnswer_D(cellStr);  
            break;
        case 6:
        	choice.setQuestion_answer(cellStr);
        	break;
        case 7:
        	choice.setDifficulty(Integer.parseInt(cellStr));
        	break;
        case 8:
        	choice.setQuestion_score(Float.valueOf(cellStr));
        	break;
        case 9:
        	Subject subject = new Subject();
        	subject.setSubject_id(Integer.parseInt(cellStr));
        	choice.setSubject(subject);
        	break;
        case 10:
        	GradeInformation grade = new GradeInformation();
        	grade.setGrade_id(Integer.parseInt(cellStr));
        	choice.setGrade(grade);
        	break;
        case 11:
        	choice.setAdd_person(cellStr);
        	break;
        case 12:
        	choice.setAdd_time(cellStr);
        case 13:
        	choice.setQuestion_remark(cellStr);
        	break;
        }  
  
        return choice;  
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
}
