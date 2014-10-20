package com.rjxy.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.ProfessionInformation;
import com.rjxy.entity.exam.AutomaticExtract;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamNature;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.ManualExtract;
import com.rjxy.entity.exam.QuestionType;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;
@SuppressWarnings("unchecked")
@Service
public class ExamService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;

	@Transactional
	public void initPaperPageBean(int pageNum, String tea_id) {
        pageDao.initPageBean(pageNum,"com.rjxy.entity.exam.ExamPaper",new String[]{"teacherInformation"}, new String[]{tea_id});
    }

	
	public void initTaskPageBean(int pageNum, String tea_id, String examTask_status) {
        pageDao.initPageBean(pageNum,"com.rjxy.entity.exam.ExamTask",new String[]{"teacherInformation", "examTask_status"}, new String[]{tea_id, examTask_status});
    }
	
	public void initManualChoicePageBean(int pageNum, String[] columns, String[] values){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.question.Choice", columns, values);
	}
	
	//手动添加试题列表
	public void initChoicePageBean(int pageNum, String[] columns, String[] values){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.question.Choice", columns, values);
	}
	public void initClozePageBean(int pageNum, String[] columns, String[] values){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.question.Cloze", columns, values);
	}
	public void initShortAnswerPageBean(int pageNum, String[] columns, String[] values){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.question.ShortAnswer", columns, values);
	}
	public void initComprehensivePageBean(int pageNum, String[] columns, String[] values){
		pageDao.initPageBean(pageNum, "com.rjxy.entity.question.Comprehensive", columns, values);
	}
	public PageBean getChoiceById(){
		return pageDao.getPage();
	}
	
	//可以手动添加试题用，也可以在试题管理模块用
	public <T> PageBean<T> getQuestionByDim(){
		return pageDao.getPage();
	}
	
	public PageBean getExamPaperByTeaId() {
        return pageDao.getPage();
    }
	
	public PageBean getExamTaskByTeaId(){
		return pageDao.getPage();
	}
	
	public List<ExamPaper> getExamPaperByPaperId(String exam_id){
		List<ExamPaper> list = findByWhere("com.rjxy.entity.exam.ExamPaper", new String[]{"exam_id"}, new String[]{exam_id});
		return list;
	}
	
	public List<ExamTask> getExamTaskByTaskId(String examTask_id){
		List<ExamTask> list = findByWhere("com.rjxy.entity.exam.ExamTask", new String[]{"examTask_id"}, new String[]{examTask_id});
		return list;
	}
	
	public List<Course> getCourseListBysubID(String subID, String tea_id){
		List<Course> list=findByWhere("com.rjxy.entity.exam.Course", new String[]{"subject","teacherInformation"}, new String[]{subID, tea_id});
		return list;
	}
	
	public List<ExamTask> getExamTaskByStatus(String examTask_status,String tea_id){
		List<ExamTask> list = findByWhere("com.rjxy.entity.exam.ExamTask", new String[]{"examTask_status","teacherInformation"}, new String[]{examTask_status,tea_id});
		return list;
	}
	
	public List<ClassInformation> getClassListByTeaID(String tea_id, String subject_id){
		List<ClassInformation> list = findByWhere("com.rjxy.entity.exam.Course", new String[]{"teacherInformation","subject"}, new String[]{tea_id,subject_id});
		return list;
	}
	
	public List<ExamNature> getExamNatureList(){
		List<ExamNature> list = getAllList("com.rjxy.entity.exam.ExamNature");
		return list;
	}
	
	public void saveExamPaper(ExamPaper examPaper){
		save(examPaper);
	}
	public void updateExamPaper(ExamPaper examPaper){
		update(examPaper);
	}
	public void saveExamTask(ExamTask examTask){
		save(examTask);
	}
	public void updateExamTask(ExamTask examTask){
		update(examTask);
	}
	public void deleteExamPaper(ExamPaper examPaper){
		delete(examPaper);
	}
	public void deleteExamTask(ExamTask examTask){
		delete(examTask);
	}
	public List<Course> getCourseListByTeaId(String tea_id){
		List<Course> list = findByWhere("com.rjxy.entity.exam.Course", new String[]{"teacherInformation"}, new String[]{tea_id});
		return list;
	}
	public List<QuestionType> getQuestionTypeList(){
		List<QuestionType> list = getAllList("com.rjxy.entity.exam.QuestionType");
		return list;
	}
	public List<AutomaticExtract> getAutomaticByExamId(String exam_id){
		List<AutomaticExtract> list = findByWhere("com.rjxy.entity.exam.AutomaticExtract", new String[]{"examPaper"}, new String[]{exam_id});
		return list;
	}
	public List<Choice> getChoiceCount(){
		List<Choice> list = getCount("com.rjxy.entity.question.Choice");
		return list;
	}
	public List<Cloze> getClozeCount(){
		List<Cloze> list = getCount("com.rjxy.entity.question.Cloze");
		return list;
	}
	public List<ShortAnswer> getShortCount(){
		List<ShortAnswer> list = getCount("com.rjxy.entity.question.ShortAnswer");
		return list;
	}
	public List<Comprehensive> getCompreCount(){
		List<Comprehensive> list = getCount("com.rjxy.entity.question.Comprehensive");
		return list;
	}
	public void saveAutomatic(AutomaticExtract automaticExtract){
		save(automaticExtract);
	}
	public List<AutomaticExtract> getAutomaticById(String auto_id){
		List<AutomaticExtract> list = findByWhere("com.rjxy.entity.exam.AutomaticExtract", new String[]{"auto_id"}, new String[]{auto_id});
		return list;
	}
	public void updateAutoMatic(AutomaticExtract automaticExtract){
		update(automaticExtract);
	}
	public void deleteAtuoMatic(AutomaticExtract automaticExtract){
		delete(automaticExtract);
	}
	public List<ProfessionInformation> getProfessionByAreaId(String area_id){
		List<ProfessionInformation> list = findByWhere("com.rjxy.entity.ProfessionInformation", new String[]{"professionArea"}, new String[]{area_id});
		return list;
	}
	public List<ManualExtract> getManualExtractQuestionID(String exam_id, String type_id){
		List<ManualExtract> list = findByWhere("com.rjxy.entity.exam.ManualExtract", new String[]{"examPaper","questionType"}, new String[]{exam_id, type_id});
		return list;
	}
	public List<ManualExtract> getManualExtractById(String exam_id){
		List<ManualExtract> list = findByWhere("com.rjxy.entity.exam.ManualExtract", new String[]{"examPaper"}, new String[]{exam_id});
		return list;
	}
	public ExamPaper getExamPaperById(String exam_id){
		ExamPaper examPaper = (ExamPaper) getBean(ExamPaper.class, exam_id);
		return examPaper;
	}
	public ExamTask getExamTaskById(String task_id){
		ExamTask examTask = (ExamTask) getBean(ExamTask.class, task_id);
		return examTask;
	}
	public QuestionType getQuestionTypeById(int type_id){
		QuestionType type = (QuestionType) getBean(QuestionType.class, type_id);
		return type;
	}
	public ClassInformation getClassById(int class_id){
		ClassInformation class_ = (ClassInformation) getBean(ClassInformation.class, class_id);
		return class_;
	}
	public void saveManualExtract(ManualExtract me){
		save(me);
	}
	public void updateManualExtract(ManualExtract me){
		update(me);
	}
	public void deleteManualExtract(ManualExtract me){
		delete(me);
	}

}
