package com.rjxy.entity.exam;

import java.io.Serializable;

/*
 * 自动抽取试题
 */
public class AutomaticExtract implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int auto_id;
	private ExamPaper examPaper;	//试卷编号
	private QuestionType questionType;	//试题类型
	private int difficulty;			//难度
	private int question_num;		//数量
	private String auto_remark;		//说明
	
	public AutomaticExtract(){
		
	}
	
	/**
	 * @return the auto_id
	 */
	public int getAuto_id() {
		return auto_id;
	}
	/**
	 * @param autoId the auto_id to set
	 */
	public void setAuto_id(int autoId) {
		auto_id = autoId;
	}
	/**
	 * @return the examPaper
	 */
	public ExamPaper getExamPaper() {
		return examPaper;
	}
	/**
	 * @param examPaper the examPaper to set
	 */
	public void setExamPaper(ExamPaper examPaper) {
		this.examPaper = examPaper;
	}
	/**
	 * @return the questionType
	 */
	public QuestionType getQuestionType() {
		return questionType;
	}
	/**
	 * @param questionType the questionType to set
	 */
	public void setQuestionType(QuestionType questionType) {
		this.questionType = questionType;
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
	 * @return the question_num
	 */
	public int getQuestion_num() {
		return question_num;
	}
	/**
	 * @param questionNum the question_num to set
	 */
	public void setQuestion_num(int questionNum) {
		question_num = questionNum;
	}

	/**
	 * @return the auto_remark
	 */
	public String getAuto_remark() {
		return auto_remark;
	}

	/**
	 * @param autoRemark the auto_remark to set
	 */
	public void setAuto_remark(String autoRemark) {
		auto_remark = autoRemark;
	}

	
}
