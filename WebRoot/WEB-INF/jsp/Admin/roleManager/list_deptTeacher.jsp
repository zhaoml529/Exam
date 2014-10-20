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
    
    <title>My JSP 'list_deptTeacher.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
		function jumpPage(url,pageNum){
			if(pageNum == 0){
				document.pageFrom.action=url+$("#pageNum").val();
			}else{
				document.pageFrom.action=url+pageNum;
			}
		    document.pageFrom.submit();
		}
	</script>

  </head>
  
  <body>
    <table align="center" class="default" width="600px">
	   <col width="12%" align="center" /><!-- 1 -->
		<col width="6%" align="center" /><!-- 3 -->
		<col width="5%" align="center" /><!-- 6 -->
		<col width="3%" align="center" /><!-- 7 -->
		<col width="5%" align="center" /><!-- 10 -->
		<tr class="title">
			<td>教师编号</td><!-- 1 -->
			<td>教师名字</td><!-- 3 -->
			<td>教师所属机构</td><!-- 6 -->
			<td>教师说明</td><!-- 8 -->
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty teacherinformation}">
				<tr>
					<td colspan="5" align="center">暂无教师列表</td>
				</tr>
			</c:when>
			<c:otherwise>
		<c:forEach items="${teacherinformation}" var="teacherinformation">
		<tr class="changeColor">
		    <td><c:out value="${teacherinformation.tea_id}"/></td>
			<td><c:out value="${teacherinformation.tea_name}"/></td>
			<td><c:out value="${teacherinformation.departmentInformation.department_name}"/></td>
			<td><c:out value="${teacherinformation.tea_remark == null?'无':teacherInformation.tea_remark}"/></td>
			<td>
				<a href="<c:url value="/right/revokeTeaRoleById/${teacherinformation.tea_id}"/>">分配角色</a>
			</td>
		</tr>	
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</table>
	<c:if test="${!empty teacherinformation }">
	<form name="pageFrom" method="post">
	<table align="center" width="500">
    <tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="javascript:jumpPage('<c:url value="/right/listTeaRole/pageNum/"/>',${1});">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="javascript:jumpPage('<c:url value="/right/listTeaRole/pageNum/"/>',${pageBean.prePage});">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="javascript:jumpPage('<c:url value="/right/listTeaRole/pageNum/"/>',${pageBean.nextPage});">下一页</a></c:if>
    	<a href="javascript:jumpPage('<c:url value="/right/listTeaRole/pageNum/"/>',${pageBean.totalPage});">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/right/listTeaRole/pageNum/'/>',${0 });">
    	</td>
    </tr>
    </table>
    <input type="hidden" name="department_id" value="${department_id }"/>
    </form>
	</c:if>
  </body>
</html>
