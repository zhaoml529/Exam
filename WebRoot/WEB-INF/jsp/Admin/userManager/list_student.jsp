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
    
    <title>学生列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href='<c:url value="/css/default.css"/>' />
	<script type="text/javascript" src="<c:url value='/js/page.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/js/exam.js'/>" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.10.2.min.js"/>" charset="UTF-8"></script>
  </head>
  
  <body>

    <table cellSpacing=0 cellPadding=5 style="" width="100%" border=0 style=" margin-top:0px">
        <tr>
          <td class="manageHead">当前位置：人员管理&nbsp;-&gt;学生信息管理</td>
        </tr>
        <tr>
          <td height=2></td></tr>
    </table>
      <div style=" margin-bottom:10px;display:inline;">
       <input type="button" value="添加学生" class="btn" onclick="location.href='<c:url value='/usermanager/addStudent'/>'"/>
    </div>
     <br/>
    <form action="<c:url value='/usermanager/listStudent/pageNum/1'/>" method="post">
	 		<select name="dept_id" onchange="changeDepartment('<c:url value='/usermanager/getProfessionById'/>',this.value);" emptyInfo="请选择院系" style="width:150px;">
	 			<option value="">--请选择院系--</option>
	 			<c:forEach items="${deptList}" var="deptList">
	 				<option value="${deptList.department_id}">${deptList.department_name}</option>
	 			</c:forEach>
     		</select>
	 		<select id="professional" name="pro_id" emptyInfo="请选择专业" disabled="disabled" style="width:150px;">
	 			<option value="0" selected="selected">--请选择专业--</option>
	 		</select>
     <input type="submit" class="btn"  value="查找"/>
     </form>
     <br/><br/>
     <table align="center" class="default" width="800px">
	   <col width="12%" align="center" /><!-- 1 -->
		<col width="6%" align="center" /><!-- 2 -->
		<col width="5%" align="center" /><!-- 3 -->
		<col width="5%" align="center" /><!-- 4 -->
		<col width="5%" align="center" /><!-- 5 -->
		<col width="3%" align="center" /><!-- 6 -->
		<col width="5%" align="center" /><!-- 7 -->
		<col width="10%" align="center" /><!-- 8 -->
		<tr class="title">
			<td>学生编号</td><!-- 1 -->
			<td>学生姓名</td><!-- 2 -->
			<td>学生所属机构</td><!-- 3 -->
			<td>学生年级</td><!-- 4 -->
			<td>学生专业</td><!-- 5 -->
			<td>学生班级</td><!-- 6 -->
			<td>学生说明</td><!-- 7 -->
			<td>操作</td><!-- 8 -->
		</tr>
		<c:choose>
			<c:when test="${empty studentList}">
				<tr>
					<td colspan="8" align="center">请选择院系及专业</td>
				</tr>
			</c:when>
			<c:otherwise>
		<c:forEach items="${studentList}" var="studentList">
		<tr class="changeColor">
		    <td><c:out value="${studentList.stu_id}"/></td>
			<td><c:out value="${studentList.stu_name}"/></td>
			<td><c:out value="${studentList.departmentInformation.department_name}"/></td>
			<td><c:out value="${studentList.gradeInformation.grade_name}"/></td>
			<td><c:out value="${studentList.professionInformation.profession_name}"/></td>
			<td><c:out value="${studentList.classInformation.class_name}"/></td>
			<td><c:out value="${studentList.stu_remark == null?'无':studentList.stu_remark}"/></td>
			<td>
				<a href="<c:url value='/usermanager/showStudentInfo/${studentList.stu_id }'/>">查看</a>
				<a href="<c:url value='/usermanager/updateStudentById/${studentList.stu_id}'/>">修改</a>
				<a href="<c:url value='/usermanager/deleteStudent/${studentList.stu_id}'/>" onclick="return confirm('确定删除此学生吗?');">删除</a>
		   </td>
		</tr>	
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</table>
	<c:if test="${!empty studentList }">
	<form name="pageFrom" method="post">
	<table align="center" width="500">
    <tr>
    	<td align="center" colspan="10">
    	第<c:out value="${pageBean.currentPage}"/>页
    	共<c:out value="${pageBean.totalPage}"/>页
    	<a href="javascript:jumpPage('<c:url value="/usermanager/listStudent/pageNum/"/>',${1});">首页</a>
    	<c:if test="${pageBean.hasPreviousPage == true}"><a href="javascript:jumpPage('<c:url value="/usermanager/listStudent/pageNum/"/>',${pageBean.prePage});">上一页</a></c:if>
    	<c:if test="${pageBean.hasNextPage == true}"><a href="javascript:jumpPage('<c:url value="/usermanager/listStudent/pageNum/"/>',${pageBean.nextPage});">下一页</a></c:if>
    	<a href="javascript:jumpPage('<c:url value="/usermanager/listStudent/pageNum/"/>',${pageBean.totalPage});">尾页</a>
    	转到
    	<select id="pageNum">
    		<c:forEach  var="pageBean" varStatus="status" begin="1" end="${pageBean.totalPage}">
    			<option value="${status.count}">${status.count}</option>
    		</c:forEach>
    	</select>
    	页 
     	<input type="button" width="30px" value="GO" onclick="jumpPage('<c:url value='/usermanager/listStudent/pageNum/'/>',${0 });">
    	</td>
    </tr>
    </table>
    <input type="hidden" name="dept_id" value="${department_id }"/>
    <input type="hidden" name="pro_id" value="${profession_id }"/>
    </form>
	</c:if>
  </body>
</html>
