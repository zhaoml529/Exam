package com.rjxy.entity.exam;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

/*
 * 考试性质表
 */
public class ExamNature implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int nature_id;	//性质编号
	private String nature_name;	//性质名称
	private String nature_remark;//性质说明
	private Set<ExamTask> examTask_id = new HashSet<ExamTask>();
	public ExamNature() {

	}
	/**
	 * @return the nature_id
	 */
	public int getNature_id() {
		return nature_id;
	}
	/**
	 * @param natureId the nature_id to set
	 */
	public void setNature_id(int natureId) {
		nature_id = natureId;
	}
	/**
	 * @return the nature_name
	 */
	public String getNature_name() {
		return nature_name;
	}
	/**
	 * @param natureName the nature_name to set
	 */
	public void setNature_name(String natureName) {
		nature_name = natureName;
	}
	/**
	 * @return the nature_remark
	 */
	public String getNature_remark() {
		return nature_remark;
	}
	/**
	 * @param natureRemark the nature_remark to set
	 */
	public void setNature_remark(String natureRemark) {
		nature_remark = natureRemark;
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
	
}
