<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传试题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/page.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>


  </head>
  
  <body>
  	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：题库管理&nbsp;-&gt;上传试题</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <form >
  	<table class="default" align="center">
  		<tr class="title">
  			<td colspan="6">上传试题</td>
  		</tr>
  		<tr align="center">
  			<td>试题类型：</td>
  			<td><select id="QuestionType"  name="QuestionType" emptyInfo="请选择试题类型">
	 				<option value="0"> -- 请选择试题类型 -- </option>
	 				<option value="1"> --   选择题           --</option>
	 				<option value="2"> --   填空题           --</option>
	 				<option value="3"> --   综合题           --</option>
	 				<option value="4"> --   简答题           --</option>	    
				</select>
			</td>
			<td>试题科目：</td>
			<td><select id="subject"  name="subject" emptyInfo="请选择试题科目">
	 				<option value="0"> -- 请选择试题科目 -- </option>   
	 					<c:forEach items="${subjectList}" var="subjectList">
	 						<option value="${subjectList.subject_id}">${subjectList.subject_name}</option>
	 					</c:forEach>
				</select>
			</td>
			<td>所属年级：</td>
			<td><select id="grade"  name="grade" emptyInfo="请选择试题所属年级">
	 				<option value="0"> -- 请选择试题所属年级-- </option> 
	 	  				<c:forEach items="${gradeInfoList}" var="gradeInfoList">
	 				<option value="${gradeInfoList.grade_id}">${gradeInfoList.grade_name}</option>
	 	  				</c:forEach>
				</select>
			</td>
		</tr>
  		<tr>
  			<td>添加人：</td>
  			<td align="center"> ${user_name} </td>
  			<td>添加时间：</td><td align="center"> ${sysdate}  </td>
  			<td colspan="2" align="center"><input type="button" value="确定" class="btn" onclick="javascript:location.href='<c:url value=""/>'"/></td>
  		</tr>
	</table>
	</form>
  </body>
</html>
