

//아이디 중복체크 
function signupIdCheck(){
	//json은 script가 객체를 못받아서 객체 형태를 String으로 띌 수 있는 json을 써준다. 
	var user_id =$("#user_id").val();
	var url="signupIdCheck.do";
	$.ajax({
		type:"post"
		,url:url	
		,data: {"user_id":user_id}
		,dataType:"json"})
		.done(function(args){
			if(args.num == 0){
				alert("사용가능한 아이디입니다.");
				$("#id_check_type").val(1);
			}else{
				alert("사용불가능한 아이디입니다.");
				$("#user_id").val('');//기존내용 제거

				$("#id_check_type").val(0);
			}
			
		})
		.fail(function(e) {
			alert("error");
			alert(e.responseText);
		});
}

//비밀번호 확인
function signupPasswordCheck(){

	var password = $("#password").val();
	var passwordChk = $("#passwordCheck").val();
//alert(password);
//alert(passwordChk);
	if(password == passwordChk){
		$("#passwordChkResult").text("비밀번호가 일치합니다.");
		$("#passwordChkResult").css("color","blue");
	}else{

		$("#passwordChkResult").text("비밀번호가 불일치합니다.");
		$("#passwordChkResult").css("color","red");
	}
}




