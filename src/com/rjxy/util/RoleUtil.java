package com.rjxy.util;

/**
 * 角色工具类，用来将角色的id转换成对应角色的字符串名称形式
 * @author wang
 *
 */
public class RoleUtil {

	public static String getFromRoleId(int id){
		switch(id){
			case 1:return "schooladmin";
			case 2:return "majoradmin";
			case 3:return "teacher";
			case 4:return "professor";
			case 5:return "student";
			default:return null;
		}
	}
}
