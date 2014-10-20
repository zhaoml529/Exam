package com.rjxy.poi.util;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.CellStyle;

import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.exam.Subject;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;

public class FillExcelManager {
	/**
	 * 
	 * @Title: fillChoiceReport
	 * @Description: TODO(导出选择题题库)
	 * @param: @param worksheet
	 * @param: @param startRowIndex
	 * @param: @param startColIndex
	 * @param: @param datasource   
	 * @return: void   
	 * @throws
	 */
	public static void fillChoiceReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex, List<Choice> datasource) {  
        // Row offset  
        startRowIndex += 2;  
  
        // Create cell style for the body  
        HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();        
        bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        bodyCellStyle.setWrapText(false); //是否自动换行.  
  
        // Create body  
        for (int i=startRowIndex; i+startRowIndex-2< datasource.size()+2; i++) {  
            // Create a new row  
            HSSFRow row = worksheet.createRow((short) i+1);  
  
            // Retrieve the id value  
            HSSFCell cell1 = row.createCell(startColIndex+0);  
            cell1.setCellValue(datasource.get(i-2).getQuestion_id());  
            cell1.setCellStyle(bodyCellStyle);  
  
            // Retrieve the brand value  
            HSSFCell cell2 = row.createCell(startColIndex+1);  
            cell2.setCellValue(datasource.get(i-2).getQuestion_body());  
            cell2.setCellStyle(bodyCellStyle);  
  
            // Retrieve the model value  
            HSSFCell cell3 = row.createCell(startColIndex+2);  
            cell3.setCellValue(datasource.get(i-2).getAnswer_A());  
            cell3.setCellStyle(bodyCellStyle);  
  
            // Retrieve the maximum power value  
            HSSFCell cell4 = row.createCell(startColIndex+3);  
            cell4.setCellValue(datasource.get(i-2).getAnswer_B());  
            cell4.setCellStyle(bodyCellStyle);  
  
            // Retrieve the price value  
            HSSFCell cell5 = row.createCell(startColIndex+4);  
            cell5.setCellValue(datasource.get(i-2).getAnswer_C());  
            cell5.setCellStyle(bodyCellStyle);  
          
            // Retrieve the efficiency value  
            HSSFCell cell6 = row.createCell(startColIndex+5);  
            cell6.setCellValue(datasource.get(i-2).getAnswer_D());  
            cell6.setCellStyle(bodyCellStyle);  
            
            HSSFCell cell7 = row.createCell(startColIndex+6);  
            cell7.setCellValue(datasource.get(i-2).getQuestion_answer());  
            cell7.setCellStyle(bodyCellStyle);
            
            HSSFCell cell8 = row.createCell(startColIndex+7);  
            cell8.setCellValue(datasource.get(i-2).getDifficulty());  
            cell8.setCellStyle(bodyCellStyle);
            
            HSSFCell cell9 = row.createCell(startColIndex+8);  
            cell9.setCellValue(datasource.get(i-2).getQuestion_score());  
            cell9.setCellStyle(bodyCellStyle);
            
            HSSFCell cell10 = row.createCell(startColIndex+9);  
            cell10.setCellValue(datasource.get(i-2).getSubject().getSubject_id());  
            cell10.setCellStyle(bodyCellStyle);
            
            HSSFCell cell11 = row.createCell(startColIndex+10);  
            cell11.setCellValue(datasource.get(i-2).getGrade().getGrade_id());  
            cell11.setCellStyle(bodyCellStyle);
            
            HSSFCell cell12 = row.createCell(startColIndex+11);  
            cell12.setCellValue(datasource.get(i-2).getAdd_person());  
            cell12.setCellStyle(bodyCellStyle);
            
            HSSFCell cell13 = row.createCell(startColIndex+12);  
            cell13.setCellValue(datasource.get(i-2).getAdd_time());  
            cell13.setCellStyle(bodyCellStyle);
            
            HSSFCell cell14 = row.createCell(startColIndex+13);  
            cell14.setCellValue(datasource.get(i-2).getQuestion_remark());  
            cell14.setCellStyle(bodyCellStyle);
        }  
    }  
	/**
	 * 
	 * @Title: fillClozeReport
	 * @Description: TODO(导出填空题题库)
	 * @param: @param worksheet
	 * @param: @param startRowIndex
	 * @param: @param startColIndex
	 * @param: @param datasource   
	 * @return: void   
	 * @throws
	 */
	public static void fillClozeReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex, List<Cloze> datasource) { 
		// Row offset  
        startRowIndex += 2;  
  
        // Create cell style for the body  
        HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();        
        bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        bodyCellStyle.setWrapText(false); //是否自动换行.  
  
        // Create body  
        for (int i=startRowIndex; i+startRowIndex-2< datasource.size()+2; i++) {  
            // Create a new row  
            HSSFRow row = worksheet.createRow((short) i+1);  
  
            // Retrieve the id value  
            HSSFCell cell1 = row.createCell(startColIndex+0);  
            cell1.setCellValue(datasource.get(i-2).getQuestion_id());  
            cell1.setCellStyle(bodyCellStyle);  
  
            // Retrieve the brand value  
            HSSFCell cell2 = row.createCell(startColIndex+1);  
            cell2.setCellValue(datasource.get(i-2).getQuestion_body());  
            cell2.setCellStyle(bodyCellStyle);  
  
            // Retrieve the model value  
            HSSFCell cell3 = row.createCell(startColIndex+2);  
            cell3.setCellValue(datasource.get(i-2).getQuestion_answer());  
            cell3.setCellStyle(bodyCellStyle);  
  
            // Retrieve the maximum power value  
            HSSFCell cell4 = row.createCell(startColIndex+3);  
            cell4.setCellValue(datasource.get(i-2).getQuestion_num());  
            cell4.setCellStyle(bodyCellStyle);  
  
            // Retrieve the price value  
            HSSFCell cell5 = row.createCell(startColIndex+4);  
            cell5.setCellValue(datasource.get(i-2).getDifficulty());  
            cell5.setCellStyle(bodyCellStyle);  
          
            // Retrieve the efficiency value  
            HSSFCell cell6 = row.createCell(startColIndex+5);  
            cell6.setCellValue(datasource.get(i-2).getQuestion_score());  
            cell6.setCellStyle(bodyCellStyle);  
            
            HSSFCell cell7 = row.createCell(startColIndex+6);  
            cell7.setCellValue(datasource.get(i-2).getSubject().getSubject_id());  
            cell7.setCellStyle(bodyCellStyle);
            
            HSSFCell cell8 = row.createCell(startColIndex+7);  
            cell8.setCellValue(datasource.get(i-2).getGrade().getGrade_id());  
            cell8.setCellStyle(bodyCellStyle);
            
            HSSFCell cell9 = row.createCell(startColIndex+8);  
            cell9.setCellValue(datasource.get(i-2).getAdd_person());  
            cell9.setCellStyle(bodyCellStyle);
            
            HSSFCell cell10 = row.createCell(startColIndex+9);  
            cell10.setCellValue(datasource.get(i-2).getAdd_time());  
            cell10.setCellStyle(bodyCellStyle);
            
            HSSFCell cell11 = row.createCell(startColIndex+10);  
            cell11.setCellValue(datasource.get(i-2).getQuestion_remark());  
            cell11.setCellStyle(bodyCellStyle);
        }  
	}
	/**
	 * 
	 * @Title: fillShortReport
	 * @Description: TODO(导出简答题题库)
	 * @param: @param worksheet
	 * @param: @param startRowIndex
	 * @param: @param startColIndex
	 * @param: @param datasource   
	 * @return: void   
	 * @throws
	 */
	public static void fillShortReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex, List<ShortAnswer> datasource) { 
		// Row offset  
        startRowIndex += 2;  
  
        // Create cell style for the body  
        HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();        
        bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        bodyCellStyle.setWrapText(false); //是否自动换行.  
  
        // Create body  
        for (int i=startRowIndex; i+startRowIndex-2< datasource.size()+2; i++) {  
            // Create a new row  
            HSSFRow row = worksheet.createRow((short) i+1);  
  
            // Retrieve the id value  
            HSSFCell cell1 = row.createCell(startColIndex+0);  
            cell1.setCellValue(datasource.get(i-2).getQuestion_id());  
            cell1.setCellStyle(bodyCellStyle);  
  
            // Retrieve the brand value  
            HSSFCell cell2 = row.createCell(startColIndex+1);  
            cell2.setCellValue(datasource.get(i-2).getQuestion_title());  
            cell2.setCellStyle(bodyCellStyle);  
  
            // Retrieve the model value  
            HSSFCell cell3 = row.createCell(startColIndex+2);  
            cell3.setCellValue(datasource.get(i-2).getQuestion_answer());  
            cell3.setCellStyle(bodyCellStyle);  
  
            // Retrieve the maximum power value  
            HSSFCell cell4 = row.createCell(startColIndex+3);  
            cell4.setCellValue(datasource.get(i-2).getQuestion_body());  
            cell4.setCellStyle(bodyCellStyle);  
  
            // Retrieve the efficiency value  
            HSSFCell cell5 = row.createCell(startColIndex+4);  
            cell5.setCellValue(datasource.get(i-2).getDifficulty());  
            cell5.setCellStyle(bodyCellStyle);  
            
            HSSFCell cell6 = row.createCell(startColIndex+5);  
            cell6.setCellValue(datasource.get(i-2).getQuestion_score());  
            cell6.setCellStyle(bodyCellStyle);
            
            HSSFCell cell7 = row.createCell(startColIndex+6);  
            cell7.setCellValue(datasource.get(i-2).getSubject().getSubject_id());  
            cell7.setCellStyle(bodyCellStyle);
            
            HSSFCell cell8 = row.createCell(startColIndex+7);  
            cell8.setCellValue(datasource.get(i-2).getGrade().getGrade_id());  
            cell8.setCellStyle(bodyCellStyle);
            
            HSSFCell cell9 = row.createCell(startColIndex+8);  
            cell9.setCellValue(datasource.get(i-2).getAdd_person());  
            cell9.setCellStyle(bodyCellStyle);
            
            HSSFCell cell10 = row.createCell(startColIndex+9);  
            cell10.setCellValue(datasource.get(i-2).getAdd_time());  
            cell10.setCellStyle(bodyCellStyle);
            
            HSSFCell cell11 = row.createCell(startColIndex+10);  
            cell11.setCellValue(datasource.get(i-2).getQuestion_remark());  
            cell11.setCellStyle(bodyCellStyle);
        }  
	}
	/**
	 * 
	 * @Title: fillCompreReport
	 * @Description: TODO(导出综合题题库)
	 * @param: @param worksheet
	 * @param: @param startRowIndex
	 * @param: @param startColIndex
	 * @param: @param datasource   
	 * @return: void   
	 * @throws
	 */
	public static void fillCompreReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex, List<Comprehensive> datasource) { 
		// Row offset  
        startRowIndex += 2;  
  
        // Create cell style for the body  
        HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();        
        bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        bodyCellStyle.setWrapText(false); //是否自动换行.  
  
        // Create body  
        for (int i=startRowIndex; i+startRowIndex-2< datasource.size()+2; i++) {  
            // Create a new row  
            HSSFRow row = worksheet.createRow((short) i+1);  
  
            // Retrieve the id value  
            HSSFCell cell1 = row.createCell(startColIndex+0);  
            cell1.setCellValue(datasource.get(i-2).getQuestion_id());  
            cell1.setCellStyle(bodyCellStyle);  
  
            // Retrieve the brand value  
            HSSFCell cell2 = row.createCell(startColIndex+1);  
            cell2.setCellValue(datasource.get(i-2).getQuestion_title());  
            cell2.setCellStyle(bodyCellStyle);  
  
            // Retrieve the model value  
            HSSFCell cell3 = row.createCell(startColIndex+2);  
            cell3.setCellValue(datasource.get(i-2).getQuestion_body());  
            cell3.setCellStyle(bodyCellStyle);  
  
            // Retrieve the maximum power value  
            HSSFCell cell4 = row.createCell(startColIndex+3);  
            cell4.setCellValue(datasource.get(i-2).getQuestion_answer());  
            cell4.setCellStyle(bodyCellStyle);  
  
            HSSFCell cell5 = row.createCell(startColIndex+4);  
            cell5.setCellValue(datasource.get(i-2).getQuestion_picture());  
            cell5.setCellStyle(bodyCellStyle);
            
            // Retrieve the efficiency value  
            HSSFCell cell6 = row.createCell(startColIndex+5);  
            cell6.setCellValue(datasource.get(i-2).getDifficulty());  
            cell6.setCellStyle(bodyCellStyle);  
            
            HSSFCell cell7 = row.createCell(startColIndex+6);  
            cell7.setCellValue(datasource.get(i-2).getQuestion_score());  
            cell7.setCellStyle(bodyCellStyle);
            
            HSSFCell cell8 = row.createCell(startColIndex+7);  
            cell8.setCellValue(datasource.get(i-2).getSubject().getSubject_id());  
            cell8.setCellStyle(bodyCellStyle);
            
            HSSFCell cell9 = row.createCell(startColIndex+8);  
            cell9.setCellValue(datasource.get(i-2).getGrade().getGrade_id());  
            cell9.setCellStyle(bodyCellStyle);
            
            HSSFCell cell10 = row.createCell(startColIndex+9);  
            cell10.setCellValue(datasource.get(i-2).getAdd_person());  
            cell10.setCellStyle(bodyCellStyle);
            
            HSSFCell cell11 = row.createCell(startColIndex+10);  
            cell11.setCellValue(datasource.get(i-2).getAdd_time());  
            cell11.setCellStyle(bodyCellStyle);
            
            HSSFCell cell12 = row.createCell(startColIndex+11);  
            cell12.setCellValue(datasource.get(i-2).getQuestion_remark());  
            cell12.setCellStyle(bodyCellStyle);
        }
	}
	
	public static void fillEmptyReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex, List<Subject> subject, List<GradeInformation> grade) { 
		// Row offset  
        startRowIndex += 2;  
  
        // Create cell style for the body  
        HSSFCellStyle bodyCellStyle = worksheet.getWorkbook().createCellStyle();        
        bodyCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        bodyCellStyle.setWrapText(false); //是否自动换行.  
        int maxLength = 0;
        if(subject.size()>3){
        	maxLength = subject.size();
        }
        if(grade.size()>maxLength){
        	maxLength = grade.size();
        }
        
        for (int i=startRowIndex; i+startRowIndex-2< maxLength+2; i++) {  
            // Create a new row  
            HSSFRow row = worksheet.createRow((short) i+1);  
            
            if((i-1)<=3){
	            // Retrieve the id value  
	            HSSFCell cell1 = row.createCell(startColIndex+0);  
	            cell1.setCellValue(i-1);  
	            cell1.setCellStyle(bodyCellStyle);  
	  
	            // Retrieve the brand value  
	            HSSFCell cell2 = row.createCell(startColIndex+1); 
	            switch(i-1){
		            case 1:
		            	cell2.setCellValue("简单");
		            	break;
		            case 2:
		            	cell2.setCellValue("中等");
		            	break;
		            case 3:
		            	cell2.setCellValue("困难");
		            	break;
	            }
	            cell2.setCellStyle(bodyCellStyle);  
            }
            if((i-2)<subject.size()){
	            HSSFCell cell3 = row.createCell(startColIndex+2);  
	            cell3.setCellValue(subject.get(i-2).getSubject_id());  
	            cell3.setCellStyle(bodyCellStyle);  
	  
	            // Retrieve the brand value  
	            HSSFCell cell4 = row.createCell(startColIndex+3);  
	            cell4.setCellValue(subject.get(i-2).getSubject_name());  
	            cell4.setCellStyle(bodyCellStyle); 
            }
            if((i-2)<grade.size()){
		        // Retrieve the id value  
		        HSSFCell cell5 = row.createCell(startColIndex+4);  
		        cell5.setCellValue(grade.get(i-2).getGrade_id());  
		        cell5.setCellStyle(bodyCellStyle);  
		
		        // Retrieve the brand value  
		        HSSFCell cell6 = row.createCell(startColIndex+5);  
		        cell6.setCellValue(grade.get(i-2).getGrade_name());  
		        cell6.setCellStyle(bodyCellStyle);
            }
        }
	}
}
