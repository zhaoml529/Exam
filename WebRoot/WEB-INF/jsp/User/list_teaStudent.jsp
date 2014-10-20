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
    
    <title>My JSP 'list_teaStudent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />

  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=8 style="" width="100%" border=0 style=" margin-top:0px">
	        <tr>
	          <td class="manageHead">当前位置：学生列表</td>
	        </tr>
	        <tr>
	        <td height=2></td></tr>
	</table>
     <br/><br/>
     <c:choose>
     	<c:when test="${empty classSet }"></c:when>
     	<c:otherwise>
     	<c:forEach items="${classSet }" var="classSet">
     	<input type="button" class="btn" value="${classSet.class_name }" onclick="javascript:location.href='<c:url value='/user/listTeaStudent/${classSet.class_id }'/>'"/>
     	</c:forEach>
     </c:otherwise>
     </c:choose>
     <table align="center" class="default" width="800px">
	   <col width="12%" align="center" /><!-- 1 -->
		<col width="6%" align="center" /><!-- 2 -->
		<col width="5%" align="center" /><!-- 3 -->
		<col width="5%" align="center" /><!-- 4 -->
		<col width="5%" align="center" /><!-- 5 -->
		<col width="3%" align="center" /><!-- 6 -->
		<col width="5%" align="center" /><!-- 7 -->
		<tr class="title">
			<td>学生编号</td><!-- 1 -->
			<td>学生姓名</td><!-- 2 -->
			<td>学生所属机构</td><!-- 3 -->
			<td>学生年级</td><!-- 4 -->
			<td>学生专业</td><!-- 5 -->
			<td>学生班级</td><!-- 6 -->
			<td>学生说明</td><!-- 7 -->
		</tr>
		<c:choose>
			<c:when test="${empty studentList}">
				<tr>
					<td colspan="7" align="center">暂无学生列表</td>
				</tr>
			</c:when>
			<c:otherwise>
		<c:forEach items="${studentList}" var="studentList">
		<tr class="changeColor" align="center">
		    <td><c:out value="${studentList.stu_id}"/></td>
			<td><c:out value="${studentList.stu_name}"/></td>
			<td><c:out value="${studentList.departmentInformation.department_name}"/></td>
			<td><c:out value="${studentList.gradeInformation.grade_name}"/></td>
			<td><c:out value="${studentList.professionInformation.profession_name}"/></td>
			<td><c:out value="${studentList.classInformation.class_name}"/></td>
			<td><c:out value="${studentList.stu_remark == null?'无':studentList.stu_remark}"/></td>
		</tr>	
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</table>
  </body>
</html>
