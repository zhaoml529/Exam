/**
 * Project Name:ExamDemo
 * File Name:ChoiceService.java
 * Package Name:com.rjxy.poi.biz
 * Date:2014-5-20����5:25:45
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
 * @Description:TODO(poi����ѡ����)
 * @author: zml
 * @date: 2014-5-20 ����5:25:45
 *
 */

@Service
@Transactional
public class ChoiceService extends BaseService<Choice>{

	@Autowired
	private CourseService courseService;
	public void exportXLS(HttpServletResponse response) {  
		  
        // 1.����һ�� workbook  
        HSSFWorkbook workbook = new HSSFWorkbook();  
  
        // 2.����һ�� worksheet  
        HSSFSheet worksheet = workbook.createSheet("ѡ����");  
  
        // 3.������ʼ�к���  
        int startRowIndex = 0;  
        int startColIndex = 0;  
  
        // 4.����title,data,headers  
        ChoiceLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
  
        // 5.�������  
  
        FillExcelManager.fillChoiceReport(worksheet, startRowIndex, startColIndex,  
        		getChoiceAllList());  
  
        // 6.����reponse����  
        String fileName = "ChoicesReport.xls";  
        response.setHeader("Content-Disposition", "inline; filename="  
                + fileName);  
        // ȷ�����͵ĵ�ǰ�ı���ʽ  
        response.setContentType("application/vnd.ms-excel");  
  
        // 7. �����  
        Writer.write(response, workbook);  
  
    }  
	/**
	 * 
	 * @Title: exportEmptyXLS
	 * @Description: TODO(�ձ����ϴ���)
	 * @param: @param response   
	 * @return: void   
	 * @throws
	 */
	public void exportEmptyXLS(HttpServletResponse response) {  
		  
        // 1.����һ�� workbook  
        HSSFWorkbook workbook = new HSSFWorkbook();  
        // 2.�������� worksheet  
        for(int i=0;i<2;i++){
        	String str = "ѡ����";
        	HSSFSheet worksheet = workbook.createSheet(); 
        	if(i == 1) str = "˵��";
        	workbook.setSheetName(i, str);
        	// 3.������ʼ�к���  
        	int startRowIndex = 0;  
            int startColIndex = 0; 
            // 4.����title,data,headers  
            if(i == 0){
            	ChoiceLayouter.buildReport(worksheet, startRowIndex, startColIndex);
            }else{
            	EmptyLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
            	// 5.�������  
            	List<Subject> subjectList = courseService.getSubjectList();
            	List<GradeInformation> gradeList = courseService.getGradeInformationList();
                FillExcelManager.fillEmptyReport(worksheet, startRowIndex, startColIndex, subjectList, gradeList);  
            }
        }
     // 6.����reponse����  
        String fileName = "ChoicesReport.xls";  
        response.setHeader("Content-Disposition", "inline; filename="  
                + fileName);  
        // ȷ�����͵ĵ�ǰ�ı���ʽ  
        response.setContentType("application/vnd.ms-excel");  
        // 7. �����  
        Writer.write(response, workbook);
    } 
    /** 
     * ��ȡ���� 
     */  
    public List<Choice> readReport(InputStream inp) {  
  
        List<Choice> choiceList = new ArrayList<Choice>();  
  
        try {  
            String cellStr = null;  
  
            Workbook wb = WorkbookFactory.create(inp);  
  
            Sheet sheet = wb.getSheetAt(0);// ȡ�õ�һ��sheets  
  
            //�ӵ����п�ʼ��ȡ����  
            for (int i = 3; i <= sheet.getLastRowNum(); i++) {  
  
                Choice choice = new Choice();  
                Choice addChoice = new Choice();  
  
                Row row = sheet.getRow(i); // ��ȡ��(row)����  
                if (row == null) {  
                    // rowΪ�յĻ�,������  
                    continue;  
                }  
  
                for (int j = 0; j < row.getLastCellNum(); j++) {  
  
                    Cell cell = row.getCell(j); // ��õ�Ԫ��(cell)����  
                    // ת�����յĵ�Ԫ��  
                    cellStr = ConvertCellStr(cell, cellStr);  
  
                    // ����Ԫ������������һ������  
                    addChoice = addingChoice(j, choice, cellStr);  
  
                }  
                // ��������ݺ�Ķ��������list��  
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
     * �����ݿ������е�Choice��Ϣ. 
     */   
    public List<Choice> getChoiceAllList(){
		List<Choice> list = getAllList("com.rjxy.entity.question.Choice");
		return list;
	}
    
//    public List<Subject> getSubjectAllList(){
//    	List<Subject> list = getAllList("com.rjxy.entity.exam.Subject");
//    }
    /** 
     * ��ȡ��������ݺ��������� 
     */  
    public boolean insertChoice(List<Choice> list) {  
    	for(Choice choice:list){
    		save(choice);
    	}
    	return true;
    }  
  
    /** 
     * ��õ�Ԫ������������choice 
     *  
     * @param j 
     *            ���� 
     * @param choice 
     *            ��Ӷ��� 
     * @param cellStr 
     *            ��Ԫ������ 
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
     * �ѵ�Ԫ���ڵ�����ת����String���� 
     */  
    private String ConvertCellStr(Cell cell, String cellStr) {  
    	
        switch (cell.getCellType()) {  
  
        case Cell.CELL_TYPE_STRING:  
            // ��ȡString  
            cellStr = cell.getStringCellValue().toString();  
            break;  
  
        case Cell.CELL_TYPE_BOOLEAN:  
            // �õ�Boolean����ķ���  
            cellStr = String.valueOf(cell.getBooleanCellValue());  
            break;  
  
        case Cell.CELL_TYPE_NUMERIC:  
  
            // �ȿ��Ƿ������ڸ�ʽ  
            if (DateUtil.isCellDateFormatted(cell)) {  
  
                // ��ȡ���ڸ�ʽ  
                cellStr = cell.getDateCellValue().toString();  
  
            } else {  
                // ��ȡ����  
                cellStr = String.valueOf((int) cell.getNumericCellValue());  
            }  
            break;  
  
        case Cell.CELL_TYPE_FORMULA:  
            // ��ȡ��ʽ  
            cellStr = cell.getCellFormula().toString();  
            break;  
        }  
        return cellStr;  
    }  
}
