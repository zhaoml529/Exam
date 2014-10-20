package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.Subject;

/*
 * 专业表
 */
public class ProfessionInformation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int profession_id;	//专业编号
	private DepartmentInformation departmentInformation;	//机构编号
	private String profession_name;	//专业名称
	private String profession_remark;//专业说明
	private Set<Course> course_id = new HashSet<Course>();
	private Set<StudentInformation> stu_id = new HashSet<StudentInformation>();
	private Set<Subject> subject_id = new HashSet<Subject>();
	public ProfessionInformation() {

	}
	/**
	 * @return the profession_id
	 */
	public int getProfession_id() {
		return profession_id;
	}
	/**
	 * @param professionId the profession_id to set
	 */
	public void setProfession_id(int professionId) {
		profession_id = professionId;
	}


	public DepartmentInformation getDepartmentInformation() {
		return departmentInformation;
	}
	public void setDepartmentInformation(DepartmentInformation departmentInformation) {
		this.departmentInformation = departmentInformation;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	/**
	 * @return the profession_name
	 */
	public String getProfession_name() {
		return profession_name;
	}
	/**
	 * @param professionName the profession_name to set
	 */
	public void setProfession_name(String professionName) {
		profession_name = professionName;
	}
	/**
	 * @return the profession_remark
	 */
	public String getProfession_remark() {
		return profession_remark;
	}
	/**
	 * @param professionRemark the profession_remark to set
	 */
	public void setProfession_remark(String professionRemark) {
		profession_remark = professionRemark;
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
	 * @return the subject_id
	 */
	@JsonIgnore
	public Set<Subject> getSubject_id() {
		return subject_id;
	}
	/**
	 * @param subjectId the subject_id to set
	 */
	public void setSubject_id(Set<Subject> subjectId) {
		subject_id = subjectId;
	}

}
