     function jmpPage(url){
     	var sel=$("#pageNum").val();
     	window.location.href=sel;
     }
     function jumpPage(url,pageNum){
			if(pageNum == 0){
				document.pageFrom.action=url+$("#pageNum").val();
			}else{
				document.pageFrom.action=url+pageNum;
			}
		    document.pageFrom.submit();
	}