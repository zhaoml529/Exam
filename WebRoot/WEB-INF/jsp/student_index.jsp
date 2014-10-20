<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
<title>首页</title>
</head>
<FRAMESET frameSpacing=0 rows=80,* frameBorder=0>
		<FRAME name=top src="<c:url value='/index/YHTop.jsp'/>" frameBorder=0 noResize
			scrolling=no>
		<FRAMESET frameSpacing=0 frameBorder=0 cols=220,*>
			<FRAME name=menu src="<c:url value='/index/YHStudentMenu.html'/>" frameBorder=0 noResize scrolling=no>
			<FRAME name=dmMain src="<c:url value='/index/student_Main.jsp'/>" frameBorder=0>
		</FRAMESET>
		<NOFRAMES>
			<p>
				This page requires frames, but your browser does not support them.
			</p>
		</NOFRAMES>
	</FRAMESET>
<body>
	
</body>
</html>