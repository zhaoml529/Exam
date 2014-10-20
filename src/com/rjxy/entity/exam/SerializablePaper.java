package com.rjxy.entity.exam;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;

public class SerializablePaper implements Serializable{
	/**
	 * ���л��Ծ�
	 */
	private static final long serialVersionUID = 1L;
	private String stu_id;			
	private String stu_name;
	private String grade_name;	//�꼶
	private String stu_class;
	private String ipAddress;
	private String paper_id;
	private String task_id;
	private double totScore;		//�Ծ�÷�
	private double paperScore;  	//�Ծ��ܷ�
	private float passScore;			//ͨ������
	private String paper_start;		//��ʼʱ��
	private String paper_end;		//����ʱ��
	private String chackteacher;	//�࿼��ʦ
	private long paper_leftTime=0;	//����ʣ��ʱ��
	private String paper_name;		//�Ծ�����
	private String paper_subject;	//�Ծ��Ŀ
	private String address;
	private int examNature;		//��������
	private List<Integer> quedtionType;//�Ծ��ж�����Щ����
	private String commitDate;		//�ύʱ��
	//����
	private List<Choice> choiceList;
	private List<Cloze> clozeList;
	private List<ShortAnswer> shortAnswerList;
	private List<Comprehensive> comprehensiveList;
	//ѧ������д��ÿ�����͵Ĵ�
	private String[] stuChoice;
	private String[] stuCloze;
	private String[] stuShortAnswer;
	private String[] StuComprehensive;
	//ѧ��ÿ�����͵ĵ÷�
	private float choiceScore;
	private float clozeScore;
	private float shortAnswerScore;
	private float comprehensiveScore;
	//ѧ���������Ŀ���(ѡ�����)
	private int[] wrongChoice;//��ȷ��1������ʱ0
	private int[] wrongCloze;
	//ѧ��������ۺ���ÿ����ķ���
	private float[] eachShortAnswer;
	private float[] eachComprehensive;
	
	public SerializablePaper(){
		quedtionType = new ArrayList<Integer>();
		choiceList = new ArrayList<Choice>();
		clozeList = new ArrayList<Cloze>();
		shortAnswerList = new ArrayList<ShortAnswer>();
		comprehensiveList = new ArrayList<Comprehensive>();
		
		stuChoice = new String[100];		//��ʼ����������ֻ����100��ѡ����
		stuCloze = new String[100];
		stuShortAnswer = new String[50];
		StuComprehensive = new String[50];
		
		wrongChoice=new int[100];
		wrongCloze=new int[100];
		
		eachShortAnswer=new float[50];
		eachComprehensive=new float[50];
		
		this.choiceScore = 0;
		this.clozeScore = 0;
		this.shortAnswerScore = 0;
		this.comprehensiveScore = 0;
	}

	/**
	 * @return the stu_id
	 */
	public String getStu_id() {
		return stu_id;
	}

	/**
	 * @param stuId the stu_id to set
	 */
	public void setStu_id(String stuId) {
		stu_id = stuId;
	}

	/**
	 * @return the stu_name
	 */
	public String getStu_name() {
		return stu_name;
	}

	/**
	 * @param stuName the stu_name to set
	 */
	public void setStu_name(String stuName) {
		stu_name = stuName;
	}

	/**
	 * @return the stu_class
	 */
	public String getStu_class() {
		return stu_class;
	}

	/**
	 * @param stuClass the stu_class to set
	 */
	public void setStu_class(String stuClass) {
		stu_class = stuClass;
	}

	/**
	 * @return the ipAddress
	 */
	public String getIpAddress() {
		return ipAddress;
	}

	/**
	 * @param ipAddress the ipAddress to set
	 */
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	/**
	 * @return the paper_id
	 */
	public String getPaper_id() {
		return paper_id;
	}

	/**
	 * @param paperId the paper_id to set
	 */
	public void setPaper_id(String paperId) {
		paper_id = paperId;
	}

	/**
	 * @return the totScore
	 */
	public double getTotScore() {
		return totScore;
	}

	/**
	 * @param totScore the totScore to set
	 */
	public void setTotScore(double totScore) {
		this.totScore = totScore;
	}

	/**
	 * @return the paperScore
	 */
	public double getPaperScore() {
		return paperScore;
	}

	/**
	 * @param paperScore the paperScore to set
	 */
	public void setPaperScore(double paperScore) {
		this.paperScore = paperScore;
	}


	/**
	 * @return the paper_name
	 */
	public String getPaper_name() {
		return paper_name;
	}

	/**
	 * @param paperName the paper_name to set
	 */
	public void setPaper_name(String paperName) {
		paper_name = paperName;
	}

	/**
	 * @return the paper_subject
	 */
	public String getPaper_subject() {
		return paper_subject;
	}

	/**
	 * @param paperSubject the paper_subject to set
	 */
	public void setPaper_subject(String paperSubject) {
		paper_subject = paperSubject;
	}

	/**
	 * @return the examNature
	 */
	public int getExamNature() {
		return examNature;
	}

	/**
	 * @param examNature the examNature to set
	 */
	public void setExamNature(int examNature) {
		this.examNature = examNature;
	}

	/**
	 * @return the quedtionType
	 */
	public List<Integer> getQuedtionType() {
		return quedtionType;
	}

	/**
	 * @param quedtionType the quedtionType to set
	 */
	public void setQuedtionType(List<Integer> quedtionType) {
		this.quedtionType = quedtionType;
	}

	/**
	 * @return the commitDate
	 */
	public String getCommitDate() {
		return commitDate;
	}

