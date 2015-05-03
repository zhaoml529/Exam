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
    
    <title>添加考试试题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
		function qtype (){
			var typeid=$("#type").val();
			if(typeid == 1){
				$("#typeCount").empty().append("(题库共 "+'${choiceCount}'+" 道题)");
			}else if(typeid == 2){
				$("#typeCount").empty().append("(题库共 "+'${clozeCount}'+" 道题)");
			}else if(typeid == 3){
				$("#typeCount").empty().append("(题库共 "+'${shortCount}'+" 道题)");
			}else{
				$("#typeCount").empty().append("(题库共 "+'${compreCount}'+" 道题)");
			}
			
		}
		
	</script>
	
  </head>
  
  <body>
  	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;生成试卷&nbsp;-&gt;添加试题</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:location.href='<c:url value="/exam/listExamPaper/pageNum/1"/>'" style=" margin-bottom:10px">
	<table width="100%" class="default" style=" margin-bottom:10px">
	 	<col width="6%" align="center" />
		<col width="20%" align="center"/>
		<col width="14%" align="center" />
		<col width="12%" align="center" />
		<col width="12%" align="center" />
		<col width="15%" align="center" />
		<col width="15%" align="center" />
		<tr class="title">
			<td>ID</td>
			<td>试题类型</td>
			<td>试题难度系数</td>
			<td>试题个数</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${automaticList == null}">
				<tr>
					<td colspan="6" align="center">没有数据</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${automaticList}" var="automaticList">
					<tr class="changeColor">
						<td>${automaticList.auto_id }</td>
						<td>${automaticList.questionType.type_name }</td>
						<td>${automaticList.difficulty }</td>
						<td>${automaticList.question_num }</td>
						<td>${automaticList.auto_remark }</td>
						<td><a href="<c:url value='/exam/updateAutomaticExtractById/auto_id/${automaticList.auto_id }'/>">修改</a>|
							<a href="<c:url value='/exam/deleteAutomaticExtract/auto_id/${automaticList.auto_id }/exam_id/${exam_id}'/>" onclick="return confirm('确定删除该试卷?')">删除</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<form action="<c:url value='/exam/saveAutomaticExtract'/>" method="post" onsubmit="return validateForm(this)">
		<table class="default" align="center">
		<tr class="title">
			<td colspan="2">添加试卷条件</td>
		</tr>
		<tr>
		<td>试卷科目</td>
		<td>
			<input type="text" name="subject_name" value="${subject_name }" disabled="disabled">
			<input type="hidden" name="examPaper.exam_id" value="${exam_id }">
		</td>
		</tr>
		<tr>
		<td>选择试题类型</td>
		<td>		
			<select id="type" onchange="qtype();" name="questionType.type_id" emptyInfo="请选择试卷类型">
	 		    <option value=""> -- 请选择试题类型 -- </option>
	 		    <c:forEach items="${typeList}" var="typeList">
					<option value="${typeList.type_id}">${typeList.type_name}</option>
				</c:forEach>
	 		</select>
		</td>
		</tr>
		<tr>
			<td>试题难度</td>
			<td>
			<select name="difficulty" emptyInfo="请选择试卷难度">
	 		    <option value=""> -- 请选择试题难度 -- </option>
				<option value="1">  简单  </option>
 				<option value="2">  适中  </option>
  				<option value="3">  较难  </option>
	 		</select>
		</td>
		</tr>
	 	<tr>
		    <td>生成试题个数</td>
			<td>
			<input type="text" name="question_num" emptyInfo="请填写试题个数" size="25"><span id="typeCount" class="note"></span>
			</td>
		</tr>
		<tr>
	 		<td>试题备注</td>
	 		<td>
	 		<textarea name="auto_remark" size="50" style="width:270px" style="height:100px"></textarea>
	 		</td>
	 	</tr>
	 	<tr align="center">
	 			<td colspan="2"><input type="submit" value="添加试题" class="btn"></td>
	 	</tr>
		</table>
	</form>
  </body>
</html>
