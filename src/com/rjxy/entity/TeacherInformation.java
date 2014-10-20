package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.role.TeaRole;

/*
 * 教师信息
 */

public class TeacherInformation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String tea_id;				//教师编号
	private String tea_password;			//教师密码
	private String tea_name;			//教师名字
	private String tea_sex;				//教师性别
	private EduBackGround eduBackGround;//教师学历
	private PeopleAge peopleAge;		//教师年龄
	private DepartmentInformation departmentInformation;//教师所属机构
	private String tea_tel;				//联系方式
	private String tea_remark;			//教师说明
	private Set<ExamPaper> exam_id = new HashSet<ExamPaper>();
	private Set<ExamTask> examTask_id = new HashSet<ExamTask>();
	private Set<Course> course_id = new HashSet<Course>();
	private Set<TeaRole> teaRole_id = new HashSet<TeaRole>();
	
	public TeacherInformation(){
		
	}

	/**
	 * @return the tea_id
	 */
	public String getTea_id() {
		return tea_id;
	}

	/**
	 * @param teaId the tea_id to set
	 */
	public void setTea_id(String teaId) {
		tea_id = teaId;
	}

	/**
	 * @return the tea_password
	 */
	public String getTea_password() {
		return tea_password;
	}

	/**
	 * @param teaPassword the tea_password to set
	 */
	public void setTea_password(String teaPassword) {
		tea_password = teaPassword;
	}

	/**
	 * @return the tea_name
	 */
	public String getTea_name() {
		return tea_name;
	}

	/**
	 * @param teaName the tea_name to set
	 */
	public void setTea_name(String teaName) {
		tea_name = teaName;
	}

	/**
	 * @return the tea_sex
	 */
	public String getTea_sex() {
		return tea_sex;
	}

	/**
	 * @param teaSex the tea_sex to set
	 */
	public void setTea_sex(String teaSex) {
		tea_sex = teaSex;
	}

	/**
	 * @return the eduBackGround
	 */
	public EduBackGround getEduBackGround() {
		return eduBackGround;
	}

	/**
	 * @param eduBackGround the eduBackGround to set
	 */
	public void setEduBackGround(EduBackGround eduBackGround) {
		this.eduBackGround = eduBackGround;
	}

	/**
	 * @return the peopleAge
	 */
	public PeopleAge getPeopleAge() {
		return peopleAge;
	}

	/**
	 * @param peopleAge the peopleAge to set
	 */
	public void setPeopleAge(PeopleAge peopleAge) {
		this.peopleAge = peopleAge;
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
	 * @return the tea_tel
	 */
	public String getTea_tel() {
		return tea_tel;
	}

	/**
	 * @param teaTel the tea_tel to set
	 */
	public void setTea_tel(String teaTel) {
		tea_tel = teaTel;
	}

	/**
	 * @return the tea_remark
	 */
	public String getTea_remark() {
		return tea_remark;
	}

	/**
	 * @param teaRemark the tea_remark to set
	 */
	public void setTea_remark(String teaRemark) {
		tea_remark = teaRemark;
	}

	/**
	 * @return the exam_id
	 */
	@JsonIgnore
	public Set<ExamPaper> getExam_id() {
		return exam_id;
	}

	/**
	 * @param examId the exam_id to set
	 */
	public void setExam_id(Set<ExamPaper> examId) {
		exam_id = examId;
	}

	/**
	 * @return the examTask_id
	 */
	@JsonIgnore
	public Set<ExamTask> getExamTask_id() {
		return examTask_id;
	}

	/**
	 * @param examTaskId the examTask_id to set
	 */
	public void setExamTask_id(Set<ExamTask> examTaskId) {
		examTask_id = examTaskId;
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
	 * @return the teaRole_id
	 */
	@JsonIgnore
	public Set<TeaRole> getTeaRole_id() {
		return teaRole_id;
	}

	/**
	 * @param teaRoleId the teaRole_id to set
	 */
	public void setTeaRole_id(Set<TeaRole> teaRoleId) {
		teaRole_id = teaRoleId;
	}

	
}
