package com.rjxy.entity.role;

import java.io.Serializable;
import java.util.HashSet;
/*
 * ¶¯×÷±í
 */
import java.util.Set;

public class Action implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int action_id;
	private String action_name;
	private String action_remark;
	private Set<GroupAM> AM_id = new HashSet<GroupAM>();
	
	public Action(){
		
	}

	public int getAction_id() {
		return action_id;
	}

	public void setAction_id(int actionId) {
		action_id = actionId;
	}

	public String getAction_name() {
		return action_name;
	}

	public void setAction_name(String actionName) {
		action_name = actionName;
	}

	public String getAction_remark() {
		return action_remark;
	}

	public void setAction_remark(String actionRemark) {
		action_remark = actionRemark;
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

	
}
