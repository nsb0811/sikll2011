<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   
    <!--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--> 
   <meta http-equiv="X-UA-Compatible" content="IE=edge" /><meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, shrink-to-fit=no" />
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
    <link href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/ionicons.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/icomoon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


</head>
<body>
	<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters mb-5">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4" style="margin-left: 35%;">
										<h3 class="mb-4">LOGIN</h3>
										<div id="form-message-warning" class="mb-4"></div> 
					      		<div id="form-message-success" class="mb-4">
					            	<div class="col-md-12" >
										<label class="label" for="user_id">ID</label>
											<div class="form-group">
												<input type="text" class="form-control" name="user_id" id="user_id" placeholder="ID를 입력해주세요" style="width: 100%;">
											</div>
									</div>
					      		</div>
					      		<div class="col-md-12"> 
									<label class="label" for="password">password</label>
										<div class="form-group">
											<input type="password" class="form-control" name="password" id="password" placeholder="password를 입력해주세요" style="width: 100%; display: inline-block;">
										</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="button" value="로그인" class="btn btn-primary" onclick="loginCheck()"/>
										<input type="button" value="취소" class="btn btn-primary" onclick="location.href='main.do'"/>
										<div class="submitting"></div>
									</div>
								</div>
								<!-- 카카오로그인 버튼 -->
								<div class="col-md-12">
								<div class="form-group" style="display: inline-block;">
									<a id="kakao-login-btn"></a>
									<%-- <div onclick="kakaoLogOut();"><span id="kakaoThumbnailImg"></span></div>
									<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a> --%>
									
									<!-- 네이버 로그인 창으로 이동 -->
									<div id="naver_id_login" style="text-align:center; margin-top: 10%;">
									<a href="${url}">
									<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
									</a>
								</div>
								</div>
								</div>
								
								<%-- <a id="kakaoPayBtn" onclick="kakaoPay();"> <img alt="카카오페이결제버튼" src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"></a>
								<a id="naverPayBtn" onclick="naverPay();"><img alt="네이버페이결제버튼" src="${pageContext.request.contextPath}/resources/images/npay_logo.PNG"></a> 
								<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼" onclick="naverPay();">
								<input type="button" id="kakaoPayBtn" value="카카오페이 결제 버튼" onclick="kakaoPay();">  --%> 
							
							</div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>
    </section>
	
    

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <!--카카오로그인  -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
  <script src="<c:url value="/resources/js/payment.js"/>"></script>
</body>
</html>