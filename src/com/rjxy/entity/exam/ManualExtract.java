package com.rjxy.entity.exam;

import java.io.Serializable;


/*
 * 手动抽取试题
 */
public class ManualExtract implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int manual_id;			//手动组卷编号
	private ExamPaper examPaper;	//试卷编号
	private QuestionType questionType;  //试题类型
	private String question_id;			//所选试题题号 用-隔开
	private int question_num;			//试题个数
	private float question_score;		//所选试题总分
	
	public ManualExtract(){
		
	}
	
	/**
	 * @return the manual_id
	 */
	public int getManual_id() {
		return manual_id;
	}
	/**
	 * @param manualId the manual_id to set
	 */
	public void setManual_id(int manualId) {
		manual_id = manualId;
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
	 * @return the question_id
	 */
	public String getQuestion_id() {
		return question_id;
	}
	/**
	 * @param questionId the question_id to set
	 */
	public void setQuestion_id(String questionId) {
		question_id = questionId;
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
	
	
}
