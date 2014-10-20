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
    
    <title>学生信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />

  </head>
  
<body>
  	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：人员管理&nbsp;-&gt;学生信息&nbsp;-&gt;详细信息</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table><br/>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
    <div align="center">
	<table width="500" class="default" >
		<tr class="title">
			<td colspan="2">个人信息</td>
		</tr>
		<tr>
	    <td align="center" width="200">学生编号</td>
			<td>${studentInformation.stu_id }</td>
		</tr>
		<tr>
			<td align="center" >姓名</td>
			<td>${studentInformation.stu_name}</td>
		</tr>
		<tr>
			<td align="center" >性别</td>
			<td>${studentInformation.stu_sex==1?'男':'女'}</td>
		</tr>
		<tr>
			<td align="center" >出生日期</td>
			<td>${studentInformation.stu_birthday}</td>
		</tr>
		<tr>
			<td align="center" >籍贯</td>
			<td>${studentInformation.stu_address}</td>
		</tr>
		<tr>
			<td align="center" >政治面貌</td>
			<td>${studentInformation.stu_polity}</td>
		</tr>
		<tr>
			<td align="center" >年级</td>
			<td>${studentInformation.gradeInformation.grade_name}</td>
		</tr>
		<tr>
			<td align="center" >专业方向</td>
			<td>${studentInformation.professionInformation.profession_name}</td>
		</tr>
		<tr>
			<td align="center" >班级</td>
			<td>${studentInformation.classInformation.class_name}</td>
		</tr>
		<tr>
			<td align="center" >班级职务</td>
			<td>${studentInformation.role.role_name == null?'无':studentInformation.role.role_name}</td>
		</tr>
		<tr>
			<td align="center" >备注</td>
			<td>${studentInformation.stu_remark == null?'无':studentInformation.stu_remark }</td>
		</tr>
	</table>
	</div>
  </body>
</html>
