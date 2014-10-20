package com.rjxy.entity.role;

import java.io.Serializable;

import com.rjxy.entity.TeacherInformation;

public class TeaRole implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int teaRole_id;
	private TeacherInformation teacherInformation;
	private Role role;
	public TeaRole() {

	}
	/**
	 * @return the teaRole_id
	 */
	public int getTeaRole_id() {
		return teaRole_id;
	}
	/**
	 * @param teaRoleId the teaRole_id to set
	 */
	public void setTeaRole_id(int teaRoleId) {
		teaRole_id = teaRoleId;
	}
	/**
	 * @return the teacherInformation
	 */
	public TeacherInformation getTeacherInformation() {
		return teacherInformation;
	}
	/**
	 * @param teacherInformation the teacherInformation to set
	 */
	public void setTeacherInformation(TeacherInformation teacherInformation) {
		this.teacherInformation = teacherInformation;
	}
	/**
	 * @return the role
	 */
	public Role getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(Role role) {
		this.role = role;
	}
	
}
