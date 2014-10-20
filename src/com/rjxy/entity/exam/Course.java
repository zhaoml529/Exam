package com.rjxy.entity.exam;

import java.io.Serializable;

import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.TeacherInformation;

/*
 * �γ���Ϣ
 */
public class Course implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int course_id;	//�γ̱��
	private DepartmentInformation departmentInformation;	//�������FK
	private ProfessionInformation professionInformation;	//ѧ��רҵ���FK
	private Subject	subject;	//��Ŀ���FK
	private GradeInformation gradeInformation;		//�꼶���
	private ClassInformation classInformation;		//���
	private TeacherInformation teacherInformation;	//��ʦ���
	private String course_remark;		//�γ�˵��
	
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
