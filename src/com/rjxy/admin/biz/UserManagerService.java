package com.rjxy.admin.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.EduBackGround;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.PeopleAge;

import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;
@Service
public class UserManagerService extends BaseService {	
	@Autowired
	private PageDaoImpl pageDao;
	@Transactional
	public void initTeacherPageBean(int pageNum,String department_id) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.TeacherInformation",new String[]{"departmentInformation"}, new String[]{department_id});
	}
	public PageBean getTeacherPageList() {
        return pageDao.getPage();
    }
	public void initStudentPageBean(int pageNum,String department_id, String profession_id) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.StudentInformation",new String[]{"departmentInformation","professionInformation"}, new String[]{department_id,profession_id});
	}
	public PageBean getStudentPageList() {
        return pageDao.getPage();
    }
	public void initAgePageBean(int pageNum) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.PeopleAge",new String[]{}, new String[]{});
	}
	public PageBean getAgePageList() {
        return pageDao.getPage();
    }
	public void initEductionBean(int pageNum) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.EduBackGround",new String[]{}, new String[]{});
	}
	
	public List<ProfessionInformation> getProfessionById(String dept_id){
		List<ProfessionInformation> list = findByWhere("com.rjxy.entity.ProfessionInformation", new String[]{"departmentInformation"}, new String[]{dept_id});
		return list;
	}
	public List<ClassInformation> getClassById(String grade_id){
		List<ClassInformation> list = findByWhere("com.rjxy.entity.ClassInformation", new String[]{"gradeInforMation"}, new String[]{grade_id});
		return list;
	}
	public PageBean getEductionList() {
        return pageDao.getPage();
    }
	public void saveEduction(EduBackGround edubackground){
		save(edubackground);
	}
	public void updateEduction(EduBackGround edubackground){
		update(edubackground);
	}
	public EduBackGround updateEductionById(int eduBackGround_id){
		EduBackGround edubackground = (EduBackGround)getBean(EduBackGround.class, eduBackGround_id);
		return edubackground;
    }
	public void deleteEduction(EduBackGround edubackground){
		delete(edubackground);
	}
	public void updateAge(PeopleAge peopleage){
		update(peopleage);
	}
	public void deleteAge(PeopleAge peopleage){
		delete(peopleage);
	}
	public void saveAge(PeopleAge peopleage){
		save(peopleage);
	}
	public PeopleAge updateAgeById(int age_id){
		PeopleAge peopleage = (PeopleAge)getBean(PeopleAge.class, age_id);
		return peopleage;
    }
	public TeacherInformation getTeacherInfoById(String tea_id){
		TeacherInformation teacherinformation = (TeacherInformation)getBean(TeacherInformation.class, tea_id);
		return teacherinformation;
    }
	public StudentInformation getStudentInfoById(String stu_id){
		StudentInformation studentinformation = (StudentInformation)getBean(StudentInformation.class, stu_id);
		return studentinformation;
    }
	public void updateTeacherInfo(TeacherInformation teacherinformation){
		update(teacherinformation);
	}
	public void updateStudentInfo(StudentInformation studentinformation){
		update(studentinformation);
	}
	public void saveStudent(StudentInformation studentinformation){
		save(studentinformation);
	}
	public List<DepartmentInformation> getDepartmentList(){
		List<DepartmentInformation> list = getAllList("com.rjxy.entity.DepartmentInformation");
		return list;
	}
	public List<PeopleAge> getAgelist(){
		List<PeopleAge> list =getAllList("com.rjxy.entity.PeopleAge");
		return list;
	}
	public List<EduBackGround> getEdulist(){
		List<EduBackGround> list =getAllList("com.rjxy.entity.EduBackGround");
		return list;
	}
	public List<DepartmentInformation> getDeptlist(){
		List<DepartmentInformation> list =getAllList("com.rjxy.entity.DepartmentInformation");
		return list;
	}
	public List<GradeInformation> getGradelist(){
		List<GradeInformation> list =getAllList("com.rjxy.entity.GradeInformation");
		return list;
	}
	public TeacherInformation showTeacherById(String tea_id){
		TeacherInformation teacherinfomation = (TeacherInformation) getBean(TeacherInformation.class, tea_id);
		return teacherinfomation;
	}
	public StudentInformation showStudentById(String stu_id){
		StudentInformation studentinformation = (StudentInformation) getBean(StudentInformation.class, stu_id);
		return studentinformation;
	}
	public List<StudentInformation> getStudentById(String department_id,String profession_id){
		List<StudentInformation> stuList = findByWhere("com.rjxy.entity.StudentInformation", new String[]{"departmentInformation","professionInformation"}, new String[]{department_id,profession_id});
		return stuList;
	}
	public void saveTeacher(TeacherInformation teacherinformation){
		save(teacherinformation);
	}
	public void deleteTeacher(TeacherInformation teacherinformation){
		delete(teacherinformation);
	}	
	public void deleteStudent(StudentInformation studentinformation){
		delete(studentinformation);
	}

	/*public List<TeacherInformation> getTeacherList(String dept_id){
		List<TeacherInformation> list = findByWhere("com.rjxy.entity.TeacherInformation", new String[]{"departmentInformation"}, new String[]{dept_id});
		return list;
	}*/
}
