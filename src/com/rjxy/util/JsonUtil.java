/**
 * Project Name:ExamDemo
 * File Name:JsonUtil.java
 * Package Name:com.rjxy.util
 * Date:2014-5-21����1:20:39
 *
 */
package com.rjxy.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @ClassName: JsonUtil
 * @Description:TODO(����json�Ĺ����࣬����json����ת����java�����java����ת����json)
 * @author: zml
 * @date: 2014-5-21 ����1:20:39
 *
 */
public class JsonUtil {
private static final Logger LOGGER=LoggerFactory.getLogger(JsonUtil.class);
	
	/**
	 * ��һ��JSON �����ַ���ʽ�еõ�һ��java����
	 * 
	 * @param jsonString
	 * @param pojoCalss
	 * @return
	 */
	public static Object getObject4JsonString(String jsonString, Class pojoCalss) {
		Object pojo;
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		pojo = JSONObject.toBean(jsonObject, pojoCalss);
		return pojo;
	}

	/**
	 * ��json HASH���ʽ�л�ȡһ��map����map֧��Ƕ�׹���
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Map getMap4Json(String jsonString) {
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		Iterator keyIter = jsonObject.keys();
		String key;
		Object value;
		Map valueMap = new HashMap();
		while (keyIter.hasNext()) {
			key = (String) keyIter.next();
			value = jsonObject.get(key);
			valueMap.put(key, value);
		}
		return valueMap;
	}

	/**
	 * ��һ��java����ת��Ϊobject����
	 * 
	 * @param object
	 * @return
	 * @author:shizhongwen
	 * @date:2012-10-29
	 */
	public static Map getMap4Object(Object object) {
		String josn = getJsonString4JavaPOJO(object);
		return getMap4Json(josn);
	}

	/**
	 * ��json�����еõ���Ӧjava����
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Object[] getObjectArray4Json(String jsonString) {
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		return jsonArray.toArray();
	}

	/**
	 * ��json���󼯺ϱ��ʽ�еõ�һ��java�����б�
	 * 
	 * @param jsonString
	 * @param pojoClass
	 * @return
	 */
	public static List getList4Json(String jsonString, Class pojoClass) {
		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		JSONObject jsonObject;
		Object pojoValue;
		List list = new ArrayList();
		for (int i = 0; i < jsonArray.size(); i++) {
			jsonObject = jsonArray.getJSONObject(i);
			pojoValue = JSONObject.toBean(jsonObject, pojoClass);
			list.add(pojoValue);
		}
		return list;
	}

	/**
	 * ��json�����н�����java�ַ�������
	 * 
	 * @param jsonString
	 * @return
	 */
	public static String[] getStringArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		String[] stringArray = new String[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			stringArray[i] = jsonArray.getString(i);

		}

		return stringArray;
	}

	/**
	 * ��json�����н�����javaLong�Ͷ�������
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Long[] getLongArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		Long[] longArray = new Long[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			longArray[i] = jsonArray.getLong(i);

		}
		return longArray;
	}

	/**
	 * ��json�����н�����java Integer�Ͷ�������
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Integer[] getIntegerArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		Integer[] integerArray = new Integer[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			integerArray[i] = jsonArray.getInt(i);

		}
		return integerArray;
	}

	/**
	 * ��json�����н�����java Integer�Ͷ�������
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Double[] getDoubleArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		Double[] doubleArray = new Double[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			doubleArray[i] = jsonArray.getDouble(i);

		}
		return doubleArray;
	}

	/**
	 * ��java����ת����json�ַ���
	 * 
	 * @param javaObj
	 * @return
	 */
	public static String getJsonString4JavaPOJO(Object javaObj) {
		JSONObject json;
		json = JSONObject.fromObject(javaObj);
		return json.toString();

	}

	public static String getJsonString4JavaArray(Object[] objects) {
		JSONArray jsonArray;
		jsonArray = JSONArray.fromObject(objects);
		return jsonArray.toString();
	}

	/**
	 * ��java����ת����json�ַ���,���趨���ڸ�ʽ
	 * 
	 * @param javaObj
	 * @param dataFormat
	 * @return
	 */
	public static String getJsonString4JavaPOJO(Object javaObj,
			String dataFormat) {
		JSONObject json;
		JsonConfig jsonConfig = configJson(dataFormat);
		json = JSONObject.fromObject(javaObj, jsonConfig);
		return json.toString();

	}

	/**
	 * JSON ʱ���������
	 */
	public static JsonConfig configJson(String datePattern) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[] { "" });
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor(datePattern));

		return jsonConfig;
	}

	/**
	 * ��ȥ�������ɵ��ֶΣ��ر��ʺ�ȥ�������Ķ���+ʱ��ת��
	 * 
	 * @param excludes
	 *            ��ȥ�������ɵ��ֶ�
	 * @param datePattern
	 * @return
	 */
	public static JsonConfig configJson(String[] excludes, String datePattern) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		jsonConfig.setIgnoreDefaultExcludes(true);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor(datePattern));
		return jsonConfig;
	}

	/**
	 * ����LIST����������ҳ���ӡ�б�����
	 */
	public static void returnJsonListData(HttpServletResponse response,
			List list, int count, String name) {
		Map<String, Object> mapJson = new Hashtable<String, Object>();
		mapJson.put("total", count);
		mapJson.put("rows", list);

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd hh:mm:ss"));

		JSONObject jsonObject = JSONObject.fromObject(mapJson, jsonConfig);
		System.out.print(jsonObject);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(LogUtil.getLogStr("IOException", "500", "", "", e.getMessage()),e);
		}
		out.print(jsonObject);
		out.close();
	}

	/**
	 * ��ҳ���ȥdata�ַ���
	 */
	public static void returnJsonStringData(HttpServletResponse response,
			String data) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			LOGGER.error(LogUtil.getLogStr("IOException", "500", "", "", e.getMessage()),e);
		}
		out.write(data);
		out.close();
	}

	/**
	 * ��listת��Ϊjson�ַ���
	 */
	public static String getJsonArray4JavaList(List list) {
		JSONArray jsonArray;
		jsonArray = JSONArray.fromObject(list);
		String jsonArrayStr = jsonArray.toString();
		jsonArrayStr = jsonArrayStr.substring(jsonArrayStr.indexOf("["));
		return jsonArray.toString();
	}

	/**
	 * ƴ�ӱ�ͼ����
	 *  
	 * @param resultList
	 * @return List<Map<String,Object>>
	 * @author:Jiyong.Wei 
	 * @date:2013-4-9
	 */
	public static List<Map<String,Object>> getPieData(List<Map<String,Object>> resultList){
		List<Map<String,Object>> result; 
		if (resultList==null || resultList.size()==0) {
			return null;
		}
		result=new ArrayList<Map<String,Object>>();
		int size = resultList.size();
		for (int i = 0; i < size; i++) {
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("desc", Validation.toString(resultList.get(i).get("description")));
			map.put("value",Validation.toInteger(resultList.get(i).get("count")));
			
			result.add(map);
		}
		return result;
	}
}
