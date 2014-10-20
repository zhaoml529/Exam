package com.rjxy.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rjxy.core.BaseService;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.exam.AutomaticExtract;
import com.rjxy.entity.exam.ExamPaper;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.ManualExtract;
import com.rjxy.entity.exam.Score;
import com.rjxy.entity.question.Choice;
import com.rjxy.page.PageBean;
import com.rjxy.page.PageDaoImpl;
import com.rjxy.util.BeanUtils;

@SuppressWarnings("unchecked")
@Service
public class JudgeService extends BaseService{
	@Autowired
	private PageDaoImpl pageDao;
	
	public void initTaskPageBean(int pageNum, String tea_id, String examTask_status) {
        pageDao.initPageBean(pageNum,"com.rjxy.entity.exam.ExamTask",new String[]{"teacherInformation", "examTask_status"}, new String[]{tea_id, examTask_status});
    }
	public PageBean getExamTaskByTeaId(){
		return pageDao.getPage();
	}
	
	public List<Score> getScoreListByExamTask(String examTask_id){
		List<Score> list=findByWhere("com.rjxy.entity.exam.Score", new String[]{"examTask"}, new String[]{examTask_id});
		return list;
	}
	public ExamTask getExamTaskById(String examTask_id){
		ExamTask examTask=(ExamTask)getBean(ExamTask.class, examTask_id);
		return examTask;
	}
	public StudentInformation getStudentById(String stu_id){
		StudentInformation student=(StudentInformation)getBean(StudentInformation.class, stu_id);
		return student;
	}
	public Score getScoreById(String stu_id,String examTask_id){
		List<Score> list=findByWhere("com.rjxy.entity.exam.Score", new String[]{"studentInformation","examTask"}, new String[]{stu_id,examTask_id});
		return list.get(0);		
	}
	public void updateScore(Score score){
		update(score);
	}
	
	public int getPassScoreByTaskId(String task_id){
		List<Score> list = findByWhere("com.rjxy.entity.exam.Score", new String[]{"examTask", "isPass"}, new String[]{task_id, "1"});
		if(BeanUtils.isBlank(list)){
			return 0;
		}else{
			return list.size();
		}
	}
	public int getnoPassScoreByTaskId(String task_id){
		List<Score> list = findByWhere("com.rjxy.entity.exam.Score", new String[]{"examTask", "isPass"}, new String[]{task_id, "0"});
		if(BeanUtils.isBlank(list)){
			return 0;
		}else{
			return list.size();
		}
	}
	public List<ExamPaper> getExamPaperByPaperId(String exam_id){
		List<ExamPaper> list = findByWhere("com.rjxy.entity.exam.ExamPaper", new String[]{"exam_id"}, new String[]{exam_id});
		return list;
	}
	public List<AutomaticExtract> getAutomaticByExamId(String exam_id){
		List<AutomaticExtract> list = findByWhere("com.rjxy.entity.exam.AutomaticExtract", new String[]{"examPaper"}, new String[]{exam_id});
		return list;
	}
	public List<ManualExtract> getManualExtractById(String exam_id){
		List<ManualExtract> list = findByWhere("com.rjxy.entity.exam.ManualExtract", new String[]{"examPaper"}, new String[]{exam_id});
		return list;
	}
}
