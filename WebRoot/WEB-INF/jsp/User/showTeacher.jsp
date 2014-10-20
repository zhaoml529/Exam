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
    
    <title>My JSP 'showTeacher.jsp' starting page</title>
    
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
          <td class="manageHead">当前位置：信息设置&nbsp;-&gt;个人信息</td>
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
			<td align="center" width="200">教师编号</td>
			<td align="center">${teacherInformation.tea_id }</td>
		</tr>
		<tr>
			<td align="center">教师姓名</td>
			<td align="center">${teacherInformation.tea_name}</td>
		</tr>
		<tr>
			<td align="center">教师性别</td>
			<td align="center">${teacherInformation.tea_sex == 1?'男':'女'}</td>
		</tr>
		<tr>
			<td align="center">教师年龄</td>
			<td align="center">${teacherInformation.peopleAge.age_id }</td>
		</tr>
				<tr>
			<td align="center">教师学历</td>
			<td align="center">${teacherInformation.eduBackGround.eduBackGround_name }</td>
		</tr>
		<tr>
			<td align="center">教师所属机构</td>
			<td align="center">${teacherInformation.departmentInformation.department_name}</td>
		</tr>
		<tr>
			<td align="center">联系方式</td>
			<td align="center">${teacherInformation.tea_tel}</td>
		</tr>
		<tr>
			<td align="center">教师说明</td>
			<td align="center">${teacherInformation.tea_remark == null?'无':teacherInformation.tea_remark}</td>
		</tr>
	</table>
	</div>
  </body>
</html>
