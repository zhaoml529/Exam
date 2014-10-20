package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;


/*
 * 学历编号  EduBackGround
 */
public class EduBackGround implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int eduBackGround_id;	//学历编号
	private String eduBackGround_name;	//学历名称
	private String eduBackGround_remark;//学历说明
	private Set<TeacherInformation> tea_id = new HashSet<TeacherInformation>();
	public EduBackGround() {
		
	}
	public int getEduBackGround_id() {
		return eduBackGround_id;
	}
	public void setEduBackGround_id(int eduBackGround_id) {
		this.eduBackGround_id = eduBackGround_id;
	}
	public String getEduBackGround_name() {
		return eduBackGround_name;
	}
	public void setEduBackGround_name(String eduBackGround_name) {
		this.eduBackGround_name = eduBackGround_name;
	}
	public String getEduBackGround_remark() {
		return eduBackGround_remark;
	}
	public void setEduBackGround_remark(String eduBackGroundRemark) {
		eduBackGround_remark = eduBackGroundRemark;
	}
	/**
	 * @return the tea_id
	 */
	@JsonIgnore
	public Set<TeacherInformation> getTea_id() {
		return tea_id;
	}
	/**
	 * @param teaId the tea_id to set
	 */
	public void setTea_id(Set<TeacherInformation> teaId) {
		tea_id = teaId;
	}
	
}
