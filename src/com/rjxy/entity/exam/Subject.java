package com.rjxy.entity.exam;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;

/*
 * 考试科目 java基础  oralce mysql
 */
public class Subject implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int subject_id;	//科目编号
	private ProfessionInformation professionInformation; //学科专业
	private String subject_name;	//科目名称
	private String subject_remark;	//科目说明
	private Set<ExamPaper> exam_id = new HashSet<ExamPaper>();
	private Set<ExamTask> examTask_id = new HashSet<ExamTask>();
	private Set<Course> course_id = new HashSet<Course>();
	private Set<Choice> choice_id = new HashSet<Choice>();
	private Set<Cloze> cloze_id = new HashSet<Cloze>();
	private Set<ShortAnswer> short_id = new HashSet<ShortAnswer>();
	private Set<Comprehensive> compre_id = new HashSet<Comprehensive>();
	
	public Subject() {

	}
	/**
	 * @return the subject_id
	 */
	public int getSubject_id() {
		return subject_id;
	}
	/**
	 * @param subjectId the subject_id to set
	 */
	public void setSubject_id(int subjectId) {
		subject_id = subjectId;
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
	 * @return the subject_name
	 */
	public String getSubject_name() {
		return subject_name;
	}
	/**
	 * @param subjectName the subject_name to set
	 */
	public void setSubject_name(String subjectName) {
		subject_name = subjectName;
	}
	/**
	 * @return the subject_remark
	 */
	public String getSubject_remark() {
		return subject_remark;
	}
	/**
	 * @param subjectRemark the subject_remark to set
	 */
	public void setSubject_remark(String subjectRemark) {
		subject_remark = subjectRemark;
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
	
}
