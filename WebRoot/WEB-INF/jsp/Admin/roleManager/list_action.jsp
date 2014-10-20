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
    
    <title>My JSP 'list_action.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/page.js'/>" charset="UTF-8"></script>
  	<script type="text/javascript">
		function jumpPage(url){
			location.href=url+$("#pageNum").val();
		}
	</script>
  </head>
  
  <body>
      <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
	        <tr>
	          <td class="manageHead">当前位置：功能权限管理</td>
	        </tr>
	        <tr>
	        <td height=2></td></tr>
	  </table>
	  <input type="button" class="btn" value="添加功能" onclick="window.location.href='<c:url value='/right/addAction'/>'"/>
	  <table align="center" class="default" width="600px">
			<tr class="title">
				<td align="center">功能编号</td>
				<td align="center">功能名称</td>
				<td align="center">功能描述</td>
				<td align="center">操作</td>
			</tr>
			<c:choose>
				<c:when test="${empty actionList }">
					<tr>
						<td colspan="4" align="center">没有数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${actionList }" var="actionList">
						<tr class="changeColor">
							<td>${actionList.action_id }</td>
							<td>${actionList.action_name }</td>
							<td>${actionList.action_remark }</td>
							<td>
								<a href="<c:url value='/right/updateActionById/${actionList.action_id }'/>">修改</a>
								|
								<a href="<c:url value='/right/deleteAction/${actionList.action_id }'/>" onclick="return confirm('确定删除此功能吗?');">删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<table align="center" width="500">
    	<tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="<c:url value="/right/listAction/pageNum/1"/>">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="<c:url value="/right/listAction/pageNum/${pageBean.prePage}"/>">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="<c:url value="/right/listAction/pageNum/${pageBean.nextPage}"/>">下一页</a></c:if>
    	<a href="<c:url value="/right/listAction/pageNum/${pageBean.totalPage}"/>">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/right/listAction/pageNum/'/>');">
    	</td>
    </tr>
    </table>
	</body>
</html>
