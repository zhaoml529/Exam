<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_ModuleAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
		function revoke(url, action_id, module_id){
			document.moduleform.action=url + action_id + "/"+ module_id;
		    document.moduleform.submit();
		}
	</script>

  </head>
  
  <body>
  	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：权限管理&nbsp;-&gt;模块信息管理</td>
        </tr>
    </table>
  	<input type="button" value="返回" class="btn" onclick="javascript:location.href='<c:url value="/right/listModule/pageNum/1"/>'" style=" margin-bottom:10px">
	<form name="moduleform" method="post">
		<table align="center" class="default" width="600px">
			<tr class="title">
				<td colspan="4">功能列表</td>
			</tr>
			<tr>
				<td align="center">功能ID</td>
				<td align="center">功能名称</td>
				<td align="center">功能描述</td>
				<td align="center">操作</td>
			</tr>
			<c:forEach items="${actionList }" var="actionList">
			<tr>
				<td align="center">${actionList.action_id }</td>
				<td align="center" width="110">${actionList.action_name }</td>
				<td align="center">${actionList.action_remark }</td>
				<td align="center">
				<c:set var="flag" value="0"></c:set>
				<c:forEach items="${groupAMList }" var="groupAMList">
				  <c:if test="${groupAMList.action.action_id == actionList.action_id}">
				  	<input type="checkbox" onclick="revoke('<c:url value='/right/deleteGroupAM/'/>',${actionList.action_id},${module_id});" checked="checked"/>
				  <c:set var="flag" value="1"></c:set>
				  </c:if>
				</c:forEach>
				<c:if test="${flag!='1' }">
					<input type="checkbox" onclick="revoke('<c:url value='/right/addGroupAM/'/>',${actionList.action_id},${module_id});"/>
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
