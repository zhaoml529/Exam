package com.rjxy.entity.exam;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.TeacherInformation;

/*
 * 考试任务表
 */
/**
 * @author Administrator
 *
 */
public class ExamTask implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String examTask_id;	//任务编号
	private ExamPaper examPaper;	//试卷编号FK
	private Subject subject;		//科目编号FK
	private String class_id;	//班级编号
	private ExamNature examNature;	//考试性质编号FK
	private TeacherInformation teacherInformation;//教师编号
	private String examTask_start;	//考试时间
	private	String examTask_end;	//结束时间
	private String examTask_leftTime;//考试剩余时间 - 表中不用
	private String examTask_address;//考试地点
	private String examTask_teacher;//监考老师
	private String examTask_remark;	//考试说明
	private String examTask_status;	//考试状态	PENDING-等待 RUNNING-开始 ENDED-结束
	private Set<Score> score_id = new HashSet<Score>(); 
	public ExamTask() {

	}
	@JsonIgnore
	public Set<Score> getScore_id() {
		return score_id;
	}

	public void setScore_id(Set<Score> score_id) {
		this.score_id = score_id;
	}

	public String getExamTask_id() {
		return examTask_id;
	}

	public void setExamTask_id(String examTask_id) {
		this.examTask_id = examTask_id;
	}

	public ExamPaper getExamPaper() {
		return examPaper;
	}

	public void setExamPaper(ExamPaper examPaper) {
		this.examPaper = examPaper;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}


	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public ExamNature getExamNature() {
		return examNature;
	}

	public void setExamNature(ExamNature examNature) {
		this.examNature = examNature;
	}

	public TeacherInformation getTeacherInformation() {
		return teacherInformation;
	}

	public void setTeacherInformation(TeacherInformation teacherInformation) {
		this.teacherInformation = teacherInformation;
	}

	public String getExamTask_start() {
		return examTask_start;
	}

	public void setExamTask_start(String examTask_start) {
		this.examTask_start = examTask_start;
	}

	public String getExamTask_end() {
		return examTask_end;
	}

	public void setExamTask_end(String examTask_end) {
		this.examTask_end = examTask_end;
	}

	public String getExamTask_address() {
		return examTask_address;
	}

	public void setExamTask_address(String examTask_address) {
		this.examTask_address = examTask_address;
	}

	public String getExamTask_teacher() {
		return examTask_teacher;
	}

	public void setExamTask_teacher(String examTask_teacher) {
		this.examTask_teacher = examTask_teacher;
	}

	public String getExamTask_remark() {
		return examTask_remark;
	}

	public void setExamTask_remark(String examTask_remark) {
		this.examTask_remark = examTask_remark;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getExamTask_status() {
		return examTask_status;
	}

	public void setExamTask_status(String examTask_status) {
		this.examTask_status = examTask_status;
	}

	public String getExamTask_leftTime() {
		return examTask_leftTime;
	}

	public void setExamTask_leftTime(String examTask_leftTime) {
		this.examTask_leftTime = examTask_leftTime;
	}
	
}
