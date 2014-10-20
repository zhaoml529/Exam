package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.Score;

/*
 * 班级表
 */

public class ClassInformation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int class_id;		//班级编号
	private String class_name;		//班级名称
	private String class_date;		//建班时间
	private String class_remark;	//班级说明
	private GradeInformation gradeInforMation;	//年级
	private Set<Course> course_id = new HashSet<Course>();
	private Set<StudentInformation> stu_id = new HashSet<StudentInformation>();
	public ClassInformation() {

	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int classId) {
		class_id = classId;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String className) {
		class_name = className;
	}
	public String getClass_date() {
		return class_date;
	}
	public void setClass_date(String classDate) {
		class_date = classDate;
	}
	public String getClass_remark() {
		return class_remark;
	}
	public void setClass_remark(String classRemark) {
		class_remark = classRemark;
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
	public GradeInformation getGradeInforMation() {
		return gradeInforMation;
	}
	public void setGradeInforMation(GradeInformation gradeInforMation) {
		this.gradeInforMation = gradeInforMation;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
