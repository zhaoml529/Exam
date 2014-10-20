package com.rjxy.entity.role;

import java.io.Serializable;
/*
 * 角色动作模块表
 */

public class GroupRAM implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int RAM_id;
	private GroupAM groupAM;
	private Role role;
	public GroupRAM(){
		
	}
	public int getRAM_id() {
		return RAM_id;
	}
	public void setRAM_id(int rAMId) {
		RAM_id = rAMId;
	}
	public GroupAM getGroupAM() {
		return groupAM;
	}
	public void setGroupAM(GroupAM groupAM) {
		this.groupAM = groupAM;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
