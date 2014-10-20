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
    
    <title>My JSP 'list_course.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value='/js/page.js'/>" charset="UTF-8"></script>
  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=8 style="" width="100%" border=0 style=" margin-top:0px">
	        <tr>
	          <td class="manageHead">当前位置：课程信息</td>
	        </tr>
	        <tr>
	        <td height=2></td></tr>
	</table>
     <br/><br/>
  	<table align="center" class="default">
  		<col width="5%" align="center" />
		<col width="15%" align="center"/>
		<col width="15%" align="center" />
		<col width="8%" align="center" />
		<col width="5%" align="center" />
		<col width="10%" align="center" />
		<col width="8%" align="center" />
		<col width="8%" align="center" />
		<tr class="title">
			<td align="center">课程编号</td>
			<td align="center">机构名称</td>
			<td align="center">专业名称</td>
			<td align="center">科目名称</td>
			<td align="center">年级名称</td>
			<td align="center">班级名称</td>
			<td align="center">教师姓名</td>
			<td align="center">课程说明</td>
		</tr>
		<c:choose>
			<c:when test="${empty courselist }">
				<tr>
					<td colspan="8" align="center">没有数据</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${courselist}" var="courselist">
			<tr class="changeColor" align="center">
				<td>${courselist.course_id}</td>
				<td>${courselist.departmentInformation.department_name}</td>
				<td>${courselist.professionInformation.profession_name }</td>
				<td>${courselist.subject.subject_name}</td>
				<td>${courselist.gradeInformation.grade_name}</td>
				<td>${courselist.classInformation.class_name}</td>
				<td>${courselist.teacherInformation.tea_name}</td>
				<td>${courselist.course_remark}</td>
			</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<form name="pageFrom" method="post">
	<table align="center" width="500">
    <tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="javascript:jumpPage('<c:url value="/user/listCourse/pageNum/"/>',${1});">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="javascript:jumpPage('<c:url value="/user/listCourse/pageNum/"/>',${pageBean.prePage});">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="javascript:jumpPage('<c:url value="/user/listCourse/pageNum/"/>',${pageBean.nextPage});">下一页</a></c:if>
    	<a href="javascript:jumpPage('<c:url value="/user/listCourse/pageNum/"/>',${pageBean.totalPage});">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/user/listCourse/pageNum/'/>',${0 });">
    	</td>
    </tr>
    </table>
  	</form>
  	</body>
</html>
