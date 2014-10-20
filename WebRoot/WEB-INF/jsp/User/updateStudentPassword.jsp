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
    
    <title>My JSP 'updatePassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/default.css" />
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript">
	function toupkey(){
	var oldpass=$("#oldpass").val();
	var newpass=$("#newpass").val();
	var password=$("#password").val();
	
	alert(oldpass);
	if(oldpass == ''){
	alert("请输入当前密码");
	return false;
	}else if(newpass == ''){
	alert("请输入新密码");
	document.upkey.newpass.focus();
	return false;
	}else if(password == ''){
	alert("请再次输入新密码");
	document.upkey.newpass.focus();
	return false;
	}else if(password!=newpass){
	alert("两次输入的密码不一样");
	document.upkey.newpass.value="";
	document.upkey.password.value="";
	document.upkey.newpass.focus();
	return false;
	}else{
	return true;
	}
	}
	</script>
  </head>
	<body>
		<table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：信息管理 -&gt;修改密码</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
			<form action="<c:url value='/user/saveStudentPassword'/>" name="upkey" method="post" onsubmit="return toupkey();">
			<table class="default" align="center">
				<tr class="title">
					<td colspan="2">修改密码</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>当前密码：
					</td>
					<td>
						<input type="password" name="oldpass" id="oldpass"/>
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>新密码：
					</td>
					<td>
						<input type="password" name="newpass" id="newpass"/>
					</td>
				</tr>
				<tr>
					<td>
						<span class="note"> * </span>确认密码：
					</td>
					<td>
						<input type="password" name="password" id="password"/>
					</td>
				</tr>

				<tr>
					<td>
						<input type="submit" class="btn" name="submit" value="修改" />
					</td>
					<td>
						<input type="reset" class="btn" name="reset" value="重置" />
					</td>
				</tr>
			</table>
			<div align="center"><span class="note"> ${message }</span></div>
		</form>
	</body>
</html>
