package com.rjxy.entity.exam;

import java.io.Serializable;

import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.TeacherInformation;

/*
 * 课程信息
 */
public class Course implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int course_id;	//课程编号
	private DepartmentInformation departmentInformation;	//机构编号FK
	private ProfessionInformation professionInformation;	//学科专业编号FK
	private Subject	subject;	//科目编号FK
	private GradeInformation gradeInformation;		//年级编号
	private ClassInformation classInformation;		//班号
	private TeacherInformation teacherInformation;	//教师编号
	private String course_remark;		//课程说明
	
	public Course() {

	}
	/**
	 * @return the course_id
	 */
	public int getCourse_id() {
		return course_id;
	}
	/**
	 * @param courseId the course_id to set
	 */
	public void setCourse_id(int courseId) {
		course_id = courseId;
	}
	/**
	 * @return the departmentInformation
	 */
	public DepartmentInformation getDepartmentInformation() {
		return departmentInformation;
	}
	/**
	 * @param departmentInformation the departmentInformation to set
	 */
	public void setDepartmentInformation(DepartmentInformation departmentInformation) {
		this.departmentInformation = departmentInformation;
	}
	/**
	 * @return the professionInformation
	 */
	public ProfessionInformation getProfessionInformation() {
		return professionInformation;
	}
	/**
	 * @param professionInformation the professionInformation to set
	 */
	public void setProfessionInformation(ProfessionInformation professionInformation) {
		this.professionInformation = professionInformation;
	}
	/**
	 * @return the subject
	 */
	public Subject getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	/**
	 * @return the gradeInformation
	 */
	public GradeInformation getGradeInformation() {
		return gradeInformation;
	}
	/**
	 * @param gradeInformation the gradeInformation to set
	 */
	public void setGradeInformation(GradeInformation gradeInformation) {
		this.gradeInformation = gradeInformation;
	}
	/**
	 * @return the classInformation
	 */
	public ClassInformation getClassInformation() {
		return classInformation;
	}
	/**
	 * @param classInformation the classInformation to set
	 */
	public void setClassInformation(ClassInformation classInformation) {
		this.classInformation = classInformation;
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
	 * @return the course_remark
	 */
	public String getCourse_remark() {
		return course_remark;
	}
	/**
	 * @param courseRemark the course_remark to set
	 */
	public void setCourse_remark(String courseRemark) {
		course_remark = courseRemark;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
