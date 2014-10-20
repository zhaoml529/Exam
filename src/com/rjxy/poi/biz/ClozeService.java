/**
 * Project Name:ExamDemo
 * File Name:ClozeService.java
 * Package Name:com.rjxy.poi.biz
 * Date:2014-5-21����11:22:09
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
import com.rjxy.entity.question.Cloze;
import com.rjxy.poi.util.ChoiceLayouter;
import com.rjxy.poi.util.ClozeLayouter;
import com.rjxy.poi.util.EmptyLayouter;
import com.rjxy.poi.util.FillExcelManager;
import com.rjxy.poi.util.Writer;

/**
 * @ClassName: ClozeService
 * @Description:TODO(poi���������)
 * @author: zml
 * @date: 2014-5-21 ����11:22:09
 *
 */
@Service
@Transactional
public class ClozeService extends BaseService<Cloze>{
	@Autowired
	private CourseService courseService;
	
	public void exportXLS(HttpServletResponse response) {  
		  
        // 1.����һ�� workbook  
        HSSFWorkbook workbook = new HSSFWorkbook();  
  
        // 2.����һ�� worksheet  
        HSSFSheet worksheet = workbook.createSheet("�����");  
  
        // 3.������ʼ�к���  
        int startRowIndex = 0;  
        int startColIndex = 0;  
  
        // 4.����title,data,headers  
        ClozeLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
  
        // 5.�������  
  
        FillExcelManager.fillClozeReport(worksheet, startRowIndex, startColIndex,  
        		getClozeAllList());  
  
        // 6.����reponse����  
        String fileName = "ClozesReport.xls";  
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
        	String str = "�����";
        	HSSFSheet worksheet = workbook.createSheet(); 
        	if(i == 1) str = "˵��";
        	workbook.setSheetName(i, str);
        	// 3.������ʼ�к���  
        	int startRowIndex = 0;  
            int startColIndex = 0; 
            // 4.����title,data,headers  
            if(i == 0){
            	ClozeLayouter.buildReport(worksheet, startRowIndex, startColIndex);
            }else{
            	EmptyLayouter.buildReport(worksheet, startRowIndex, startColIndex);  
            	// 5.�������  
            	List<Subject> subjectList = courseService.getSubjectList();
            	List<GradeInformation> gradeList = courseService.getGradeInformationList();
                FillExcelManager.fillEmptyReport(worksheet, startRowIndex, startColIndex, subjectList, gradeList);  
            }
        }
     // 6.����reponse����  
        String fileName = "ClozeReport.xls";  
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
    public List<Cloze> readReport(InputStream inp) {  
  
        List<Cloze> clozeList = new ArrayList<Cloze>();  
  
        try {  
            String cellStr = null;  
  
            Workbook wb = WorkbookFactory.create(inp);  
  
            Sheet sheet = wb.getSheetAt(0);// ȡ�õ�һ��sheets  
  
            //�ӵ����п�ʼ��ȡ����  
            for (int i = 3; i <= sheet.getLastRowNum(); i++) {  
  
                Cloze cloze = new Cloze();  
                Cloze addCloze = new Cloze();  
  
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
                    addCloze = addingCloze(j, cloze, cellStr);  
  
                }  
                // ��������ݺ�Ķ��������list��  
                clozeList.add(addCloze);  
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
        return clozeList;  
  
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
    
    private Cloze addingCloze(int j, Cloze cloze, String cellStr) {  
        switch (j) {  
        case 0:  
           // choice.setId(0);  
            break;  
        case 1:  
        	cloze.setQuestion_body(cellStr);
            break;  
        case 2:  
        	cloze.setQuestion_answer(cellStr);
            break;  
        case 3:  
        	cloze.setQuestion_num(Integer.parseInt(cellStr));
            break;  
        case 4:  
            cloze.setDifficulty(Integer.parseInt(cellStr));  
            break;  
        case 5:  
        	cloze.setQuestion_score(Float.valueOf(cellStr));
            break;
        case 6:
        	Subject subject = new Subject();
        	subject.setSubject_id(Integer.parseInt(cellStr));
        	cloze.setSubject(subject);
        	break;
        case 7:
        	GradeInformation grade = new GradeInformation();
        	grade.setGrade_id(Integer.parseInt(cellStr));
        	cloze.setGrade(grade);
        	break;
        case 8:
        	cloze.setAdd_person(cellStr);
        	break;
        case 9:
        	cloze.setAdd_time(cellStr);
        	break;
        case 10:
        	cloze.setQuestion_remark(cellStr);
        	break;
        }  
        return cloze;  
    }  
    /** 
     * �����ݿ������е�Cloze��Ϣ. 
     */   
    public List<Cloze> getClozeAllList(){
		List<Cloze> list = getAllList("com.rjxy.entity.question.Cloze");
		return list;
	}
    
    /** 
     * ��ȡ��������ݺ��������� 
     */  
    public boolean insertCloze(List<Cloze> list) {  
    	for(Cloze cloze:list){
    		save(cloze);
    	}
    	return true;
    }
}
