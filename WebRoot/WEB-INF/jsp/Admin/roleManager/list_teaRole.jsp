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
    
    <title>My JSP 'list_teaRole.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/page.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：权限管理&nbsp;-&gt;教师权限管理</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table><br>
    <form action="<c:url value='/right/listTeaRole/pageNum/1'/>" method="post">
    <select name="department_id" emptyInfo1="请选择院系" style="width:150px;">
	 	<option value="">--请选择院系--</option>
	 	<c:forEach items="${deptList}" var="deptList">
	 		<option value="${deptList.department_id}">${deptList.department_name}</option>
	 	</c:forEach>
     </select>  
     <input type="submit" class="btn"  value="查找">
     </form>
     <br/><br/>
     <c:import url="/right/listTeaRoleBydeptID"></c:import>
  </body>
</html>
