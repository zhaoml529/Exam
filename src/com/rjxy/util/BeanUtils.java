package com.rjxy.util;

import java.util.List;
import java.util.Map;

/**
 * 工具类，判断bean，数组，集合是否为空
 * @author wang
 *
 */
public class BeanUtils {

	public static boolean isBlank(Object obj){
		if(obj == null){
			return true;
		}
		return false;
	}
	public static boolean isBlank(List list){
		if(list == null || list.size()<=0){
			return true;
		}
		return false;
	}
	public static boolean isBlank(Map map){
		if(map == null || map.size()<=0){
			return true;
		}
		return false;
	}
	public static boolean isBlank(Object []obj){
		if(obj == null || obj.length<=0){
			return true;
		}
		return false;
	}
}
