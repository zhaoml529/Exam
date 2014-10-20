<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>添加考试任务</title>
		<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
		<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
		<script type="text/javascript" src="<c:url value='/js/calendar.js'/>" charset="UTF-8"></script>
	</head>
	<body>
		<table cellSpacing=0 cellPadding=5 width="100%" border=0
			style="margin-top: 0px">
			<tr>
				<td class="manageHead">  
					当前位置：试卷管理&nbsp;-&gt;添加任务  
				</td>
			</tr>
		</table>
		<br />
		<input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
		<form action="<c:url value='/exam/saveExamTask'/>" method="post" onsubmit="return validateForm(this)">
			<table class="default" align="center" width="500">
				<tr class="title">
					<td colspan="2">
						填写考试信息
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>所用试卷名称
					</td>
					<td>
					<input type="text" disabled="disabled" size="50" value="${examPaper.exam_name}"/>
					<input type="hidden" name="examPaper.exam_id" value="${examPaper.exam_id}"/>
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>考试科目
					</td>
					<td>
					<input type="text" disabled="disabled" size="50" value="${examPaper.subject.subject_name}"/>
					<input type="hidden" name="subject.subject_id" value="${examPaper.subject.subject_id}" />
					</td>
				</tr>
				<tr>
					<td>
					  <span class="note"> * </span>考试班级
					</td>
					<td>
							<c:forEach items="${courseList}" var="courseList">
								<c:if test="${courseList.gradeInformation.grade_name == examPaper.gradeInformation.grade_name }">
									<input type="checkbox"  name="class_id" value="${courseList.classInformation.class_id}" emptyInfo="请选择至少一个班级">${courseList.classInformation.class_name}-${courseList.gradeInformation.grade_name }
								</c:if>
							</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>考试性质
					</td>
					<td>
						<select name="examNature.nature_id" emptyInfo="请选择考试科目">
							<option value="">--请选择性质--</option>
							<c:forEach items="${natureList}" var="natureList">
								<option value="<c:out value="${natureList.nature_id}"/>"><c:out value="${natureList.nature_name}"/></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>考试教师
					</td>
					<td>
					<input type="text" name="teacherInformation.tea_name" value="${examPaper.teacherInformation.tea_name}" disabled="disabled"/>
					<input type="hidden" name="teacherInformation.tea_id" value="${examPaper.teacherInformation.tea_id}"/> 
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>考试时间
					</td>
					<td>
							<input id="bgntime" name="examTask_start" readonly="readonly" type="text" emptyInfo="请填写考试时间" style="width: 100px" onclick="calendar.show(this);" />
							<input type="text" name="shh" emptyInfo="请填写考试时间" style="width: 24px" />HH
							<input type="text" name="smm" emptyInfo="请填写考试时间" style="width: 24px" />MM
					</td>
			</tr>
					<tr>	<td>
						<span class="note"> * </span>结束时间
					</td>
					<td>
							<input id="bgntime" name="examTask_end" readonly="readonly" type="text" emptyInfo="请填写结束时间" style="width: 100px" onclick="calendar.show(this);" />
							<input type="text" name="ehh" emptyInfo="请填写结束时间" style="width: 24px" />HH
							<input type="text" name="emm" emptyInfo="请填写结束时间" style="width: 24px" />MM
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>考试地点
					</td>
					<td>
						<input type="text" name="examTask_address" emptyInfo="请填写考试地点" size="50" />
					</td>
				</tr>
				<tr>
					<td>监考老师</td>
					<td>
						<input tupe="text" name="examTask_teacher" emptyInfo="请填写监考老师" size="50">
					</td>
				</tr>
				<tr>
					<td>
						备注
					</td>
					<td>
						<textarea name="examTask_remark" size="100" maxLength="100" lengthInfo="最大长度不能超过100!" style="width: 270px; height: 100px"></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="添加任务" class="btn">
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>