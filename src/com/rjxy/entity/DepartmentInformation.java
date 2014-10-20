package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.exam.Course;

/*
 * 院系机构信息
 */

public class DepartmentInformation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int department_id;	//机构编号
	private String department_name;	//机构名称
	private String department_remark;//机构说明
	private Set<StudentInformation> stu_id = new HashSet<StudentInformation>();
	private Set<TeacherInformation> tea_id = new HashSet<TeacherInformation>();
	private Set<Course> course_id = new HashSet<Course>();
	private Set<ProfessionInformation> profession_id = new HashSet<ProfessionInformation>();
	public DepartmentInformation() {

	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int departmentId) {
		department_id = departmentId;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String departmentName) {
		department_name = departmentName;
	}
	public String getDepartment_remark() {
		return department_remark;
	}
	public void setDepartment_remark(String departmentRemark) {
		department_remark = departmentRemark;
	}
	/**
	 * @return the stu_id
	 */
	@JsonIgnore
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
	 * @return the tea_id
	 */
	@JsonIgnore
	public Set<TeacherInformation> getTea_id() {
		return tea_id;
	}
	/**
	 * @param teaId the tea_id to set
	 */
	public void setTea_id(Set<TeacherInformation> teaId) {
		tea_id = teaId;
	}
	/**
	 * @return the course_id
	 */
	@JsonIgnore
	public Set<Course> getCourse_id() {
		return course_id;
	}
	/**
	 * @param courseId the course_id to set
	 */
	public void setCourse_id(Set<Course> courseId) {
		course_id = courseId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@JsonIgnore
	public Set<ProfessionInformation> getProfession_id() {
		return profession_id;
	}
	public void setProfession_id(Set<ProfessionInformation> profession_id) {
		this.profession_id = profession_id;
	}
	
}
