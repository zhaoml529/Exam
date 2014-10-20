<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <td class="manageHead">当前位置：查看成绩&nbsp;-&gt;查看此次考试成绩</td>
        </tr>
    </table>
	<br/><br/>
	<input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
	
	<table class="default" width="100%">
		<tr class="title">
			<td>学生学号</td>
			<td>学生姓名</td>
			<td>所属年级</td>
			<td>选择题得分</td>
			<td>填空题得分</td>
			<td>简答题得分</td>
			<td>综合题得分</td>
			<td>总分数</td>
			<td>是否通过</td>
			<td>评分情况</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty scoreList}">
				<tr>
					<td colspan="11" align="center">暂无成绩列表</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${scoreList}" var="scoreList">
			<tr class="changeColor">
				<td align="center">${scoreList.studentInformation.stu_id }</td>
				<td align="center">${scoreList.studentInformation.stu_name }</td>
				<td align="center">${scoreList.studentInformation.departmentInformation.department_name }--${scoreList.studentInformation.professionInformation.profession_name }--${scoreList.studentInformation.classInformation.class_name }</td>
				<td align="center">${scoreList.choiceScore }</td>
				<td align="center">${scoreList.clozeScore }</td>
				<td align="center">${scoreList.shortAnswerScore }</td>
				<td align="center">${scoreList.comprehensiveScore }</td>
				<td align="center">${scoreList.totalScore }</td>
				<td align="center">${scoreList.isPass == 1?"<span style='color:green'>通过</span>":"<span style='color:red'>未通过</span>" }</td>
				<td align="center">
				<c:choose>
				<c:when test="${scoreList.judge==0}"><span style="color:red">未评分</span></c:when>
				<c:otherwise><span style="color:grey">已评分</span></c:otherwise>
				</c:choose>
				</td>
				<td align="center"><input type="button" class="btn" value="评分" onclick="javascript:location.href='<c:url value="/judge/judgeScore/${scoreList.studentInformation.stu_id }/${scoreList.examTask.examTask_id }"/>'"/></td>
			</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
  </body>
</html>
