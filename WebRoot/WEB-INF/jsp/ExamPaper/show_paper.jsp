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
    
    <title>My JSP 'show_paper.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />

  </head>
<body>
	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;试卷列表&nbsp;-&gt;详细信息</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)" style=" margin-bottom:10px">

		
		<br>
		
		<table class="default" width="50%" align="center" style=" margin-bottom:10px">
		<tr class="title">
			<td colspan="2">试卷相关信息</td>
		</tr>
	 	<tr>
	 	<td>试卷编号</td>
	 	<td>
	 	${examPaper.exam_id }
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>试卷名称</td>
	 	<td>
	 	${examPaper.exam_name }
	 	</td>
	 	</tr>
	 	 <tr>
	 	<td>试卷科目</td>
	 	<td>
		${examPaper.subject.subject_name}
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>试卷创建人</td>
	 	<td>
	 	${examPaper.teacherInformation.tea_name }
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>试卷创建时间</td>
	 	<td>
	 	${examPaper.exam_date }
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>所属年级</td>
	 	<td>
		${examPaper.gradeInformation.grade_name }
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>抽题方式</td>
	 	<td>
	    ${examPaper.exam_way == 1?'自动抽题':'手动抽题' }
	 	</td>
	 	</tr>
	 	<tr>
	 	<td>试卷备注</td>
	 	<td>
	 	${examPper.exam_remark == null?'无':ExamPper.exam_remark}
	 	</td>
	 	</tr>
	</table>
		
</body>
</html>
