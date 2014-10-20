package com.rjxy.admin.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.Subject;
import com.rjxy.entity.role.Action;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;

@Service
public class CourseService extends BaseService {
	@Autowired
	private PageDaoImpl pageDao;
	
	@Transactional
	public void initExamNaturePageBean(int pageNum) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.exam.ExamNature",new String[]{}, new String[]{});
	}
	public void initCoursePageBean(int pageNum, String department_id, String professional_id, String subject_id){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.exam.Course", new String[]{"departmentInformation","professionInformation","subject"}, new String[]{department_id, professional_id, subject_id});
	}

	public void initProfessionPageBean(int pageNum, String department_id ){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.ProfessionInformation", new String[]{"departmentInformation"}, new String[]{department_id});
	}
	public PageBean getProfessionPageList() {
        return pageDao.getPage();
    }

	public void initSubjectPageBean(int pageNum, String professional_id){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.exam.Subject", new String[]{"professionInformation"}, new String[]{professional_id});
	}

	public void initExamTaskPageBean(int pageNum, String examTask_status){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.exam.ExamTask", new String[]{"examTask_status"}, new String[]{examTask_status});
	}

	public PageBean getExamNaturePageList() {
        return pageDao.getPage();
    }
	public PageBean getCoursePageList() {
        return pageDao.getPage();
    }
	public PageBean getSubjectPageList(){
		return pageDao.getPage();
	}
	public PageBean getExamTaskPageList(){
		return pageDao.getPage();
	}
	public void updateExamNature(ExamNature examnature){
		update(examnature);
	}
	public void deleteExamNature(ExamNature examnature){
		delete(examnature);
	}
	public void deleteProfession(ProfessionInformation professionInformation){
		delete(professionInformation);
	}
	public void saveExamNature(ExamNature examnature){
		save(examnature);
	}
	public ExamNature updateNatureById(int nature_id){
		ExamNature examnature = (ExamNature)getBean(ExamNature.class, nature_id);
		return examnature;
    }
	public ProfessionInformation updateProfessionById(int profession_id){
		ProfessionInformation professionInformation= (ProfessionInformation)getBean(ProfessionInformation.class, profession_id);
		return professionInformation;
    }
	public List<DepartmentInformation> getDepartmentList(){
		List<DepartmentInformation> list = getAllList("com.rjxy.entity.DepartmentInformation");
		return list;
	}
	public List<GradeInformation> getGradeInformationList(){
		List<GradeInformation> list = getAllList("com.rjxy.entity.GradeInformation");
		return list;
	}
	public List<Subject> getSubjectList(){
		List<Subject> list = getAllList("com.rjxy.entity.exam.Subject");
		return list;
	}
	public List<ProfessionInformation> getProfessionById(String dept_id){
		List<ProfessionInformation> list = findByWhere("com.rjxy.entity.ProfessionInformation", new String[]{"departmentInformation"}, new String[]{dept_id});
		return list;
	}
	public List<TeacherInformation> getTeacherById(String dept_id){
		List<TeacherInformation> list = findByWhere("com.rjxy.entity.TeacherInformation", new String[]{"departmentInformation"}, new String[]{dept_id});
		return list;
	}
	public List<Subject> getSubjectById(String prof_id){
		List<Subject> list = findByWhere("com.rjxy.entity.exam.Subject", new String[]{"professionInformation"}, new String[]{prof_id});
		return list;
	}
	public List<ClassInformation> getClassById(String grade_id){
		List<ClassInformation> list = findByWhere("com.rjxy.entity.ClassInformation", new String[]{"gradeInforMation"}, new String[]{grade_id});
		return list;
	}
	public List<ExamTask> getExamTaskById(String task_id){
		List<ExamTask> list = findByWhere("com.rjxy.entity.exam.ExamTask", new String[]{"examTask_id"}, new String[]{task_id});
		return list;
	}
	public void saveCourse(Course course){
		save(course);
	}
	public void saveProfession(ProfessionInformation professionInformation){
		save(professionInformation);
	}
	public ProfessionInformation getProfessionById(int  profession_id){
		ProfessionInformation professionInformation = (ProfessionInformation)getBean(ProfessionInformation.class, profession_id);
		return professionInformation;
    }
	public void updateProfession(ProfessionInformation professionInformation){
		update(professionInformation);
	}
	public void saveSubject(Subject subject){
		save(subject);
	}
	public void updateSubject(Subject subject){
		update(subject);
	}
	public Course getCourseById(int course_id){
		Course course = (Course) getBean(Course.class, course_id);
		return course;
	}
	public Subject getSubjectById(int subject_id){
		Subject subject = (Subject) getBean(Subject.class, subject_id);
		return subject;
	}
	public void updateCourse(Course course){
		update(course);
	}
	public void deleteCourse(Course course){
		delete(course);
	}
	public void deleteSubject(Subject subject){
		delete(subject);
	}
	public void updateExamTask(ExamTask examTask){
		update(examTask);
	}
}
