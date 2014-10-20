package com.rjxy.entity.role;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/*
 *动作模块表 
 */

public class GroupAM implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int AM_id;
	private Action action;
	private Module module;
	private Set<GroupRAM> RAM_id = new HashSet<GroupRAM>();
	public GroupAM(){
		
	}
	public int getAM_id() {
		return AM_id;
	}
	public void setAM_id(int aMId) {
		AM_id = aMId;
	}
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	/**
	 * @return the rAM_id
	 */
	public Set<GroupRAM> getRAM_id() {
		return RAM_id;
	}
	/**
	 * @param rAMId the rAM_id to set
	 */
	public void setRAM_id(Set<GroupRAM> rAMId) {
		RAM_id = rAMId;
	}
	
	
	
}
