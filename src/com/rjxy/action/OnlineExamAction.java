package com.rjxy.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rjxy.biz.ExamineService;
import com.rjxy.entity.StudentInformation;
import com.rjxy.entity.exam.ExamTask;
import com.rjxy.entity.exam.Score;
import com.rjxy.entity.exam.SerializablePaper;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;
import com.rjxy.util.BeanUtils;

@Controller
@RequestMapping("/onlineExam")
public class OnlineExamAction {
	@Autowired
	private ExamineService onlineExamService;
	private SerializablePaper serializablePaper;
	private static final String APPLICATION_X_RAR = "application/x-rar";
	private static final String APPLICATION_X_RAR_COM = "application/x-rar-compressed";
	private static final String APPLICATION_ZIP ="application/zip";
	private static final String APPLICATION_ZIP_COM = "application/x-zip-compressed";
	private static final String APPLICATION_OCT = "application/octet-stream";
	
	
	@RequestMapping("/getChoice")
	public @ResponseBody String getChoice(HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
		String choiceAnswer=request.getParameter("choiceAnswer");
		int choiceId=Integer.parseInt(request.getParameter("choiceId"));
		int choiceNum=Integer.parseInt(request.getParameter("choiceNum"));
		long paper_leftTime = Long.parseLong(request.getParameter("time"));
		List<Choice> choiceList=serializablePaper.getChoiceList();
		String[] stuChoice=serializablePaper.getStuChoice();
		int[] wrongChoice=serializablePaper.getWrongChoice();//0Ϊ��1Ϊ��
		float choiceScore=serializablePaper.getChoiceScore();
		if(stuChoice==null){
			stuChoice=new String[100];
		}
		if(wrongChoice==null){
			wrongChoice=new int[100];
		}
		Choice choice = choiceList.get(choiceNum-1);
		if(stuChoice[choiceNum-1]!=null){
			//��ѡ�������
			if(wrongChoice[choiceNum-1]==1){
				//��ѡ����ȷ��
				choiceScore-=choice.getQuestion_score();
			}
			//������޲���
		}
			stuChoice[choiceNum-1]=choiceAnswer;
			if(choice.getQuestion_answer().equals(choiceAnswer)){
				wrongChoice[choiceNum-1]=1;
				choiceScore+=choice.getQuestion_score();
			}else{
				wrongChoice[choiceNum-1]=0;
			}
		
		serializablePaper.setChoiceScore(choiceScore);
		serializablePaper.setStuChoice(stuChoice);
		serializablePaper.setWrongChoice(wrongChoice);
		serializablePaper.setPaper_leftTime(paper_leftTime);
		boolean flag=false;
		flag=onlineExamService.serializableExamPaper(serializablePaper);
		if(flag){
			session.setAttribute("serializablePaper", serializablePaper);
		}
		return "success";
	}
	@RequestMapping("/getCloze")
	public @ResponseBody String getCloze(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
		String clozeAnswer=request.getParameter("clozeAnswer").replace("��", ",").replace("��", ",");
		int clozeNum=Integer.parseInt(request.getParameter("clozeNum"));
		int clozeId=Integer.parseInt(request.getParameter("clozeId"));
		long paper_leftTime = Long.parseLong(request.getParameter("time"));
		List<Cloze> clozeList=serializablePaper.getClozeList();
		String[] stuCloze=serializablePaper.getStuCloze();
		float clozeScore=serializablePaper.getClozeScore();
		int[] wrongCloze=serializablePaper.getWrongCloze();
		if(stuCloze==null){
			stuCloze=new String[100];
		}
		if(wrongCloze==null){
			wrongCloze=new int[100];
		}
		Cloze cloze=clozeList.get(clozeNum-1);
		stuCloze[clozeNum-1]=clozeAnswer;//����ѧ����
		String[] splitStuAnswer=clozeAnswer.split(",");//��ȡ��
		if(clozeId==cloze.getQuestion_id()){
			double score=cloze.getQuestion_score();
			String rightAnswer=cloze.getQuestion_answer();
			String[] splitRightAnswer=rightAnswer.split(",");//��ȡ��ȷ��
			int count=0;
			if(splitStuAnswer.length<=splitRightAnswer.length){
				for(int x=0;x<splitStuAnswer.length;x++){
					//����ⰴ˳�����,���������𰸣��õ��ش���ȷ����
						if(splitRightAnswer[x].equals(splitStuAnswer[x])){
							count++;
							splitRightAnswer[x]=null;
						}
				}
			}else if(splitRightAnswer.length<splitStuAnswer.length){
				for(int x=0;x<splitRightAnswer.length;x++){
					//����ⰴ˳�����,���������𰸣��õ��ش���ȷ����
						if(splitRightAnswer[x].equals(splitStuAnswer[x])){
							count++;
							splitRightAnswer[x]=null;
						}
				}
			}
			//��һ�λش������ȫ������
			if(wrongCloze[clozeNum-1]==0){
				if(count==splitRightAnswer.length){
					clozeScore+=score;//����
					wrongCloze[clozeNum-1]=1;
				}else if(count!=splitRightAnswer.length&&count!=0){
					clozeScore+=(score/2);//��һ��ķ���
					wrongCloze[clozeNum-1]=2;
				}else if(count==0){
					wrongCloze[clozeNum-1]=0;//0��
				}
			}
			//��һ�λش�ȫ����ȷ
			else if(wrongCloze[clozeNum-1]==1){
					if(count==splitRightAnswer.length){
						wrongCloze[clozeNum-1]=1;
					}else if(count!=splitRightAnswer.length&&count!=0){
						clozeScore-=(score/2);//�۳�һ��ķ���
						wrongCloze[clozeNum-1]=2;
					}else if(count==0){
						clozeScore-=score;
						wrongCloze[clozeNum-1]=0;//�۳�ȫ��������
					}
				}
				//��һ�λش�û��ȫ����ȷ
				else if(wrongCloze[clozeNum-1]==2){
					if(count==splitRightAnswer.length){
						clozeScore+=(score/2);//��һ���Ѿ��ӹ�һ��ķ���������ֻ��һ��Ϳ���
						wrongCloze[clozeNum-1]=1;
					}else if(count!=splitRightAnswer.length&&count!=0){
						wrongCloze[clozeNum-1]=2;
					}else if(count==0){
						clozeScore-=(score/2);
						wrongCloze[clozeNum-1]=0;//�۳�һ������
					}
				}
			
		}
		serializablePaper.setClozeScore(clozeScore);;
		serializablePaper.setStuCloze(stuCloze);
		serializablePaper.setWrongCloze(wrongCloze);
		serializablePaper.setPaper_leftTime(paper_leftTime);
		boolean flag=false;
		flag=onlineExamService.serializableExamPaper(serializablePaper);
		if(flag){
			session.setAttribute("serializablePaper", serializablePaper);
		}
		return "success";
	}
	@RequestMapping("/getShortAnswer")
	public @ResponseBody String getShortAnswer(HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
		String[] stuShortAnswer=serializablePaper.getStuShortAnswer();
		if(stuShortAnswer==null){
			stuShortAnswer=new String[50];
		}
		String shortAnswer=request.getParameter("shortAnswer");
		int shortAnswerNum=Integer.parseInt(request.getParameter("shortAnswerNum"));
		long paper_leftTime = Long.parseLong(request.getParameter("time"));
		stuShortAnswer[shortAnswerNum-1]=shortAnswer;
		serializablePaper.setStuShortAnswer(stuShortAnswer);
		serializablePaper.setPaper_leftTime(paper_leftTime);
		boolean flag=false;
		flag=onlineExamService.serializableExamPaper(serializablePaper);
		if(flag){
			session.setAttribute("serializablePaper", serializablePaper);
		}
		return "success";
	}
	@RequestMapping("/getComprehensive/{num}")
	public void getComprehensive(@RequestParam("file") MultipartFile file,@PathVariable("num") String num , HttpServletRequest request, HttpServletResponse response) throws Exception{
		if(!file.isEmpty()){
			String contentType = file.getContentType();
			if(APPLICATION_X_RAR.equals(contentType)||APPLICATION_X_RAR_COM.equals(contentType)||APPLICATION_ZIP.equals(contentType)||APPLICATION_ZIP_COM.equals(contentType)||APPLICATION_OCT.equals(contentType)){
				HttpSession session=request.getSession();
				serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
				String paper_id = serializablePaper.getPaper_id();
				String task_id = serializablePaper.getTask_id();
				String stu_class = serializablePaper.getStu_class();
				String grade_name = serializablePaper.getGrade_name();
				String tempName = file.getOriginalFilename();
				//�ļ���׺
				String appden = tempName.substring(tempName.lastIndexOf('.'));
				String filePath = "d:/score/"+paper_id+"/"+task_id+"/"+grade_name+"/"+stu_class;
				String fileName = serializablePaper.getStu_name()+"-"+serializablePaper.getStu_id()+"-Num"+num+appden;
				file.transferTo(new File(filePath+"/"+fileName));
				response.getWriter().print("<script>alert('�ύ�ɹ���');</script>");
			}else{
				response.getWriter().print("<script>alert('ֻ�����ύrar��zip��ʽ���ļ���');</script>");
			}
			
		}else{
			response.getWriter().print("<script>alert('��ѡ��Ҫ�ϴ����ļ�,��ʽΪzip��rar��ѹ������');</script>");
		}
		return;
	}
	@RequestMapping("/saveScore/{stu_id}/{task_id}")
	public void saveScore(@PathVariable("stu_id") String stu_id,@PathVariable("task_id") String task_id,HttpServletRequest request, HttpServletResponse response) throws IOException{
		List<Score> scoreList = onlineExamService.getScoreById(stu_id, task_id);
		Score score = new Score();
		if(!BeanUtils.isBlank(scoreList)){
			score=scoreList.get(0);
		}
		HttpSession session=request.getSession();
		serializablePaper=(SerializablePaper)session.getAttribute("serializablePaper");
		if((serializablePaper.getShortAnswerList()==null||serializablePaper.getShortAnswerList().size()==0)&&(serializablePaper.getComprehensiveList()==null||serializablePaper.getComprehensiveList().size()==0)){
			score.setJudge(1);
		}
		ExamTask examTask=onlineExamService.getExamTaskById(task_id);
		StudentInformation stuInfo=onlineExamService.getStudentById(stu_id);
		score.setExamTask(examTask);
		score.setStudentInformation(stuInfo);
		score.setChoiceScore(serializablePaper.getChoiceScore());
		score.setClozeScore(serializablePaper.getClozeScore());
		float totalScore = score.getChoiceScore()+score.getClozeScore();
		score.setTotalScore(totalScore);
		if(totalScore >= serializablePaper.getPassScore()){
			score.setIsPass(1);
		}else{
			score.setIsPass(0);
		}
		if(BeanUtils.isBlank(scoreList)){
			onlineExamService.saveScore(score);
		}else{
			onlineExamService.updateScore(score);
		}
		PrintWriter out=response.getWriter();
		out.print("<script language=javascript>this.window.opener=null;window.close();</script>");
	}
	@RequestMapping("/showScoreToStu")
	public String showScoreToStu(HttpServletRequest request,ModelMap modelMap){
		HttpSession session=request.getSession();
		String stu_id=(String)session.getAttribute("user_id");
		List<Score> scoreList=onlineExamService.getScoreByStu(stu_id);
		modelMap.addAttribute("scoreList",scoreList);
		return "User/showScore";
	}

}
