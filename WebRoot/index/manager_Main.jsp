<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
 <%
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 	String createtime = sdf.format(new Date());
 	String manage = (String) session.getAttribute("manage");
 %>
   <%
   	String path = request.getContextPath();
   	String basePath = request.getScheme() + "://"
   			+ request.getServerName() + ":" + request.getServerPort()
   			+ path + "/";
   %>

<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD id=Head1><TITLE>模板</TITLE>

<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
<LINK href="YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
<style type="text/css">
  table.default {
	border:1px solid #0283c5;
	border-collapse:collapse;
}
table.default td, table.default tr.style1 td {
	padding:2 5 2 5;
	height:26px;
	border:1px solid #ffffff;
}
table.default tr, table.default tr.style1{
	background-color:#D5EFFE;
}
table.default tr.style0{
	background-color:#dfdfdf;
}
table.default tr.title td {
	font-weight:bold;
	text-align:center;
	background:#20A8F0;
	color:#ffffff;
	border:1px solid #ffffff;
	white-space:nowrap;
	height:26px;
}
table.default td.item {
	font-weight:bold;
	color:#333333;
	text-align:right;
	vertical-align:top;
	padding-top:4px;
}

table.explain {
	margin-top:5px;
	margin-bottom:5px;
}
table.explain td {
	border:1px solid #333333;
	background:#D5EFFE;
	padding:8px;
	line-height:120%;
}
/**/
table.pages {
	border:0;
}
table.pages td {
	height:26px;
}

</style>

<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>	
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="YHChannelApply.files/new_019.jpg" border=0></TD>
    <TD width="100%" background=YHChannelApply.files/new_020.jpg height=20></TD>
    <TD width=15><IMG src="YHChannelApply.files/new_021.jpg" 
  border=0></TD></TR>
  </TBODY>
  </TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 height="95%">
				<TBODY>
					<TR>
						<TD width=15 background=YHChannelApply.files/new_022.jpg>
							&nbsp;
						</TD>
						<TD vAlign=top width="100%" bgColor=#ffffff>
							<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
								<TR>
									<TD class=manageHead>
										当前位置：管理员首页
									</TD>
								</TR>
								<TR>
									<TD height=2></TD>
								</TR>
							</TABLE>
							<br />
							<br />
							<br />
							<table width="500" height="110" class="default" align="center">
								<tr height="10" align="center" class="title">
									<td colspan="2">
										${LoginUser.tea_name }登陆成功!
									</td>
								</tr>
								<tr height="35">
									<td align="right" width="150">
										称谓：
									</td>
									<td align="center">
										${LoginUser.tea_name }
									</td>
								</tr>
								<tr height="35">
									<td align="right" width="150">
										最近登录：
									</td>
									<td align="center"><%=createtime%></td>
								</tr>
								<tr height="35">
									<td align="right" width="150">
										登录身份：
									</td>
									<td align="center">
										管理员<%
										if (manage != null) {
									%><a
											href="../../DoExitServlet?action=tea" target="_parent">[切换为教师登录]</a>
										<%
											}
										%>
									</td>
								</tr>
								<tr height="10">
									<td align="center" colspan="2">
										<span style="font-size: 15">『 在线考试系统 』</span>
									</td>
								</tr>
							</table>
						</TD>

						<TD width=15 background=YHChannelApply.files/new_023.jpg>
							<IMG src="YHChannelApply.files/new_023.jpg" border=0>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				<TBODY>
					<TR>
						<TD width=15>
							<IMG src="YHChannelApply.files/new_024.jpg" border=0>
						</TD>
						<TD align=center width="100%"
							background=YHChannelApply.files/new_025.jpg height=15></TD>
						<TD width=15>
							<IMG src="YHChannelApply.files/new_026.jpg" border=0>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</BODY></HTML>