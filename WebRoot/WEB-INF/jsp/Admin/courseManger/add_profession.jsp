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
    
    <title>添加专业</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>

  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：课程管理&nbsp;-&gt;专业设置&nbsp;-&gt;添加专业</td>
        </tr>
        <tr>
          <td height=2></td>
        </tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
	<form action="<c:url value='/courseAction/saveProfession'/>" method="post" onsubmit="return validateForm(this)" >
		<table class="default" align="center" width="600px">
		<tr class="title">
			<td colspan="5">&nbsp;添加专业信息</td>
		</tr>
		<tr>
			<td>专业名称</td>
				<td>
					<input type="text" name="profession_name"  emptyInfo="请填写专业名称"  size="40" />
				</td>
			</tr>
	 	<tr>
	 	<td><span class="note"> * </span>院系</td>
	 	<td>
	 	<select id="dept_id" name="departmentInformation.department_id" emptyInfo="请选择院系" style="width:200px;">
	 		<option value="">--请选择院系--</option>
	 		<c:forEach items="${deptList}" var="deptList">
	 			<option value="${deptList.department_id}">${deptList.department_name}</option>
	 		</c:forEach>
     	</select>
	 	</td>
	 	</tr>
	 	
	 	<tr>
	 	<td><span class="note"> * </span>专业说明</td>
	 	<td>
	 	<textarea name="profession_remark" size="50" maxLength="100" lengthInfo="最大长度不能超过100！" style="width:270px;height:100px" ></textarea>
	 	</td>
	 	</tr>
	 	<tr align="center">
	 	<td colspan="2"><input type="submit" value="添加专业" class="btn"></td>
	 	</tr>
	</table>
	</form>
  </body>
</html>
