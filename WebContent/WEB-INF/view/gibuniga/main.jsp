<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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

<script type="text/javascript">
window.onload = function(){
	$.ajax({
		type : "post",
		url : "notifyCheck.do",
		dataType : "json"
	}).done(function(args){
		if(args > 0){
			alert("다른 이용자가 신고한 댓글이 있습니다.");
		}
				
	}).fail(function(e){
		alert(e.responseText);	
	})
}

/* function notifyCheck(){
	alert("notifyCheck!");
	$.ajax({
		type : "post",
		url : "notifyCheck.do",
		dataType : "json"
	}).done(function(args){
		if(args > 0){
			alert("다른 이용자가 신고한 댓글이 있습니다. 댓글을 수정해주세요.");
		}
				
	}).fail(function(e){
		alert(e.responseText);	
	})
} */

</script>
 </head>
  
  <body>



    
    <!-- END nav  액션바-->
    <div class="hero-wrap" >
	   <div class="home-slider owl-carousel">
	     <c:forEach var="newAscList" items="${newAscList}">
	     
	      	<div class="slider-item" style="background-image: url(${pageContext.request.contextPath}/resources/images/${newAscList.banner_file_name});">
	       <div class="overlay"></div>
	        <div class="container">
	          <div class="row no-gutters slider-text align-items-center justify-content-center">
		          <div class="col-md-12 ftco-animate">
		          	<div class="text w-100 text-center">
		          		<%-- <h2>${newAscList.program_subject}</h2> --%>
		          		<a href = "${pageContext.request.contextPath}/showProgram.do?program_id=${newAscList.program_id}&organization_id=${newAscList.organization_id}">
		          		<h1 class="mb-3">${newAscList.program_subject}</h1>
		          		</a>
		            </div>
		          </div>
		        </div>
	        </div>
	      </div>
		</c:forEach>
	   </div>
	 </div>
	  
	  

<!-- 아이콘 -->

<section class="testimony-section bg-mainicon">
      <div class="container">
        <div class="row ftco-animate">
          <div class="col-md-12">
           <div class="carousel-testimony owl-carousel ftco-owl">
           
           <table style="width: 100%;">
           <tr>
           	<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=2">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-old"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">노인</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=3">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-wheelchair"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">장애인</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           </tr>
           </table>
           <table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=4">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-multicultural"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">다문화</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=6">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-family"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">가족</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           	</tr>
           </table>
           <table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=5">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-earth"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">지구촌</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=8">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-eco"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">환경</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           	</tr>
           	</table>
           	<table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=7">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-animal"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">동물</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=9">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-ect"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">기타</h3>
								</div>
							</div>
						</div>
					</a>	 
           		</td>
           	</tr>
           </table>
   			<table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=0">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-all"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">전체</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=1">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-children"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">청소년</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		
           	</tr>
           </table>
                        
           </div>
          </div>
        </div>
      </div>
 </section>

	<!--마감임박 모집프로그램 -->
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">곧 모집기간이 마감됩니다!</span>
            <h2>또 한 번의 관심을..</h2>
          </div>
        </div>
        <div class="row d-flex">
        <c:forEach var="dateAscList" items="${dateAscList}">
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a class="block-20 rounded" style="background-image: url(${pageContext.request.contextPath}/resources/images/${dateAscList.banner_file_name});" href = "${pageContext.request.contextPath}/showProgram.do?program_id=${dateAscList.program_id}&organization_id=${dateAscList.organization_id}"></a>
              <div class="text mt-3 text-center">
              	<div class="meta mb-2">
                  <div><a href="${pageContext.request.contextPath}/showProgram.do?program_id=${dateAscList.program_id}&organization_id=${dateAscList.organization_id}">${dateAscList.program_subject}</a></div>
                </div>
                <h3 class="heading"><a href="${pageContext.request.contextPath}/showProgram.do?program_id=${dateAscList.program_id}&organization_id=${dateAscList.organization_id}">${dateAscList.summary}</a></h3>
              </div>
            </div>
            </div>
         </c:forEach>
          
        </div>
      </div>
    </section>
	
	
	<!--많은 관심을 받은 모집프로그램 -->
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">최근 관심 UP</span>
            <h2>이런 프로그램은 어떠신가요?</h2>
          </div>
        </div>
        <div class="row d-flex">
        <c:forEach var="readCntList" items="${readCntList}">
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a class="block-20 rounded" style="background-image: url(${pageContext.request.contextPath}/resources/images/${readCntList.banner_file_name});" href = "${pageContext.request.contextPath}/showProgram.do?program_id=${readCntList.program_id}&organization_id=${readCntList.organization_id}"></a>
              <div class="text mt-3 text-center">
              	<div class="meta mb-2">
                  <div><a href="${pageContext.request.contextPath}/showProgram.do?program_id=${readCntList.program_id}&organization_id=${readCntList.organization_id}">${readCntList.program_subject}</a></div>
                </div>
                <h3 class="heading"><a href="${pageContext.request.contextPath}/showProgram.do?program_id=${readCntList.program_id}&organization_id=${readCntList.organization_id}">${readCntList.summary}</a></h3>
              </div>
            </div>
           </div>
        </c:forEach>
        </div>
      </div>
    </section>

    
    
  

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
  <script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>
  <script src="<c:url value="/resources/js/signup.js?v=1"/>"></script>
    
  </body>    
</html>