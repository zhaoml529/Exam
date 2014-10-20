/**
 * Project Name:ExamDemo
 * File Name:Layouter.java
 * Package Name:com.rjxy.poi.util
 * Date:2014-5-20下午5:05:46
 *
 */
package com.rjxy.poi.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;

import com.rjxy.util.DateUtil;


/**
 * @ClassName: Layouter
 * @Description:TODO(创建选择题报表)
 * @author: zml
 * @date: 2014-5-20 下午5:05:46
 *
 */
public class ChoiceLayouter {

    public static void buildReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex) {  
        // 设置列的宽度  
    	for(int i=0;i<14;i++){
    		worksheet.setColumnWidth(i, 5000);
    	}
        buildTitle(worksheet, startRowIndex, startColIndex);  
  
        buildHeaders(worksheet, startRowIndex, startColIndex);  
  
    }  
  
    /** 
     * 创建报表标题和日期 
     */  
    private static void buildTitle(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex) {  
        // 设置报表标题字体  
        Font fontTitle = worksheet.getWorkbook().createFont();  
        fontTitle.setBoldweight(Font.BOLDWEIGHT_BOLD);  
        fontTitle.setFontHeight((short) 280);  
  
        // 标题单元格样式  
        HSSFCellStyle cellStyleTitle = worksheet.getWorkbook().createCellStyle();  
        cellStyleTitle.setAlignment(CellStyle.ALIGN_CENTER);  
        cellStyleTitle.setWrapText(true);  
        cellStyleTitle.setFont((HSSFFont) fontTitle);  
  
        // 报表标题  
        HSSFRow rowTitle = worksheet.createRow((short) startRowIndex);  
        rowTitle.setHeight((short) 500);  
        HSSFCell cellTitle = rowTitle.createCell(startColIndex);  
        cellTitle.setCellValue("选择题题库");  
        cellTitle.setCellStyle(cellStyleTitle);  
  
        // 合并区域内的报告标题  
        worksheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 13));  
  
        // date header 
        //说明字体
        Font fontComment = worksheet.getWorkbook().createFont();
        fontComment.setColor(HSSFColor.RED.index);
        //说明单元格样式
        HSSFCellStyle cellStyleComment = worksheet.getWorkbook().createCellStyle();  
        cellStyleComment.setFont((HSSFFont) fontComment);
        
        HSSFRow comment = worksheet.createRow((short) startRowIndex + 1);
        comment.setHeight((short) 500);
        HSSFCell cellComment = comment.createCell(startColIndex);  
        cellComment.setCellValue("创建于: " + DateUtil.getNowTime()+"  说明：科目编号、年级编号请参照'说明'工作簿！");  
        cellComment.setCellStyle(cellStyleComment);
    }  
  
    /** 
     * 创建表头 
     */  
    private static void buildHeaders(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex) {  
        // Header字体  
    	Font font = worksheet.getWorkbook().createFont();
    	
        font.setBoldweight(Font.BOLDWEIGHT_BOLD);  
        font.setColor(HSSFColor.RED.index);
        // 单元格样式  
        HSSFCellStyle headerCellStyle = worksheet.getWorkbook().createCellStyle();  
       // headerCellStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);  
       // headerCellStyle.setFillBackgroundColor(HSSFColor.GREY_80_PERCENT.index);
       // headerCellStyle.setFillPattern(CellStyle.FINE_DOTS);  
        headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        headerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);  
        headerCellStyle.setWrapText(true);  
        headerCellStyle.setFont((HSSFFont) font);  
        headerCellStyle.setBorderBottom(CellStyle.BORDER_THIN);  
  
        // 创建字段标题  
        HSSFRow rowHeader = worksheet.createRow((short) startRowIndex + 2);  
        rowHeader.setHeight((short) 500);  
  
        HSSFCell cell1 = rowHeader.createCell(startColIndex + 0);  
        cell1.setCellValue("编号");  
        cell1.setCellStyle(headerCellStyle);  
  
        HSSFCell cell2 = rowHeader.createCell(startColIndex + 1);  
        cell2.setCellValue("题目");  
        cell2.setCellStyle(headerCellStyle);  
  
        HSSFCell cell3 = rowHeader.createCell(startColIndex + 2);  
        cell3.setCellValue("选项A");  
        cell3.setCellStyle(headerCellStyle);  
  
        HSSFCell cell4 = rowHeader.createCell(startColIndex + 3);  
        cell4.setCellValue("选项B");  
        cell4.setCellStyle(headerCellStyle);  
  
        HSSFCell cell5 = rowHeader.createCell(startColIndex + 4);  
        cell5.setCellValue("选项C");  
        cell5.setCellStyle(headerCellStyle);  
  
        HSSFCell cell6 = rowHeader.createCell(startColIndex + 5);  
        cell6.setCellValue("选项D");  
        cell6.setCellStyle(headerCellStyle);  
        
        HSSFCell cell7 = rowHeader.createCell(startColIndex + 6);  
        cell7.setCellValue("答案");  
        cell7.setCellStyle(headerCellStyle);  
  
        HSSFCell cell8 = rowHeader.createCell(startColIndex + 7);  
        cell8.setCellValue("难度系数");  
        cell8.setCellStyle(headerCellStyle);  
        
        HSSFCell cell9 = rowHeader.createCell(startColIndex + 8);  
        cell9.setCellValue("分值");  
        cell9.setCellStyle(headerCellStyle);  
        
        HSSFCell cell10 = rowHeader.createCell(startColIndex + 9);  
        cell10.setCellValue("科目编号");  
        cell10.setCellStyle(headerCellStyle);  
        
        HSSFCell cell11 = rowHeader.createCell(startColIndex + 10);  
        cell11.setCellValue("年级编号");  
        cell11.setCellStyle(headerCellStyle);  
        
        HSSFCell cell12 = rowHeader.createCell(startColIndex + 11);  
        cell12.setCellValue("教师编号");  
        cell12.setCellStyle(headerCellStyle);  
        
        HSSFCell cell13 = rowHeader.createCell(startColIndex + 12);  
        cell13.setCellValue("添加时间");  
        cell13.setCellStyle(headerCellStyle);  
        
        HSSFCell cell14 = rowHeader.createCell(startColIndex + 13);  
        cell14.setCellValue("试题说明");  
        cell14.setCellStyle(headerCellStyle);  
    } 
}
