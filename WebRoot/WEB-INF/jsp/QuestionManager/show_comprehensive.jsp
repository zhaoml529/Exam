<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show_comprehensive.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
  </head>
<body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：题库管理&nbsp;-&gt;试题题库管理&nbsp;-&gt;查看试题详细信息</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
    <table class="default" width="1100px">
				<tr class="title">
					<td colspan="2">查看试题详细信息</td>					
				</tr>
				<tr><td>综合题编号</td><td>${comprehensive.question_id }</td></tr>
				<tr><td>综合题题目</td><td>${comprehensive.question_title }</td></tr>
				<tr><td>试题描述</td><td>${comprehensive.question_body }</td></tr>
				<tr><td>正确答案</td><td>${comprehensive.question_answer }</td></tr>
				<tr><td>试题难度</td><td>${comprehensive.difficulty }</td></tr>
				<tr><td>所属科目</td><td>${comprehensive.subject.subject_name }</td></tr>
				<tr><td>年级</td><td>${comprehensive.grade.grade_name }</td></tr>
				<tr><td>添加人</td><td>${comprehensive.add_person }</td></tr>
				<tr><td>添加时间</td><td>${comprehensive.add_time }</td></tr>
				<tr><td>试题分值</td><td>${comprehensive.question_score }</td></tr>
				<tr><td>试题备注</td><td>${comprehensive.question_remark }</td></tr>
	 </table>
  </body>
</html>
