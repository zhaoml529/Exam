/**
 * @author Administrator
 */
var xmlhttp2=null;         
var myfbt1=null;
var myfbt2=null;
var exam_id=null;
function createXMLHttpRequest2(){
	if(window.XMLHttpRequest){
		xmlhttp2 = new XMLHttpRequest();
		if(xmlhttp2.overrideMimeType){
			xmlhttp2.overrideMimeType("text/xml")
		}
	}else if(window.ActiveXObject){
		xmlhttp2= new ActiveXObject("Microsoft.XMLHTTP");
	}
}
	
function addqut(url_,qtype,qID,scores){
	myfbt1=document.getElementById("fadd"+qID);
    myfbt2=document.getElementById("fdel"+qID);
    exam_id=$("#exam_id").val();
	doAjax2(url_+"/qtype/"+qtype+"/qID/"+qID+"/scores/"+scores+"/exam_id/"+exam_id);
}
function delqut(url_,qtype,qID,scores){
	myfbt1=document.getElementById("fadd"+qID);
    myfbt2=document.getElementById("fdel"+qID);
    exam_id=$("#exam_id").val();
    doAjax2(url_+"/qtype/"+qtype+"/qID/"+qID+"/scores/"+scores+"/exam_id/"+exam_id);
}
	   
function doAjax2(url){
	createXMLHttpRequest2();
	if(xmlhttp2==null){
	    return false;
	}
	xmlhttp2.onreadystatechange=processRequest2;
	xmlhttp2.open("post",url,true);
	xmlhttp2.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp2.send(null);
}
       
function processRequest2(){
    if(xmlhttp2.readyState==4){
       if(xmlhttp2.responseText=="true"){
           myfbt1.value="已添加";
           myfbt1.disabled="disabled";
           myfbt2.disabled="";
           return;
       }else{
           myfbt1.value="添加";
           myfbt1.disabled="";
           myfbt2.disabled="disabled";
           return;
       }
    } 
} 