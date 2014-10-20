package com.rjxy.entity.role;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/*
 * Ä£¿é±í
 */

public class Module implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int module_id;
	private String module_name;
	private String module_URL;
	private String module_remark;
	private Set<GroupAM> AM_id = new HashSet<GroupAM>();
	
	public Module(){
		
	}

	public int getModule_id() {
		return module_id;
	}

	public void setModule_id(int moduleId) {
		module_id = moduleId;
	}

	public String getModule_name() {
		return module_name;
	}

	public void setModule_name(String moduleName) {
		module_name = moduleName;
	}

	public String getModule_URL() {
		return module_URL;
	}

	public void setModule_URL(String moduleURL) {
		module_URL = moduleURL;
	}

	/**
	 * @return the aM_id
	 */
	public Set<GroupAM> getAM_id() {
		return AM_id;
	}

	/**
	 * @param aMId the aM_id to set
	 */
	public void setAM_id(Set<GroupAM> aMId) {
		AM_id = aMId;
	}

	/**
	 * @return the module_remark
	 */
	public String getModule_remark() {
		return module_remark;
	}

	/**
	 * @param moduleRemark the module_remark to set
	 */
	public void setModule_remark(String moduleRemark) {
		module_remark = moduleRemark;
	}

	
}
