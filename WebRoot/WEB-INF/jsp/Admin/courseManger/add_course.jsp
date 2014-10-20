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
    
    <title>My JSP 'add_course.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>

  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：课程管理&nbsp;-&gt;科目设置&nbsp;-&gt;添加课程</td>
        </tr>
        <tr>
          <td height=2></td>
        </tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
	<form action="<c:url value='/courseAction/saveCourse'/>" method="post" onsubmit="return validateForm(this)" >
		<table class="default" align="center" width="600px">
		<tr class="title">
			<td colspan="5">&nbsp;添加课程信息</td>
		</tr>
	 	<tr>
	 	<td><span class="note"> * </span>院系</td>
	 	<td>
	 	<select id="dept_id" name="departmentInformation.department_id" onchange="changeDepartment('<c:url value='/courseAction/getProfessionById'/>',this.value);" emptyInfo="请选择院系" style="width:200px;">
	 		<option value="">--请选择院系--</option>
	 		<c:forEach items="${deptList}" var="deptList">
	 			<option value="${deptList.department_id}">${deptList.department_name}</option>
	 		</c:forEach>
     	</select>
	 	</td>
	 	</tr>
	 	 <tr>
	 	<td><span class="note"> * </span>专业</td>
	 	<td>
	 	<select id="professional" name="professionInformation.profession_id" onchange="changeProfessional('<c:url value='/courseAction/getSubjectById'/>',this.value)" emptyInfo="请选择专业" disabled="disabled" style="width:200px;">
	 		<option value="0" selected="selected">--请选择专业--</option>
	 	</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>科目</td>
	 	<td>
	 	<select id="subject" name="subject.subject_id" emptyInfo="请选择科目" disabled="disabled" style="width:200px;">
	 		<option value="0" selected="selected">--请选择科目--</option>
	 	</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>年级</td>
	 	<td>
	 		<select name="gradeInformation.grade_id" onchange="changeGrade('<c:url value='/courseAction/getClassById'/>',this.value)" emptyInfo="请选择年级">
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
	 	<select id="classinfo" name="classInformation.class_id" emptyInfo="请选择班级" disabled="disabled" style="width:200px;">
	 		<option value="0" selected="selected">--请选择班级--</option>
	 	</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>教师</td>
	 	<td>
	 	<select id="teacher" name="teacherInformation.tea_id" emptyInfo="请选择教师" disabled="disabled" style="width:200px;">
	 		<option value="0" selected="selected">--请选择教师--</option>
	 	</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>课程说明</td>
	 	<td>
	 	<textarea name="course_remark" size="50" maxLength="100" lengthInfo="最大长度不能超过100！" style="width:270px;height:100px" ></textarea>
	 	</td>
	 	</tr>
	 	<tr align="center">
	 	<td colspan="2"><input type="submit" value="添加课程" class="btn"></td>
	 	</tr>
	</table>
	</form>
  </body>
</html>
