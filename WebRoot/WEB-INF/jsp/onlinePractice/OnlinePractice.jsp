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
	<script type="text/javascript" src="<c:url value="/js/exam.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>
  </head>
  
  <body onbeforeunload="history.go(-1)" onbeforepaste="return window.clipboardData.setData('text', '');" onkeydown="return Keydown();">
	  <div align="center"><font size="6" color="red" style="font-weight: 10"> 练习试卷</font><br></div><br/><br/>
	  <div align="right"><font size="2" color="grey" style="margin-right: 200">试题提供：邯郸学院软件职业技术学院</font></div>
	  <div class="scores"><div class="p_a">试卷说明</div>
		<div class="rt_msg">
			<table cellspacing="0" cellpadding="0" border="0"
				style="text-align: left; margin-left: auto; margin-right: auto;">
				<tbody>
					<tr>
						<td>此试卷仅供练习使用</td>
					</tr>
					<tr>
						<td>您的试卷不会被保存</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	   <br/><br/>

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
				  
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="A" onclick="getChoiceToPractice(this.value,'${i.count }',this.id);" />A、&nbsp;${choiceList.answer_A }</td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="B" onclick="getChoiceToPractice(this.value,'${i.count }',this.id);" />B、&nbsp;${choiceList.answer_B }</td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="C" onclick="getChoiceToPractice(this.value,'${i.count }',this.id);" />C、&nbsp;${choiceList.answer_C }</td></tr>
				   <tr><td width="900" ><input type="radio" name="choice${i.count }" id="${choiceList.question_id }" value="D" onclick="getChoiceToPractice(this.value,'${i.count }',this.id);" />D、&nbsp;${choiceList.answer_D }</td></tr>
				</table>
				<div id="choice_${i.count }"></div><br/>
  			</div>
  			</c:forEach>
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
				   <tr><td>答案：</td><td><input type="text" name="cloze${i.count }" id="${clozeList.question_id }" onblur="getClozeToPractice(this.value,'${i.count }',this.id);"/></td></tr>
				</table>
				<div id="cloze_${i.count }"></div><br/>
  			</div>
  			</c:forEach>
  		</div>
  		
  		<!-- 简答题  -->
  		<div id="shortAnswercon" style="display:none" align="center">
  			<div  align="left" style="margin-left: 200"><font style="font-weight: 10;font-size: 20;"><b>简答题（每题${serializablePaper.shortAnswerList[0].question_score}分,共${serializablePaper.shortAnswerList[0].question_score * fn:length(serializablePaper.shortAnswerList)}分）</b></font></div>
  			<br/>
  			<c:forEach items="${serializablePaper.shortAnswerList}" var="shortAnswerList" varStatus="i">
  			<c:set value="${serializablePaper.stuShortAnswer[i.index]}" var="stuShortAnswer"/>
  			<div id="shortAnswer_${i.count }" align="left" style="margin-left: 200">
  				<table class="default">
				   <tr class="title"><td width="900" style="text-align: left;" colspan="2">${i.count }.${shortAnswerList.question_body }</td></tr>
				   <tr><td>答案：</td><td>
				   <textarea name="shortAnswer${i.count }" id="${shortAnswerList.question_id }" style="width:700;height: 100" onblur="getShortAnswerToPractice(this.value,'${i.count }');"></textarea>
					</td></tr>
				</table>
				<div id="shortAnswer_${i.count }"></div><br/>
  			</div>
  			</c:forEach>
  		</div>
	</body>
</html>
