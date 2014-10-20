package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;

/*
 * 年级表
 */
public class GradeInformation implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int grade_id;	//年级编号
	private String grade_name;  //年级名称
	private String grade_remark;//年级说明
	private Set<StudentInformation> stu_id = new HashSet<StudentInformation>();
	private Set<Course> course_id = new HashSet<Course>();
	private Set<ExamPaper> exam_id = new HashSet<ExamPaper>();
	private Set<Choice> choice_id = new HashSet<Choice>();
	private Set<Cloze> cloze_id = new HashSet<Cloze>();
	private Set<ShortAnswer> short_id = new HashSet<ShortAnswer>();
	private Set<Comprehensive> compre_id = new HashSet<Comprehensive>();
	private Set<ClassInformation> class_id = new HashSet<ClassInformation>();
	public GradeInformation() {

	}
	public int getGrade_id() {
		return grade_id;
	}
	public void setGrade_id(int gradeId) {
		grade_id = gradeId;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String gradeName) {
		grade_name = gradeName;
	}
	public String getGrade_remark() {
		return grade_remark;
	}
	public void setGrade_remark(String gradeRemark) {
		grade_remark = gradeRemark;
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
	 * @return the choice_id
	 */
	@JsonIgnore
	public Set<Choice> getChoice_id() {
		return choice_id;
	}
	/**
	 * @param choiceId the choice_id to set
	 */
	public void setChoice_id(Set<Choice> choiceId) {
		choice_id = choiceId;
	}
	/**
	 * @return the cloze_id
	 */
	@JsonIgnore
	public Set<Cloze> getCloze_id() {
		return cloze_id;
	}
	/**
	 * @param clozeId the cloze_id to set
	 */
	public void setCloze_id(Set<Cloze> clozeId) {
		cloze_id = clozeId;
	}
	/**
	 * @return the short_id
	 */
	@JsonIgnore
	public Set<ShortAnswer> getShort_id() {
		return short_id;
	}
	/**
	 * @param shortId the short_id to set
	 */
	public void setShort_id(Set<ShortAnswer> shortId) {
		short_id = shortId;
	}
	/**
	 * @return the compre_id
	 */
	@JsonIgnore
	public Set<Comprehensive> getCompre_id() {
		return compre_id;
	}
	/**
	 * @param compreId the compre_id to set
	 */
	public void setCompre_id(Set<Comprehensive> compreId) {
		compre_id = compreId;
	}
	@JsonIgnore
	public Set<ClassInformation> getClass_id() {
		return class_id;
	}
	public void setClass_id(Set<ClassInformation> class_id) {
		this.class_id = class_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
