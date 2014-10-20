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

  </head>
  
  <body>
      <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
	        <tr>
	          <td class="manageHead">当前位置：考试状态管理</td>
	        </tr>
	        <tr>
	        <td height=2></td></tr>
	  </table>
	  <input type="button" class="btn" value="添加状态" onclick="window.location.href='<c:url value='/courseAction/addExamNature'/>'"/>
	  <table align="center" class="default" width="600px">
			<tr class="title">
				<td align="center">状态编号</td>
				<td align="center">状态名称</td>
				<td align="center">状态描述</td>
				<td align="center">操作</td>
			</tr>
			<c:choose>
				<c:when test="${empty natureList }">
					<tr>
						<td colspan="4" align="center">没有数据</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${natureList }" var="natureList">
						<tr class="changeColor" align="center">
							<td>${natureList.nature_id}</td>
							<td>${natureList.nature_name}</td>
							<td>${natureList.nature_remark }</td>
							<td>
								<a href="<c:url value='/courseAction/updateExamNatureById/${natureList.nature_id }'/>">修改</a>
								|
								<a href="<c:url value='/courseAction/deleteExamNatureAction/${natureList.nature_id  }'/>" onclick="return confirm('确定删除此功能吗?');">删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

	</body>
</html>