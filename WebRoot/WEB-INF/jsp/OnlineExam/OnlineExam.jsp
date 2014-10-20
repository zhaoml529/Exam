<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线考试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/exam.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>
	<script language="javascript">
		var time = ${serializablePaper.paper_leftTime };
		$("#clock").html(OnlineJudge.formatSeconds(time));
		function clock(){
			if(time>0){
				 $("#time").html(time);
				 time--;
				 $("#clock").html(OnlineJudge.formatSeconds(time));
				 if(time == 300){
				 	alert('距离考试结束还有 5 分钟!');
				 }
				 if(time==0){
				 	$("#contest_status").html("考试结束");
				 	$("#contest_status").attr('style', 'color:red');
				 	alert('本场考试结束!'); 
				 	window.location.href='<c:url value="/onlineExam/saveScore/${serializablePaper.stu_id}/${serializablePaper.task_id}"/>';
				 }
				 setTimeout(clock, 1000);
			}
		}
		
		$(document).ready(function(){
		clock();
})
		
</script>

</head>
  
  <body>
	  <div align="center"><font size="6" color="red" style="font-weight: 10"> ${serializablePaper.paper_name }</font><br></div><br/><br/>
	  <div align="right"><font size="2" color="grey" style="margin-right: 200">试题提供：邯郸学院</font></div> <br/><br/>
	  <div align="center"  style="font-weight:bold;">
	  		开始时间: ${serializablePaper.paper_start }&nbsp;&nbsp;结束时间: ${serializablePaper.paper_end }<br/><br/>
	  		考试地点: ${serializablePaper.address }<br/><br/>
	  		监考教师: ${serializablePaper.chackteacher }<br/><br/>
	  	<dir id="contest_status">
	  	<c:choose>
	  	<c:when test="${serializablePaper.paper_leftTime == 0 }">
	  		考试结束
	  	</c:when>
	  	<c:when test="${serializablePaper.paper_leftTime > 0 }">
	  		距离考试结束还有：<span id="clock" style="color:red"></span>
	  		<span id="time" style="display:none"></span>
	  	</c:when>
	  	<c:otherwise>
	  		等待开始考试
	  	</c:otherwise>
	  </c:choose>
	  </dir>
	  </div><br/><br/>

		<table align="center">
			<tr>
				<c:if test="${serializablePaper.choiceList != null&&fn:length(serializablePaper.choiceList) != 0}">
				<td>
					<input type="button" id="choice" class="btn" value=" 选择题"
						onclick="changeDiv('choicecon');" />
				</td>
				</c:if>
				<c:if test="${serializablePaper.clozeList != null&&fn:length(serializablePaper.clozeList) != 0}">
				<td>
					<input type="button" id="cloze" class="btn" value="填空题"
						onclick="changeDiv('clozecon');" />
				</td>
				</c:if>
				<c:if test="${serializablePaper.shortAnswerList != null&&fn:length(serializablePaper.shortAnswerList) != 0}">
				<td>
					<input type="button" id="shortAnswer" class="btn" value="简答题"
						onclick="changeDiv('shortAnswercon');" />
				</td>
				</c:if>
				<c:if test="${serializablePaper.comprehensiveList != null&&fn:length(serializablePaper.comprehensiveList) != 0}">
				<td>
					<input type="button" id="comprehensive" class="btn" value="综合题" 
					onclick="changeDiv('comprehensivecon');" />
				</td>
				</c:if>
				
			</tr>
		</table>
		<br/><br/>
				
		<!-- 选择题 -->
  		<div id="choicecon" style="display: block" align="center">
  			<div  align="left" style="margin-left: 200"><font style="font-weight: 10;font-size: 20;"><b>选择题（每题${serializablePaper.choiceList[0].question_score}分,共${serializablePaper.choiceList[0].question_score * fn:length(serializablePaper.choiceList)}分）</b></font></div>
  			<br/>
  			<c:forEach items="${serializablePaper.choiceList}" var="choiceList" varStatus="i">
  			<c:set value="${serializablePaper.stuChoice[i.index]}" var="stuChoice"/>
  			<div id="choice_${i.count }" align="left" style="margin-left: 200">
  				<table class="default">
				   <tr class="title"><td width="900" style="text-align: left;">${i.count }.${choiceList.question_body }</td></tr>
				  
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="A" onclick="getChoice(this.value,'${i.count }',this.id);" ${'A' eq stuChoice?"checked":"" }/>A、&nbsp;<c:out value="${choiceList.answer_A }"/></td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="B" onclick="getChoice(this.value,'${i.count }',this.id);" ${'B' eq stuChoice?"checked":"" }/>B、&nbsp;<c:out value="${choiceList.answer_B }"/></td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="C" onclick="getChoice(this.value,'${i.count }',this.id);" ${'C' eq stuChoice?"checked":"" }/>C、&nbsp;<c:out value="${choiceList.answer_C }"/></td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="D" onclick="getChoice(this.value,'${i.count }',this.id);" ${'D' eq stuChoice?"checked":"" }/>D、&nbsp;<c:out value="${choiceList.answer_D }"/></td></tr>
				</table><br>
				<div id="choice${i.count }"><p></p></div><br/>
  			</div>
  			</c:forEach>
  			<div>
		<c:choose>
		<c:when test="${serializablePaper.clozeList != null&&fn:length(serializablePaper.clozeList) != 0}">
		<input type="button" class="btn" value="下一题>>" onclick="changeDiv('clozecon');" /></c:when>
		<c:when test="${serializablePaper.shortAnswerList != null&&fn:length(serializablePaper.shortAnswerList) != 0}">
		<input type="button" class="btn" value="下一题>>" onclick="changeDiv('shortAnswercon');" /></c:when>
			<c:when test="${serializablePaper.comprehensiveList != null&&fn:length(serializablePaper.comprehensiveList) != 0}">
			<input type="button" class="btn" value="下一题>>" onclick="changeDiv('comprehensivecon');" /></c:when>
			<c:otherwise>
				<input type="button" class="btn" value="提交试卷" id="saveScore" onclick="javascript:location.href='<c:url value="/onlineExam/saveScore/${serializablePaper.stu_id}/${serializablePaper.task_id}"/>'"/>
			</c:otherwise>	
		</c:choose></div>
  		</div>
  		
  		<!-- 填空题 -->
  		<div id="clozecon" style="display:none" align="center">
  			<div  align="left" style="margin-left: 200"><font style="font-weight: 10;font-size: 20;"><b>填空题（每题${serializablePaper.clozeList[0].question_score}分,共${serializablePaper.clozeList[0].question_score * fn:length(serializablePaper.clozeList)}分）</b></font></div>
  			<br/>
  			<c:forEach items="${serializablePaper.clozeList}" var="clozeList" varStatus="i">
  			<c:set value="${serializablePaper.stuCloze[i.index]}" var="stuCloze"/>
  			<div id="cloze_${i.count }" align="left" style="margin-left: 200">
  				<table class="default">
				   <tr class="title"><td width="900" style="text-align: left;" colspan="2">${i.count }.<c:out value="${clozeList.question_body }"/></td></tr>
				   <tr><td>答案：</td><td width="800"><input type="text" onpaste="return false" name="cloze${i.count }" id="${clozeList.question_id }" value="${empty stuCloze?null:stuCloze }" onblur="getCloze(this.value,'${i.count }',this.id);"/></td></tr>
				</table><br>
				<div id="cloze${i.count }"></div><br/>
  			</div>
  			</c:forEach>
  			<div>
  			<c:if test="${serializablePaper.choiceList != null&&fn:length(serializablePaper.choiceList) != 0}">				
					<input type="button" class="btn" value="<<上一题"	onclick="changeDiv('choicecon');" /></c:if>
		<c:choose>
		<c:when test="${serializablePaper.shortAnswerList!=null&&fn:length(serializablePaper.shortAnswerList) != 0}">
		<input type="button" class="btn" value="下一题>>" onclick="changeDiv('shortAnswercon');" /></c:when>
			<c:when test="${serializablePaper.comprehensiveList!= null&&fn:length(serializablePaper.comprehensiveList) != 0}">
			<input type="button" class="btn" value="下一题>>" onclick="changeDiv('comprehensivecon');" /></c:when>
			<c:otherwise>
				<input type="button" class="btn" value="提交试卷" id="saveScore" onclick="javascript:location.href='<c:url value="/onlineExam/saveScore/${serializablePaper.stu_id}/${serializablePaper.task_id}"/>'"/>
			</c:otherwise>	
		</c:choose></div>
  		</div>
  		
  		<!-- 简答题  -->
		<div id="shortAnswercon" style="display:none" align="center">
		<div align="left" style="margin-left: 200">
			<font style="font-weight: 10;font-size: 20;"><b>简答题（每题${serializablePaper.shortAnswerList[0].question_score}分,共${serializablePaper.shortAnswerList[0].question_score* fn:length(serializablePaper.shortAnswerList)}分）</b>
			</font>
		</div>
		<br />
		<c:forEach items="${serializablePaper.shortAnswerList}" var="shortAnswerList" varStatus="i">
			<c:set value="${serializablePaper.stuShortAnswer[i.index]}" var="stuShortAnswer" />
			<div id="shortAnswer_${i.count }" align="left"
				style="margin-left: 200">
				<table class="default">
					<tr class="title">
						<td width="900" style="text-align: left;">${i.count}.<c:out value="${shortAnswerList.question_body }"/></td>
					</tr>
					<tr>
						<td><textarea name="shortAnswer${i.count }" onpaste="return false"
								id="${shortAnswerList.question_id }"
								style="width:700;height: 100"
								onblur="getShortAnswer(this.value,'${i.count }');"><c:out value="${empty stuShortAnswer?null:stuShortAnswer }"/></textarea>
						</td>
					</tr>
				</table><br>
				<div id="shortAnswer${i.count }"></div>
				<br />
			</div>
		</c:forEach>
		<div>
		<c:choose>
		<c:when test="${serializablePaper.clozeList != null&&fn:length(serializablePaper.clozeList) != 0}">
		<input type="button" class="btn" value="<<上一题" onclick="changeDiv('clozecon');" /></c:when>
		<c:when test="${serializablePaper.choiceList != null&&fn:length(serializablePaper.choiceList) != 0}">				
		<input type="button" class="btn" value="<<上一题"	onclick="changeDiv('choicecon');" /></c:when>
		</c:choose>
		<c:choose>
			<c:when test="${serializablePaper.comprehensiveList!= null&&fn:length(serializablePaper.comprehensiveList) != 0}">
			<input type="button" class="btn" value="下一题>>" onclick="changeDiv('comprehensivecon');" /></c:when>
			<c:otherwise>
				<input type="button" class="btn" value="提交试卷" id="saveScore" onclick="javascript:location.href='<c:url value="/onlineExam/saveScore/${serializablePaper.stu_id}/${serializablePaper.task_id}"/>'"/>
			</c:otherwise>	
		</c:choose></div>
	</div>
	<!-- 综合题 -->
  		<div id="comprehensivecon" style="display:none" align="center">
  			<div  align="left" style="margin-left: 200"><font style="font-weight: 10;font-size: 20;"><b>综合题（每题${serializablePaper.comprehensiveList[0].question_score}分,共${serializablePaper.comprehensiveList[0].question_score * fn:length(serializablePaper.comprehensiveList)}分）</b></font></div>
  			<br/>
  			<c:forEach items="${serializablePaper.comprehensiveList}" var="comprehensiveList" varStatus="i">
  			<form action="<c:url value='/onlineExam/getComprehensive/${i.count }'/>" encType="multipart/form-data" name="form${i.count }" id="form${i.count }" method="post" target="hidden_frame">
  			<div id="comprehensive_${i.count }" align="left" style="margin-left: 200">
  				<table class="default">
				   <tr class="title">
						<td width="900" style="text-align: left;">${i.count }.<c:out value="${comprehensiveList.question_title }"/></td>
				   </tr>
				   <tr>
				   		<td><c:out value="${comprehensiveList.question_body }"/></td>
				   </tr>
				   <tr>
				   	<td>
				   		<input type="text" name="name"/>
				   		<input type="file" id="file" name="file" style="width:200"/>      
    	 				<input type="submit" class="btn" value="上传文件">
					</td>
				   </tr>
				</table>
				<div id="comprehensive${i.count }"></div><br/>
  			</div>
  			</form>
  			</c:forEach>
  			<div>
  			<c:choose>
  			<c:when test="${serializablePaper.shortAnswerList!=null&&fn:length(serializablePaper.shortAnswerList) != 0}">
		<input type="button" class="btn" value="<<上一题" onclick="changeDiv('shortAnswercon');" /></c:when>
		<c:when test="${serializablePaper.clozeList != null&&fn:length(serializablePaper.clozeList) != 0}">
		<input type="button" class="btn" value="<<上一题" onclick="changeDiv('clozecon');" /></c:when>
		<c:when test="${serializablePaper.choiceList != null&&fn:length(serializablePaper.choiceList) != 0}">				
		<input type="button" class="btn" value="<<上一题"	onclick="changeDiv('choicecon');" /></c:when>
		</c:choose>
  		<input type="button" class="btn" value="提交试卷" id="saveScore" onclick="javascript:location.href='<c:url value="/onlineExam/saveScore/${serializablePaper.stu_id}/${serializablePaper.task_id}"/>'"/> </div>
  		</div>
  		<iframe name="hidden_frame"id="hidden_frame" style="display:none"></iframe>
	</body>
</html>
