/**
 * Project Name:ExamDemo
 * File Name:Layouter.java
 * Package Name:com.rjxy.poi.util
 * Date:2014-5-20����5:05:46
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
 * @Description:TODO(����ѡ���ⱨ��)
 * @author: zml
 * @date: 2014-5-20 ����5:05:46
 *
 */
public class ChoiceLayouter {

    public static void buildReport(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex) {  
        // �����еĿ��  
    	for(int i=0;i<14;i++){
    		worksheet.setColumnWidth(i, 5000);
    	}
        buildTitle(worksheet, startRowIndex, startColIndex);  
  
        buildHeaders(worksheet, startRowIndex, startColIndex);  
  
    }  
  
    /** 
     * ���������������� 
     */  
    private static void buildTitle(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex) {  
        // ���ñ����������  
        Font fontTitle = worksheet.getWorkbook().createFont();  
        fontTitle.setBoldweight(Font.BOLDWEIGHT_BOLD);  
        fontTitle.setFontHeight((short) 280);  
  
        // ���ⵥԪ����ʽ  
        HSSFCellStyle cellStyleTitle = worksheet.getWorkbook().createCellStyle();  
        cellStyleTitle.setAlignment(CellStyle.ALIGN_CENTER);  
        cellStyleTitle.setWrapText(true);  
        cellStyleTitle.setFont((HSSFFont) fontTitle);  
  
        // �������  
        HSSFRow rowTitle = worksheet.createRow((short) startRowIndex);  
        rowTitle.setHeight((short) 500);  
        HSSFCell cellTitle = rowTitle.createCell(startColIndex);  
        cellTitle.setCellValue("ѡ�������");  
        cellTitle.setCellStyle(cellStyleTitle);  
  
        // �ϲ������ڵı������  
        worksheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 13));  
  
        // date header 
        //˵������
        Font fontComment = worksheet.getWorkbook().createFont();
        fontComment.setColor(HSSFColor.RED.index);
        //˵����Ԫ����ʽ
        HSSFCellStyle cellStyleComment = worksheet.getWorkbook().createCellStyle();  
        cellStyleComment.setFont((HSSFFont) fontComment);
        
        HSSFRow comment = worksheet.createRow((short) startRowIndex + 1);
        comment.setHeight((short) 500);
        HSSFCell cellComment = comment.createCell(startColIndex);  
        cellComment.setCellValue("������: " + DateUtil.getNowTime()+"  ˵������Ŀ��š��꼶��������'˵��'��������");  
        cellComment.setCellStyle(cellStyleComment);
    }  
  
    /** 
     * ������ͷ 
     */  
    private static void buildHeaders(HSSFSheet worksheet, int startRowIndex,  
            int startColIndex) {  
        // Header����  
    	Font font = worksheet.getWorkbook().createFont();
    	
        font.setBoldweight(Font.BOLDWEIGHT_BOLD);  
        font.setColor(HSSFColor.RED.index);
        // ��Ԫ����ʽ  
        HSSFCellStyle headerCellStyle = worksheet.getWorkbook().createCellStyle();  
       // headerCellStyle.setFillForegroundColor(HSSFColor.PALE_BLUE.index);  
       // headerCellStyle.setFillBackgroundColor(HSSFColor.GREY_80_PERCENT.index);
       // headerCellStyle.setFillPattern(CellStyle.FINE_DOTS);  
        headerCellStyle.setAlignment(CellStyle.ALIGN_CENTER);  
        headerCellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);  
        headerCellStyle.setWrapText(true);  
        headerCellStyle.setFont((HSSFFont) font);  
        headerCellStyle.setBorderBottom(CellStyle.BORDER_THIN);  
  
        // �����ֶα���  
        HSSFRow rowHeader = worksheet.createRow((short) startRowIndex + 2);  
        rowHeader.setHeight((short) 500);  
  
        HSSFCell cell1 = rowHeader.createCell(startColIndex + 0);  
        cell1.setCellValue("���");  
        cell1.setCellStyle(headerCellStyle);  
  
        HSSFCell cell2 = rowHeader.createCell(startColIndex + 1);  
        cell2.setCellValue("��Ŀ");  
        cell2.setCellStyle(headerCellStyle);  
  
        HSSFCell cell3 = rowHeader.createCell(startColIndex + 2);  
        cell3.setCellValue("ѡ��A");  
        cell3.setCellStyle(headerCellStyle);  
  
        HSSFCell cell4 = rowHeader.createCell(startColIndex + 3);  
        cell4.setCellValue("ѡ��B");  
        cell4.setCellStyle(headerCellStyle);  
  
        HSSFCell cell5 = rowHeader.createCell(startColIndex + 4);  
        cell5.setCellValue("ѡ��C");  
        cell5.setCellStyle(headerCellStyle);  
  
        HSSFCell cell6 = rowHeader.createCell(startColIndex + 5);  
        cell6.setCellValue("ѡ��D");  
        cell6.setCellStyle(headerCellStyle);  
        
        HSSFCell cell7 = rowHeader.createCell(startColIndex + 6);  
        cell7.setCellValue("��");  
        cell7.setCellStyle(headerCellStyle);  
  
        HSSFCell cell8 = rowHeader.createCell(startColIndex + 7);  
        cell8.setCellValue("�Ѷ�ϵ��");  
        cell8.setCellStyle(headerCellStyle);  
        
        HSSFCell cell9 = rowHeader.createCell(startColIndex + 8);  
        cell9.setCellValue("��ֵ");  
        cell9.setCellStyle(headerCellStyle);  
        
        HSSFCell cell10 = rowHeader.createCell(startColIndex + 9);  
        cell10.setCellValue("��Ŀ���");  
        cell10.setCellStyle(headerCellStyle);  
        
        HSSFCell cell11 = rowHeader.createCell(startColIndex + 10);  
        cell11.setCellValue("�꼶���");  
        cell11.setCellStyle(headerCellStyle);  
        
        HSSFCell cell12 = rowHeader.createCell(startColIndex + 11);  
        cell12.setCellValue("��ʦ���");  
        cell12.setCellStyle(headerCellStyle);  
        
        HSSFCell cell13 = rowHeader.createCell(startColIndex + 12);  
        cell13.setCellValue("���ʱ��");  
        cell13.setCellStyle(headerCellStyle);  
        
        HSSFCell cell14 = rowHeader.createCell(startColIndex + 13);  
        cell14.setCellValue("����˵��");  
        cell14.setCellStyle(headerCellStyle);  
    } 
}
