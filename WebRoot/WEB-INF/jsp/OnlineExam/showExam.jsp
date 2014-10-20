<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>在线考试</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	
	 OnlineJudge.countdown();
	
	});
	</script> 
	<script type="text/javascript">
		function doExam(url){
			document.doExamTask.action=url;
			document.doExamTask.submit();
			
		}
	</script>

  </head>
  
  <body>
  	  <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
	        <tr>
	          <td class="manageHead">当前位置：在线考试</td>
	        </tr>
	        <tr>
	        <td height=2>&nbsp;</td></tr>
	  </table>
   <form name="doExamTask" method="post"  target="_blank" >
     <div>说明: 在考试期间不要刷新网页，在所有题型的题都答完后，点击试卷下面的"我要交卷"按钮结束本场考试。</div>
     <table width="100%" class="default">
		<col width="15%" align="center" />
		<col width="5%" align="center" />
		<col width="5%" align="center" />
		<col width="10%" align="center" />
		<col width="15%" align="center" />
		<col width="15%" align="center" />
		<col width="15%" align="center" />
		<col width="8%" align="center" />
		<col width="10%" align="center" />
		<tr class="title">
			<td>考试科目</td>
			<td>考试性质</td>
			<td>考试老师</td>
			<td>考试班级</td>
			<td>考试时间</td>
			<td>考试状态</td>
			<td>考试地点</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty examTaskList}">
				<tr>
					<td colspan="9" align="center">暂无考试任务</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:forEach items="${examTaskList}" var="taskList">
			<tr class="changeColor" align="center">
				<td>${taskList.subject.subject_name}</td>
				<td>${taskList.examNature.nature_name}</td>
				<td>${taskList.teacherInformation.tea_name}</td>
				<td><c:set value="${ fn:split(taskList.class_id, ',') }" var="class_id" />
					<c:forEach items="${classList }" var="classList">
						<c:forEach items="${class_id }" var="classid">
							<c:if test="${classList.class_id == classid }">
								${classList.class_name }
							</c:if>						
						</c:forEach>
					</c:forEach>
				</td>
				<td title="From ${taskList.examTask_start} to ${taskList.examTask_end}">
					${taskList.examTask_start}
				</td>
				<td title="From ${taskList.examTask_start} to ${taskList.examTask_end}">
					<c:choose>
						<c:when test="${'PENDING' eq taskList.examTask_status}">
							等待考试 &nbsp;<span style="color:red" class="countdown">${taskList.examTask_leftTime}</span>
						</c:when>
						<c:when test="${'RUNNING' eq taskList.examTask_status}">
							<span style="color:red;"><b>考试中 &nbsp;</b></span><span style="color:red" class="countdown">${taskList.examTask_leftTime}</span>
						</c:when>
						<c:otherwise>
							考试结束
						</c:otherwise>
					</c:choose>
				</td>
				<td>${taskList.examTask_address}</td>
				<td>${taskList.examTask_remark == null ?"无":taskList.examTask_remark}</td>
				<td>
					<c:choose>
						<c:when test="${'PENDING' eq taskList.examTask_status}">
							等待考试...
						</c:when>
						<c:when test="${'RUNNING' eq taskList.examTask_status}">
							<input type="button" value="开始考试" class="btn"  onclick="if(confirm('姓名:${user_name }\n学号:${user_id }\n\n确认开始本次考试吗?')) doExam('<c:url value='/examine/createExamine/${taskList.examTask_id }'/>')"  style="color: red">
						</c:when>
						<c:otherwise>
							考试结束...
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		</table>
     </form>
  </body>
</html>
