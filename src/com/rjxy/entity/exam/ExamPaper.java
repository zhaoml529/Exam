package com.rjxy.entity.exam;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;


import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.TeacherInformation;

/*
 * 试卷信息
 */
public class ExamPaper implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String exam_id;			//试卷编号
	private String exam_name;		//试卷名称
	private TeacherInformation teacherInformation;	//创建人FK
	private Subject subject;				//科目编号fk
	private GradeInformation gradeInformation;		//所属年级 FK
	private float passScore;			//通过分数
	private String exam_date;		//创建时间
	private int exam_way;			//组卷方式
	private String exam_remark;		//试卷说明
	private Set<ExamTask> examTask_id = new HashSet<ExamTask>();
	private Set<ManualExtract> manual_id = new HashSet<ManualExtract>();
	private Set<AutomaticExtract> auto_id = new HashSet<AutomaticExtract>();
	public ExamPaper() {

	}

	/**
	 * @return the exam_id
	 */
	public String getExam_id() {
		return exam_id;
	}

	/**
	 * @param examId the exam_id to set
	 */
	public void setExam_id(String examId) {
		exam_id = examId;
	}

	/**
	 * @return the exam_name
	 */
	public String getExam_name() {
		return exam_name;
	}

	/**
	 * @param examName the exam_name to set
	 */
	public void setExam_name(String examName) {
		exam_name = examName;
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
	 * @return the exam_date
	 */
	public String getExam_date() {
		return exam_date;
	}

	/**
	 * @param examDate the exam_date to set
	 */
	public void setExam_date(String examDate) {
		exam_date = examDate;
	}

	/**
	 * @return the exam_way
	 */
	public int getExam_way() {
		return exam_way;
	}

	/**
	 * @param examWay the exam_way to set
	 */
	public void setExam_way(int examWay) {
		exam_way = examWay;
	}

	/**
	 * @return the exam_remark
	 */
	public String getExam_remark() {
		return exam_remark;
	}

	/**
	 * @param examRemark the exam_remark to set
	 */
	public void setExam_remark(String examRemark) {
		exam_remark = examRemark;
	}

	/**
	 * @return the manual_id
	 */
	@JsonIgnore
	public Set<ManualExtract> getManual_id() {
		return manual_id;
	}

	/**
	 * @param manualId the manual_id to set
	 */
	public void setManual_id(Set<ManualExtract> manualId) {
		manual_id = manualId;
	}

	/**
	 * @return the auto_id
	 */
	@JsonIgnore
	public Set<AutomaticExtract> getAuto_id() {
		return auto_id;
	}

	/**
	 * @param autoId the auto_id to set
	 */
	public void setAuto_id(Set<AutomaticExtract> autoId) {
		auto_id = autoId;
	}



	public float getPassScore() {
		return passScore;
	}

	public void setPassScore(float passScore) {
		this.passScore = passScore;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
