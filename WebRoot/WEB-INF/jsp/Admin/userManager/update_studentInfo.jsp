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
    <title>学生信息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  </head>  
  <body>
	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0
		style=" margin-top:0px">
		<tr>
			<td class="manageHead">当前位置：人员管理&nbsp;-&gt;学生信息&nbsp;-&gt;学生信息修改</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn"
		onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='/usermanager/updateStudentInfo' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">修改学生信息</td>
			</tr>
			<tr>
				<td>学生姓名</td>
				<td>
					<input type="text" name="stu_name" size="40" value="${studentinformation.stu_name }" />
				</td>                                                     
			</tr>
			<tr>
				<td>学生密码</td>
				<td>
					<input type="password" name="stu_password" size="40" value="${studentinformation.stu_password }" />
				</td>                                                     
			</tr>
			<tr>
				<td>学生性别</td>
					<td>
						<input type="hidden" validatorType="radio" fieldName="stu_sex"
							errorInfo="请选择学生性别">
						<c:choose>
							<c:when test="${studentinformation.stu_sex == 1 }">
								<input type="radio" name="stu_sex" id="1" value="1" checked>男
	 				            <input type="radio" name="stu_sex" id="0" value="0">女
	 			            </c:when>
							<c:otherwise>
								<input type="radio" name="stu_sex" id="1" value="1"/>男
	 				            <input type="radio" name="stu_sex" id="0" value="0" checked>女
	 			            </c:otherwise>
						</c:choose>
					</td>
				</tr>
			<tr>
				<td>出生年月</td>
				<td>
	 		     <input type="text" name="stu_birthday" size="40" value="${studentinformation.stu_birthday }" />
	 	        </td>
			</tr>
			<tr>
				<td>籍贯</td>
					<td>
					<input type="text" name="stu_address" size="40" value="${studentinformation.stu_address }" />
				</td>     
			</tr>
			<tr>
				<td>学生所属院系</td>
				 <td>
	 		<select name="departmentInformation.department_id" emptyInfo="请选择所属院系 " onchange="changeDepartment('<c:url value='/courseAction/getProfessionById'/>',this.value);">
	 		    <option value=""> -- 请选择院系 -- </option>
	 		    <c:forEach items="${deptList}" var="deptList">
	 		    	<c:choose>
	 		    		<c:when test="${deptList.department_id == studentinformation.departmentInformation.department_id}">
	 		    			<option value="<c:out value='${studentinformation.departmentInformation.department_id}'/>" selected="selected"><c:out value='${studentinformation.departmentInformation.department_name}'/></option>
	 		    		</c:when>
	 		    		<c:otherwise>
	 		    			<option value="<c:out value='${deptList.department_id}'/>"><c:out value='${deptList.department_name}'/></option>
	 		    		</c:otherwise>
	 		    	</c:choose>
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
	 		<select name="gradeInformation.grade_id" emptyInfo="请选择年级 " onchange="changeGrade('<c:url value='/usermanager/getClassById'/>',this.value)">
	 		    <option value=""> -- 请选择年级 -- </option>
	 		    <c:forEach items="${gradeList}" var="gradeList">
	 		    	<c:choose>
	 		    		<c:when test="${gradeList.grade_id == studentinformation.gradeInformation.grade_id}">
	 		    			<option value="<c:out value='${studentinformation.gradeInformation.grade_id}'/>" selected="selected"><c:out value='${studentinformation.gradeInformation.grade_name}'/></option>
	 		    		</c:when>
	 		    		  <c:otherwise>
	 		    			<option value="<c:out value='${gradeList.grade_id}'/>"><c:out value='${gradeList.grade_name}'/></option>
	 		    		  </c:otherwise>
	 		    	  </c:choose>
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
					<input type="text" name="stu_polity" size="40" value="${studentinformation.stu_polity }" />
				</td>
			</tr>
			<tr>
				<td>学生说明</td>
				<td>
					<input type="text" name="stu_remark" size="40" value="${studentinformation.stu_remark == null?'无':studentinformation.stu_remark}" />
				</td>
			</tr>
			<tr>
				<td colspan="13" align="right"><input type="submit" class="btn"
					value="修改" />
				</td>
			</tr>
		</table>
		<input type="hidden" name="role.role_id" value="2" />
		<input type="hidden" name="stu_id" size="40" value="${studentinformation.stu_id }" />
	</form>
</body>
</html>

