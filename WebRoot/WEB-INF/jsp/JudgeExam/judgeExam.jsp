<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <title>评分页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/exam.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>
  </head>
  
  <body>
  <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
  <div align="center"><font size="6" color="red" style="font-weight: 10"> ${serializablePaper.paper_name }</font><br></div><br/><br/>
	  <div align="right"><font size="2" color="grey" style="margin-right: 200">试题提供：邯郸学院</font></div> <br/><br/>
	  <div align="center"  style="font-weight:bold;">
	  		开始时间: ${serializablePaper.paper_start }&nbsp;&nbsp;结束时间: ${serializablePaper.paper_end }<br/><br/>
	  		考试地点: ${serializablePaper.address }<br/><br/>
	  		监考教师: ${serializablePaper.chackteacher }<br/><br/>
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
				  
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" readonly="readonly" id="${choiceList.question_id }" value="A" ${'A' eq stuChoice?"checked":"" }/>A、&nbsp;${choiceList.answer_A }</td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" readonly="readonly" id="${choiceList.question_id }" value="B" ${'B' eq stuChoice?"checked":"" }/>B、&nbsp;${choiceList.answer_B }</td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" readonly="readonly" id="${choiceList.question_id }" value="C" ${'C' eq stuChoice?"checked":"" }/>C、&nbsp;${choiceList.answer_C }</td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" readonly="readonly" id="${choiceList.question_id }" value="D" ${'D' eq stuChoice?"checked":"" }/>D、&nbsp;${choiceList.answer_D }</td></tr>
				<tr><td width="900"><span style="color: red;margin-left: 18">正确答案:</span>${choiceList.question_answer }</td></tr>
				</table>
				<div id="choice${i.count }">
					状态:<c:choose>
					<c:when test="${serializablePaper.wrongChoice[i.count-1] == 1 }"><span style="color: #0000FF">[正确]</span></c:when>
					<c:otherwise><span style="color: #FF0000">[错误]</span></c:otherwise>
					</c:choose>
				</div>
				<br/>
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
				   <tr class="title"><td width="900" style="text-align: left;" colspan="2">${i.count }.${clozeList.question_body }</td></tr>
				   <tr><td width="100" align="center">答案：</td><td><input type="text" disabled="disabled" name="cloze${i.count }" id="${clozeList.question_id }" value="${empty stuCloze?null:stuCloze }"/></td></tr>
				<tr><td width="100"><span style="color: red;margin-left: 18">正确答案:</span></td><td>${clozeList.question_answer }</td></tr>
				</table>
				<div>
				状态:<c:choose>
					<c:when test="${serializablePaper.wrongCloze[i.count-1] == 1 }"><span style="color: #0000FF">[正确]</span></c:when>
					<c:when test="${serializablePaper.wrongCloze[i.count-1] == 2 }"><span style="color: #FF0000">[不全对]</span></c:when>
					<c:otherwise><span style="color: #FF0000">[错误]</span></c:otherwise>
					</c:choose>
				</div><br/>
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
		</c:choose></div>
  		</div>
  		<form method="post" name="myform" action="<c:url value='/judge/saveJudgeScore/${serializablePaper.stu_id }/${serializablePaper.task_id }'/>">
  		<!-- 简答题  -->
		<div id="shortAnswercon" style="display:none" align="center">
		<div align="left" style="margin-left: 200">
			<font style="font-weight: 10;font-size: 20;"><b>简答题（每题${serializablePaper.shortAnswerList[0].question_score}分,共${serializablePaper.shortAnswerList[0].question_score* fn:length(serializablePaper.shortAnswerList)}分）</b></font>
		</div>
		<br/>
		<c:forEach items="${serializablePaper.shortAnswerList}" var="shortAnswerList" varStatus="i">
			<c:set value="${serializablePaper.stuShortAnswer[i.index]}" var="stuShortAnswer" />
			<div id="shortAnswer_${i.count }" align="left" style="margin-left: 200">
				<table class="default">
					<tr class="title">
						<td width="900" style="text-align: left;" colspan="2">${i.count}.${shortAnswerList.question_title }</td>
					</tr>
					<tr>
						<td colspan="2">${shortAnswerList.question_body }</td>
					</tr>
					<tr>
						<td width="100" align="center">答案：</td><td><textarea disabled="disabled" name="shortAnswer${i.count }" id="${shortAnswerList.question_id }" style="width:700;height: 100">${empty stuShortAnswer?null:stuShortAnswer }</textarea></td>
					</tr>
					<tr><td width="100" style="text-align: center;color: red;">正确答案:</td><td width="800">${shortAnswerList.question_answer }</td></tr>
				</table>
				<br/>
				<div id="shortAnswer${i.count }">
				打分：<input type="text" value="${serializablePaper.eachShortAnswer[i.count-1] }" name="shortAnswer"/>
				</div>
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
				<input type="submit" class="btn" value="保存分数"/>
			</c:otherwise>	
		</c:choose></div>
	</div>
	<!-- 综合题 -->
  		<div id="comprehensivecon" style="display:none" align="center">
  			<div  align="left" style="margin-left: 200"><font style="font-weight: 10;font-size: 20;"><b>综合题（每题${serializablePaper.comprehensiveList[0].question_score}分,共${serializablePaper.comprehensiveList[0].question_score * fn:length(serializablePaper.comprehensiveList)}分）</b></font></div>
  			<br/>
  			<c:forEach items="${serializablePaper.comprehensiveList}" var="comprehensiveList" varStatus="i">
  			<div id="comprehensive_${i.count }" align="left" style="margin-left: 200">
  				<table class="default">
				   <tr class="title">
						<td width="900" style="text-align: left;">${i.count }.${comprehensiveList.question_title }</td>
				   </tr>
				   <tr>
				   		<td>${comprehensiveList.question_body }</td>
				   </tr>
				   <tr>
				   	<td>
				   		下载学生提交的试题&nbsp;<input type="button" value="下载" class="btn" onclick="javascript:location.href='<c:url value='/judge/downloadFile/${i.count }'/>'"/>
				   </tr>
				</table>
				<div id="comprehensive${i.count }">打分：<input type="text" value="${serializablePaper.eachComprehensive[i.count-1] }" name="comprehensive"/></div><br/>
  			</div>
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
  		<input type="submit" class="btn" value="保存分数" id="saveScore"/> </div>
  		</div>
  		</form>
  		<iframe name="hidden_frame"id="hidden_frame" style="display:none"></iframe>
  </body>
</html>
