
//즐겨찾기 클릭시 컨트롤러를 통해서 인서트 딜리트 계산해서 리턴값이 1이면 인서트라서 이미지가  pStar로 바뀌고 리턴값이 그외라면 bStar로 바뀐다
function bookmark(a,b,c){
	
	var url="bookmark.do";
	var id = "#"+b;
	var projectURL = $("#projectURL").val();
$.ajax({
	  
type:"post"
,url:url
,data:"organization_id="+a+"&nanmmbyNm="+c
,dataType:"text"	}) 
.done(function(args){
   
   if(args==1){   
       $(id).attr("src",projectURL+"/resources/images/pStar.png");	
	   }
    else{  
    	 if(confirm("삭제하시겠습니까?")){
             location.href="bookmark.do";
           }else{
             close();
               }
   }
	 
	
	
	
	
}).fail(function(e){
	alert(e.responseText);
	
}); 
	
}

