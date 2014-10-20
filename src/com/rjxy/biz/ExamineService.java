package com.rjxy.biz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;
import com.rjxy.entity.ClassInformation;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.exam.AutomaticExtract;
import com.rjxy.entity.exam.Course;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.ManualExtract;
import com.rjxy.entity.exam.Score;
import com.rjxy.entity.exam.SerializablePaper;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.entity.question.Comprehensive;
import com.rjxy.entity.question.ShortAnswer;
import com.rjxy.page.PageDaoImpl;
import com.rjxy.util.BeanUtils;

@Service
public class ExamineService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Course> getCourseList(String grade, String profession, String classes){
		List<Course> list = findByWhere("com.rjxy.entity.exam.Course", new String[]{"professionInformation","gradeInformation","classInformation"}, new String[]{profession,grade,classes});
		return list;
		
	}
	public List<ExamTask> getExamTaskList(String subject_id, String tea_id, String grade_id){
		List<ExamTask> list = findByWhere("com.rjxy.entity.exam.ExamTask", new String[]{"subject","teacherInformation","examPaper.gradeInformation"}, new String[]{subject_id,tea_id,grade_id});
		return list;
	}
	public ExamTask getExamTaskById(String task_id){
		//ExamTask examTask = (ExamTask) getBean(ExamTask.class, task_id);
		List<ExamTask> list = findByWhere("com.rjxy.entity.exam.ExamTask", new String[]{"examTask_id"}, new String[]{task_id});
		return list.get(0);
	}
	public List<ManualExtract> getManualExtractByExamId(String exam_id){
		List<ManualExtract> list = findByWhere("com.rjxy.entity.exam.ManualExtract", new String[]{"examPaper"}, new String[]{exam_id});
		return list;
	}
	public List<AutomaticExtract> getAutomaticExtractByExamId(String exam_id){
		List<AutomaticExtract> list = findByWhere("com.rjxy.entity.exam.AutomaticExtract", new String[]{"examPaper"}, new String[]{exam_id});
		return list;
	}
	
	public StudentInformation getStudentById(String stu_id){
		StudentInformation student = (StudentInformation) getBean(StudentInformation.class, stu_id);
		return student;
	}
	//手动抽取试题
	public Choice getChoiceById(int id){
		Choice choice = (Choice) getBean(Choice.class, id);
		return choice;
	}
	public Cloze getClozeById(int id){
		Cloze cloze = (Cloze) getBean(Cloze.class, id);
		return cloze;
	}
	public ShortAnswer getShortAnswerById(int id){
		ShortAnswer shortAnswer = (ShortAnswer) getBean(ShortAnswer.class, id);
		return shortAnswer;
	}
	public Comprehensive getComperById(int id){
		Comprehensive compre = (Comprehensive) getBean(Comprehensive.class, id);
		return compre;
	}
	//自动抽取试题
	public List<Choice> getAutoChoiceList(String subject_id, String grade_id, String difficulty, int num ){
		List<Choice> list = getQuestion("com.rjxy.entity.question.Choice", new String[]{"question_id","subject","grade","difficulty"}, new String[]{"",subject_id,grade_id,difficulty}, num);
		return list;
	}
	public List<Cloze> getAutoClozeList(String subject_id, String grade_id, String difficulty, int num ){
		List<Cloze> list = getQuestion("com.rjxy.entity.question.Cloze", new String[]{"question_id","subject","grade","difficulty"}, new String[]{"",subject_id,grade_id,difficulty}, num);
		return list;
	}
	public List<Comprehensive> getAutoComprehensiveList(String subject_id, String grade_id, String difficulty, int num ){
		List<Comprehensive> list = getQuestion("com.rjxy.entity.question.Comprehensive", new String[]{"question_id","subject","grade","difficulty"}, new String[]{"",subject_id,grade_id,difficulty}, num);
		return list;
	}
	public List<ShortAnswer> getAutoShortAnswerList(String subject_id, String grade_id, String difficulty, int num ){
		List<ShortAnswer> list = getQuestion("com.rjxy.entity.question.ShortAnswer", new String[]{"question_id","subject","grade","difficulty"}, new String[]{"",subject_id,grade_id,difficulty}, num);
		return list;
	}
	
	//保存分数
	public void saveScore(Score score){
		save(score);
	}
	
	public boolean serializableExamPaper(SerializablePaper serializablePaper) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try {
			String paper_id = serializablePaper.getPaper_id();
			String task_id = serializablePaper.getTask_id();
			String stu_class = serializablePaper.getStu_class();
			String grade_name = serializablePaper.getGrade_name();
			String filePath = "d:/score/"+paper_id+"/"+task_id+"/"+grade_name+"/"+stu_class;
			File myFilePath = new File(filePath);
			//文件夹是否已存在，不可使用exists()方法  
			if (!myFilePath.exists()) {  
				myFilePath.mkdirs();
			}
			FileOutputStream f = new FileOutputStream(filePath+"/"+serializablePaper.getStu_name()+"-"+serializablePaper.getStu_id()+"-"+serializablePaper.getExamNature()+".obj");   
		    ObjectOutputStream s = new ObjectOutputStream(f);   
		    s.writeObject(serializablePaper);   
		    s.flush();  
		    s.close();
		    f.close();
		    flag=true;
		} catch (Exception e) {
			// TODO: handle exception
			flag=false;
			throw new Exception("序列化试卷失败！");
		}  
	    return flag;
	}
	public List<Score> getScoreById(String stu_id,String examTask_id){
		List<Score> list=findByWhere("com.rjxy.entity.exam.Score", new String[]{"studentInformation","examTask"}, new String[]{stu_id,examTask_id});
		if(BeanUtils.isBlank(list)){
			return null;
		}else{
			return list;
		}
				
	}
	public void updateScore(Score score){
		update(score);
	}
	
	public List<ClassInformation> getClassInformationList(){
		List<ClassInformation> list = getAllList("com.rjxy.entity.ClassInformation");
		return list;
	}
	public List<Score> getScoreByStu(String stu_id){
		List<Score> list=findByWhere("com.rjxy.entity.exam.Score", new String[]{"studentInformation","judge"}, new String[]{stu_id,"1"});
		return list;
	}
}

