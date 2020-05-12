// modal
var modal = document.getElementById('myModal');
// 회원가입 버튼 
var btn = document.getElementById("myBtn");
var loginBtn = document.getElementById("loginBtn");
//span x버튼
var spanM = document.getElementsByClassName("close_m"); 

//-------modal
//회원가입 누르면 modal나옴 
/*btn.onclick = function() {
    modal.style.display = "block";
}
*/
//modal의 X버튼 누르면 modal close 
function closeX() {
	modal.style.display = "none";
}

//회원가입 누르면 modal나옴 
function memberBtn(){
	modal.style.display = "block";
}

// modal외의 것 클릭하면 modal close
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

//loginForm으로 가기 
/*loginBtn.onclick = function(){
	location.href="loginForm.do";
}*/
function memberloginBtn(){
	location.href="loginForm.do";
}

//logout시 controller session 삭제 처리로 이동  
function logout(){
			if(confirm("로그아웃 하시겠습니까?")){
				//kakaoLogOut();
				location.href = "logout.do"; 
			}else{
						
			}
}

//카카오톡 로그인
//사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('28abf74319c8fba2a728a8ac668a3696');
// 카카오 로그인 버튼을 생성합니다.
Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
     // 로그인 성공시, API를 호출합니다.
     Kakao.API.request({
      url: '/v2/user/me',
      success: function(res) {
       console.log(res);
       
       var user_id = res.id;      //유저의 카카오톡 고유 id
       var nickname = res.properties.nickname; //유저가 등록한 별명
       //var userEmail = res.kaccount_email;   //유저의 이메일
       //document.getElementById( "kakaoThumbnailImg" ).innerHTML = res.properties.nickname;
       console.log(user_id);
       console.log(nickname);
       
       $.ajax({
   		type:"get"
   		,url:"kakaoLogin.do?user_id="+user_id+"&nickname="+nickname	 
   		,dataType:"html"})
   		.done(function(args){
   				location.href = "main.do";
   		})
   		.fail(function(e) {
   			alert("error");
   			alert(e.responseText);
   		});
       //
      // location.href = "main.do";
      },
      fail: function(error) {
       alert(JSON.stringify(error));
      }
     });
    },
    fail: function(err) {
     alert(JSON.stringify(err));
    }
   });


//카카오 톡의 로그아웃 기능 굳이 사용할 필요는 없다. 
/*function kakaoLogOut(){
	alert("ok");
	//이 페이지에서 정보 삭제 
	Kakao.Auth.logout(function() {
		  console.log(Kakao.Auth.getAccessToken());
		});
	
	
 *카카오 이 페이지에서 탈퇴 
 * Kakao.API.request({
		  url: '/v1/user/unlink',
		  success: function(response) {
		    console.log(response);
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
}*/
 
//홈페이지 가입 로그인 확인 
function loginCheck(){
	//json은 script가 객체를 못받아서 객체 형태를 String으로 띌 수 있는 json을 써준다. 
	var user_id =$("#user_id").val();
	var password=$("#password").val();
	var url="loginCheck.do";
	$.ajax({
		type:"post"
		,url:url	
		,data: "user_id="+user_id+"&password="+password
		,dataType:"json"})
		.done(function(args){
			if(args.num == 0){
				alert("아이디 OR 비밀번호가 일치하지않습니다.");

				$("#user_id").val('');//기존내용 제거
				$("#password").val('');//기존내용 제거
			}else{
				alert("로그인되었습니다.");
				
				
				window.location="main.do";
			}
			
		})
		.fail(function(e) {
			alert("error");
			alert(e.responseText);
		});
}




//프로그램 신청 접근 권한 
function programAuthorityCheck() {
	//alert("start");
	var user_type = $("#user_type").val();
	if(user_type != 2 ){
		alert("기부단체 전용 페이지입니다.\n 접근권한이 없습니다.")
		//location.href="main.do";
	}else{
		location.href = "requestList.do";
	}
}
