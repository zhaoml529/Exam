package com.rjxy.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

/*
 * 年龄编号 PeopleAge
 */
public class PeopleAge implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int age_id;		//年龄编号
	private String age_range;	//年龄范围
	private String age_remark;	//年龄说明
	private Set<TeacherInformation> tea_id = new HashSet<TeacherInformation>();
	public PeopleAge() {
		
	}
	public int getAge_id() {
		return age_id;
	}
	public void setAge_id(int ageId) {
		age_id = ageId;
	}
	public String getAge_range() {
		return age_range;
	}
	public void setAge_range(String ageRange) {
		age_range = ageRange;
	}
	public String getAge_remark() {
		return age_remark;
	}
	public void setAge_remark(String ageRemark) {
		age_remark = ageRemark;
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
