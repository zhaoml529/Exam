<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看成绩</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/page.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>


  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：查看成绩&nbsp;-&gt;查看考试成绩</td>
        </tr>
    </table>
	<br/><br/>
	<table class="default" width="100%">
	<tr class="title">
		<td>科目</td><td>考试批次</td><td>考试时间</td><td>选择题分数</td><td>填空题分数</td><td>简答题分数</td><td>综合题分数</td><td>总分数</td></tr>
		<c:choose>
		<c:when test="${empty scoreList}">
			<tr>
				<td colspan="8" align="center">当前无成绩可查看</td>
			</tr>
		</c:when>
	<c:otherwise>
	<c:forEach items="${scoreList}" var="scoreList">
	<tr>
	<td>${scoreList.examTask.subject.subject_name }</td>
	<td>${scoreList.examTask.examNature.nature_name }</td>
	<td>${scoreList.examTask.examTask_start }</td>
	<td>${scoreList.choiceScore }</td>
	<td>${scoreList.clozeScore }</td>
	<td>${scoreList.shortAnswerScore }</td>
	<td>${scoreList.comprehensiveScore }</td>
	<td>${scoreList.totalScore }</td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</table>
  </body>
</html>
