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
    
    <title>班级列表</title>
    
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
          <td class="manageHead">当前位置：机构管理&nbsp;-&gt;班级管理</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
      <div style=" margin-bottom:10px;display:inline;">
       <input type="button" value="添加班级" class="btn" onclick="location.href='<c:url value='/department/addClass'/>'"/>
    </div>
     <br/>
     <td >年级：</td>
    <form action="<c:url value='/department/listClass/pageNum/1'/>" method="post">
    <select name="grade_id" emptyInfo="请选择年级" style="width:150px;">
	 	<option value="">--请选年级--</option>
	 	<c:forEach items="${gradeList}" var="gradeList">
	 		<option value="${gradeList.grade_id}">${gradeList.grade_name}</option>
	 	</c:forEach>
     </select>  
     <input type="submit" class="btn"  value="查找">
     </form>
     <br/><br/>
     <c:import url="/department/listClassBygradeID"></c:import>
  </body>
</html>
