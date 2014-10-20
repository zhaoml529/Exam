/*
 * add_manualExtract.jsp
 * 手动添加试题
 */
function searchQuestion(pagenum, url_) {
	if (pagenum == 0) {
		pagenum = $("#pageNum").val();
	}
	var subject = $("#subject").val();
	var grade = $("#grade").val();
	var tea_name = $("#tea_name").val();
	var chapter = $("#chapter").val();
	var difficulty = $("#difficulty").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var questionID = $("#questionID").val();
	var questionKey = $("#questionKey").val();
	var questionType = $("#questionType").val();
	var exam_id = $("#exam_id").val();
	var reg = /^\d*$/;
	if (reg.test(questionID) == false) {
		alert("ID查询必须输入数字");
	} else {
		alert("run post..");
		$.post(url_, {
			subject : subject,
			grade : grade,
			tea_name : tea_name,
			chapter : chapter,
			difficulty : difficulty,
			startTime : startTime,
			endTime : endTime,
			questionID : questionID,
			questionKey : questionKey,
			questionType : questionType,
			exam_id : exam_id,
			pageNum : pagenum
		}, function(data, readyState, status) {
			var mydiv = document.getElementById("questionlist");
			if (readyState == "success") {
				mydiv.innerHTML = data;
			} else {
				mydiv.innerHTML = "正在查询...";
			}
		});
	}
}

/*
 * add_paper.jsp 选择第一学科后，显示第二学科
 */

