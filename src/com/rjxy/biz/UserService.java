package com.rjxy.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.Course;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;
@Service
public class UserService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;
 @Transactional
	public StudentInformation getStudentById(String stu_id){
		StudentInformation student = (StudentInformation) getBean(StudentInformation.class, stu_id);
		return student;
	}

	public TeacherInformation getTeacherById(String tea_id){
		TeacherInformation teacher = (TeacherInformation) getBean(TeacherInformation.class, tea_id);
		return teacher;
	}
	public void updateStudentPassword(StudentInformation studentInformation){
		update(studentInformation);
	}
	public void updateTeacherPassword(TeacherInformation teacherInformation){
		update(teacherInformation);
	}
	public void initCoursePageBean(int pageNum, String tea_id) {
        pageDao.initPageBean(pageNum,"com.rjxy.entity.exam.Course",new String[]{"teacherInformation"}, new String[]{tea_id});
    }
	public PageBean getCoursePageList() {
        return pageDao.getPage();
    }
	public List<Course> getCourseListByTeaId(String tea_id){
		List<Course> list = findByWhere("com.rjxy.entity.exam.Course", new String[]{"teacherInformation"}, new String[]{tea_id});
		return list;
	}
	public List<StudentInformation> getStudentList(String class_id){
		List<StudentInformation> list = findByWhere("com.rjxy.entity.StudentInformation", new String[]{"classInformation"}, new String[]{class_id});
		return list;
	}
}
