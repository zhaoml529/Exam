package com.rjxy.entity;

/*
 * ѧ����Ϣ��
 */

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.rjxy.entity.exam.Score;
import com.rjxy.entity.role.Role;

public class StudentInformation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String stu_id;			//ѧ�����
	private String stu_password;	//ѧ������
	private String stu_name;		//ѧ������
	private int stu_sex;			//ѧ���Ա�
	private String stu_birthday;	//��������
	private String stu_address;		//��ͥסַ
	private String stu_polity;		//������ò
	private ClassInformation classInformation;	//�����༶ FK
	private GradeInformation gradeInformation;	//�����꼶 FK
	private ProfessionInformation professionInformation;//����רҵ FK 
	private DepartmentInformation departmentInformation;//�������� FK
	private Role role;				//������ɫ FK
	private String stu_remark;		//ѧ��˵��
	private Set<Score> score_id = new HashSet<Score>(); 
	
	public StudentInformation(){
		
	}
	@JsonIgnore
	public Set<Score> getScore_id() {
		return score_id;
	}
	public void setScore_id(Set<Score> score_id) {
		this.score_id = score_id;
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
	 * @return the stu_password
	 */
	public String getStu_password() {
		return stu_password;
	}

	/**
	 * @param stuPassword the stu_password to set
	 */
	public void setStu_password(String stuPassword) {
		stu_password = stuPassword;
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
	 * @return the stu_sex
	 */
	public int getStu_sex() {
		return stu_sex;
	}

	/**
	 * @param stuSex the stu_sex to set
	 */
	public void setStu_sex(int stuSex) {
		stu_sex = stuSex;
	}

	/**
	 * @return the stu_birthday
	 */
	public String getStu_birthday() {
		return stu_birthday;
	}

	/**
	 * @param stuBirthday the stu_birthday to set
	 */
	public void setStu_birthday(String stuBirthday) {
		stu_birthday = stuBirthday;
	}

	/**
	 * @return the stu_address
	 */
	public String getStu_address() {
		return stu_address;
	}

	/**
	 * @param stuAddress the stu_address to set
	 */
	public void setStu_address(String stuAddress) {
		stu_address = stuAddress;
	}

	/**
	 * @return the stu_polity
	 */
	public String getStu_polity() {
		return stu_polity;
	}

	/**
	 * @param stuPolity the stu_polity to set
	 */
	public void setStu_polity(String stuPolity) {
		stu_polity = stuPolity;
	}

	/**
	 * @return the classInformation
	 */
	public ClassInformation getClassInformation() {
		return classInformation;
	}

	/**
	 * @param classInformation the classInformation to set
	 */
	public void setClassInformation(ClassInformation classInformation) {
		this.classInformation = classInformation;
	}

	/**
	 * @return the gradeInformation
	 */
	public GradeInformation getGradeInformation() {
		return gradeInformation;
	}

	/**
	 * @param gradeInformation the gradeInformation to set
	 */
	public void setGradeInformation(GradeInformation gradeInformation) {
		this.gradeInformation = gradeInformation;
	}

	/**
	 * @return the professionInformation
	 */
	public ProfessionInformation getProfessionInformation() {
		return professionInformation;
	}

	/**
	 * @param professionInformation the professionInformation to set
	 */
	public void setProfessionInformation(ProfessionInformation professionInformation) {
		this.professionInformation = professionInformation;
	}

	/**
	 * @return the departmentInformation
	 */
	public DepartmentInformation getDepartmentInformation() {
		return departmentInformation;
	}

	/**
	 * @param departmentInformation the departmentInformation to set
	 */
	public void setDepartmentInformation(DepartmentInformation departmentInformation) {
		this.departmentInformation = departmentInformation;
	}

	/**
	 * @return the role
	 */
	public Role getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(Role role) {
		this.role = role;
	}

	/**
	 * @return the stu_remark
	 */
	public String getStu_remark() {
		return stu_remark;
	}

	/**
	 * @param stuRemark the stu_remark to set
	 */
	public void setStu_remark(String stuRemark) {
		stu_remark = stuRemark;
	}
	
}
