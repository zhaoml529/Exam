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
    
    <title>查看考试任务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />

  </head>
  
  <body>
  	<table cellSpacing=0 cellPadding=5 width="100%" border=0
			style="margin-top: 0px">
			<tr>
				<td class="manageHead">
					当前位置：试卷管理&nbsp;-&gt;考试任务&nbsp;-&gt;查看考试任务
				</td>
			</tr>
		</table>
		<br />
		<input type="button" value="返回" class="btn" onclick="javascript:location.href='<c:url value="/exam/listExamTask/pageNum/1"/>'">
			<table class="default" align="center" width="500">
				<tr class="title">
					<td colspan="2">
						查看考试信息
					</td>
				</tr>
				<tr>
					<td>所用试卷</td>
					<td>${examTask.examPaper.exam_name}</td>
				</tr>
				<tr>
					<td>考试科目</td>
					<td>${examTask.subject.subject_name}</td>
				</tr>
				<tr>
					<td>考试年级</td>
					<td>${examTask.examPaper.gradeInformation.grade_name }</td>
				</tr>
				<tr>
					<td>考试班级</td>
					<td>
						<c:forEach items="${classList}" var="classList">
							${classList.class_name }&nbsp;
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>考试性质</td>
					<td>${examTask.examNature.nature_name }</td>
				</tr>
				<tr>
					<td>考试教师</td>
					<td>${examTask.teacherInformation.tea_name }</td>
				</tr>
				<tr>
					<td>考试时间</td>
					<td>${examTask.examTask_start }</td>
				</tr>
				<tr>
					<td>结束时间</td>
					<td>${examTask.examTask_end }</td>
				</tr>
				<tr>
					<td>考试地点</td>
					<td>${examTask.examTask_address }</td>
				</tr>
				<tr>
					<td>监考老师</td>
					<td>${examTask.examTask_teacher }</td>
				</tr>
				<tr>
					<td>备注</td>
					<td>${examTask.examTask_remark == null?'无':examTask.examTask_remark }</td>
				</tr>
	</table>
  </body>
</html>
