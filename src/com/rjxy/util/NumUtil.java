/**
 * Project Name:ExamDemo
 * File Name:NumUtil.java
 * Package Name:com.rjxy.util
 * Date:2014-5-21����1:26:18
 *
 */
package com.rjxy.util;

import java.math.BigDecimal;
import java.text.NumberFormat;

/**
 * @ClassName: NumUtil
 * @Description:TODO(�������ֵ�Util������ٷֱ�)
 * @author: zml
 * @date: 2014-5-21 ����1:26:18
 *
 */
public class NumUtil {
	/**
     * ת��ΪBigDecimal
     *  
     * @param o
     * @return BigDecimal
     * @author fantasy 
     * @date 2013-8-27
     */
    public static BigDecimal toBig(Object o) {
        if (o == null || o.toString().equals("") || o.toString().equals("NaN")) {
            return new BigDecimal(0);
        }
        return new BigDecimal(o.toString());
    }
    
    /**
     * ����ٷֱ�
     *  
     * @param divisor
     * @param dividend
     * @return String
     * @author fantasy 
     * @date 2013-8-27
     */
    public static String getPercent(Object divisor, Object dividend){
        if(divisor == null || dividend == null){
            return "";
        }
        NumberFormat percent = NumberFormat.getPercentInstance();   
        //�����ٷֱȸ�ʽ������   
        percent.setMaximumFractionDigits(2);
        BigDecimal a = toBig(divisor);
        BigDecimal b = toBig(dividend);
        if(a.equals(toBig(0)) || b.equals(toBig(0)) || a.equals(toBig(0.0)) || b.equals(toBig(0.0))){
       	 return "0.00%";
        }
        BigDecimal c = a.divide(b, 4, BigDecimal.ROUND_DOWN);
        return percent.format(c);
    }
    
    /**
     * �������
     *  
     * @param divisor
     * @param dividend
     * @return String
     * @author fantasy 
     * @date 2013-10-9
     */
    public static String divideNumber(Object divisor, Object dividend){
    	if(divisor == null || dividend == null){
            return "";
        }
    	 BigDecimal a = toBig(divisor);
         BigDecimal b = toBig(dividend);
         if(a.equals(toBig(0)) || b.equals(toBig(0))){
        	 return "0";
         }
         BigDecimal c = a.divide(b, 2, BigDecimal.ROUND_DOWN);
         return c.toString();
    }
    
    /**
     * ȥ��������ƽ��ֵ����������
     *  
     * @param divisor
     * @param dividend
     * @return int
     * @author fantasy 
     * @date 2013-11-6
     */
    public static int averageNumber(Object divisor, Object dividend){
    	if(divisor == null || dividend == null){
            return 0;
        }
    	BigDecimal a = toBig(divisor);
        BigDecimal b = toBig(dividend);
        if(a.equals(toBig(0)) || b.equals(toBig(0))){
       	 	return 0;
        }
        BigDecimal c = a.divide(b, 0, BigDecimal.ROUND_HALF_UP);
        return c.intValue();
    }
}
