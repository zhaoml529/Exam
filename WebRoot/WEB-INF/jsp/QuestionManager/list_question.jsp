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
    
    <title>题库管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/common.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/calendar.js'/>" charset="UTF-8"></script>

  </head>
  
  <body>
   <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：题库管理&nbsp;-&gt;试题题库管理</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <form action="<c:url value='/question/getQuestionList'/>" method="post">
    <table class="default" align="center">
  		<tr class="title">
  			<td colspan="6">查看试题</td>
  		</tr>
  		<tr align="center">
  			<td>试题类型：</td>
  			<td><select id="QuestionType"  name="QuestionType" emptyInfo="请选择试题类型">
	 				<option value="1"> --   选择题           --</option>
	 				<option value="2"> --   填空题           --</option>
	 				<option value="3"> --   综合题           --</option>
	 				<option value="4"> --   简答题           --</option>	    
				</select>
			</td>
			<td>所教科目：</td>
			<td><select id="subject"  name="subject">
	 				<option value=""> -- 全部科目 -- </option> 
	 				<c:choose>
	 					<c:when test="${empty courseList }"></c:when>
	 					<c:otherwise><c:forEach items="${courseList}" var="courseList">
	 						<option value="${courseList.subject.subject_id}">${courseList.subject.subject_name}</option>
	 					</c:forEach></c:otherwise>
	 				</c:choose>  
				</select>
			</td>
			<td>所属年级：</td>
			<td><select id="grade"  name="grade">
	 				<option value=""> -- 全部年级-- </option> 
	 	  				<c:forEach items="${gradeInfoList}" var="gradeInfoList">
	 				<option value="${gradeInfoList.grade_id}">${gradeInfoList.grade_name}</option>
	 	  				</c:forEach>
				</select>
			</td>
		</tr>
  		<tr>
  			<td>添加时间：</td>
  			<td align="center">
     			<input id="add_time" name="startTime" type="text" maxlength="10" onclick="calendar.show(this);" readonly="readonly" />
			</td>
			<td>难度系数:</td>
			<td align="center">
     			 <select name="difficulty">
      			 <option value="" selected="selected">--请选择难度系数--</option>
       			 <option value="1">简单</option>
        		 <option value="2">适中</option>
         		 <option value="3">较难</option>
     			 </select>
     		</td>
     	 <td align="center">ID查询:</td><td><input type="text" name="questionID"/></td></tr>
     	 <tr>
     	 <td>试题所属教师</td><td><select id="tea_id"  name="tea_id">
	 				<option value=""> -- 全部教师-- </option> 
	 	  				<c:forEach items="${teaList}" var="teaList">
	 				<option value="${teaList.tea_id}">${teaList.tea_name}</option>
	 	  				</c:forEach>
				</select></td>
     	 <td align="center">关键字查询:</td><td colspan="3"><input type="text" name="questionKey" size="50"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确定" class="btn" /></td>
  		</tr>
	</table>
	<br><br><br>
	</form>
		<c:if test="${QuestionType==1}">
		<table class="default" align="center" width="100%">
			<col width="3%" align="center" />
			<col width="20%" align="center"/>
			<col width="8%" align="center" />
			<col width="8%" align="center" />
			<col width="8%" align="center" />
			<col width="8%" align="center" />
			<col width="5%" align="center" />
			<col width="5%" align="center" />
			<col width="8%" align="center" />
			<col width="5%" align="center" />
			<col width="8%" align="center" />
			<col width="5%" align="center" />
			<col width="3%" align="center" />
			<col width="15%" align="center" />
				<tr class="title">
					<td>编号</td>
					<td>题目</td>
					<td>选项A</td>
					<td>选项B</td>
					<td>选项C</td>
					<td>选项D</td>
					<td>正确答案</td>
					<td>试题难度</td>
					<td>科目</td>
					<td>年级</td>
					<td>添加时间</td>
					<td>分值</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
		<c:choose>
			<c:when test="${empty choiceList}">
			<tr>
				<td colspan="15" align="center">没有找到符合条件的试题！</td>
			</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach  items="${choiceList}" var="choiceList">
				<tr class="changeColor">
					<td align="center">${choiceList.question_id }</td>
					<td align="center">${choiceList.question_body }</td>
					<td align="center">${choiceList.answer_A }</td>
					<td align="center">${choiceList.answer_B }</td>
					<td align="center">${choiceList.answer_C }</td>
					<td align="center">${choiceList.answer_D }</td>
					<td align="center">${choiceList.question_answer }</td>
					<td align="center">${choiceList.difficulty }</td>
					<td align="center">${choiceList.subject.subject_name }</td>
					<td align="center">${choiceList.grade.grade_name }</td>
					<td align="center">${choiceList.add_time }</td>
					<td align="center">${choiceList.question_score }</td>
					<td align="center">${choiceList.question_remark }</td>
					<td align="center">
					<a href="<c:url value='/question/showQuestion/question_id/${choiceList.question_id}/question_type/1'/>">查看</a>
					<c:if test="${choiceList.add_person==user_id }">|
					<a href="<c:url value='/question/updateChoiceById/question_id/${choiceList.question_id }'/>">修改</a>|
					<a href="<c:url value='/question/deleteQuestion/question_id/${choiceList.question_id }/question_type/1'/>">删除</a></c:if>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</c:if>
		<c:if test="${QuestionType==2}">
			<table class="default"  align="center">
				<tr class="title">
					<td>填空题编号</td>
					<td>填空题题目</td>
					<td>填空题答案</td>
					<td>填空题应填个数</td>
					<td>试题难度</td>
					<td>填空题科目</td>
					<td>适合年级</td>
					<td>添加时间</td>
					<td>试题分值</td>
					<td>试题备注</td>
					<td>操作</td>
				</tr>
		<c:choose>
			<c:when test="${empty clozeList}">
			<tr>
				<td colspan="15" align="center">没有找到符合条件的试题！</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach  items="${clozeList}" var="clozeList">
				<tr class="changeColor">
					<td>${clozeList.question_id }</td>
					<td>${clozeList.question_body }</td>
					<td>${clozeList.question_answer }</td>
					<td>${clozeList.question_num }</td>
					<td>${clozeList.difficulty }</td>
					<td>${clozeList.subject.subject_name }</td>
					<td>${clozeList.grade.grade_name }</td>
					<td>${clozeList.add_time }</td>
					<td>${clozeList.question_score }</td>
					<td>${clozeList.question_remark }</td>
					<td>
					<a href="<c:url value='/question/showQuestion/question_id/${clozeList.question_id}/question_type/2'/>">查看</a>
					<c:if test="${clozeList.add_person==user_id }">|
					<a href="<c:url value='/question/updateClozeById/question_id/${clozeList.question_id }'/>">修改</a>|
					<a href="<c:url value='/question/deleteQuestion/question_id/${clozeList.question_id }/question_type/2'/>">删除</a></c:if>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</c:if>
		<c:if test="${QuestionType==3}">
			<table class="default"  align="center">
				<tr class="title">
					<td>综合题编号</td>
					<td>综合题题目</td>
					<td>试题难度</td>
					<td>所属科目</td>
					<td>所属年级</td>
					<td>添加时间</td>
					<td>试题分数</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
		<c:choose>
			<c:when test="${empty comprehensiveList}">
			<tr>
				<td colspan="15" align="center">没有找到符合条件的试题！</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach  items="${comprehensiveList}" var="comprehensiveList">
				<tr class="changeColor">
					<td>${comprehensiveList.question_id }</td>
					<td>${comprehensiveList.question_title} ${comprehensiveList.question_body }</td>
					<td>${comprehensiveList.difficulty }</td>
					<td>${comprehensiveList.subject.subject_name }</td>
					<td>${comprehensiveList.grade.grade_name }</td>
					<td>${comprehensiveList.add_time }</td>
					<td>${comprehensiveList.question_score }</td>
					<td>${comprehensiveList.question_remark }</td>
					<td>
					<a href="<c:url value='/question/showQuestion/question_id/${comprehensiveList.question_id}/question_type/3'/>">查看</a>
					<c:if test="${comprehensiveList.add_person==user_id }">|
					<a href="<c:url value='/question/updateComprehensiveById/question_id/${comprehensiveList.question_id }'/>">修改</a>|
					<a href="<c:url value='/question/deleteQuestion/question_id/${comprehensiveList.question_id }/question_type/3'/>">删除</a></c:if>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</c:if>
		<c:if test="${QuestionType==4}">
			<table class="default"  align="center">
				<tr class="title">
					<td>简答题编号</td>
					<td>简答题题目</td>
					<td>简答题答案</td>
					<td>试题难度</td>
					<td>所属科目</td>
					<td>所属年级</td>
					<td>添加时间</td>
					<td>试题分数</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
		<c:choose>
			<c:when test="${empty shortAnswerList}">
			<tr>
				<td colspan="15" align="center">没有找到符合条件的试题！</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach  items="${shortAnswerList}" var="shortAnswerList">
				<tr class="changeColor">
					<td>${shortAnswerList.question_id }</td>
					<td>${shortAnswerList.question_body }</td>
					<td>${shortAnswerList.question_answer }</td>
					<td>${shortAnswerList.difficulty }</td>
					<td>${shortAnswerList.subject.subject_name }</td>
					<td>${shortAnswerList.grade.grade_name }</td>
					<td>${shortAnswerList.add_time }</td>
					<td>${shortAnswerList.question_score }</td>
					<td>${shortAnswerList.question_remark }</td>
					<td>
					<a href="<c:url value='/question/showQuestion/question_id/${shortAnswerList.question_id}/question_type/4'/>">查看</a>
					<c:if test="${shortAnswerList.add_person==user_id }">|
					<a href="<c:url value='/question/updateShortAnswerById/question_id/${shortAnswerList.question_id }'/>">修改</a>|
					<a href="<c:url value='/question/deleteQuestion/question_id/${shortAnswerList.question_id }/question_type/4'/>">删除</a></c:if>
					</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</c:if>
  </body>
</html>
