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
    
    <title>专业信息修改</title>
    
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
			<td class="manageHead">当前位置：课程管理&nbsp;-&gt;专业管理&nbsp;-&gt;专业信息修改</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn"
		onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='courseAction/updateProfession' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">修改专业信息</td>
			</tr>
			<tr>
				<td>专业名称</td>
				<td>
					<input type="text" name="profession_name" size="40" value="${professionInformation.profession_name }" />
				</td>                                                     
			</tr>
			<tr>
				<td>所属院系</td>
				<td>
	 		<select name="departmentInformation.department_id" emptyInfo="请选择院系">
	 		    <option value=""> -- 请选择院系-- </option>
	 		    <c:forEach items="${deptList}" var="deptList">
	 		    	<c:choose>
	 		    		<c:when test="${deptList.department_id == professionInformation.departmentInformation.department_id}">
	 		    			<option value="<c:out value='${professionInformation.departmentInformation.department_id}'/>" selected="selected"><c:out value='${professionInformation.departmentInformation.department_name}'/></option>
	 		    		</c:when>
	 		    		<c:otherwise>
	 		    			<option value="<c:out value='${deptList.department_id}'/>"><c:out value='${deptList.department_name}'/></option>
	 		    		</c:otherwise>
	 		    	</c:choose>
	 		    </c:forEach>
	 		</select>
	 	</td>
			</tr>
			<tr>
				<td>专业说明</td>
				<td>
					<input type="text" name="class_remark" size="40" value="${professionInformation.profession_remark == null?'无':professionInformation.profession_remark}" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" class="btn"
					value="修改" />
				</td>
			</tr>
		</table>
             <input type="hidden" name="profession_id" size="40" value="${professionInformation.profession_id }" />
	</form>
</body>
</html>
