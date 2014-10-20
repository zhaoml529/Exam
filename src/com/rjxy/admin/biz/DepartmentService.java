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
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;

@Service
public class DepartmentService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;
	
	@Transactional
	
	public void initDepartmentPageBean(int pageNum) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.DepartmentInformation",new String[]{}, new String[]{});
	}
	public void initGradePageBean(int pageNum) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.GradeInformation",new String[]{}, new String[]{});
	}
	public void initClassPageBean(int pageNum,String grade_id) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.ClassInformation",new String[]{"gradeInforMation"},new String[]{grade_id});
	}
	public PageBean getDepartmentPageList() {
        return pageDao.getPage();
    }
	public PageBean getGradePageList() {
        return pageDao.getPage();
    }
	public PageBean getClassPageList() {
        return pageDao.getPage();
    }
	public List<GradeInformation> getGradeList(){
		List<GradeInformation> list = getAllList("com.rjxy.entity.GradeInformation");
		return list;
	}
	
	public void saveDepartment(DepartmentInformation departmentinformation){
		save(departmentinformation);
	}
	public void saveGrade(GradeInformation gradeInformation){
		save(gradeInformation);
	}
	public DepartmentInformation getDepartmentById(int department_id){
		DepartmentInformation departmentinformation = (DepartmentInformation)getBean(DepartmentInformation.class, department_id);
		return departmentinformation;
    }
	public GradeInformation getGradeById( int grade_id){
		GradeInformation gradeInformation = (GradeInformation)getBean(GradeInformation.class, grade_id);
		return gradeInformation;
    }
	public ClassInformation getClassInfoById(String class_id){
		ClassInformation classInformation = (ClassInformation)getBean(ClassInformation.class, Integer.parseInt(class_id));
		return classInformation;
    }

	public void deleteDepartment(DepartmentInformation departmentinformation){
		delete(departmentinformation);
	}
	public void deleteGrade(GradeInformation gradeInformation){
		delete(gradeInformation);
	}
	public void deleteClass(ClassInformation classInformation){
		delete(classInformation);
	}
	public void updateDepartment(DepartmentInformation departmentinformation){
		update(departmentinformation);
	}
	public void updateGrade(GradeInformation gradeInformation){
		update(gradeInformation);
	}
	public void updateClass(ClassInformation classInformation){
		update(classInformation);
	}
	public void saveClass(ClassInformation classInformation){
		save(classInformation);
	}


}
