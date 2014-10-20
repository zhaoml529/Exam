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
    
    <title>My JSP 'update_course.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style="margin-top:0px">
		<tr>
			<td class="manageHead">当前位置：课程管理&nbsp;-&gt;课程设置&nbsp;-&gt;修改课程信息</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='/courseAction/updateSubject' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">修改科目信息</td>
			</tr>
			<tr>
			<td>所属院系</td>
			<td>
	 		<select id="dept_id" name="department_id" onchange="changeDepartment('<c:url value='/courseAction/getProfessionById'/>',this.value);" emptyInfo="请选择院系" style="width:150px;">
			 	<option value="">--请选择院系--</option>
			 		<c:forEach items="${deptList}" var="deptList">
			 			<option value="${deptList.department_id}">${deptList.department_name}</option>
			 		</c:forEach>
		     </select>
		 	</td>
			</tr>
			<tr>
			<td>专业</td>
			<td>
			<select id="professional" name="professionInformation.profession_id" onchange="changeProfessional('<c:url value='/courseAction/getSubjectById'/>',this.value)" emptyInfo="请选择专业" disabled="disabled" style="width:150px;">
		 		<option value="0" selected="selected">--请选择专业--</option>
		 	</select> 
			</td>
			</tr>
			<tr>
			<td>科目</td>
			<td>
			<select id="subject" name="subject_id" emptyInfo="请选择科目" disabled="disabled" style="width:150px;">
	 			<option value="0" selected="selected">--请选择科目--</option>
	 		</select>
			</td>
			</tr>
			<tr>
				<td><span class="note"> * </span>年级</td>
		 	<td>
		 		<select name="gradeInformation.grade_id" onchange="changeGrade('<c:url value='/courseAction/getClassById'/>',this.value)" emptyInfo="请选择考试对象">
		 		    <option value=""> -- 请选择年级 -- </option>
		 		    <c:forEach items="${gradeList}" var="gradeList">
		 		    	<option value="<c:out value='${gradeList.grade_id}'/>"><c:out value='${gradeList.grade_name}'/></option>
		 		    </c:forEach>
		 		</select>
		 	</td>
		 	</tr>
		 	<tr>
		 	<td><span class="note"> * </span>班级</td>
		 	<td>
		 	<select id="classinfo" name="classInformation.class_id" emptyInfo="请选择专业" disabled="disabled" style="width:200px;">
		 		<option value="0" selected="selected">--请选择班级--</option>
		 	</select>
		 	</td>
		 	</tr>
		 	<tr>
		 	<td><span class="note"> * </span>教师</td>
		 	<td>
		 	<select id="teacher" name="teacherInformation.tea_id" emptyInfo="请选择专业" disabled="disabled" style="width:200px;">
		 		<option value="0" selected="selected">--请选择教师--</option>
		 	</select>
		 	</td>
		 	</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" class="btn"
					value="修改" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="subject_id" value="${subject.subject_id }"/>
	</form>
  </body>
</html>
