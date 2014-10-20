package com.rjxy.entity.role;

import java.io.Serializable;
/*
 * ½ÇÉ«±í
 */
import java.util.HashSet;
import java.util.Set;

import com.rjxy.entity.StudentInformation;

public class Role implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int role_id;
	private String role_name;
	private String role_remark;
	private Set<TeaRole> teaRole_id = new HashSet<TeaRole>();
	private Set<StudentInformation> stu_id = new HashSet<StudentInformation>();
	private Set<GroupRAM> RAM_id = new HashSet<GroupRAM>();
	
	public Role() {

	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int roleId) {
		role_id = roleId;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String roleName) {
		role_name = roleName;
	}
	public String getRole_remark() {
		return role_remark;
	}
	public void setRole_remark(String roleRemark) {
		role_remark = roleRemark;
	}

	/**
	 * @return the teaRole_id
	 */
	public Set<TeaRole> getTeaRole_id() {
		return teaRole_id;
	}
	/**
	 * @param teaRoleId the teaRole_id to set
	 */
	public void setTeaRole_id(Set<TeaRole> teaRoleId) {
		teaRole_id = teaRoleId;
	}
	/**
	 * @return the stu_id
	 */
	public Set<StudentInformation> getStu_id() {
		return stu_id;
	}
	/**
	 * @param stuId the stu_id to set
	 */
	public void setStu_id(Set<StudentInformation> stuId) {
		stu_id = stuId;
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
