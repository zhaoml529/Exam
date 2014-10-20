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
    
    <title>My JSP 'add_teacherRole.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
		function revoke(url, tea_id, role_id){
			document.teaForm.action=url + tea_id + "/"+ role_id;
		    document.teaForm.submit();
		}
	</script>
  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：权限管理&nbsp;-&gt;教师权限管理&nbsp;-&gt;分配教师角色</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:location.href='<c:url value="/right/listTeaRole/pageNum/1"/>'"><br/><br/>
  	<form name="teaForm" method="POST" >
      <table width="600px" align="center" class="default">
      <col width="10%" align="center">
      <col width="30%" align="center">
      <col width="40%" align="center">
      <col width="20%" align="center">
      	<tr class="title">
      		<td>角色编号</td>
      		<td>角色名称</td>
      		<td>角色描述</td>
      		<td>操作</td>
      	</tr>
      	<c:forEach items="${roleList }" var="roleList">
      	<tr>
      		<td>${roleList.role_id }</td>
      		<td>${roleList.role_name }</td>
      		<td>${roleList.role_remark }</td>
      		<td>
      		<c:set var="flag" value="0"></c:set>
      		<c:forEach items="${teaRoleList }" var="teaRoleList">
      			<c:if test="${roleList.role_id == teaRoleList.role.role_id }">
      				<input type=checkbox  onclick="revoke('<c:url value='/right/deleteTeaRole/' />',${tea_id },${roleList.role_id });" checked>
      				<c:set var="flag" value="1"></c:set>
      			</c:if>
      		</c:forEach>
      		<c:if test="${flag!=1 }">
      			<input type=checkbox  onclick="revoke('<c:url value='/right/addTeaRole/' />',${tea_id },${roleList.role_id });">
      		</c:if>
      		</td>
      	</tr>
      	</c:forEach>
      </table>
      </form>
  </body>
</html>
