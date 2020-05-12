
//회원 탈퇴비밀번호체크 후 탈퇴
function deleteUser(){	
	var password=$("#pass #password").val();
	var url="deleteUserCheck.do";
	$.ajax({
		type:"post"
		,url:url	
		,data: "password="+password
		,dataType:"json"})
		.done(function(args){
			if(args.num == 0){
				alert("비밀번호가 일치하지않습니다.");
				$("#pass #password").val('');
			}else{
				alert("탈퇴가 완료 되었습니다.");
				window.location.href="deleteUser.do";
			}	
		})
		.fail(function(e) {
			alert("error");
			alert(e.responseText);
		});
}

