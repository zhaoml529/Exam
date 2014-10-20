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
    
    <title>添加生成试卷条件</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/default.css'/>" />
    <script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>" charset="UTF-8"></script>
    <script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
    <script type="text/javascript" src="<c:url value='/js/manualExtract.js'/>" charset="UTF-8"></script>
    </head>
	<body >
	  	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;生成试卷&nbsp;-&gt;手动添加试题</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:location.href='<c:url value="/exam/listExamPaper/pageNum/1"/>'" style=" margin-bottom:10px">
    <form name="myform" action="<c:url value='/exam/listQuestion/pageNum/1'/>" method="post">
  	<table class="default" align="center">
  		<tr class="title">
  			<td colspan="6">查看试题</td>
  		</tr>
  		<tr align="center">
  			<td>试题类型：</td>
  			<td><select name="questionType" emptyInfo="请选择试题类型">
	 				<c:forEach items="${typeList}" var="typeList">
			 	<option value="${typeList.type_id}" ${typeList.type_id == 1?'selected':''}>${typeList.type_name }</option>
			 </c:forEach>	    
				</select>
			</td>
			<td>试题科目：</td>
			<td>${subject }
			</td>
			<td>所属年级：</td>
			<td>${grade }
			</td>
		</tr>
  		<tr>
  			<td>添加时间：</td>
  			<td align="center">
     			<input id="add_time" name="add_time" type="text" maxlength="10" onclick="calendar.show(this);" readonly="readonly" />
			</td>
			<td>难度系数:</td>
			<td align="center">
     			 <select name="difficulty">
      			 <option value="" selected="selected">--请选择难度系数--</option>
       			 <option value="1">简单</option>
        		 <option value="2">适中</option>
         		 <option value="3">较难</option>
     			 </select>
     		</td>
     	 <td align="center">ID查询:</td><td><input type="text" name="questionID"/></td></tr>
     	 <tr>
     	 <td></td>
     	 <!-- 
     	 <td>试题所属教师</td><td><select id="tea_id"  name="tea_id">
	 				<option value=""> -- 全部教师-- </option> 
	 	  				<c:forEach items="${teaList}" var="teaList">
	 				<option value="${teaList.tea_id}">${teaList.tea_name}</option>
	 	  				</c:forEach>
				</select></td> -->
     	 <td align="center">关键字查询:</td><td colspan="3"><input type="text" name="questionKey" size="50"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确定" class="btn"/></td>
  		 <td></td>
  		</tr>
  		<input type="hidden" id="exam_id" name="exam_id" value="${exam_id }"/>
	</table>
   	</form>
    <hr size="5">
    <c:if test="${!empty choiceList }">
	<jsp:include page="../QuestionManager/show_M_choice.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty clozeList }">
	<jsp:include page="../QuestionManager/show_M_cloze.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty shortAnswerList }">
	<jsp:include page="../QuestionManager/show_M_shortAnswer.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty comprehensiveList }">
	<jsp:include page="../QuestionManager/show_M_comprehensive.jsp"></jsp:include>
	</c:if>
  </body>
</html>
