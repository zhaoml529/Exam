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
    
    <title>添加班级</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  </head>  
  <body>
	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0
		style=" margin-top:0px">
		<tr>
			<td class="manageHead">当前位置：院系管理&nbsp;-&gt;班级管理&nbsp;-&gt;添加班级</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn"
		onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='/department/saveclass' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">添加班级</td>
			</tr>
			<tr>
				<td>班级名称</td>
				<td>
					<input type="text" name="class_name" size="40"  />
				</td>                                                     
			</tr>
			<tr>
				<td>建班时间</td>
				<td>
					<input type="text" name="class_date" size="40"  />
				</td>                                                     
			</tr>
			<tr>
				<td>所在年级</td>
				<td>
	 		<select name="gradeInforMation.grade_id" emptyInfo="请选择年级">
	 		    <option value=""> -- 请选择年级 -- </option>
	 		    <c:forEach items="${gradeList}" var="gradeList">
	 		    <option value="<c:out value='${gradeList.grade_id}'/>"><c:out value='${gradeList.grade_name}'/></option>
	 		    </c:forEach>
	 		</select>
	 	</td>
			</tr>
			<tr>
				<td>班级说明</td>
				<td>
					<input type="text" name="class_remark" size="40"  />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" class="btn"
					value="添加" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
