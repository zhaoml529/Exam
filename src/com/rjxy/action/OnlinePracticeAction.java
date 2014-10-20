package com.rjxy.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rjxy.entity.exam.SerializablePaper;
import com.rjxy.entity.question.Choice;
import com.rjxy.entity.question.Cloze;

@Controller
@RequestMapping("/onlinePractice")
public class OnlinePracticeAction {
	
	@RequestMapping("/getChoiceToPractice")
	public String getChoiceToPractice(HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		List<Choice> choiceList = null;			
		String[] stuChoice=(String[])session.getAttribute("stuChoice");
		int[] wrongChoice=(int[])session.getAttribute("wrongChoice");//0Ϊ��1Ϊ��
		Double choiceScore=(Double)session.getAttribute("choiceScore");
		if(choiceScore==null){
			choiceScore=0.0;
		}
		String choiceAnswer = request.getParameter("choiceAnswer");
		int choiceNum = Integer.parseInt(request.getParameter("choiceNum"));
		int choiceId = Integer.parseInt(request.getParameter("choiceId"));
		//��ȡ������session�е��Ծ��б�����ȷ�𰸶Ա�
		choiceList=(List<Choice>)session.getAttribute("choiceList");
			Choice choice = choiceList.get(choiceNum-1);
			if (choiceId == choice.getQuestion_id()) {//��ȡ��ȷ�𰸺ͷ���
				String rightAnswer = choice.getQuestion_answer();
				//�����������ͬ
				if(stuChoice[choiceNum-1]!=null&&stuChoice[choiceNum-1].equals(choiceAnswer)){
					//System.out.println("----�����������ͬ-----");						
				}else{
				if(stuChoice[choiceNum-1]!=null&&wrongChoice[choiceNum-1]==1&&!(choiceAnswer.equals(rightAnswer))){
					choiceScore-=choice.getQuestion_score();//��һ��ѡ����ȷ,���Ǻ����޸��˴�,����,�۳�����
					wrongChoice[choiceNum - 1] =0;
				}
				stuChoice[choiceNum-1]=choiceAnswer;//��ѧ��ÿ����ô𰸴����������
				if (choiceAnswer.equals(rightAnswer)) {
					choiceScore+=choice.getQuestion_score();
					wrongChoice[choiceNum-1]=1;
				}else{
					wrongChoice[choiceNum - 1] =0;
				}
				}
			}
			session.setAttribute("choiceScore", choiceScore);
			session.setAttribute("stuChoice", stuChoice);
			session.setAttribute("wrongChoice", wrongChoice);
		return null;
	}
	@RequestMapping("/getClozeToPractice")
	public String getClozeToPractice(HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		List<Cloze> clozeList = null;
		String[] stuCloze=(String[])session.getAttribute("stuCloze");
		int[] wrongCloze=(int[])session.getAttribute("wrongCloze");//0��ȫ��1��ȫ�ԣ�2�ǲ�ȫ��
		Double clozeScore=(Double)session.getAttribute("clozeScore");
		if(clozeScore==null){
			clozeScore=0.0;
		}
		String clozeAnswer = request.getParameter("clozeAnswer").replace("��", ",").replace("��", ",");
		int clozeNum = Integer.parseInt(request.getParameter("clozeNum"));
		int clozeId = Integer.parseInt(request.getParameter("clozeId"));
		stuCloze[clozeNum-1]=clozeAnswer;//��ѧ���𰸷���������
		String[] splitAnswer=clozeAnswer.split(",");//��ȡ��
		clozeList =(List<Cloze>)session.getAttribute("completionList");
				Cloze cloze=clozeList.get(clozeNum-1);
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
				session.setAttribute("clozeScore", clozeScore);
				session.setAttribute("stuCloze", stuCloze);
				session.setAttribute("wrongCloze", wrongCloze);
		return null;
	}
	@RequestMapping("/getShortAnswerToPractice")
	public String getShortAnswerToPractice(HttpServletRequest request) throws Exception{
		HttpSession session=request.getSession();
		String[] stuResponseAnswer=(String[])session.getAttribute("stuResponseAnswer");
		String responseAnswerAnswer = request.getParameter("responseAnswer");
		int responseAnswerNum = Integer.parseInt(request.getParameter("responseAnswerNum"));
		stuResponseAnswer[responseAnswerNum-1]=responseAnswerAnswer;
		session.setAttribute("stuResponseAnswer", stuResponseAnswer);
		return null;
	}
}
