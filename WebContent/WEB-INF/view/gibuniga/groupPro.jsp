<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
 
</head>
<body>
<section class="ftco-section testimony-section bg-primary">

<c:if test="${R==1}">
 <div class="container">
     
        <div class="row justify-content-center mb-5">
        
          <div class="col-md-8 text-center heading-section heading-section-white ftco-animate">
          	<span class="subheading"></span>
            <h2 class="mb-4">회원가입 완료</h2>
           <a class="btn btn-primary" href="main.do">Home</a>
           <a class="btn btn-primary" href="loginForm.do">로그인</a>
          </div>
        </div>
         
        <div class="row ftco-animate"> 
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
            </div>
          </div>  
        </div>
        </div>
          
          </c:if>
       <c:if test="${R==0 }">
 <div class="container">
     
        <div class="row justify-content-center mb-5">
        
          <div class="col-md-8 text-center heading-section heading-section-white ftco-animate">
          	<span class="subheading"></span>
            <h2 class="mb-4">이미 가입되어 있는 기부단체입니다</h2>
          <a class="btn btn-primary" href="signupCheck.do?num=2">되돌아가기</a>
          </div>
        </div>
        
        <div class="row ftco-animate"> 
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
            </div>
          </div>  
        </div>
        </div>   
          </c:if>
    </section>








  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  <script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>
  <script src="<c:url value="/resources/js/signup.js?v=1"/>"></script>
    
</body>
</html>