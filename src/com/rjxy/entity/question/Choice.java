package com.rjxy.entity.question;

import java.io.Serializable;

import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.exam.Subject;

public class Choice implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int question_id;
	private String question_body;
	private String answer_A;
	private String answer_B;
	private String answer_C;
	private String answer_D;
	private String question_answer;
	private int difficulty;
	private Subject subject;
	private GradeInformation grade;
	private String add_person;
	private String add_time;
	private float question_score;
	private String question_remark;
	
	public Choice(){
		
	}
	
	/**
	 * @return the question_id
	 */
	public int getQuestion_id() {
		return question_id;
	}
	/**
	 * @param questionId the question_id to set
	 */
	public void setQuestion_id(int questionId) {
		question_id = questionId;
	}
	/**
	 * @return the question_body
	 */
	public String getQuestion_body() {
		return question_body;
	}
	/**
	 * @param questionBody the question_body to set
	 */
	public void setQuestion_body(String questionBody) {
		question_body = questionBody;
	}
	/**
	 * @return the answer_A
	 */
	public String getAnswer_A() {
		return answer_A;
	}
	/**
	 * @param answerA the answer_A to set
	 */
	public void setAnswer_A(String answerA) {
		answer_A = answerA;
	}
	/**
	 * @return the answer_B
	 */
	public String getAnswer_B() {
		return answer_B;
	}
	/**
	 * @param answerB the answer_B to set
	 */
	public void setAnswer_B(String answerB) {
		answer_B = answerB;
	}
	/**
	 * @return the answer_C
	 */
	public String getAnswer_C() {
		return answer_C;
	}
	/**
	 * @param answerC the answer_C to set
	 */
	public void setAnswer_C(String answerC) {
		answer_C = answerC;
	}
	/**
	 * @return the answer_D
	 */
	public String getAnswer_D() {
		return answer_D;
	}
	/**
	 * @param answerD the answer_D to set
	 */
	public void setAnswer_D(String answerD) {
		answer_D = answerD;
	}
	/**
	 * @return the question_answer
	 */
	public String getQuestion_answer() {
		return question_answer;
	}
	/**
	 * @param questionAnswer the question_answer to set
	 */
	public void setQuestion_answer(String questionAnswer) {
		question_answer = questionAnswer;
	}
	/**
	 * @return the difficulty
	 */
	public int getDifficulty() {
		return difficulty;
	}
	/**
	 * @param difficulty the difficulty to set
	 */
	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
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
	 * @return the grade
	 */
	public GradeInformation getGrade() {
		return grade;
	}

	/**
	 * @param grade the grade to set
	 */
	public void setGrade(GradeInformation grade) {
		this.grade = grade;
	}

	/**
	 * @return the add_person
	 */
	public String getAdd_person() {
		return add_person;
	}
	/**
	 * @param addPerson the add_person to set
	 */
	public void setAdd_person(String addPerson) {
		add_person = addPerson;
	}
	/**
	 * @return the add_time
	 */
	public String getAdd_time() {
		return add_time;
	}
	/**
	 * @param addTime the add_time to set
	 */
	public void setAdd_time(String addTime) {
		add_time = addTime;
	}
	/**
	 * @return the question_score
	 */
	public float getQuestion_score() {
		return question_score;
	}
	/**
	 * @param questionScore the question_score to set
	 */
	public void setQuestion_score(float questionScore) {
		question_score = questionScore;
	}
	/**
	 * @return the question_remark
	 */
	public String getQuestion_remark() {
		return question_remark;
	}
	/**
	 * @param questionRemark the question_remark to set
	 */
	public void setQuestion_remark(String questionRemark) {
		question_remark = questionRemark;
	}
	
	
}
