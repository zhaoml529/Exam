<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改试题条件</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="js/common.js" charset="UTF-8"></script>
  </head>
  
  <body>
  <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;试卷列表&nbsp;-&gt;修改试题</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)" style=" margin-bottom:10px">

    <form action="<c:url value='/exam/updateAutomaticExtract'/>" method="post" onsubmit="return validateForm(this)">
	<table class="default" align="center">
			<tr class="title">
				<td colspan="2">添加试卷条件</td>
			</tr>
			
			<tr>
			<td><span class="note"> * </span>测试</td>
			<td>		
				
			</td>
			</tr>
			
			<tr>
			<td><span class="note"> * </span>选择试题类型</td>
			<td>		
			<select name="questionType.type_id" emptyInfo="请选择试题类型">
	 		    <option value=""> -- 请选择试题类型 -- </option>
				<c:forEach items="${typeList}" var="typeList">
					<option value="${typeList.type_id}" ${autoMatic.questionType.type_id == typeList.type_id?'selected':'' }>${typeList.type_name}</option>
				</c:forEach>
	 		</select>
			</td>
			</tr>
			<tr>
			<td><span class="note"> * </span>试题难度</td>
			<td>
			<select name="difficulty" emptyInfo="请选择试题难度">
	 		    <option value=""> -- 请选择试题难度 -- </option>
				<option value="1" <c:if test="${autoMatic.difficulty == 1 }">selected</c:if>>简单</option>
 				<option value="2" <c:if test="${autoMatic.difficulty == 2 }">selected</c:if>>适中</option>
  				<option value="3" <c:if test="${autoMatic.difficulty == 3 }">selected</c:if>>较难</option>
	 		</select>
			</td>
			</tr>
	 		<tr>
		    <td><span class="note"> * </span>生成此类型试题个数</td>
			<td>
			<input type="text" name="question_num" emptyInfo="请填写试题个数" size="50" value="${autoMatic.question_num }">
			</td>
			</tr>
			<tr>
	 		<td><span class="note"> * </span>试题备注</td>
	 		<td>
	 		<textarea name="auto_remark" size="50" style="width:270px" style="height:100px">${autoMatic.auto_remark }</textarea>
	 		</td>
	 		</tr>
	 		<tr align="center">
	 		<td colspan="2"><input type="submit" value="提交修改" class="btn"></td>
	 		</tr>
			</table>
			<input type="hidden" name="auto_id" value="${autoMatic.auto_id }">
			<input type="hidden" name="examPaper.exam_id" value="${autoMatic.examPaper.exam_id }">
		</form>
  </body>
</html>
