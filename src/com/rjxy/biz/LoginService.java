package com.rjxy.biz;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.role.GroupRAM;
import com.rjxy.entity.role.TeaRole;


@Service
public class LoginService extends BaseService{
	@Transactional
	public List<StudentInformation> getStudentById(String userid){
		List<StudentInformation> list = findByWhere("com.rjxy.entity.StudentInformation", new String[]{"stu_id"}, new String[] {userid});
		if(list==null){
			return null;
		}else{
			return list;
		}
	}
	public List<TeacherInformation> getTeacherById(String userid){
		List<TeacherInformation> list = findByWhere("com.rjxy.entity.TeacherInformation", new String[]{"tea_id"}, new String[] {userid});
		if(list==null){
			return null;
		}else{
			return list;
		}
	}
	public List<TeaRole> getTeaRoleById(String userid){
		List<TeaRole> list = findByWhere("com.rjxy.entity.role.TeaRole", new String[]{"teacherInformation"}, new String[] {userid});
		return list;
	}
	public List<GroupRAM> getGroupRAMListByRoleId(String roleid){
		List<GroupRAM> list = findByWhere("com.rjxy.entity.role.GroupRAM", new String[]{"role"}, new String[] {roleid});
		return list;
	}
//	public List<ResearchInstitutionPeople> getAllList(){
//	List<ResearchInstitutionPeople> list = getAllList("nebula.common.entity.ry.ResearchInstitutionPeople");
//	return list;
//}
}
