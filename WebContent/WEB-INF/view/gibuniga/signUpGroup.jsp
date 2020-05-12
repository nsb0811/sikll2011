<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">

    <link rel="stylesheet" href="<c:url value="/resources/css/ionicons.min.css"/>">
    
    <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/icomoon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
//공백체크





function checkpass() {



 	 if (($("#user_id").val() == "")) {
		alert("ID를 입력해주세요.")
		$("#user_id").focus();
		return false;
	}

 	else if (($("#id_check_type").val() == 0)) {
		alert("ID 중복체크를 해주세요.");
		$("#user_id").focus();
		return false;
	}
	

   	
	
 	 else if($("#password").val() == ""){
		alert("비밀번호를 입력해 주세요.")
		$("#password").focus();
		return false;
	}

 	else if($("#passwordCheck").val() == ""){
		alert("비밀번호check를 입력해 주세요.")
		$("#passwordCheck").focus();
		return false;
	} 

 	else if($("#password").val() != $("#passwordCheck").val()){
		alert("비밀번호가 일치하지 않습니다.")
		$("#passwordCheck").focus();
		return false;
		} 
	
    	

 	 else	if($("#name").val() == ""){
		alert("이름을 입력해 주세요.")
		$("#name").focus();
		return false;
	}

 	 else if($("#nickname").val() == ""){
		alert("닉네임을 입력해 주세요.")
		$("#nickname").focus();
		return false;
	}

	 else if($("#nanmmbyNm").val() == ""){
			alert("모집단체명을 입력해 주세요.")
			$("#nanmmbyNm").focus();
			return false;
		}
	    
 	 
 	else if (($("#search_check_type").val() == 0)) {
		alert("모집단체명 검색을 해주세요");
		$("#nanmmbyNm").focus();
		return false;
	}
	

 	
	
 

	return true;
}

</script>





</head>
<body>

