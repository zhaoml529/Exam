<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'update_cloze.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/calendar.js'/>" charset="UTF-8"></script>

  </head>
<body>
    <table cellSpacing=0 cellPadding=5 width="100%" border=0 style="margin-top: 0px">
			<tr>
				<td class="manageHead">
					当前位置：题库管理&nbsp;-&gt;试题题库管理&nbsp;-&gt;修改试题
				</td>
			</tr>
	</table>
	<input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
	<form action="<c:url value='/question/updateCloze'/>" method="post" onsubmit="return validateForm(this)">
		<table class="default" width="1100px">
				<tr class="title">
					<td colspan="2">查看试题详细信息</td>					
				</tr>
				<tr><td>填空题编号</td><td><input type="text" name="question_id" readonly="readonly" value="${cloze.question_id }"/></td></tr>
				<tr><td>填空题题目</td><td><input type="text" name="question_body" value="${cloze.question_body }"/></td></tr>
				<tr><td>正确答案</td><td><input type="text" name="question_answer" value="${cloze.question_answer }"/></td></tr>
				<tr><td>答案个数</td><td><input type="text" name="question_num" value="${cloze.question_num }"/></td></tr>
				<tr><td>试题难度</td><td><input type="text" name="difficulty" value="${cloze.difficulty }"/></td></tr>
				<tr><td>所属科目</td><td>
					<select name="subject.subject_id" emptyInfo="请选择试题科目">
							<c:forEach items="${subjectList}" var="subjectList">
								<option value="${subjectList.subject_id}" ${subjectList.subject_id == cloze.subject.subject_id?'selected':"" }>${subjectList.subject_name}</option>
							</c:forEach>
						</select>
								</td></tr>
				<tr><td>年级</td><td>
				<select name="grade.grade_id" emptyInfo="请选择试题年级">
							<c:forEach items="${gradeInfoList}" var="gradeInfoList">
								<option value="${gradeInfoList.grade_id}" ${gradeInfoList.grade_id == cloze.grade.grade_id?'selected':"" }>${gradeInfoList.grade_name}</option>
							</c:forEach>
						</select>
								</td></tr>
				<tr><td>添加人</td><td><input type="text" name="add_person" readonly="readonly" value="${cloze.add_person }"/></td></tr>
				<tr><td>添加时间</td><td><input type="text" name="add_time" value="${cloze.add_time }" onclick="calendar.show(this);"/></td></tr>
				<tr><td>试题分值</td><td><input type="text" name="question_score" value="${cloze.question_score }"/></td></tr>
				<tr><td>试题备注</td><td><input type="text" name="question_remark" value="${cloze.question_remark }"/></td></tr>
				<tr><td colspan="2"><input type="submit" value="保存" class="btn"/></td></tr>
	 </table>
	 </form>
  </body>
</html>