function changeSubjectOne(subID) {
	$.ajax({
		type : "POST",
		url : "changeProfessionArea.action",
		cache : false, // 将不会从浏览器缓存中加载请求信息。
		data : {
			area_id : subID
		},
		dataType : "json",
		success : function(json) {
			var selc = document.getElementById("subTwo");
			selc.length = 0;
			var op;
			for ( var i = 0; i < json.length; i++) {
				op = new Option(json[i].area_name, json[i].area_id);
				selc.options.add(op);
			}
			document.getElementById("subTwo").disabled = false;
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}

/*
 * add_paper.jsp 选择第二学科后，显示第三学科
 */
function changeSubjectTwo(subID) {
	$.ajax({
		type : "POST",
		url : "changeProfessionInformation.action",
		cache : false,
		data : {
			area_id : subID
		},
		dataType : 'json',
		success : function(json) {
			var selc = document.getElementById("subThree");
			if (json.length == 0) {
				selc.length = 0;
				var op;
				op = new Option('--暂无学科专业--', 0);
				selc.options.add(op);
				$("#subTwo").attr("name", "subjectArea.subArea_id");
				$("#subThree").attr("name", "subArea_id");
				document.getElementById("subThree").disabled = true;
			} else {
				selc.length = 0;
				var op;
				op = new Option('--请选择第三学科--', 0);
				selc.options.add(op);
				for ( var i = 0; i < json.length; i++) {
					op = new Option(json[i].profession_name,
							json[i].profession_id);
					selc.options.add(op);
				}
				document.getElementById("subThree").disabled = false;
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}
/*
 * add_paper.jsp 显示第三学科
 */
function changeSubjectThree(subID) {
	$.ajax({
		type : "POST",
		url : "changeProfessionInformation.action",
		cache : false,
		data : {
			area_id : subID
		},
		dataType : 'json',
		success : function(json) {
			var selc = document.getElementById("subThree");
			if (json.length == 0) {
				selc.length = 0;
				var op;
				op = new Option('--暂无学科专业--', 0);
				selc.options.add(op);
				$("#subTwo").attr("name", "subjectArea.subArea_id");
				$("#subThree").attr("name", "subArea_id");
				document.getElementById("subThree").disabled = true;
			} else {
				selc.length = 0;
				var op;
				op = new Option('--请选择第三学科--', 0);
				selc.options.add(op);
				for ( var i = 0; i < json.length; i++) {
					op = new Option(json[i].profession_name,
							json[i].profession_id);
					selc.options.add(op);
				}
				document.getElementById("subThree").disabled = false;
			}
		}
	});
}

/*
 * add_paper.jsp 章节已经在表中删除，没用了。
 */
function changeSub_noNeed(id) {
	$.ajax({
		type : "POST", // 请求方式
		url : "searchChapter.action", // 请求路径
		cache : false,
		data : {
			subject_id : id
		}, // 传参
		dataType : 'json', // 返回值类型
		success : function(json) {
			var selc = document.getElementById("chapter");
			selc.length = 0;
			var op;
			for ( var i = 0; i < json.length; i++) {
				op = new Option(json[i].chapter_name, json[i].chapter_id);
				selc.options.add(op);
			}
			selc.options.add(new Option("全部章节", ""));
			document.getElementById("chapter").disabled = false;
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}

/**
 * 手动添加空白试卷试题
 * @param subID
 */
function saveQuestion(url_, type, id, score) {
	e_id=$("#exam_id").val(); 
	$.ajax({
		type : "POST",
		url : url_,
		data : {type_id:type,question_id:id,question_score:score,exam_id:e_id},
		dataType : "json",
		success : function(json) {
			var score = document.getElementById("score");
			$("#score").html(json[0].question_score);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
		}
	});
}

function showTeacher(url, dept_id){
 	$.ajax({ 
	       type:"POST", //����ʽ 
	       url:url, //����·�� 
	       cache: false,  
	       data:{department_id : dept_id},  //���� 
    	   dataType: 'json',   //����ֵ���� 
	       success:function(json){
	        document.getElementById("msg").innerHTML="��ǰ�� "+json.length+"��";
			var txt="<table border='1' class='default' width='100%'><tr class='title'><td>ѧ��</td><td>����</td><td>�Ա�</td></tr>";
			for ( var i = 0; i < json.length; i++) {
			txt=txt+"<tr align='center'><td>"+json[i].tea_id+"</td><td>"+json[i].tea_name+"</td><td>"+json[i].tea_sex+"</td></tr>";
			}
			txt=txt+"</table>";
			document.getElementById("mytable").innerHTML=txt;
	       } 
     }); 
}

/*
 * 在线考试
 */	
function getChoice(choiceAnswer,choiceNum,choiceId) {
	var time = $("#time").html();
	$.post("onlineExam/getChoice", { choiceAnswer: choiceAnswer, choiceNum: choiceNum, choiceId:choiceId, time:time},function(){
		$("div #choice"+choiceNum).empty().append("已完成");
	} );
}
function getCloze(clozeAnswer,clozeNum,clozeId){
	var time = $("#time").html();
	$.post("onlineExam/getCloze",{clozeAnswer: clozeAnswer,clozeNum:clozeNum,clozeId:clozeId, time:time},function(){
		$("div #cloze"+clozeNum).empty().append("已完成");
	});
}
function getShortAnswer(shortAnswer,shortAnswerNum) {
	var time = $("#time").html();
	$.post("onlineExam/getShortAnswer",{shortAnswer:shortAnswer,shortAnswerNum:shortAnswerNum, time:time},function(){
		$("div #shortAnswer"+shortAnswerNum).empty().append("已完成");
	});
}
function getComprehensive(comprehensive,num){
	var answer=$("textarea[name="+comprehensive+"]").val();
	var time = $("#time").html();
	$.post("onlineExam/getComprehensive",{comprehensive:answer,comprehensiveNum:num, time:time},function(){
		$("div #comprehensive"+num).empty().append("已完成");});
}


function changeDiv(str){
	if(str=="choicecon"){
	document.getElementById("choicecon").style.display="block";	
	document.getElementById("clozecon").style.display="none";
	document.getElementById("shortAnswercon").style.display="none";
	document.getElementById("comprehensivecon").style.display="none";
	}else if(str=="clozecon"){
		document.getElementById("choicecon").style.display="none";	
	document.getElementById("clozecon").style.display="block";
	document.getElementById("shortAnswercon").style.display="none";
	document.getElementById("comprehensivecon").style.display="none";
	}else if(str=="shortAnswercon"){
		document.getElementById("choicecon").style.display="none";	
	document.getElementById("clozecon").style.display="none";
	document.getElementById("shortAnswercon").style.display="block";
	document.getElementById("comprehensivecon").style.display="none";
		
	}else if(str=="comprehensivecon"){
		document.getElementById("choicecon").style.display="none";	
	document.getElementById("clozecon").style.display="none";
	document.getElementById("shortAnswercon").style.display="none";
	document.getElementById("comprehensivecon").style.display="block";
	}
}


/*
 * 在线练习
 */
function getChoiceToPractice(choiceAnswer,choiceNum,choiceId) {
	$.post("onlineExam/getChoiceToPractice", { choiceAnswer: choiceAnswer, choiceNum: choiceNum, choiceId:choiceId},function(){
		$("div #choice_"+choiceNum).empty().append("已完成");
	} );
}
function getClozeToPractice(clozeAnswer,clozeNum,clozeId){
	$.post("onlineExam/getClozeToPractice",{clozeAnswer: clozeAnswer,clozeNum:clozeNum,clozeId:clozeId},function(){
		$("div #cloze_"+num).empty().append("已完成");
	});
}
function getShortAnswerToPractice(shortAnswer,shortAnswerNum) {
	$.post("onlineExam/getShortAnswerToPractice",{shortAnswer:shortAnswer,shortAnswerNum:shortAnswerNum},function(){
		$("div #shortAnswer_"+num).empty().append("已完成");
	});
}


/*
 * 二次判分
 */
function getResponseAnswerScore(num,id){
	var score=$("#"+id).val();
	$.post("doManagerStuPapersServlet",{action:'judgment',questionType:'responseAnswer',num:num,score:score},function(){
	});
}

function getprincipleAiscussScore(num,id){
	var score=$("#"+id).val();
	$.post("doManagerStuPapersServlet",{action:'judgment',questionType:'principleAiscuss',num:num,score:score},function(){
	});
}

function getsystemDesignScore(num,id){
	var score=$("#"+id).val();
	$.post("doManagerStuPapersServlet",{action:'judgment',questionType:'systemDesign',num:num,score:score},function(){
	});
}

function getsystemOperationScore(num,id){
	var score=$("#"+id).val();
	$.post("doManagerStuPapersServlet",{action:'judgment',questionType:'systemOperation',num:num,score:score},function(){
	});
}
/*
 * lisr_student.jsp 选择院系后显示第专业
 */

function changeDepartment(url_,deptID) {
	$.ajax({
		type : "POST",
		url : url_,
		cache : false, // 将不会从浏览器缓存中加载请求信息。
		data : {
			department_id : deptID
		},
		dataType : "json",
		success : function(json) {
			var selc = document.getElementById("professional");
			selc.length = 0;
			var op;
			if(json.proList != null){
				op = new Option("--请选择专业--",0);
				selc.options.add(op);
				for ( var i = 0; i < json.proList.length; i++) {
					op = new Option(json.proList[i].profession_name, json.proList[i].profession_id);
					selc.options.add(op);
				}
				document.getElementById("professional").disabled = false;
			}else{
				op = new Option("--此院系无相应专业--",0);
				selc.options.add(op);
				document.getElementById("professional").disabled = true;
				document.getElementById("subject").disabled = true;
			}
			
			var tea = document.getElementById("teacher"); 
			tea.length = 0;
			var opt;
			opt = new Option("--请选择教师--",0);
			tea.options.add(opt);
			if(json.teaList != null){
				for( var j = 0; j < json.teaList.length; j++){
					opt = new Option(json.teaList[j].tea_name, json.teaList[j].tea_id);
					tea.options.add(opt);
				}
				document.getElementById("teacher").disabled = false;
			}else{
				document.getElementById("teacher").disabled = true;
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("对不起，该院系下没有专业，请添加。");

		}
	});
}


function changeProfessional(url_,proId){
	$.ajax({
		type : "POST",
		url : url_,
		cache : false, // 将不会从浏览器缓存中加载请求信息。
		data : {
			profession_id : proId
		},
		dataType : "json",
		success : function(json) {
			var selc = document.getElementById("subject");
			selc.length = 0;
			var op;
			if(json != null){
				op = new Option("--请选择科目--",0);
				selc.options.add(op);
				for ( var i = 0; i < json.length; i++) {
					op = new Option(json[i].subject_name, json[i].subject_id);
					selc.options.add(op);
				}
				document.getElementById("subject").disabled = false;
			}else{
				op = new Option("--此专业没有相应科目--",0);
				selc.options.add(op);
				document.getElementById("subject").disabled = true;
				document.getElementById("teacher").disabled = true;
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {

		}
	});
}

function changeGrade(url_,gradeId){
	$.ajax({
		type : "POST",
		url : url_,
		cache : false, // 将不会从浏览器缓存中加载请求信息。
		data : {
			grade_id : gradeId
		},
		dataType : "json",
		success : function(json) {
			var selc = document.getElementById("classinfo");
			selc.length = 0;
			var op;
			op = new Option("--请选择班级--",0);
			selc.options.add(op);
			for ( var i = 0; i < json.length; i++) {
				op = new Option(json[i].class_name, json[i].class_id);
				selc.options.add(op);
			}
			document.getElementById("classinfo").disabled = false;
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("对不起，该年级下没有班级，请添加。");
			op = new Option("--此专业没有相应科目--",0);
			selc.options.add(op);
			document.getElementById("classinfo").disabled = true;
		}
	});
}

function changeSubject(url_,id){
	$.ajax({
		type : "POST",
		url : url_,
		cache : false, // 将不会从浏览器缓存中加载请求信息。
		data : {
			subId : id
		},
		dataType : "json",
		success : function(json) {
			var selc = document.getElementById("grade");
			selc.length = 0;
			var op;
			op = new Option("--请选择年级--",0);
			selc.options.add(op);
			for ( var i = 0; i < json.length; i++) {
				op = new Option(json[i].grade_name, json[i].grade_id);
				selc.options.add(op);
			}
			document.getElementById("grade").disabled = false;
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			document.getElementById("grade").disabled = true;
		}
	});
}

function getPath(obj){
	if(obj.value.indexOf('.xls')==-1){
		alert("请上传excel格式的文件");
	}
}
