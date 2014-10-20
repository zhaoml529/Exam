package com.rjxy.util;

import java.util.List;

public class JsonUtils {

	/**
	 * 将rmList转换成为json格式的数据
	 * 
	 * @param rmList
	 * @return
	 */
//	public static String fromList(List<RoleMenu> rmList) {
//		StringBuffer sb = new StringBuffer();
//		sb.append("[");
//		if (!BeanUtils.isBlank(rmList)) {
//			for (RoleMenu rm : rmList) {
//				String module = rm.getId().getMenu().getId().getMenuModule();
//				String privilege = rm.getId().getMenu().getId()
//						.getMenuPrivilege();
//				String menuName = rm.getId().getMenu().getMenuName();
//				if (!StringUtils.isBlank(module, privilege)) {
//					if (module.equals(privilege)) {
//						sb.append("{text:'" + menuName + "',children:[");
//						for (RoleMenu rmSub : rmList) {
//							String moduleSub = rmSub.getId().getMenu().getId()
//									.getMenuModule();
//							String privilegeSub = rmSub.getId().getMenu()
//									.getId().getMenuPrivilege();
//							String menuNameSub = rmSub.getId().getMenu()
//									.getMenuName();
//							String url = rmSub.getId().getMenu().getUrl();
//							if (!StringUtils.isBlank(moduleSub, privilegeSub)) {
//								if (!moduleSub.equals(privilegeSub)
//										&& moduleSub.equals(module)) {
//									sb.append("{text:'" + menuNameSub
//											+ "',attributes:{url:'" + url
//											+ "'}},");
//								}
//							}
//						}
//						sb.deleteCharAt(sb.length() - 1);
//						sb.append("]},");
//					}
//				}
//			}
//		}
//		sb.deleteCharAt(sb.length() - 1);
//		sb.append("]");
//		return sb.toString();
//	}

	/**
	 * 将adminList转换成为json的字符串
	 * 
	 * @param adminList
	 * @return
	 */
//	public static String fromAdminList(List<Admin> adminList) {
//		StringBuffer sb = new StringBuffer("");
//		sb.append("[");
//		for (Admin admin : adminList) {
//			if (!BeanUtils.isBlank(admin)) {
//				sb.append("{admin:'admin',");
//				sb.append("adminCode:");
//				sb.append("'"+admin.getAdminCode()+"'");
//				sb.append("},");
//			}
//		}
//		sb.deleteCharAt(sb.length() - 1);
//		sb.append("]");
//		return sb.toString();
//	}
}
