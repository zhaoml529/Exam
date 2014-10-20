<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试任务</title>
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value="/js/page.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  	<script type="text/javascript" src="<c:url value="/js/examTime.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	
	 OnlineJudge.countdown();
	
	});
	</script> 
	<script type="text/javascript">
		
		function doExam(){
			return confirm("");
			document.getElementById("doExamTask").submit(); 
		}
	</script>
</head>
<body>
	<table cellSpacing=0 cellPadding=5 width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;考试任务</td>
        </tr>
    </table>
    <br/>
	<br/>
	<div><span style="color: red">正在进行与即将开始的考试</span></div><br/>
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
		<col width="10%" align="center"/>
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
			<td>备注</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty beginTaskList}">
				<tr>
					<td colspan="11" align="center">暂无考试任务</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${beginTaskList}" var="taskList">
				<tr class="changeColor" align="center">
					<td>${taskList.examTask_id}</td>
					<td>${taskList.examPaper.exam_name}</td>
					<td>${taskList.subject.subject_name}</td>
					<td>${taskList.examNature.nature_name}</td>
					<td>${taskList.teacherInformation.tea_name}</td>
					<td>${taskList.examPaper.gradeInformation.grade_name }</td>
					<td title="From ${taskList.examTask_start} to ${taskList.examTask_end}">${taskList.examTask_start}</td>
					<td>${taskList.examTask_address}</td>
					<td title="From ${taskList.examTask_start} to ${taskList.examTask_end}">
						<c:choose>
							<c:when test="${'PENDING' eq taskList.examTask_status}">
								等待考试 &nbsp;<span style="color:red" class="countdown">${taskList.examTask_leftTime}</span>
							</c:when>
							<c:when test="${'RUNNING' eq taskList.examTask_status}">
								<span style="color:red;"><b>考试中 &nbsp;</b></span><span style="color:red" class="countdown">${taskList.examTask_leftTime}</span>
							</c:when>
							<c:otherwise>
								<span style="color:grey">考试结束</span>
							</c:otherwise>
						</c:choose>
					</td>	
					<td>${taskList.examTask_remark == null?'无':taskList.examTask_remark}</td>
					<td>
						<c:choose>
							<c:when test="${'PENDING' eq taskList.examTask_status }">
								<a href="<c:url value='/exam/showExamTask/examTask_id/${taskList.examTask_id}'/>">查看</a>
								|
								<a href="<c:url value='/exam/updateExamTaskById/examTask_id/${taskList.examTask_id}'/>">修改</a>
								|
								<a href="<c:url value='/exam/deleteExamTask/examTask_id/${taskList.examTask_id}'/>" onclick="return confirm('确定删除该试卷?')">删除</a>
							</c:when>
							<c:when test="${'RUNNING' eq taskList.examTask_status }">
								<span style="color:grey">等待考试结束...</span>
							</c:when>
							<c:otherwise> <!-- ENDED -->
								<a href="<c:url value='/exam/showExamTask/examTask_id/${taskList.examTask_id}'/>">查看</a>
								|
								<a href="<c:url value='/exam/deleteExamTask/examTask_id/${taskList.examTask_id}'/>" onclick="return confirm('确定删除该试卷?')">删除</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<br/><br/>
	<div><span style="color: red">已经结束的考试</span></div><br/>
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
		<col width="10%" align="center"/>
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
			<td>备注</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty endTaskList}">
				<tr>
					<td colspan="11" align="center">暂无考试任务</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${endTaskList}" var="taskList">
				<tr class="changeColor" align="center">
					<td>${taskList.examTask_id}</td>
					<td>${taskList.examPaper.exam_name}</td>
					<td>${taskList.subject.subject_name}</td>
					<td>${taskList.examNature.nature_name}</td>
					<td>${taskList.teacherInformation.tea_name}</td>
					<td>${taskList.examPaper.gradeInformation.grade_name }</td>
					<td title="From ${taskList.examTask_start} to ${taskList.examTask_end}">${taskList.examTask_start}</td>
					<td>${taskList.examTask_address}</td>
					<td title="From ${taskList.examTask_start} to ${taskList.examTask_end}">
						<span style="color:grey">考试结束</span>
					</td>	
					<td>${taskList.examTask_remark == null?'无':taskList.examTask_remark}</td>
					<td>
						<a href="<c:url value='/exam/showExamTask/examTask_id/${taskList.examTask_id}'/>">查看</a>
						
					<!-- 	|<a href="<c:url value='/exam/deleteExamTask/examTask_id/${taskList.examTask_id}'/>" onclick="return confirm('确定删除该试卷?')">删除</a> -->
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<table align="center" width="500">
    	<tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean_end.currentPage}"/>页
    	共<c:out value="${pageBean_end.totalPage}"/>页
    	<a href="<c:url value='/exam/listExamTask/pageNum/1'/>">首页</a>
    	<c:if test="${pageBean_end.hasPreviousPage == true}"><a href="<c:url value='/exam/listExamTask/pageNum/${pageBean_end.prePage}'/>">上一页</a></c:if>
    	<c:if test="${pageBean_end.hasNextPage == true}"><a href="<c:url value='/exam/listExamTask/pageNum/${pageBean_end.nextPage}'/>">下一页</a></c:if>
    	<a href="<c:url value='/exam/listExamTask/pageNum/${pageBean_end.totalPage}'/>">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean_end.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jmpPage('listExamTask');">
    	</td>
    </tr>
    </table>
</body>
</html>