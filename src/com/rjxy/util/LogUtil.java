/**
 * Project Name:ExamDemo
 * File Name:LogUtil.java
 * Package Name:com.rjxy.util
 * Date:2014-5-21����1:22:49
 *
 */
package com.rjxy.util;

/**
 * @ClassName: LogUtil
 * @Description:TODO( ��־������)
 * @author: zml
 * @date: 2014-5-21 ����1:22:49
 *
 */
public class LogUtil {
	public static final String LOG_SPLIT = " ";
	public static final String LOG_MARKS_QUOTATION = "\"";

	/**
	 * ��־��Ϣ��ȡ
	 * 
	 * @param functionName
	 *            ����˵��
	 * @param status
	 *            ״̬
	 * @param inputParams
	 *            �������
	 * @param outputParams
	 *            �������
	 * @param exceptionMsg
	 *            �쳣��Ϣ
	 * @return String
	 * @author:Jiyong.Wei
	 * @date:2013-4-9
	 */
	public static String getLogStr(String functionName, String status,
			Object inputParams, Object outputParams, String exceptionMsg) {
		StringBuffer sb = new StringBuffer();
		sb.append(functionName).append(LOG_SPLIT);

		sb.append(status).append(LOG_SPLIT);

		sb.append(LOG_MARKS_QUOTATION);
		sb.append(inputParams != null ? inputParams.toString() : "");
		sb.append(LOG_MARKS_QUOTATION);
		sb.append(LOG_SPLIT);

		sb.append(LOG_MARKS_QUOTATION);
		sb.append(outputParams != null ? outputParams.toString() : "");
		sb.append(LOG_MARKS_QUOTATION);
		sb.append(LOG_SPLIT);

		sb.append(LOG_MARKS_QUOTATION);
		sb.append(exceptionMsg != null ? exceptionMsg : "");
		sb.append(LOG_MARKS_QUOTATION);
		return sb.toString();
	}
}
