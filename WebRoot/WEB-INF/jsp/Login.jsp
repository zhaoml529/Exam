<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录页面</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
body {
	background-color: #127093;
}
*{ overflow-y: auto;

}
-->
</style></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- ImageReady Slices (login.psd) -->
<form action="<c:url value='/view/login'/>" method="post">
<div style="text-align:center">
<table id="__01" width="800" height="600" border="0" cellpadding="0" cellspacing="0 " align="center">
	<tr>
		<td colspan="3">
			<div style="background-image:url(../images/login_01.png); width:800px; height:347px;">
			 <div style="margin-top:238px;">
             <div style="text-align:center; border:0;"><input type="text" name="userid" style="width:350px; height:31px;"/></div>
             <div style="text-align:center; padding-top:25px;"> <input type="password" name="password" style="width:350px; height:31px;"/></div>
             </div>
			</div>
      </td>
	</tr>
	<tr>
		<td rowspan="2">
			<div style="background-image:url(../images/login_02.png); width:469px; height:253px;">
            
            <div style=" padding-right:60px; float:right;">
            <select name="role" style="width:100px;">
									<option id="student" selected="selected">
										学生
									</option>
									<option id="teacher">
										教师
									</option>
									<option id="manager">
										管理员
									</option>
								</select>
            </div>
            <div style=" border:0;color:red; float:left;padding-top:19px; text-align: center"><br> 
           	<span>${errorMessage}</span>   
            </div>
			</div>
			</td>
		<td>
		  <input type="submit" style=" background:url(../images/login_03.jpg);width:100px;height:28px; border:0; cursor:pointer;" value=""/></td>
		<td rowspan="2">
			<img src="../images/login_04.png" width="231" height="253" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/login_05.png" width="100" height="225" alt=""></td>
	</tr>
</table>
</div>
</form>
<!-- End ImageReady Slices -->
</body>
</html>