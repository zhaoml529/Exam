<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="" name="myform2">
 <table align="center" width="1100px"  class="default">
     <tr class="title">
         <td>试题编号</td>
         <td>题目</td>
         <td>选项</td>
         <td>答案</td>
         <td>难度系数</td>
         <td>科目</td>
         <td>考试年级</td>
         <td>试题添加人</td>
         <td>添加时间</td>
         <td>分值</td>
         <td>操作</td>
     </tr>
     <c:choose>
			<c:when test="${choiceList == null}">
				<tr>
					<td colspan="12" align="center">当前没有符合条件的试题</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${choiceList}" var="choiceList">
					<c:set value="false" var="flag"/>
					<c:if test="${queList != null}">
					<c:forEach items="${queList}" var="queList">
						<c:if test="${choiceList.question_id == queList}">
							<c:set value="true" var="flag"/>
						</c:if>
					</c:forEach>
					</c:if>
				     <tr class="changeColor">
				         <td>${choiceList.question_id }</td>
				         <td>${choiceList.question_body }</td>
				         <td>${choiceList.answer_A }|
				         	 ${choiceList.answer_B }|
				         	 ${choiceList.answer_C }|
				         	 ${choiceList.answer_D }
				         </td>
				         <td>${choiceList.question_answer }</td>
				         <td>${choiceList.difficulty }</td>
				         <td>${choiceList.subject.subject_name }</td>
				         <td>${choiceList.grade.grade_name }</td>
				         <td>${choiceList.add_person }</td>
				         <td>${choiceList.add_time }</td>
				         <td>${choiceList.question_score }</td>
				         <td><input type="button" id="fadd${choiceList.question_id }" ${flag?"disabled":"" } name="addOK" value="${flag?"已添加":"添加" }" onclick="addqut('<c:url value='/exam/saveQuestion'/>',${1 },${choiceList.question_id },${choiceList.question_score })"/><input type="button" name="delNo" id="fdel${choiceList.question_id }" ${!flag?"disabled":"" } value="取消" onclick="delqut('<c:url value='/exam/deleteQuestion'/>',${1 },${choiceList.question_id },${choiceList.question_score })"/> </td>
				     </tr>
			     </c:forEach>
			</c:otherwise>
	 </c:choose>
</table>
<input type="hidden" id="exam_id" name="exam_id" value="${exam_id}" />
<table align="center" width="500">
    <tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="javascript:searchQuestion(${1 },'<c:url value='/exam/searchQuestion'/>')">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="javascript:searchQuestion(${pageBean.prePage},'<c:url value='/exam/searchQuestion'/>')">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="javascript:searchQuestion(${pageBean.nextPage},'<c:url value='/exam/searchQuestion'/>')">下一页</a></c:if>
    	<a href="javascript:searchQuestion(${pageBean.totalPage},'<c:url value='/exam/searchQuestion'/>')">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="javascript:searchQuestion(${0},'<c:url value='/exam/searchQuestion'/>')">
    	</td>
    </tr>
</table>
</form>
    
			
