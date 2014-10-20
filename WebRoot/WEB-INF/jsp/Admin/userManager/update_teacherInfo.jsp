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
    
    <title>教师信息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  </head>  
  <body>
	<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0
		style=" margin-top:0px">
		<tr>
			<td class="manageHead">当前位置：人员管理&nbsp;-&gt;教师信息&nbsp;-&gt;教师信息修改</td>
		</tr>
		<tr>
			<td height=2></td>
		</tr>
	</table>
	<input type="button" value="返回" class="btn"
		onclick="javascript:history.go(-1)" style=" margin-bottom:10px">
	<br />
	<form action="<c:url value='/usermanager/updateTeacherInfo' />" method="post" onsubmit="return validateForm(this)">
		<table align="center" class="default">
			<tr class="title">
				<td colspan="2">修改教师信息</td>
			</tr>
			<tr>
				<td>教师编号</td>
				<td>
					<input type="text" name="tea_id" size="40" value="${teacherinformation.tea_id }" />
				</td>
			</tr>
			<tr>
				<td>教师姓名</td>
				<td>
					<input type="text" name="tea_name" size="40" value="${teacherinformation.tea_name }" />
				</td>                                                     
			</tr>
			<tr>
				<td>教师密码</td>
				<td>
					<input type="password" name="tea_password" size="40" value="${teacherinformation.tea_password }" />
				</td>                                                     
			</tr>
			<tr>
				<td>教师性别</td>
					<td>
						<input type="hidden" validatorType="radio" fieldName="tea_sex"
							errorInfo="请选择教师性别">
						<c:choose>
							<c:when test="${teacherinformation.tea_sex == 1 }">
								<input type="radio" name="tea_sex" id="1" value="1" checked>男
	 				            <input type="radio" name="tea_sex" id="0" value="0">女
	 			            </c:when>
							<c:otherwise>
								<input type="radio" name="tea_sex" id="1" value="1"/>男
	 				            <input type="radio" name="tea_sex" id="0" value="0" checked>女
	 			            </c:otherwise>
						</c:choose>
					</td>
				</tr>
			<tr>
				<td>教师年龄</td>
				<td>
	 		<select name="peopleAge.age_id" emptyInfo="请选择教师年龄">
	 		    <option value=""> -- 请选择年龄 -- </option>
	 		    <c:forEach items="${ageList}" var="ageList">
	 		    	<c:choose>
	 		    		<c:when test="${ageList.age_id == teacherinformation.peopleAge.age_id}">
	 		    			<option value="<c:out value='${teacherinformation.peopleAge.age_id}'/>" selected="selected"><c:out value='${teacherinformation.peopleAge.age_range}'/></option>
	 		    		</c:when>
	 		    		<c:otherwise>
	 		    			<option value="<c:out value='${ageList.age_id}'/>"><c:out value='${ageList.age_range}'/></option>
	 		    		</c:otherwise>
	 		    	</c:choose>
	 		    </c:forEach>
	 		</select>
	 	</td>
			</tr>
			<tr>
				<td>教师学历</td>
	              <td>
	 		<select name="eduBackGround.eduBackGround_id" emptyInfo="请选择教师学历">
	 		    <option value=""> -- 请选择学历 -- </option>
	 		    <c:forEach items="${eduList}" var="eduList">
	 		    	<c:choose>
	 		    		<c:when test="${eduList.eduBackGround_id == teacherinformation.eduBackGround.eduBackGround_id}">
	 		    			<option value="<c:out value='${teacherinformation.eduBackGround.eduBackGround_id}'/>" selected="selected"><c:out value='${teacherinformation.eduBackGround.eduBackGround_name}'/></option>
	 		    		</c:when>
	 		    		<c:otherwise>
	 		    			<option value="<c:out value='${eduList.eduBackGround_id}'/>"><c:out value='${eduList.eduBackGround_name}'/></option>
	 		    		</c:otherwise>
	 		    	</c:choose>
	 		    </c:forEach>
	 		</select>
	 	</td>
			</tr>
			<tr>
				<td>教师所属机构</td>
				 <td>
	 		<select name="departmentInformation.department_id" emptyInfo="请选择所属机构">
	 		    <option value=""> -- 请选择机构 -- </option>
	 		    <c:forEach items="${deptList}" var="deptList">
	 		    	<c:choose>
	 		    		<c:when test="${deptList.department_id == teacherinformation.departmentInformation.department_id}">
	 		    			<option value="<c:out value='${teacherinformation.departmentInformation.department_id}'/>" selected="selected"><c:out value='${teacherinformation.departmentInformation.department_name}'/></option>
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
				<td>联系方式</td>
				<td>
					<input type="text" name="tea_tel" size="40" value="${teacherinformation.tea_tel }" />
				</td>
			</tr>
			<tr>
				<td>教师说明</td>
				<td>
					<input type="text" name="tea_remark" size="40" value="${teacherinformation.tea_remark == null?'无':teacherinformation.tea_remark}" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" class="btn"
					value="修改" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
