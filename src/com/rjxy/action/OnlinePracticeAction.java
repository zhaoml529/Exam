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
		int[] wrongChoice=(int[])session.getAttribute("wrongChoice");//0为错，1为对
		Double choiceScore=(Double)session.getAttribute("choiceScore");
		if(choiceScore==null){
			choiceScore=0.0;
		}
		String choiceAnswer = request.getParameter("choiceAnswer");
		int choiceNum = Integer.parseInt(request.getParameter("choiceNum"));
		int choiceId = Integer.parseInt(request.getParameter("choiceId"));
		//获取保存在session中的试卷列表，跟正确答案对比
		choiceList=(List<Choice>)session.getAttribute("choiceList");
			Choice choice = choiceList.get(choiceNum-1);
			if (choiceId == choice.getQuestion_id()) {//获取正确答案和分数
				String rightAnswer = choice.getQuestion_answer();
				//两次输入答案相同
				if(stuChoice[choiceNum-1]!=null&&stuChoice[choiceNum-1].equals(choiceAnswer)){
					//System.out.println("----两次输入答案相同-----");						
				}else{
				if(stuChoice[choiceNum-1]!=null&&wrongChoice[choiceNum-1]==1&&!(choiceAnswer.equals(rightAnswer))){
					choiceScore-=choice.getQuestion_score();//第一次选择正确,但是后来修改了答案,错误,扣除分数
					wrongChoice[choiceNum - 1] =0;
				}
				stuChoice[choiceNum-1]=choiceAnswer;//将学生每道题得答案存放在数组里
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
		int[] wrongCloze=(int[])session.getAttribute("wrongCloze");//0是全错，1是全对，2是不全对
		Double clozeScore=(Double)session.getAttribute("clozeScore");
		if(clozeScore==null){
			clozeScore=0.0;
		}
		String clozeAnswer = request.getParameter("clozeAnswer").replace("，", ",").replace("。", ",");
		int clozeNum = Integer.parseInt(request.getParameter("clozeNum"));
		int clozeId = Integer.parseInt(request.getParameter("clozeId"));
		stuCloze[clozeNum-1]=clozeAnswer;//把学生答案放在数组里
		String[] splitAnswer=clozeAnswer.split(",");//截取答案
		clozeList =(List<Cloze>)session.getAttribute("completionList");
				Cloze cloze=clozeList.get(clozeNum-1);
				String[] splitStuAnswer=clozeAnswer.split(",");//截取答案
				if(clozeId==cloze.getQuestion_id()){
					double score=cloze.getQuestion_score();
					String rightAnswer=cloze.getQuestion_answer();
					String[] splitRightAnswer=rightAnswer.split(",");//截取正确答案
					int count=0;
					if(splitStuAnswer.length<=splitRightAnswer.length){
						for(int x=0;x<splitStuAnswer.length;x++){
							//填空题按顺序答题,遍历填空题答案，得到回答正确个数
								if(splitRightAnswer[x].equals(splitStuAnswer[x])){
									count++;
									splitRightAnswer[x]=null;
								}
						}
					}else if(splitRightAnswer.length<splitStuAnswer.length){
						for(int x=0;x<splitRightAnswer.length;x++){
							//填空题按顺序答题,遍历填空题答案，得到回答正确个数
								if(splitRightAnswer[x].equals(splitStuAnswer[x])){
									count++;
									splitRightAnswer[x]=null;
								}
						}
					}
					//第一次回答填空题全部错误
					if(wrongCloze[clozeNum-1]==0){
						if(count==splitRightAnswer.length){
							clozeScore+=score;//满分
							wrongCloze[clozeNum-1]=1;
						}else if(count!=splitRightAnswer.length&&count!=0){
							clozeScore+=(score/2);//给一半的分数
							wrongCloze[clozeNum-1]=2;
						}else if(count==0){
							wrongCloze[clozeNum-1]=0;//0分
						}
					}
					//第一次回答全部正确
					else if(wrongCloze[clozeNum-1]==1){
							if(count==splitRightAnswer.length){
								wrongCloze[clozeNum-1]=1;
							}else if(count!=splitRightAnswer.length&&count!=0){
								clozeScore-=(score/2);//扣除一半的分数
								wrongCloze[clozeNum-1]=2;
							}else if(count==0){
								clozeScore-=score;
								wrongCloze[clozeNum-1]=0;//扣除全部分数分
							}
						}
						//第一次回答没有全部正确
						else if(wrongCloze[clozeNum-1]==2){
							if(count==splitRightAnswer.length){
								clozeScore+=(score/2);//上一次已经加过一半的分数，现在只加一半就可以
								wrongCloze[clozeNum-1]=1;
							}else if(count!=splitRightAnswer.length&&count!=0){
								wrongCloze[clozeNum-1]=2;
							}else if(count==0){
								clozeScore-=(score/2);
								wrongCloze[clozeNum-1]=0;//扣除一半数分
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
