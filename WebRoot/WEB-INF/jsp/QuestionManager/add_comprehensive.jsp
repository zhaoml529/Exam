<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加综合题</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/js/kindeditor-4.1.10/plugins/code/prettify.css'/>" />
<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
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
	<table cellSpacing=0 cellPadding=5 width="100%" border=0
		style="margin-top: 0px">
		<tr>
			<td class="manageHead">当前位置：题库管理&nbsp;-&gt;手动添加试题</td>
		</tr>
	</table>
	<br />

<table align="center">
                <tr>
                    <td>
                      <input type="button" id="Choice" class="btn" value="添加选择题"  onclick="javascript:location.href='<c:url value="/question/addChoice"/>'"/>
                    </td>
                    <td>
                       <input type="button" id="Cloze" class="btn" value="添加填空题"  onclick="javascript:location.href='<c:url value="/question/addCloze"/>'"/>
                    </td>
                    <td>
                       <input type="button" id="Comprehensive" class="btn" value="添加综合题"  onclick="javascript:location.href='<c:url value="/question/addComprehensive"/>'"/>
                    </td>
                    <td>
                      <input type="button" id="ShortAnswer" class="btn" value="添加简答题"  onclick="javascript:location.href='<c:url value="/question/addShortAnswer"/>'"/>
                    </td>
                </tr>
            </table>

	<form action="<c:url value='/question/saveComprehensive'/>" method="post" onsubmit="return validateForm(this)">
		<table class="default" align="center" width="900">
			<tr class="title">
				<td colspan="2">填写综合试题信息</td>
			</tr>
			<tr>
				<td><span class="note"> * </span>题目</td>
				<td><input type="text" name="question_title"
					emptyInfo="请填写试题题目" size="80" />
				</td>
			</tr>
			<tr>
				<td><span class="note"> * </span>描述</td>
				<td><textarea id="editor_id1" name="question_body" style="width:700px;height:300px;">
					&lt;strong&gt;试题内容&lt;/strong&gt;
				</textarea></td>
			</tr>
			<tr>
				<td><span class="note"> * </span>答案</td>
				<td>
				<textarea id="editor_id2" name="question_answer" style="width:700px;height:300px;">
					&lt;strong&gt;试题答案&lt;/strong&gt;
				</textarea>
				</td>
			</tr>
			<tr>
				<td><span class="note"> * </span>难度系数</td>
				<td>
					<select name="difficulty" emptyInfo="请选择试题难度" style="width: 150px">
      					<option value="1" selected="selected">简单</option>
          				<option value="2">适中</option>
             			<option value="3">较难</option>
    		 		</select>
				</td>
			</tr>
			<tr>
				<td><span class="note"> * </span>分值</td>
				<td><input type="text" name="question_score"
					emptyInfo="请填写试题分值" size="80" />
				</td>
			</tr>
			<tr>
				<td><span class="note"> * </span>所属科目</td>
				<td><select name="subject.subject_id" emptyInfo="请选择试题所属科目" style="width: 150px" ${empty courseList?"disabled":"" }>
					<c:choose>
					<c:when test="${empty courseList}">
						<option value="" disabled="disabled">您没有所教课程，不能添加试题。</option>
						
					</c:when>
					<c:otherwise>
						<c:forEach items="${courseList}" var="courseList">
							<option value="${courseList.subject.subject_id}">${courseList.subject.subject_name}</option>
						</c:forEach>
					</c:otherwise>
				</c:choose>
     			</select></td>
			</tr>
			<tr>
				<td><span class="note"> * </span>所属年级</td>
				<td><select name="grade.grade_id" emptyInfo="请选择适合年级" style="width: 150px">
					<c:forEach items="${gradeInfoList}" var="gradeInfoList">
								<option value="${gradeInfoList.grade_id}">${gradeInfoList.grade_name}</option>
					</c:forEach>
     				</select></td>
			</tr>
			<tr>
				<td><span class="note"> * </span>添加时间</td>
				<td><input type="text" name="add_time" readonly="readonly" size="70" value="${sysdate }"/></td>
			</tr>
			<tr>
				<td>试题说明</td>
				<td>
				<textarea id="editor_id3" name="question_remark" style="width:700px;height:300px;">
					&lt;strong&gt;试题说明&lt;/strong&gt;
				</textarea>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="${empty courseList?'您没有教授课程，不能添加试题':'保存'}" class="btn" ${empty courseList?'disabled':''}>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
