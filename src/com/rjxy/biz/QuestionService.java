package com.rjxy.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.GradeInformation;
import com.rjxy.entity.TeacherInformation;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.Subject;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.page.PageDaoImpl;

@SuppressWarnings("unchecked")
@Service
public class QuestionService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;
	
	@Transactional
	public void saveChoice(Choice choice){
		save(choice);
	}
	public void saveCloze(Cloze cloze){
		save(cloze);
	}
	public void saveComprehensive(Comprehensive comprehensive){
		save(comprehensive);
	}
	public void saveShortAnswer(ShortAnswer shortAnswer){
		save(shortAnswer);
	}
	
	public void deleteChoice(Choice choice){
		delete(choice);
	}
	public void deleteCloze(Cloze cloze){
		delete(cloze);
	}
	public void deleteComprehensive(Comprehensive comprehensive){
		delete(comprehensive);
	}
	public void deleteShortAnswer(ShortAnswer shortAnswer){
		delete(shortAnswer);
	}
	
	public void updateChoice(Choice choice){
		update(choice);
	}
	public void updateCloze(Cloze cloze){
		update(cloze);
	}
	public void updateComprehensive(Comprehensive comprehensive){
		update(comprehensive);
	}
	public void updateShortAnswer(ShortAnswer shortAnswer){
		update(shortAnswer);
	}
	
	public List<Subject> getSubjectList(){
		List<Subject> list=getAllList("com.rjxy.entity.exam.Subject");
		return list;
	}
	
	public List<GradeInformation> getGradeInformationList(){
		List<GradeInformation> list=getAllList("com.rjxy.entity.GradeInformation");
		return list;
	}
	
	public List<Course> getCourseList(String tea_id){
		List<Course> list = findByWhere("com.rjxy.entity.exam.Course", new String[]{"teacherInformation"}, new String[]{tea_id});
		return list;
		
	}
	
	public List<TeacherInformation> getTeacherList(){
		List<TeacherInformation> list=getAllList("com.rjxy.entity.TeacherInformation");
		return list;
	}
	
	public List<Choice> getChoiceList(String subject,String grade,String add_time,String user_name,String difficulty,String questionID,String questionKey){
		List<Choice> list=findByDim("com.rjxy.entity.question.Choice", new String[]{"subject","grade","add_person","add_time","difficulty","question_id","question_body"}, new String[]{subject,grade,user_name,add_time,difficulty,questionID,questionKey});
		return list;
	}
	public List<Cloze> getClozeList(String subject,String grade,String add_time,String user_name,String difficulty,String questionID,String questionKey){
		List<Cloze> list=findByDim("com.rjxy.entity.question.Cloze", new String[]{"subject","grade","add_person","add_time","difficulty","question_id","question_body"}, new String[]{subject,grade,user_name,add_time,difficulty,questionID,questionKey});
		return list;
	}
	public List<Comprehensive> getComprehensiveList(String subject,String grade,String add_time,String user_name,String difficulty,String questionID,String questionKey){
		List<Comprehensive> list=findByDim("com.rjxy.entity.question.Comprehensive", new String[]{"subject","grade","add_person","add_time","difficulty","question_id","question_body"}, new String[]{subject,grade,user_name,add_time,difficulty,questionID,questionKey});
		return list;
	}
	public List<ShortAnswer> getShortAnswerList(String subject,String grade,String add_time,String user_name,String difficulty,String questionID,String questionKey){
		List<ShortAnswer> list=findByDim("com.rjxy.entity.question.ShortAnswer", new String[]{"subject","grade","add_person","add_time","difficulty","question_id","question_body"}, new String[]{subject,grade,user_name,add_time,difficulty,questionID,questionKey});
		return list;
	}
	
	public Choice getChoiceById(int question_id){
		Choice choice=(Choice)getBean(Choice.class, question_id);
		return choice;
	}
	public Cloze getClozeById(int question_id){
		Cloze cloze=(Cloze)getBean(Cloze.class, question_id);
		return cloze;
	}
	public Comprehensive getComprehensiveById(int question_id){
		Comprehensive comprehensive=(Comprehensive)getBean(Comprehensive.class, question_id);
		return comprehensive;
	}
	public ShortAnswer getShortAnswerById(int question_id){
		ShortAnswer shortAnswer=(ShortAnswer)getBean(ShortAnswer.class, question_id);
		return shortAnswer;
	}
	
	public List<Choice> getChoiceAllList(){
		List<Choice> list = getAllList("com.rjxy.entity.question.Choice");
		return list;
	}
	public List<Cloze> getClozeAllList(){
		List<Cloze> list = getAllList("com.rjxy.entity.question.Cloze");
		return list;
	}
	public List<Comprehensive> getComprehensiveAllList(){
		List<Comprehensive> list = getAllList("com.rjxy.entity.question.Comprehensive");
		return list;
	}
	public List<ShortAnswer> getShortAnswerAllList(){
		List<ShortAnswer> list = getAllList("com.rjxy.entity.question.ShortAnswer");
		return list;
	}
}
