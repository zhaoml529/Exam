<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String role=(String)session.getAttribute("role"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD id=Head1><TITLE>顶部</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #2a8dc8
}
BODY {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
TD {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
DIV {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
P {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
 
 a {
	 TEXT-DECORATION: none;
	
}

 
#form1 table tbody tr td table tbody tr td {
	text-align: right;
}
#form1 table tbody tr td table tbody tr td #btn_search {
	background-image: url(YHTop.files/button_search.gif);
	height: 22px;
	width: 40px;
	border:0 ;
}

#form1 table tbody tr td table tbody tr td a:link {
	COLOR:#0055bb; TEXT-DECORATION: none
}
	#form1 table tbody tr td table tbody tr td a:visited {
	COLOR:#00F; TEXT-DECORATION: none
}
#form1 table tbody tr td table tbody tr td a:hover {
	COLOR: #ff0000; TEXT-DECORATION: none
}
</STYLE>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>
<FORM id=form1 name=form1 action=YHTop.aspx method=post>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 align="center">
  <TBODY>
  <TR>
    <TD  width=10><IMG src="YHTop.files/new_001.jpg" border=0 style="border: 0"></TD>
    <TD background=YHTop.files/new_002.jpg><FONT size=6 style="font-family:'华文宋体'"><B>&nbsp;&nbsp;在线考试系统
      </B></FONT> 
      <TABLE cellSpacing=0 cellPadding=0 width="1000" border=0 >
       <TBODY>
       <TR>
         <TD align="center" width="500">
         <a href="" target=dmMain></a>&nbsp;&nbsp;
         <a href="" target=dmMain></a>&nbsp;&nbsp;
         <%if("tea".equals(role)){ %>
         <a href="teacher_Main.jsp" target=dmMain><img src="YHTop.files/gif-0148[1].gif" border="none">首页</a> &nbsp;&nbsp;
         <%}else if("stu".equals(role)){%>
         <a href="student_Main.jsp" target=dmMain><img src="YHTop.files/gif-0148[1].gif" border="none">首页</a> &nbsp;&nbsp;
         <%}else if("manage".equals(role)){%>
         <a href="manager_Main.jsp" target=dmMain><img src="YHTop.files/gif-0148[1].gif" border="none">首页</a> &nbsp;&nbsp;
         <%} %>
         <a href="" target=dmMain></a>&nbsp;&nbsp; 
         <a href="" target=dmMain></a>
         </TD>
       <TD align="right" width="300">&nbsp;&nbsp;</TD> 
       </TR>
          
       </TBODY>
      </TABLE>
      </TD>
    <TD background=YHTop.files/new_002.jpg>
      <TABLE cellSpacing=0 cellPadding=0 width="350" border=0 height="57">
        <TBODY>
        <TR>
          <TD height=20 width="90" >欢迎你！${user_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD></TR>
        <TR>
          <TD height=20 width="90" ><a href="../view/logout" target="_parent"><FONT color=red ><B>安全退出&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></FONT></a>
      </TD></TR></TBODY></TABLE></TD>
    <TD ><IMG src="YHTop.files/new_003.jpg" 
border=0></TD></TR></TBODY></TABLE></FORM>




</BODY></HTML>