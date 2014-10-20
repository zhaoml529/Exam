package com.rjxy.admin.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.DepartmentInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.role.Action;
import com.rjxy.entity.role.GroupAM;
import com.rjxy.entity.role.GroupRAM;
import com.rjxy.entity.role.Module;
import com.rjxy.entity.role.Role;
import com.rjxy.entity.role.TeaRole;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;

@Service
public class RightService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;

	@Transactional
	public void initActionPageBean(int pageNum) {
		pageDao.initPageBean(pageNum,"com.rjxy.entity.role.Action",new String[]{}, new String[]{});
	}
	
	public void initModulePageBean(int pageNum){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.role.Module", new String[]{}, new String[]{});
	}
	
	public void initRolePageBean(int pageNum){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.role.Role", new String[]{}, new String[]{});
	}
	
	public void initTeacherPageBean(int pageNum, String dept_id){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.TeacherInformation", new String[]{"departmentInformation"}, new String[]{dept_id});
	}
	
	public PageBean getRolePageList(){
		return pageDao.getPage();
	}
	
	public PageBean getModulePageList(){
		return pageDao.getPage();
	}
	
	public PageBean getActionPageList() {
        return pageDao.getPage();
    }
	
	public PageBean getTeacherPageList(){
		return pageDao.getPage();
	}
	
	public void saveAction(Action action){
		save(action);
	}
	
	public void saveModule(Module module){
		save(module);
	}
	
	public void saveRole(Role role){
		save(role);
	}
	
	public void deleteAction(Action action){
		delete(action);
	}
	
	public void deleteModule(Module module){
		delete(module);
	}
	
	public void deleteRole(Role role){
		delete(role);
	}
	
	public void updateAction(Action action){
		update(action);
	}
	
	public void updateModule(Module module){
		update(module);
	}
	
	public void updateRole(Role role){
		update(role);
	}
	
	public Action getActionById(int action_id){
		Action action = (Action)getBean(Action.class, action_id);
		return action;
	}
	
	public Module getModuleById(int module_id){
		Module module = (Module)getBean(Module.class, module_id);
		return module;
	}

	public Role getRoleById(int role_id){
		Role role = (Role)getBean(Role.class, role_id);
		return role;
	}
	
	public GroupAM getGroupAMById(int am_id){
		GroupAM groupAM = (GroupAM)getBean(GroupAM.class, am_id);
		return groupAM;
	}
	
	public TeacherInformation getTeacherInformationById(String tea_id){
		TeacherInformation teacher = (TeacherInformation)getBean(TeacherInformation.class, tea_id);
		return teacher;
	}
	public List<GroupRAM> getGroupRAMById(String role_id, String am_id){
		List<GroupRAM> groupRAM = findByWhere("com.rjxy.entity.role.GroupRAM", new String[]{"role","groupAM"}, new String[]{role_id, am_id});
		return groupRAM;
	}
	
	public List<Action> getActionList(){
		List<Action> list = getAllList("com.rjxy.entity.role.Action");
		return list;
	}
	
	public List<Module> getModuleList(){
		List<Module> list = getAllList("com.rjxy.entity.role.Module");
		return list;
	}
	
	public List<GroupAM> getGroupAMListById(String module_id){
		List<GroupAM> list = findByWhere("com.rjxy.entity.role.GroupAM", new String[]{"module"}, new String[]{module_id});
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<GroupAM> getGroupAMListById(String action_id, String module_id){
		List<GroupAM> list = findByWhere("com.rjxy.entity.role.GroupAM", new String[]{"action","module"}, new String[]{action_id,module_id});
		return list;
	}
	
	public void addGroupAM(GroupAM groupAM){
		save(groupAM);
	}
	
	public void addGroupRAM(GroupRAM groupRAM){
		save(groupRAM);
	}
	
	public void addTeaRole(TeaRole teaRole){
		save(teaRole);
	}
	
	public void deleteGroupAM(GroupAM groupAM){
		delete(groupAM);
	}
	
	public void deleteGroupRAM(GroupRAM groupRAM){
		delete(groupRAM);
	}
	
	public void deleteTeaRole(TeaRole teaRole){
		delete(teaRole);
	}
	
	public List<GroupRAM> getGroupRAMListById(String role_id){
		List<GroupRAM> list = findByWhere("com.rjxy.entity.role.GroupRAM", new String[]{"role"}, new String[]{role_id});
		return list;
	}
	
	public List<GroupAM> getGroupAMList(){
		List<GroupAM> list = getAllList("com.rjxy.entity.role.GroupAM");
		return list;
	}
	
	public List<Role> getRoleList(){
		List<Role> list = getAllList("com.rjxy.entity.role.Role");
		return list;
	}
	public List<TeaRole> getTeaRoleById(String tea_id){
		List<TeaRole> list = findByWhere("com.rjxy.entity.role.TeaRole", new String[]{"teacherInformation"}, new String[]{tea_id});
		return list;
	}
	
	public List<DepartmentInformation> getDepartmentList(){
		List<DepartmentInformation> list = getAllList("com.rjxy.entity.DepartmentInformation");
		return list;
	}
	public List<TeacherInformation> getTeaInformationByDeptId(String dept_id){
		List<TeacherInformation> list = findByWhere("com.rjxy.entity.TeacherInformation", new String[]{"departmentInformation"}, new String[]{dept_id});
		return list;
	}
	
	public List<TeaRole> getTeaRoleById(String tea_id, String role_id){
		List<TeaRole> teaRole = findByWhere("com.rjxy.entity.role.TeaRole", new String[]{"teacherInformation","role"}, new String[]{tea_id, role_id});
		return teaRole;
	}
	
	
}
