/**
 * Project Name:ExamDemo
 * File Name:Validation.java
 * Package Name:com.rjxy.util
 * Date:2014-5-21����1:27:10
 *
 */
package com.rjxy.util;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName: Validation
 * @Description:TODO(��֤�� ���ṩ���õ�ת��)
 * @author: zml
 * @date: 2014-5-21 ����1:27:10
 *
 */
public class Validation {
	private static final Logger LOGGER = LoggerFactory.getLogger(Validation.class);

	/**
	 * ��֤����������ʽ
	 */
	private static final String P_INT = "^\\d+$";
	/**
	 * ��֤������������ʽ
	 */
	private static final String P_FLOAT = "^\\d+(\\.\\d+){0,1}$";
	/**
	 * ��֤�绰���������ʽ
	 */
	private static final String P_PHONE = "^\\d+(-\\d+)*$";
	/**
	 * ��֤ e-mail ������ʽ
	 */
	private static final String P_EMAIL = "^[a-zA-Z_]\\w*@\\w+(\\.\\w+)+$";

	/**
	 * ��֤�Ƿ�Ϊ����
	 */
	public static final int INT = 1;
	/**
	 * ��֤�Ƿ�Ϊ������
	 */
	public static final int FLOAT = 2;
	/**
	 * ��֤�Ƿ�Ϊ�绰����
	 */
	public static final int PHONE = 3;
	/**
	 * ��֤�Ƿ�Ϊ e-mail
	 */
	public static final int EMAIL = 4;

	public static void main(String[] args) {
		System.out.println(validate("2r", INT));
	}

	/**
	 * ���ַ���������֤
	 * 
	 * @param input
	 *            ��Ҫ��֤���ַ���
	 * @param matcher
	 *            ��֤����
	 * @return ��֤�Ƿ�ͨ��
	 */
	public static boolean validate(String input, int matcher) {
		if (isNULL(input)) {
			return false;
		}
		String regex = null;
		switch (matcher) {
		case INT:
			regex = P_INT;
			break;
		case FLOAT:
			regex = P_FLOAT;
			break;
		case PHONE:
			regex = P_PHONE;
			break;
		case EMAIL:
			regex = P_EMAIL;
			break;
		default:
			return false;
		}
		return Pattern.matches(regex, input);
	}

	public static String toString(Object value) {

		if (isNULL(value))
			return "";
		else
			return value.toString().trim();
	}

	public static String isNbsp(Object value) {
		if (isNULL(value)) {
			return "&nbsp;";
		} else {
			return value.toString();
		}
	}

