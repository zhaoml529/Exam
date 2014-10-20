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
    
    <title>My JSP 'add_RoleModuleAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
		function revoke(url, role_id, am_id){
			document.roleForm.action=url + role_id + "/"+ am_id;
		    document.roleForm.submit();
		}
	</script>

  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：权限管理&nbsp;-&gt;角色信息管理&nbsp;-&gt;分配角色权限</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="window.location.href='<c:url value='/right/listRole/pageNum/1'/>'"><br><br/>
  <div align="center">
  <form name="roleForm" method="POST" >
    <table class="default" width="700px">
     	<col width="5%" align="center" />
		<col width="20%" align="center"/>
		<col width="20%" align="center" />
		<col width="55%" align="center" />
    	<tr class="title">
    		<td>模块编号</td>
    		<td>模块名称</td>
    		<td>模块地址</td>
    		<td>分配操作权限</td>
    	</tr>
    	<c:forEach items="${moduleList }" var="moduleList">
    	<tr>
    		<td>${moduleList.module_id }
    		<td>${moduleList.module_name }</td>
    		<td>${moduleList.module_URL }</td>
    		<td align="center">
    		<c:forEach items="${groupAMList }" var="amList">
    			<c:set var="flag" value="0"></c:set>
    			<c:if test="${amList.module.module_id == moduleList.module_id }">
    				<c:forEach items="${groupRAMList }" var="ramList">
    					<c:if test="${ramList.groupAM.module.module_id == moduleList.module_id && ramList.groupAM.action.action_id == amList.action.action_id}">
    						<input type=checkbox  onclick="revoke('<c:url value='/right/deleteGroupRAM/'/>',${role_id },${amList.AM_id });" checked="checked">${amList.action.action_remark }
    						<c:set var="flag" value="1"></c:set>
    					</c:if>
    				</c:forEach>
    				<c:if test="${flag!='1' }">
						<input type="checkbox" onclick="revoke('<c:url value='/right/addGroupRAM/'/>',${role_id },${amList.AM_id });">${amList.action.action_remark }
					</c:if>
    			</c:if>
    		</c:forEach>
    		</td>
    		</tr>
    	</c:forEach>
    </table>
    </form>
    </div>
  </body>
</html>
