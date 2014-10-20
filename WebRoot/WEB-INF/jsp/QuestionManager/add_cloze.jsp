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
    
    <title>My JSP 'add_cloze.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/default.css"/>" />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>

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
       <br/>
       <form action="<c:url value='/question/saveCloze'/>" method="post" onsubmit="return validateForm(this)">
       <table class="default" width="580px" align="center">
			 	<tr class="title">
			 	<td colspan="2" align="center">
                       添加填空题
                    </td>
                </tr>
				
     			<tr>
					<td ><span class="note"> * </span>
						填空题题目
					</td><td ><input type="text" name="question_body" emptyInfo="请填写试题题目" size="70"/></td>
				</tr>
				<tr>
					<td ><span class="note"> * </span>
						填空题答案
					</td><td ><input type="text" name="question_answer" emptyInfo="请填写试题答案" size="70"/></td>
				</tr>
				<tr>
					<td ><span class="note"> * </span>
						填空题应填个数
					</td><td ><input type="text" name="question_num" emptyInfo="请填写填空的个数" size="70"/></td>
				</tr>
				<tr>
					<td ><span class="note"> * </span>
						试题难度
					</td>				
					<td >
					<select name="difficulty" emptyInfo="请选择试题难度" style="width: 150px">
      					<option value="1" selected="selected">简单</option>
          				<option value="2">适中</option>
             			<option value="3">较难</option>
    		 		</select>
    		 		</td>
    		 	</tr>
    		 	<tr>
					<td ><span class="note"> * </span>
						填空题科目
					</td>				
						<td>	
						<select name="subject.subject_id" emptyInfo="请选择试题所属科目" style="width: 150px" ${empty courseList?"disabled":"" }>
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
     			</select>
     					</td>
     				</tr>
     			<tr>
					<td ><span class="note"> * </span>适合年级</td>
					<td >
					<select name="grade.grade_id" emptyInfo="请选择适合年级" style="width: 150px">
					<c:forEach items="${gradeInfoList}" var="gradeInfoList">
								<option value="${gradeInfoList.grade_id}">${gradeInfoList.grade_name}</option>
					</c:forEach>
     				</select>
     				</td>
     			</tr>
     			<tr>
					<td ><span class="note"> * </span>
						添加时间
					</td><td ><input type="text" name="add_time" readonly="readonly" size="70" value="${sysdate }"/></td></tr><tr>
					<td ><span class="note"> * </span>
						试题分值
					</td><td ><input type="text" name="question_score" size="70" emptyInfo="请填写试题分值" onkeypress="return onKeyPressBlockNumbers(event);"/></td></tr><tr>
					<td ><span class="note"> * </span>
						试题备注
					</td><td ><input type="text" name="question_remark" size="70"/></td></tr><tr>
					<td align="center" colspan="2"><input type="submit" value="${empty courseList?'您没有教授课程，不能添加试题':'保存'}" class="btn" ${empty courseList?'disabled':''}/></td>
				</tr>					
			</table>
			</form>
  </body>
</html>