	public static Boolean isNULL(Object... value) {
		if (null == value || value.length < 1) {
			return true;
		} else {
			for (int i = 0; i < value.length; i++) {
				if (null == value[i] || "".equals(value[i].toString())
						|| "null".equals(value[i].toString().toLowerCase())) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 
	 * @param format
	 *            "" ##.## ,###.## ,000.00 0.00 ,### ,000
	 * @param value
	 *            ����
	 * @return
	 */
	public static String toNumber(String format, Object value) {
		if (isNULL(value)) {
			return "";
		}
		DecimalFormat df = new DecimalFormat(format);
		StringBuffer sb = new StringBuffer();
		df.format(new BigDecimal(value.toString()), sb, new FieldPosition(0));
		return sb.toString();
	}

	public static Boolean equals(Object o, Object x) {
		if (isNULL(o) || isNULL(x)) {
			return false;
		}

		if (o == x || o.equals(x) || o.toString().equals(x)) {
			return true;
		}
		return false;
	}

	public static Float toFloat(Object value) {
		if (isNULL(value))
			return 0.0f;
		else
			return Float.parseFloat(value.toString());
	}

	public static Boolean isBoolean(Object value) {
		if (isNULL(value))
			return false;
		else if (value.toString().equals("0")
				|| value.toString().equalsIgnoreCase("false"))
			return false;
		else
			return true;
	}

	public static Integer toInteger(Object value) {
		if (isNULL(value))
			return 0;
		else
			return Integer.parseInt(value.toString());
	}

	public static Long toLong(Object value) {
		if (isNULL(value)) {
			return 0l;
		} else
			return Long.parseLong(value.toString());
	}

	public static Double toDouble(Object value) {
		if (isNULL(value)) {
			return 0.0d;
		} else {
			return Double.parseDouble(value.toString());
		}
	}

	public static Boolean toBoolean(Object value) {
		if (isNULL(value))
			return false;
		else
			return Boolean.parseBoolean(value.toString());
	}

	/**
	 * ȡ���ַ����еĿ��ַ�
	 * 
	 * @param ȡ�����ַ�
	 * @return ȡ���˿��ַ����ַ���
	 */
	public static String toTrim(String str) {
		String s = "";
		if (null != str) {
			s = str.trim();
		}
		return s;
	}

	/**
	 * ����ַ����Ƿ�Ϊ����
	 * 
	 * @author RASCAL
	 */
	public static boolean isDate(Object value) {
		return isDateFormat(value, "^\\d{4}-\\d{1,2}-\\d{1,2}$");
	}

	/**
	 * ����ַ����Ƿ�Ϊ����ʱ������
	 * 
	 * @author RASCAL
	 */
	public static boolean isDateTime(Object value) {
		return isDateFormat(value,
				"^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$");
	}

	/**
	 * ����ַ����Ƿ�Ϊָ������������
	 * 
	 * @param fromatReg
	 *            ��ʽ������ʽ
	 * @author RASCAL
	 */
	public static boolean isDateFormat(Object value, String fromatReg) {
		Pattern pattern = Pattern.compile(fromatReg);
		if (isNULL(value) || !pattern.matcher(value.toString()).matches()) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * �����������ͣ���ʽ"yyyyMMdd"
	 * 
	 * @author RASCAL
	 */
	public static Date toDate(Object value) {
		return parseDate(value, "yyyy-MM-dd");
	}

	/**
	 * ��������ʱ�����ͣ���ʽ"yyyyMMdd HH:mm:ss"
	 * 
	 * @author RASCAL
	 */
	public static Date toDateTime(Object value) {
		return parseDate(value, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * ������������
	 * 
	 * @param fromat
	 *            ���ڸ�ʽ
	 * @author RASCAL
	 */
	public static Date parseDate(Object value, String fromat) {
		// �������ڸ�ʽ
		try {
			DateFormat df = new SimpleDateFormat(fromat);
			return df.parse(value.toString());
		} catch (Exception ex) {
			LOGGER.warn(
					LogUtil.getLogStr("TimeConvertException", "500", value
							+ ":" + fromat, "", ex.getMessage()), ex);
		}
		return null;
	}

	/**
	 * 
	 * @param format
	 *            ���ڸ�ʽ
	 * @return ��������
	 * @author RASCAL
	 */
	public static String toDay(String format) {
		if (isNULL(format)) {
			return new SimpleDateFormat(format).format(new Date());
		} else {
			return new SimpleDateFormat(format).format(new Date());
		}
	}

	// ���� 32 λ�� id
	public static String getCode(int mnum) {
		char strRandom[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
				'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
				'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5',
				'6', '7', '8', '9' };
		// �����ַ�������
		StringBuffer finalStr = new StringBuffer();
		for (int count = 0; count < mnum; count++) {
			int randomNum = new Random().nextInt(62);
			// ����ַ����������ַ���λ��
			finalStr.append(strRandom[randomNum]);
		}
		return finalStr.toString();
	}

	public static String[][] toArray(String x) {
		String[] xx = x.split("=!=");
		String[][] xxx = new String[xx.length][];
		for (int i = 0; i < xx.length; i++) {
			xxx[i] = xx[i].split("-!-");
		}
		return xxx;
	}

	public static Object[] toByte(Object value) {
		return null;
	}

	public static Object[] toTime(Object value) {
		return null;
	}
}
