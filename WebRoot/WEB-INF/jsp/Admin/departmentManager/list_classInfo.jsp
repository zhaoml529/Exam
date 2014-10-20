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
    
    <title>班级列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
		function jumpPage(url){
			location.href=url+$("#pageNum").val();
		}
	</script>

  </head>
  
  <body>
    <table align="center" class="default" width="600px">
	   <col width="5%" align="center" />
		<col width="6%" align="center" />
		<col width="5%" align="center" />
		<col width="5%" align="center" />
		<col width="5%" align="center" />
		<col width="5%" align="center" />
		<tr class="title">
			<td>班级编号</td>			
			<td>班级名称</td>
			<td>年级</td>
			<td>建班时间</td>
			<td>班级说明</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty classinformation}">
				<tr>
					<td colspan="6" align="center">暂无班级列表</td>
				</tr>
			</c:when>
			<c:otherwise>
		<c:forEach items="${classinformation}" var="classinformation">
		<tr class="changeColor">
		    <td><c:out value="${classinformation.class_id}"/></td>
			<td><c:out value="${classinformation.class_name}"/></td>
			<td><c:out value="${classinformation.gradeInforMation.grade_name}"/></td>
			<td><c:out value="${classinformation.class_date}"/></td>
			<td><c:out value="${classinformation.class_remark == null?'无':classinformation.class_remark}"/></td>
			<td>
				<a href="<c:url value='/department/updateClassById/${classinformation.class_id }'/>">修改</a>
				<a href="<c:url value='/department/deleteClass/${classinformation.class_id }'/>" onclick="return confirm('确定删除此班级吗?');">删除</a>
		   </td>
		</tr>	
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</table>
	<c:if test="${!empty classinformation }">
	<table align="center" width="500">
    <tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="<c:url value="/department/listClass/pageNum/1"/>">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="<c:url value="/department/listClass/pageNum/${pageBean.prePage}"/>">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="<c:url value="/department/listClass/pageNum/${pageBean.nextPage}"/>">下一页</a></c:if>
    	<a href="<c:url value="/department/listClass/pageNum/${pageBean.totalPage}"/>">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/usermanager/listTClass/pageNum/'/>');">
    	</td>
    </tr>
    </table>
	</c:if>
  </body>
</html>
