package com.rjxy.entity.exam;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

public class QuestionType implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int type_id;
	private String type_name;
	private String type_remark;
	private Set<ManualExtract> manual_id = new HashSet<ManualExtract>();
	private Set<AutomaticExtract> auto_id = new HashSet<AutomaticExtract>();
	
	public QuestionType(){
		
	}
	
	/**
	 * @return the type_id
	 */
	public int getType_id() {
		return type_id;
	}
	/**
	 * @param typeId the type_id to set
	 */
	public void setType_id(int typeId) {
		type_id = typeId;
	}
	/**
	 * @return the type_name
	 */
	public String getType_name() {
		return type_name;
	}
	/**
	 * @param typeName the type_name to set
	 */
	public void setType_name(String typeName) {
		type_name = typeName;
	}
	/**
	 * @return the type_remark
	 */
	public String getType_remark() {
		return type_remark;
	}
	/**
	 * @param typeRemark the type_remark to set
	 */
	public void setType_remark(String typeRemark) {
		type_remark = typeRemark;
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
	
	
}
