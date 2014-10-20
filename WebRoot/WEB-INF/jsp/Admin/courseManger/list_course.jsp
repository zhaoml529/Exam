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
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
	        <tr>
	          <td class="manageHead">当前位置：课程设置</td>
	        </tr>
	        <tr>
	        <td height=2></td></tr>
	</table>
	<input type="button" class="btn" value="添加课程" onclick="window.location.href='<c:url value='/courseAction/addCourse'/>'"/>
  	<form action="<c:url value='/courseAction/listCourse/pageNum/1'/>" method="post">
    	 院系：
    	 <select id="dept_id" name="department_id" onchange="changeDepartment('<c:url value='/courseAction/getProfessionById'/>',this.value);" emptyInfo="请选择院系" style="width:150px;">
	 		<option value="">--请选择院系--</option>
	 		<c:forEach items="${deptList}" var="deptList">
	 			<option value="${deptList.department_id}">${deptList.department_id}-${deptList.department_name}</option>
	 		</c:forEach>
     	</select>
	 	专业：
	 	<select id="professional" name="professional_id" onchange="changeProfessional('<c:url value='/courseAction/getSubjectById'/>',this.value)" emptyInfo="请选择专业" disabled="disabled" style="width:150px;">
	 		<option value="0" selected="selected">--请选择专业--</option>
	 	</select> 
	 	科目：
	 	<select id="subject" name="subject_id" emptyInfo="请选择科目" disabled="disabled" style="width:150px;">
	 		<option value="0" selected="selected">--请选择科目--</option>
	 	</select>
     <input type="submit" class="btn"  value="查找">
     </form>
     <br/><br/>
  	

  	<table align="center" class="default" width="800px">
  		<col width="5%" align="center" />
		<col width="15%" align="center"/>
		<col width="15%" align="center" />
		<col width="8%" align="center" />
		<col width="5%" align="center" />
		<col width="10%" align="center" />
		<col width="8%" align="center" />
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
			<td align="center">操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty courseList }">
				<tr>
					<td colspan="9" align="center">此科目没有课程安排</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${courseList}" var="courseList">
			<tr class="changeColor" align="center">
				<td>${courseList.course_id}</td>
				<td>${courseList.departmentInformation.department_name}</td>
				<td>${courseList.professionInformation.profession_name }</td>
				<td>${courseList.subject.subject_name}</td>
				<td>${courseList.gradeInformation.grade_name}</td>
				<td>${courseList.classInformation.class_name}</td>
				<td>${courseList.teacherInformation.tea_name}</td>
				<td>${courseList.course_remark}</td>
				<td>
				<!-- 	<a href="<c:url value='/courseAction/updateCourseById/${courseList.course_id}'/>">修改</a> -->
					<a href="<c:url value='/courseAction/deleteCourse/${courseList.course_id}'/>">删除</a>
				</td>
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
    	<a href="javascript:jumpPage('<c:url value="/courseAction/listCourse/pageNum/"/>',${1});">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="javascript:jumpPage('<c:url value="/courseAction/listCourse/pageNum/"/>',${pageBean.prePage});">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="javascript:jumpPage('<c:url value="/courseAction/listCourse/pageNum/"/>',${pageBean.nextPage});">下一页</a></c:if>
    	<a href="javascript:jumpPage('<c:url value="/courseAction/listCourse/pageNum/"/>',${pageBean.totalPage});">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/courseAction/listCourse/pageNum/'/>',${0 });">
    	</td>
    </tr>
    </table>
    <input type="hidden" name="department_id" value="${department_id }"/>
    <input type="hidden" name="professional_id" value="${professional_id }"/>
    <input type="hidden" name="subject_id" value="${subject_id }"/>
  	</form>
  	</body>
</html>
