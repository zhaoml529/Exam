<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<base href="<%=basePath%>">
<title>添加空白试卷</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" rel="stylesheet" href="css/default.css" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type='text/javascript' src='<c:url value='/js/exam.js'/>' charset="UTF-8"></script>
</head> 
<body class="default">
  	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;试卷列表&nbsp;-&gt;添加试卷</td>
        </tr>
        <tr>
          <td height=2></td>
        </tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
	<form action="<c:url value='/exam/saveExamPaper'/>" method="post" onsubmit="return validateForm(this)" >
		<table class="default" align="center" width="600px">
		<tr class="title">
			<td colspan="5">&nbsp;填写试卷相关信息</td>
		</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷名称</td>
	 	<td>
	 	<input type="text" name="exam_name" emptyInfo="请填写试卷名称" size="50" /><span class="note"> (注:考试试卷名称)</span>
	 	</td>
	 	</tr>
	 	 <tr>
	 	<td><span class="note"> * </span>试卷科目</td>
	 	<td>
	 		<select name="subject.subject_id" emptyInfo="请选择考试科目" onchange="changeSubject('<c:url value='/exam/showGradeBySubject'/>',this.value);">
	 			<option value="">--请选择科目--</option>
	 			<c:forEach items="${subjectSet}" var="subjectSet">
	 				<option value="${subjectSet.subject_id}">${subjectSet.subject_name}</option>
	 			</c:forEach>
     		</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷创建时间</td>
	 	<td>
	 	<input type="text" name="exam_date" value="<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" />">
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷对象</td>
	 	<td>
	 		<select name="gradeInformation.grade_id" emptyInfo="请选择考试对象" id="grade" disabled="disabled">
	 		    <option value=""> -- 请选择所属对象 -- </option>
	 		</select>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>通过分数</td>
	 	<td>
	 	<input type="text" name="passScore" emptyInfo="请填写试通过分数" />(分)
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>组卷方式</td>
	 	<td>
	 	<input type="hidden" validatorType="radio" fieldName="exam_way" errorInfo="请选择抽题方式">
	 	<input type="radio" name="exam_way" id="1" value="1">自动添加试题
	 	<input type="radio" name="exam_way" id="0" value="0">手动添加试题
	 	</td>
	 	</tr>
	 	<tr>
	 	<td><span class="note"> * </span>试卷备注</td>
	 	<td>
	 	<textarea name="exam_remark" size="50" maxLength="100" lengthInfo="最大长度不能超过100！" style="width:270px;height:100px" ></textarea>
	 	</td>
	 	</tr>
	 	<tr align="center">
	 	<td colspan="2"><input type="submit" value="添加试卷" class="btn"></td>
	 	</tr>
	</table>
	</form>
</body>
</html>