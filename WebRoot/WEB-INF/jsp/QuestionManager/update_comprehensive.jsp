<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_comprehensive.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/calendar.js'/>" charset="UTF-8"></script>
    <script charset="utf-8" src="<c:url value='/js/kindeditor-4.1.10/kindeditor-min.js'/>"></script>
    <script charset="utf-8" src="<c:url value='/js/kindeditor-4.1.10/lang/zh_CN.js'/>"></script>
<script charset="utf-8" src="<c:url value='/js/kindeditor-4.1.10/plugins/code/prettify.js'/>"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="question_body"]', {
				cssPath : '<c:url value='/js/kindeditor-4.1.10/plugins/code/prettify.css'/>',
				uploadJson : '<c:url value='/uploadJson/file_upload'/>',
				fileManagerJson : '<c:url value='/uploadJson/file_manager'/>',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
					});
				}
			});
			prettyPrint();
		});
		KindEditor.ready(function(K) {
			var editor2 = K.create('textarea[name="question_answer"]', {
				cssPath : '<c:url value='/js/kindeditor-4.1.10/plugins/code/prettify.css'/>',
				uploadJson : '<c:url value='/uploadJson/file_upload'/>',
				fileManagerJson : '<c:url value='/uploadJson/file_manager'/>',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
					});
				}
			});
			prettyPrint();
		});
		KindEditor.ready(function(K) {
			var editor2 = K.create('textarea[name="question_remark"]', {
				cssPath : '<c:url value='/js/kindeditor-4.1.10/plugins/code/prettify.css'/>',
				uploadJson : '<c:url value='/uploadJson/file_upload'/>',
				fileManagerJson : '<c:url value='/uploadJson/file_manager'/>',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
					});
				}
			});
			prettyPrint();
		});
		
	</script>

  </head>
<body>
    <table cellSpacing=0 cellPadding=5 width="100%" border=0 style="margin-top: 0px">
			<tr>
				<td class="manageHead">
					当前位置：题库管理&nbsp;-&gt;试题题库管理&nbsp;-&gt;修改试题
				</td>
			</tr>
	</table>
	<input type="button" value="返回" class="btn" onclick="javascript:history.go(-1)">
	<form action="<c:url value='/question/updateComprehensive'/>" method="post" onsubmit="return validateForm(this)">
		<table class="default" width="1100px">
				<tr class="title">
					<td colspan="2">查看试题详细信息</td>					
				</tr>
				<tr>
				<td>简答题编号</td>
				<td><input type="text" name="question_id" readonly="readonly"
					value="${comprehensive.question_id }" />
				</td>
				</tr>
				<tr>
				<td>简答题题目</td>
				<td><input type="text" name="question_title"
					value="${comprehensive.question_title }" />
				</td>
				</tr>
				<tr>
				<td>试题描述</td>
					<td>
						<textarea id="editor_id1" name="question_body" style="width:700px;height:300px;">
						${comprehensive.question_body }	
						</textarea>
					</td>
				</tr>
				<tr>
					<td>正确答案</td>
					<td>
						<textarea id="editor_id2" name="question_answer" style="width:700px;height:300px;">
						${comprehensive.question_answer }	
						</textarea>
					</td>
				</tr>
				<tr>
					<td>试题难度</td>
					<td><input type="text" name="difficulty" value="${comprehensive.difficulty }"/>
					</td>
				</tr>
				<tr>
					<td>所属科目</td>
					<td>
					<select name="subject.subject_id" emptyInfo="请选择试题科目">
							<c:forEach items="${subjectList}" var="subjectList">
								<option value="${subjectList.subject_id}" ${subjectList.subject_id == comprehensive.subject.subject_id?'selected':"" }>${subjectList.subject_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>年级</td>
					<td>
				<select name="grade.grade_id" emptyInfo="请选择试题年级">
							<c:forEach items="${gradeInfoList}" var="gradeInfoList">
								<option value="${gradeInfoList.grade_id}" ${gradeInfoList.grade_id == comprehensive.grade.grade_id?'selected':"" }>${gradeInfoList.grade_name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>添加人</td><td><input type="text" name="add_person" readonly="readonly" value="${comprehensive.add_person }"/></td>
				</tr>
				<tr>
					<td>添加时间</td><td><input type="text" name="add_time" value="${comprehensive.add_time }" onclick="calendar.show(this);"/></td>
				</tr>
				<tr>
					<td>试题分值</td><td><input type="text" name="question_score" value="${comprehensive.question_score }"/></td>
				</tr>
				<tr>
					<td>试题备注</td>
										<td>
						<textarea id="editor_id3" name="question_remark" style="width:700px;height:300px;">
						${comprehensive.question_remark}	
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="保存" class="btn"/></td>
				</tr>
	 </table>
	 </form>
  </body>
</html>
