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
    
    <title>My JSP 'add_student.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
 	<script type="text/javascript" src="<c:url value='/js/calendar.js'/>" charset="UTF-8"></script>
 	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
 
  </head>
  
  <body>
    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0
		style=" margin-top:0px">
		<tr>
			<td class="manageHead">当前位置：人员管理&nbsp;-&gt;学生信息&nbsp;-&gt;添加学生信息</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn"
		onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='/usermanager/saveStudent' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">添加学生信息</td>
			</tr>
			<tr>
				<td>学生编号</td>
				<td>
					<input type="text" name="stu_id" size="40"  />
				</td>
			</tr>
			<tr>
				<td>学生姓名</td>
				<td>
					<input type="text" name="stu_name" size="40"  />
				</td>                                                     
			</tr>
			<tr>
				<td>学生密码</td>
				<td>
					<input type="password" name="stu_password" size="40"  />
				</td>                                                     
			</tr>
			<tr>
				<td>学生性别</td>
					<td>
						<input type="hidden" validatorType="radio" fieldName="stu_sex" errorInfo="请选择学生性别">
								<input type="radio" name="stu_sex" id="1" value="1" checked/>男
	 				            <input type="radio" name="stu_sex" id="0" value="0"/>女
					</td>
				</tr>
			<tr>
				<td>出生年月</td>
				<td>
	 		     <input type="text" name="stu_birthday" size="40" readonly="readonly" onclick="calendar.show(this);"/>
	 	        </td>
			</tr>
			<tr>
				<td>籍贯</td>
					<td>
					<input type="text" name="stu_address" size="40" />
				</td>     
			</tr>
			<tr>
				<td>学生所属院系</td>
				 <td>
	 		<select id="dept_id" name="departmentInformation.department_id" onchange="changeDepartment('<c:url value='/courseAction/getProfessionById'/>',this.value);" emptyInfo="请选择院系" style="width:200px;">
		 		<option value="">--请选择院系--</option>
		 		<c:forEach items="${deptList}" var="deptList">
		 			<option value="${deptList.department_id}">${deptList.department_name}</option>
		 		</c:forEach>
     		</select>
	 	</td>
			</tr>

		    <tr>
			     <td>专业</td>
			     <td>
			      <select id="professional" name="professionInformation.profession_id" emptyInfo="请选择专业" disabled="disabled" style="width:200px;">
			 		<option value="0" selected="selected">--请选择专业--</option>
			 	  </select>			     
			 	 </td>
			</tr>
			<tr>
			     <td>年级</td>
			   <td>
	 		<select name="gradeInformation.grade_id" onchange="changeGrade('<c:url value='/usermanager/getClassById'/>',this.value)" emptyInfo="请选择考试对象">
	 		    <option value=""> -- 请选择年级 -- </option>
	 		    <c:forEach items="${gradeList}" var="gradeList">
	 		    	<option value="<c:out value='${gradeList.grade_id}'/>"><c:out value='${gradeList.grade_name}'/></option>
	 		    </c:forEach>
	 		</select>
	 	   </td>
			</tr>
			<tr>
			     <td>班级</td>
			     <td>
			     <select id="classinfo" name="classInformation.class_id" emptyInfo="请选择专业" disabled="disabled" style="width:200px;">
			 		<option value="0" selected="selected">--请选择班级--</option>
			 	</select>			     </td>
			</tr>
			<tr>
				<td>政治面貌</td>
				<td>
					<input type="text" name="stu_polity" size="40" />
				</td>
			</tr>
			<tr>
				<td>学生说明</td>
				<td>
					<input type="text" name="stu_remark" size="40" />
				</td>
			</tr>
			<tr>
				<td colspan="13" align="right"><input type="submit" class="btn"
					value="添加" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="role.role_id" value="2" />
	</form>
  </body>
</html>
