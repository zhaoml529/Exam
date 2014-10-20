<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<form action="" name="myform2">
	<table class="default" width="1100px">
		<tr class="title">
			<td>简答题编号</td>
			<td>简答题题目</td>
			<td>简答题答案</td>
			<td>试题难度</td>
			<td>所属科目</td>
			<td>所属年级</td>
			<td>添加人</td>
			<td>添加时间</td>
			<td>试题分数</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty shortAnswerList}">
				<tr>
					<td colspan="15" align="center">没有找到符合条件的试题！</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${shortAnswerList}" var="shortAnswerList">
					<c:set value="false" var="flag"/>
					<c:if test="${queList != null}">
					<c:forEach items="${queList}" var="queList">
						<c:if test="${shortAnswerList.question_id == queList}">
							<c:set value="true" var="flag"/>
						</c:if>
					</c:forEach>
					</c:if>
					<tr class="changeColor">
						<td>${shortAnswerList.question_id }</td>
						<td>${shortAnswerList.question_body }</td>
						<td>${shortAnswerList.question_answer }</td>
						<td>${shortAnswerList.difficulty }</td>
						<td>${shortAnswerList.subject.subject_name }</td>
						<td>${shortAnswerList.grade.grade_name }</td>
						<td>${shortAnswerList.add_person }</td>
						<td>${shortAnswerList.add_time }</td>
						<td>${shortAnswerList.question_score }</td>
						<td>${shortAnswerList.question_remark }</td>
						<td><input type="button" id="fadd${shortAnswerList.question_id }" ${flag?"disabled":"" } name="addOK" value="${flag?"已添加":"添加" }" onclick="addqut('<c:url value='/exam/saveQuestion'/>',${3 },${shortAnswerList.question_id },${shortAnswerList.question_score })"/><input type="button" name="delNo" id="fdel${shortAnswerList.question_id }" ${!flag?"disabled":"" } value="取消" onclick="delqut('<c:url value='/exam/deleteQuestion'/>',${3 },${shortAnswerList.question_id },${shortAnswerList.question_score })"/> </td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<input type="hidden" id="exam_id" value="${exam_id}" />
	<table align="center" width="500">
		<tr>
			<td align="center" colspan="10">第<c:out
					value="${pageBean.currentPage}" />页 共<c:out
					value="${pageBean.totalPage}" />页 <a
				href="javascript:searchQuestion(${1 },'<c:url value='/exam/searchQuestion'/>')">首页</a>
				<c:if test="${pageBean.hasPreviousPage == true}">
					<a
						href="javascript:searchQuestion(${pageBean.prePage},'<c:url value='/exam/searchQuestion'/>')">上一页</a>
				</c:if> <c:if test="${pageBean.hasNextPage == true}">
					<a
						href="javascript:searchQuestion(${pageBean.nextPage},'<c:url value='/exam/searchQuestion'/>')">下一页</a>
				</c:if> <a
				href="javascript:searchQuestion(${pageBean.totalPage},'<c:url value='/exam/searchQuestion'/>')">尾页</a>
				转到 <select id="pageNum">
					<c:forEach var="pageBean" varStatus="status" begin="1"
						end="${pageBean.totalPage}">
						<option value="${status.count}">${status.count}</option>
					</c:forEach>
			</select> 页 <input type="button" width="30px" value="GO"
				onclick="javascript:searchQuestion(${0},'<c:url value='/exam/searchQuestion'/>')">
			</td>
		</tr>
	</table>
</form>


