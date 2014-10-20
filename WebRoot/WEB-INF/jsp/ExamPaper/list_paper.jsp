<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷列表</title>
<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
<script type="text/javascript" src="<c:url value='/js/page.js'/>" charset="UTF-8"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-1.10.2.min.js'/>" charset="UTF-8"></script>

<script type="text/javascript">
     function showSearch1(values) {
        		if(values=="打开搜索"){
        		$("#Search").show("slow");
        		$("#SearchBtn1").val("关闭搜索");
        		}
        		if(values=="关闭搜索"){
        		$("#Search").hide("slow");
        		$("#SearchBtn1").val("打开搜索");
        		}
        }
</script>
</head>
<body>
	<table cellSpacing=0 cellPadding=5 width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：试卷管理&nbsp;-&gt;试卷列表</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
    <br/>
    <div style=" margin-bottom:10px;display:inline;">
    <c:choose>
    	<c:when test="${empty courseList }">
    		<span class="note">您当前没有课程安排，不能添加试卷。若有错误，请联系管理员！</span>
    	</c:when>
    	<c:otherwise><input type="button" value="添加试卷" class="btn" onclick="location.href='<c:url value="/exam/addExamPaper/user_id/${user_id}"/>'"/></c:otherwise>
    </c:choose>
    </div>
    <br/>    
	<table class="default" width="100%">
	   <col width="5%" align="center" />
		<col width="15%" align="center"/>
		<col width="15%" align="center" />
		<col width="8%" align="center" />
		<col width="5%" align="center" />
		<col width="10%" align="center" />
		<col width="8%" align="center" />
		<col width="8%" align="center" />
		<col width="5%" align="center" />
		<col width="10%" align="center" />
		<tr class="title">
			<td>试卷ID</td>
			<td>试卷名称</td>
			<td>试卷科目</td>
			<td>创建者</td>
			<td>创建时间</td>
			<td>创建对象</td>
			<td>使用本卷</td>
			<td>组卷方式</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		<c:choose>
			<c:when test="${empty paperList}">
				<tr>
					<td colspan="11" align="center">暂无试卷列表</td>
				</tr>
			</c:when>
			<c:otherwise>
		<c:forEach items="${paperList}" var="paperList">
		<tr class="changeColor">
			<td><c:out value="${paperList.exam_id}"/></td>
			<td><c:out value="${paperList.exam_name}"/></td>
			<td><c:out value="${paperList.subject.subject_name}"/></td>
			<td><c:out value="${paperList.teacherInformation.tea_name}"/></td>
			<td><c:out value="${paperList.exam_date}"/></td>
			<td><c:out value="${paperList.gradeInformation.grade_name}"/></td>
			<td><input type="button"  class="btn" value="添加任务" onclick="location.href='<c:url value='/exam/addExamTask/exam_id/${paperList.exam_id}'/>'"/></td>
			<td>
				<c:choose>
					<c:when test="${paperList.exam_way == 1}">自动</c:when>
					<c:otherwise>手动</c:otherwise>
				</c:choose>
			</td>
			<td><c:out value="${paperList.exam_remark}"/></td>
			<td>
				<a href="<c:url value="/exam/updateExamPaperById/exam_id/${paperList.exam_id}"/>">修改</a>
				<a href="<c:url value="/exam/deleteExamPaper/exam_id/${paperList.exam_id}"/>" onclick="return confirm('确定删除该试卷?')">删除</a>
				<a href="<c:url value="/exam/addSetExamPaper/exam_id/${paperList.exam_id}/exam_way/${paperList.exam_way}"/>">添加试题</a>
			<!--<a href=" ">试卷浏览</a> -->
				<a href="<c:url value="/exam/showExamPaper/examPaper_id/${paperList.exam_id}"/>">详细信息</a>
				<a href="<c:url value="/exam/statisticsScore/${paperList.exam_id}"/>">试卷统计</a>
			</td>
		</tr>	
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</table>
	<table align="center" width="500">
    <tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="<c:url value="/exam/listExamPaper/pageNum/1"/>">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="<c:url value="/exam/listExamPaper/pageNum/${pageBean.prePage}"/>">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="<c:url value="/exam/listExamPaper/pageNum/${pageBean.nextPage}"/>">下一页</a></c:if>
    	<a href="<c:url value="/exam/listExamPaper/pageNum/${pageBean.totalPage}"/>">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jmpPage('listExamPaper');">
    	</td>
    </tr>
    </table>
</body>
</html>