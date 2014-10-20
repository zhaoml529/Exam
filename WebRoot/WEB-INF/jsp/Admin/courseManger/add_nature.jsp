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
    
    <title>My JSP 'update_action.jsp' starting page</title>
    
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
			<td class="manageHead">当前位置：添加考试状态</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn"
		onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='/courseAction/saveExamNature' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">添加状态</td>
			</tr>
			<tr>
				<td>状态名称</td>
				<td>
					<input type="text" name="nature_name"  emptyInfo="请填写状态名称"  size="40" />
				</td>
			</tr>
			<tr>
				<td>状态描述</td>
				<td>
					<input type="text" name="nature_remark" emptyInfo="请填写状态描述" size="40"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" class="btn"
					value="添加状态" />
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>
