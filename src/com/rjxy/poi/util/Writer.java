package com.rjxy.poi.util;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class Writer {

	public static void write(HttpServletResponse response, HSSFWorkbook workbook) {  
		  
       
        try {  
            // Retrieve the output stream  
            ServletOutputStream outputStream = response.getOutputStream();  
            // Write to the output stream  
            workbook.getSheetAt(0).getWorkbook().write(outputStream);
            //worksheet.getWorkbook().write(outputStream);  
            // 清除缓存  
            outputStream.flush();  
  
        } catch (Exception e) {  
            e.printStackTrace();
        }  
    }  
}
