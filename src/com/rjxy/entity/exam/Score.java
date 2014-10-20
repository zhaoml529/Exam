package com.rjxy.entity.exam;

import java.io.Serializable;

import com.rjxy.entity.StudentInformation;

public class Score implements Serializable{
	private static final long serialVersionUID = 1L;
	private int score_id;
	private StudentInformation studentInformation;
	private ExamTask examTask;
	private float choiceScore;
	private float clozeScore;
	private float shortAnswerScore;
	private float comprehensiveScore;
	private float totalScore;
	private int isPass;//0未通过，1通过
	private int judge;//二次判分标志位0-未评分，1-已评分
	public Score(){
		
	}
	
	public int getScore_id() {
		return score_id;
	}

	public void setScore_id(int score_id) {
		this.score_id = score_id;
	}

	public StudentInformation getStudentInformation() {
		return studentInformation;
	}

	public void setStudentInformation(StudentInformation studentInformation) {
		this.studentInformation = studentInformation;
	}

	public ExamTask getExamTask() {
		return examTask;
	}

	public void setExamTask(ExamTask examTask) {
		this.examTask = examTask;
	}

	public float getChoiceScore() {
		return choiceScore;
	}
	public void setChoiceScore(float choiceScore) {
		this.choiceScore = choiceScore;
	}
	public float getClozeScore() {
		return clozeScore;
	}
	public void setClozeScore(float clozeScore) {
		this.clozeScore = clozeScore;
	}
	public float getShortAnswerScore() {
		return shortAnswerScore;
	}
	public void setShortAnswerScore(float shortAnswerScore) {
		this.shortAnswerScore = shortAnswerScore;
	}
	public float getComprehensiveScore() {
		return comprehensiveScore;
	}
	public void setComprehensiveScore(float comprehensiveScore) {
		this.comprehensiveScore = comprehensiveScore;
	}
	public float getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(float totalScore) {
		this.totalScore = totalScore;
	}

	public int getJudge() {
		return judge;
	}

	public void setJudge(int judge) {
		this.judge = judge;
	}

	public int getIsPass() {
		return isPass;
	}

	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
