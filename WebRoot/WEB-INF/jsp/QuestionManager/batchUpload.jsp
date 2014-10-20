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
    
    <title>My JSP 'uploadChoice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link type="text/css" rel="stylesheet" href="css/default.css" />
	<link type="text/css" rel="stylesheet" href="css/jquery-ui-1.10.1.custom.min.css" />
	<script type="text/javascript" src="js/jquery-1.10.2.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/jquery-ui-1.10.1.custom.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/ajaxfileupload.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/exam.js" charset="UTF-8"></script>
	<script type="text/javascript">
	var fileName = "";
	var oTimer = null;
	var url_ = null;
	
	$(document).ready(function(){ 
		window.document.getElementById("fileToUpload").disabled = false;
	});
	
	function getProgress() {
		var now = new Date();
	    $.ajax({
	        type: "post",
	        dataType: "json",
	        url: url_,
	        data: now.getTime(),
	        success: function(data) {
	        	$("#progress_percent").text(data.percent);
	            $("#progress_bar").width(data.percent);
	            $("#has_upload").text(data.mbRead);
	            $("#upload_speed").text(data.speed);
	        },
	        error: function(err) {
	        	$("#progress_percent").text("Error");
	        }
	    });
	}
	
	/**
	 * 提交上传文件
	 */
	function fSubmit(url1_, url2_) {
		var fname=document.getElementById("fileToUpload").value;
		if(fname.length==0){
			alert("请选择上传的试题文件！");
			return ;
		}else{
		var questionType=document.getElementById("QuestionType");
		for(var i=0;i<questionType.options.length;i++){
			if(questionType.options[i].selected){
				if(questionType.options[i].value=="1"){
					url1_+="Choice";
				}else if(questionType.options[i].value=="2"){
					url1_+="Cloze";
				}else if(questionType.options[i].value=="3"){
					url1_+="Short";
				}else if(questionType.options[i].value=="4"){
					url1_+="Compre";
				}
			}
		}
		url_ = url2_;
		$("#process").show();
		$("#cancel").show();
		$("#info").show();
		$("#success_info").hide();
	    //文件名
	   	fileName = $("#fileToUpload").val().split('/').pop().split('\\').pop();
	    //进度和百分比
	    $("#progress_percent").text("0%");
	    $("#progress_bar").width("0%");
	    $("#progress_all").show();
	    oTimer = setInterval("getProgress()", 1000);
	    ajaxFileUpload(url1_);
	    //document.getElementById("upload_form").submit();
	    window.document.getElementById("fileToUpload").disabled = true;
	    }
	}
	
	/**
	 * 上传文件
	 */
	function ajaxFileUpload(url_) {
	    $.ajaxFileUpload({
	        url: url_,
	        secureuri: false,
	        fileElementId: 'fileToUpload',
	        dataType: 'json',
	        data: {
	            name: 'file',
	            id: 'id'
	        },
	        success: function(data, status) {
	            if (typeof(data.status) != 'undefined') {
	            	window.clearInterval(oTimer);
	                if (data.status == 'success') {
	                	$("#info").hide();
	                	$("#success_info").show();
	                	$("#success_info").text(fileName + "\t" +data.message);
	                	$("#process").hide();
	                	$("#cancel").hide();
	                	$("#fileToUpload").val("");
	                	window.document.getElementById("fileToUpload").disabled = false;
	                	//上传进度和上传速度清0
	                	$("#has_upload").text("0");
	                    $("#upload_speed").text("0");
	                    $("#progress_percent").text("0%");
	                    $("#progress_bar").width("0%");
	                } else{
	                	$("#progress_all").hide();
	                	$("#fileToUpload").val("");
	                	if (typeof(data.message) != 'undefined') {
	                		alert(data.message);
	                	}
	                	alert("上传错误！");
	                }
	            }
	        },
	        error: function(data, status, e) {
	            alert(e);
	        }
	    })
	    return false;
	}
	