<form action="GroupUserSignup.do" method="post" enctype="multipart/form-data" onsubmit="return checkpass()">
<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters mb-5" style="background: #e8edf0;">
								<!-- <div class="col-md-7"> -->
									<div class="contact-wrap w-100 p-md-5 p-4">
										<h3 class="mb-4">회원가입</h3>
										<div id="form-message-warning" class="mb-4"></div> 
										<!-- <form method="POST" id="contactForm" name="contactForm" class="contactForm"> -->
											<div class="row">
												<div class="col-md-12" >
												<input type="hidden" name="organization_id" id="nanmmbyId"/>
														<label class="label" for="user_id">ID</label>
													<div class="form-group">
														<input type="text" class="form-control" name="user_id" id="user_id" placeholder="ID" style="width: 70%; display: inline-block;">
														<input type="button" value="중복체크" class="btn btn-primary" id="idCheckBtn" onclick="signupIdCheck()"/>
													</div>
												</div>
												<div class="col-md-12"> 
													<label class="label" for="password">비밀번호</label>
														<div class="form-group">
														<input type="password" class="form-control" name="password" id="password" placeholder="password" style="width: 70%; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12"> 
													<label class="label" for="password">비밀번호확인</label>
														<div class="form-group">
														<input type="password" class="form-control" name="passwordCheck" id="passwordCheck" placeholder="passwordCheck" onchange="signupPasswordCheck()" style="width: 70%; display: inline-block;">
														<div id="passwordChkResult"></div> 
													</div>
												</div>
												<div class="col-md-12"> 
													<label class="label" for="nickname">닉네임</label>
														<div class="form-group">
														<input type="text" class="form-control" name="nickname" id="nickname" placeholder="nickname" style="width: 70%; display: inline-block;">
													</div>
												</div>
												
												<div class="col-md-12">
													<label class="label" for="name">모집단체명</label>
														<div class="form-group">
														<input type="text" class="form-control" name="nanmmByNm" id="nanmmbyNm" placeholder="ex)(재)한베재단" style="width: 70%; margin: auto; display: inline-block;">
													    <input type="button" value="검색" class="btn btn-primary" id="idCheckBtn" onclick="searchCheck()"/>
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="name">대표자명</label>
														<div class="form-group">
														<input type="text" class="form-control" name="rprsntvNm" id="rprsntvNm" placeholder="ex)홍길동" style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="birthday">설립일자</label>
														<div class="form-group">
														<input type="text" class="form-control" name="fondDe" id="fondDe" placeholder="ex)20080331"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">전화번호</label>
														<div class="form-group">
														<input type="tel" class="form-control" name="dmstcTelno" id="dmstcTelno" placeholder="ex)02-0000-0000"style="width: 70%; margin: auto; display: inline-block;" >
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">공제유형</label>
														<div class="form-group">
														<input type="text" class="form-control" name="cntrDdcTy" id="phone_number" placeholder="ex)지정기부금"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
											<!-- 	<div class="col-md-12">
													<label class="label" for="phone_number">기부금단체 지정번호</label>
														<div class="form-group">
														<input type="text" class="form-control" name="ctbgrnpAppnNo" id="phone_number" placeholder="지정번호"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div> -->
												<div class="col-md-12">
													<label class="label" for="phone_number">팩스번호</label>
														<div class="form-group">
														<input type="tel" class="form-control" name="fxnum" id="fxnum" placeholder="ex)02-0000-0000"style="width: 70%; margin: auto; display: inline-block;" >
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">주소</label>
														<div class="form-group">
														<input type="text" class="form-control" name="adres" id="adres" placeholder="주소"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">상세주소</label>
														<div class="form-group">
														<input type="text" class="form-control" name="adres_detail" id="phone_number" placeholder="상세주소"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">우편번호</label>
														<div class="form-group">
														<input type="text" class="form-control" name="zip" id="zip" placeholder="우편번호"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">홈페이지 주소</label>
														<div class="form-group">
														<input type="text" class="form-control" name="hmpadres" id="hmpgAdres" placeholder="ex)http://www.hanviet.or.kr"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">사업자 등록번호</label>
														<div class="form-group">
														<input type="text" class="form-control" name="bizrno" id="bizrno" placeholder="ex)1234567891"style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												<div class="col-md-12">
													<label class="label" for="phone_number">기부단체 로고 등록</label>
														<div class="form-group">
														<input type="file" class="form-control" name="banner" id="banner" style="width: 70%; margin: auto; display: inline-block;">
													</div>
												</div>
												
												
												
												
												
												
												<div >
													<label class="label" >모집분야</label>
														<div >    
														<input type="radio"  name="type_id" id="" value="0" checked="checked">전체
													    <input type="radio" name="type_id" id="" value="1">아동,청소년
													    <input type="radio"  name="type_id" id="" value="2">노인복지
													    <input type="radio"  name="type_id" id="" value="3">장애인
													    <input type="radio"  name="type_id" id="" value="4">다문화
													    <input type="radio" name="type_id" id="" value="5">지구촌
													    <input type="radio"  name="type_id" id="" value="6">가족,여성
													    <input type="radio"  name="type_id" id="" value="7">동물
													    <input type="radio"  name="type_id" id="" value="8">환경
													     <input type="radio"  name="type_id" id="" value="9">기타
													</div>
												</div>
												
												
												
												
												<div class="col-md-12">
													<div class="form-group"> 
														<input type="button" value="취소" class="btn btn-primary" style="float: right; padding-left: 4%; padding-right: 4%;" onclick="location.href='main.do'"/>
														<input type="submit" value="회원가입" class="btn btn-primary" style="float: right; margin-right: 1%" onsubmit="return chkSum();"/>
														<div class="submitting"></div>
													</div>
												</div>
											</div>
									<!-- 	</form> -->
									</div> 
								<!-- </div> -->
								
							</div>
							
						</div>
					</div>
				</div>
    	</div>
    	<input type="hidden" id="user_type_id" name="user_type_id" value="1">
        	<input type="hidden" id="id_check_type"value="0">
        	<input type="hidden" id="search_check_type" value="0">
    </section>
    
    
    
</form>

  <!-- loader --> 
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


 <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/popper.min.js"/>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
  <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
  <script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<c:url value="/resources/js/google-map.js"/>"></script>
  <script src="<c:url value="/resources/js/main.js"/>"></script>
  <script src="<c:url value="/resources/js/logoutcheck.js"/>"></script>
  <script src="<c:url value="/resources/js/signup.js"/>"></script>
   <script src="<c:url value="/resources/js/searchOrganiztion.js"/>"></script>
</body>
</html>