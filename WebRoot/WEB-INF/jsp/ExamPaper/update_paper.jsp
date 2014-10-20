<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改试卷</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
<script type="text/javascript" src="<c:url value="/js/common.js"/>" charset="UTF-8"></script>
</head>
<body>
	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;试卷列表&nbsp;-&gt;修改试卷</td>
        </tr>
        <tr>
          <td height=2><br><br></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<form action="<c:url value='/exam/updateExamPaper'/>" method="post" onsubmit="return validateForm(this)">
		<table class="default" style=" margin-bottom:10px" align="center">
		<tr class="title">
			<td colspan="2">填写试卷相关信息</td>
		</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷名称</td>
	 	<td>
	 	<input type="text" name="exam_name" emptyInfo="请填写试卷名称" size="50" value="${examPaper.exam_name }"/><span class="note"> (注:考试试卷名称)</span>
	 	</td>
	 	</tr>
	 	 <tr>
	 	<td><span class="note"> * </span>试卷科目</td>
	 	<td>
	 		<select name="subject.subject_id" emptyInfo="请选择考试科目">
	 			<option value="">--请选择科目--</option>
	 			<c:forEach items="${subjectSet}" var="subjectSet">
	 				<c:choose>
	 					<c:when test="${subjectSet.subject_id == examPaper.subject.subject_id}">
	 						<option value="<c:out value='${examPaper.subject.subject_id}'/>" selected="selected"><c:out value='${examPaper.subject.subject_name}'/></option>
	 					</c:when>
	 					<c:otherwise>
	 						<option value="<c:out value='${subjectSet.subject_id}'/>"><c:out value='${subjectSet.subject_name}'/></option>
	 					</c:otherwise>
	 				</c:choose>
	 			</c:forEach>
     		</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷创建时间</td>
	 	<td>
	 	<input type="text" name="exam_date" value="${examPaper.exam_date}">
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷对象</td>
	 	<td>
	 		<select name="gradeInformation.grade_id" emptyInfo="请选择考试对象">
	 		    <option value=""> -- 请选择所属对象 -- </option>
	 		    <c:forEach items="${gradeSet}" var="gradeSet">
	 		    	<c:choose>
	 		    		<c:when test="${gradeSet.grade_id == examPaper.gradeInformation.grade_id}">
	 		    			<option value="<c:out value='${examPaper.gradeInformation.grade_id}'/>" selected="selected"><c:out value='${examPaper.gradeInformation.grade_name}'/></option>
	 		    		</c:when>
	 		    		<c:otherwise>
	 		    			<option value="<c:out value='${gradeSet.grade_id}'/>"><c:out value='${gradeSet.grade_name}'/></option>
	 		    		</c:otherwise>
	 		    	</c:choose>
	 		    </c:forEach>
	 		</select>
	 	</td>
	 	</tr>
	 	<td><span class="note"> * </span>通过分数</td>
	 	<td>
	 	<input type="text" name="passScore" value="${examPaper.passScore }" emptyInfo="请填写试通过分数" size="50" />
	 	</td>
	 	<tr>
	 	<td><span class="note"> * </span>组卷方式</td>
	 	<td>
	 	<input type="hidden" validatorType="radio" fieldName="exam_way" errorInfo="请选择抽题方式">
	 		<c:choose>
	 			<c:when test="${examPaper.exam_way == 1 }">
	 				<input type="radio" name="exam_way" id="1" value="1" checked>自动添加试题
	 				<input type="radio" name="exam_way" id="0" value="0">手动添加试题
	 			</c:when>
	 			<c:otherwise>
	 				<input type="radio" name="exam_way" id="1" value="1">自动添加试题
	 				<input type="radio" name="exam_way" id="0" value="0" checked>手动添加试题
	 			</c:otherwise>
	 		</c:choose>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷备注</td>
	 	<td>
	 	<textarea name="exam_remark" size="50" style="width:270px" style="height:100px">${examPaper.exam_remark}</textarea>
	 	</td>
	 	</tr>
	 	<tr align="center">
	 		<td colspan="2"><input type="submit" value="提交修改" class="btn"></td>
	 	</tr>
	</table>
	<input type="hidden" name="teacherInformation.tea_id" value="${examPaper.teacherInformation.tea_id}"/>
	<input type="hidden" name="exam_id" value="${examPaper.exam_id}" />
	</form>
</body>
</html>