</script>

  </head>
  
  <body>
  	<table cellSpacing=0 cellPadding=5 width="100%" border=0
			style="margin-top: 0px">
			<tr>
				<td class="manageHead">  
					当前位置：题库管理&nbsp;-&gt;批量添加试题
				</td>
			</tr>
	</table><br/><br/><br/>
  
  <div id="zong" align="center" style="width:100%;height:100%;">
	<table class="default" width="500">
		<tr class="title">
			<td colspan="3">批量上传试题</td>
		</tr>
		<tr class="changeColor">
			<td>上传试题类型：
				<select id="QuestionType"  name="QuestionType" emptyInfo="请选择试题类型">
	 				<option value="1"> --   选择题           --</option>
	 				<option value="2"> --   填空题           --</option>
	 				<option value="3"> --   简答题      --</option>
	 				<option value="4"> --   综合题           --</option>	    
				</select>
			</td>
			<td>
				<input type="file"  name="file" id="fileToUpload" title="请选择要上传的文件" onChange="getPath(this)">
			</td>
			<td>
			<img class="update" alt="上传文件" onclick="fSubmit('<c:url value='/excelAction/read'/>','<c:url value='/fileStatus/file_manager/progress'/>');"  src="images/icon.jpg">
		</tr>
		<tr class="changeColor">
			<td colspan="3">
				<div class="br"  style="display:none;" id="progress_all">
		        	<ul>
		            	<li>
		                	<div class="process clearfix" id="process">
								<span class="progress-box">
									<span class="progress-bar" style="width: 0%;" id="progress_bar"></span>
								</span>
		                        <span id="progress_percent">0%</span>
		                    </div>
		                    <div class="info" id="info">已上传：<span id="has_upload">0</span>MB  速度：<span id="upload_speed">0</span>KB/s</div>
		                    <div class="info" id="success_info" style="display: none;"></div>
		                </li>
		            </ul>
		        </div>
			</td>
		</tr>
		<tr class="title">
			<td colspan="3">下载题库</td>
		</tr>
		<tr class="changeColor">
			<td colspan="3">
				<a href="excelAction/exportChoice"><img alt="导出选择题题库" src="images/icon.gif">导出选择题题库</a>&nbsp;
				<a href="excelAction/exportCloze"><img alt="导出填空题题库" src="images/icon.gif">导出填空题题库</a>&nbsp;
				<a href="excelAction/exportShort"><img alt="导出简答题题库" src="images/icon.gif">导出简答题题库</a>&nbsp;
				<a href="excelAction/exportCompre"><img alt="导出综合题题库" src="images/icon.gif">导出综合题题库</a>
			</td>
		</tr>
		<tr>
			<td colspan="3"></td>
		</tr>
		<tr class="title">
			<td colspan="3">下载题库模版</td>
		</tr>
		<tr class="changeColor">
			<td colspan="3">
				<a href="excelAction/exportChoiceEmptyXLS"><img alt="导出选择题题库" src="images/icon.gif">导出选择题模版</a>&nbsp;
				<a href="excelAction/exportClozeEmptyXLS"><img alt="导出填空题题库" src="images/icon.gif">导出填空题题库</a>&nbsp;
				<a href="excelAction/exportShortEmptyXLS"><img alt="导出简答题题库" src="images/icon.gif">导出简答题题库</a>&nbsp;
				<a href="excelAction/exportCompreEmptyXLS"><img alt="导出综合题题库" src="images/icon.gif">导出综合题题库</a>
			</td>
		</tr>
	</table>
	</div>
  
<!--   <img class="update" alt="上传文件" onclick="showCont()" src="images/icon.jpg">
  <div class="yxbox">
    <div style="background-color: #20A8F0;"><h3><span onclick="closeCont();" style="float: right;">关闭</span>上传文件(超过1G文件上传同步较慢)</h3></div>
    <div class="pd15">
    	<form name="uploadForm" id="upload_form"  action="#" method="post" enctype="multipart/form-data">
    	<p class="mb20"><input type="file"  name="file" id="fileToUpload" title="请选择要上传的文件" onchange="fSubmit('<c:url value='/excelAction/readChoice'/>','<c:url value='/fileStatus/upfile/progress'/>');"></p>
        <div class="br"  style="display:none;" id="progress_all">
        	<ul>
            	<li><h1><a href="#" class="fr" id="cancel">取消</a></h1>
                	<div class="process clearfix" id="process">
						<span class="progress-box">
							<span class="progress-bar" style="width: 0%;" id="progress_bar"></span>
						</span>
                        <span id="progress_percent">0%</span>
                    </div>
                    <div class="info" id="info">已上传：<span id="has_upload">0</span>MB  速度：<span id="upload_speed">0</span>KB/s  状态：<span style="color: red;">上传中...</span></div>
                    <div class="info" id="success_info" style="display: none;"></div>
                </li>
            </ul>
        </div>
        </form>
    </div>
	</div>
	<div id="TB_overlayBG">&nbsp;</div>
	<script type="text/javascript">
	//显示弹框 
	function showCont(){
		$("#TB_overlayBG").css({
			display:"block",height:$(document).height()
		});
		$(".yxbox").css({
			left:($("body").width()-$(".yxbox").width())/2-20+"px",
			top:($(window).height()-$(".yxbox").height())/2+$(window).scrollTop()+"px",
			display:"block"
		});
	}
	// 关闭弹框 
	function closeCont(){
		$("#TB_overlayBG").hide();
		$(".yxbox").hide();
		window.location.reload();
	}
	function resetNavHeight() {
	    var documentHeight;
	    if (document.compatMode == 'BackCompat') {
	        documentHeight = Math.max(document.body.clientHeight,
	       	document.body.scrollHeight);
	    } else {
	        documentHeight = Math.max(document.documentElement.clientHeight,
	        document.documentElement.scrollHeight);
	    }
	    $('.left').height(documentHeight - 48);
	}
	
	resetNavHeight();
	$(window).resize(resetNavHeight);
	</script>	 -->
	<iframe id="ifile" style="display:none"></iframe> 
  
  </body>
</html>
