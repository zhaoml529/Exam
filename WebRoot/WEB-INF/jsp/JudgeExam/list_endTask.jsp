<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>结束任务列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/page.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>

  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：查看成绩&nbsp;-&gt;考试任务</td>
        </tr>
    </table>
	<br/><br/>
	<div><span style="color: red">已经结束的考试可查看成绩</span></div><br/>
	<table class="default" width="100%">
	   	<col width="5%" align="center"/>
		<col width="5%" align="center"/>
		<col width="10%" align="center"/>
		<col width="8%" align="center"/>
		<col width="5%" align="center"/>
		<col width="10%" align="center"/>
		<col width="13%" align="center"/>
		<col width="10%" align="center"/>
		<col width="8%" align="center"/>
		<col width="8%" align="center"/>
		<tr class="title">
			<td>考试ID</td>
			<td>考试试卷</td>
			<td>考试科目</td>
			<td>考试性质</td>
			<td>考试老师</td>
			<td>考试年级</td>
			<td>考试时间</td>
			<td>考试地点</td>
			<td>考试状态</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty examTaskList}">
				<tr>
					<td colspan="10" align="center">暂无考试任务</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${examTaskList}" var="examTaskList">
				<tr class="changeColor" align="center">
					<td>${examTaskList.examTask_id}</td>
					<td>${examTaskList.examPaper.exam_name}</td>
					<td>${examTaskList.subject.subject_name}</td>
					<td>${examTaskList.examNature.nature_name}</td>
					<td>${examTaskList.teacherInformation.tea_name}</td>
					<td>${examTaskList.examPaper.gradeInformation.grade_name }</td>
					<td title="From ${examTaskList.examTask_start} to ${examTaskList.examTask_end}">${examTaskList.examTask_start}</td>
					<td>${examTaskList.examTask_address}</td>
					<td title="From ${examTaskList.examTask_start} to ${examTaskList.examTask_end}">
						<span style="color:grey">考试结束</span>
					</td>	
					<td>
						<a href="<c:url value='/judge/showScore/${examTaskList.examTask_id}'/>">查看考试成绩</a>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<c:if test="${!empty examTaskList }">
		<form name="pageFrom" method="post">
		<table align="center" width="500">
    	<tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean_end.currentPage}"/>页
    	共<c:out value="${pageBean_end.totalPage}"/>页
    	<a href="<c:url value='/judge/listExamTask/pageNum/1'/>">首页</a>
    	<c:if test="${pageBean_end.hasPreviousPage == true}"><a href="<c:url value='/judge/listExamTask/pageNum/${pageBean_end.prePage}'/>">上一页</a></c:if>
    	<c:if test="${pageBean_end.hasNextPage == true}"><a href="<c:url value='/judge/listExamTask/pageNum/${pageBean_end.nextPage}'/>">下一页</a></c:if>
    	<a href="<c:url value='/judge/listExamTask/pageNum/${pageBean_end.totalPage}'/>">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean_end.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/judge/listExamTask/pageNum/'/>',${0 });">
    	</td>
    </tr>
    </table>
    </form>
    </c:if>
  </body>
</html>