	/**
	 * @param commitDate the commitDate to set
	 */
	public void setCommitDate(String commitDate) {
		this.commitDate = commitDate;
	}

	/**
	 * @return the choiceList
	 */
	public List<Choice> getChoiceList() {
		return choiceList;
	}

	/**
	 * @param choiceList the choiceList to set
	 */
	public void setChoiceList(List<Choice> choiceList) {
		this.choiceList = choiceList;
	}

	/**
	 * @return the clozeList
	 */
	public List<Cloze> getClozeList() {
		return clozeList;
	}

	/**
	 * @param clozeList the clozeList to set
	 */
	public void setClozeList(List<Cloze> clozeList) {
		this.clozeList = clozeList;
	}

	/**
	 * @return the shortAnswerList
	 */
	public List<ShortAnswer> getShortAnswerList() {
		return shortAnswerList;
	}

	/**
	 * @param shortAnswerList the shortAnswerList to set
	 */
	public void setShortAnswerList(List<ShortAnswer> shortAnswerList) {
		this.shortAnswerList = shortAnswerList;
	}

	/**
	 * @return the comprehensiveList
	 */
	public List<Comprehensive> getComprehensiveList() {
		return comprehensiveList;
	}

	/**
	 * @param comprehensiveList the comprehensiveList to set
	 */
	public void setComprehensiveList(List<Comprehensive> comprehensiveList) {
		this.comprehensiveList = comprehensiveList;
	}

	/**
	 * @return the stuChoice
	 */
	public String[] getStuChoice() {
		return stuChoice;
	}

	/**
	 * @param stuChoice the stuChoice to set
	 */
	public void setStuChoice(String[] stuChoice) {
		this.stuChoice = stuChoice;
	}

	/**
	 * @return the stuCloze
	 */
	public String[] getStuCloze() {
		return stuCloze;
	}

	/**
	 * @param stuCloze the stuCloze to set
	 */
	public void setStuCloze(String[] stuCloze) {
		this.stuCloze = stuCloze;
	}

	/**
	 * @return the stuShortAnswer
	 */
	public String[] getStuShortAnswer() {
		return stuShortAnswer;
	}

	/**
	 * @param stuShortAnswer the stuShortAnswer to set
	 */
	public void setStuShortAnswer(String[] stuShortAnswer) {
		this.stuShortAnswer = stuShortAnswer;
	}

	/**
	 * @return the stuComprehensive
	 */
	public String[] getStuComprehensive() {
		return StuComprehensive;
	}

	/**
	 * @param stuComprehensive the stuComprehensive to set
	 */
	public void setStuComprehensive(String[] stuComprehensive) {
		StuComprehensive = stuComprehensive;
	}

	/**
	 * @return the choiceScore
	 */
	public float getChoiceScore() {
		return choiceScore;
	}

	/**
	 * @param choiceScore the choiceScore to set
	 */
	public void setChoiceScore(float choiceScore) {
		this.choiceScore = choiceScore;
	}

	/**
	 * @return the clozeScore
	 */
	public float getClozeScore() {
		return clozeScore;
	}

	/**
	 * @param clozeScore the clozeScore to set
	 */
	public void setClozeScore(float clozeScore) {
		this.clozeScore = clozeScore;
	}

	/**
	 * @return the shortAnswerScore
	 */
	public float getShortAnswerScore() {
		return shortAnswerScore;
	}

	/**
	 * @param shortAnswerScore the shortAnswerScore to set
	 */
	public void setShortAnswerScore(float shortAnswerScore) {
		this.shortAnswerScore = shortAnswerScore;
	}

	/**
	 * @return the comprehensiveScore
	 */
	public float getComprehensiveScore() {
		return comprehensiveScore;
	}

	/**
	 * @param comprehensiveScore the comprehensiveScore to set
	 */
	public void setComprehensiveScore(float comprehensiveScore) {
		this.comprehensiveScore = comprehensiveScore;
	}

	/**
	 * @return the wrongChoice
	 */
	public int[] getWrongChoice() {
		return wrongChoice;
	}

	/**
	 * @param wrongChoice the wrongChoice to set
	 */
	public void setWrongChoice(int[] wrongChoice) {
		this.wrongChoice = wrongChoice;
	}

	/**
	 * @return the wrongCloze
	 */
	public int[] getWrongCloze() {
		return wrongCloze;
	}

	/**
	 * @param wrongCloze the wrongCloze to set
	 */
	public void setWrongCloze(int[] wrongCloze) {
		this.wrongCloze = wrongCloze;
	}

	public long getPaper_leftTime() {
		return paper_leftTime;
	}

	public void setPaper_leftTime(long paper_leftTime) {
		this.paper_leftTime = paper_leftTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	public String getPaper_start() {
		return paper_start;
	}

	public void setPaper_start(String paper_start) {
		this.paper_start = paper_start;
	}

	public String getPaper_end() {
		return paper_end;
	}

	public void setPaper_end(String paper_end) {
		this.paper_end = paper_end;
	}

	public String getChackteacher() {
		return chackteacher;
	}

	public void setChackteacher(String chackteacher) {
		this.chackteacher = chackteacher;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	public float[] getEachShortAnswer() {
		return eachShortAnswer;
	}

	public void setEachShortAnswer(float[] eachShortAnswer) {
		this.eachShortAnswer = eachShortAnswer;
	}

	public float[] getEachComprehensive() {
		return eachComprehensive;
	}

	public void setEachComprehensive(float[] eachComprehensive) {
		this.eachComprehensive = eachComprehensive;
	}

	public float getPassScore() {
		return passScore;
	}

	public void setPassScore(float passScore) {
		this.passScore = passScore;
	}


	
}
