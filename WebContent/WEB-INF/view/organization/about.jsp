<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Home Builder - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>


	<!-- END nav -->


<input type="hidden" value="${pageContext.request.contextPath}"
		id="projectURL">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex no-gutters">
				<div class="col-md-6 d-flex">
				
				
				
				<c:choose>
				<c:when test="${banner!=null}">
					<div
						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-end"
						style="background-image: url('http://192.168.0.83:8081/GibunigajoaSample/resources/images/${banner}');">
						
					</div>
					</c:when>
					<c:otherwise>
					<div
						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-end"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/organization_default.jpg');">
						
					</div>
					</c:otherwise>
				</c:choose>
				
				
				
				
				
				
				
				</div>
				<div class="col-md-6 pl-md-5">
					<div class="row justify-content-start py-5">
						<c:if test="${R==1}">
							<div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
                                 <c:if test="${R2==1}">
								<c:if test="${chk==1}">
								<div onClick="bookmark('${rep_list.response.body.items.item.nanmmbyId}','img${status.count}','${rep_list.response.body.items.item.nanmmbyNm}')">
						 		<img id="img"src="${pageContext.request.contextPath}/resources/images/pStar.png">
								</div>
								</c:if>
								<c:if test="${chk==0}">  
								<div
								onClick="bookmark('${rep_list.response.body.items.item.nanmmbyId}','img${status.count}','${rep_list.response.body.items.item.nanmmbyNm}')">
								<img id="img"src="${pageContext.request.contextPath}/resources/images/bStar.png">
								</div>
								</c:if>
								</c:if>
								<h2 class="mb-4">${rep_list.response.body.items.item.nanmmbyNm}</h2>
								
								
								<div class="tabulation-2 mt-4"> 

									<div class="tab-content bg-light rounded mt-2">
										<div class="tab-pane container p-0 active" id="home1">
											<p>●대표자명:${rep_list.response.body.items.item.rprsntvNm}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●설립일:${date}</p>
										</div> 
										<div class="tab-pane container p-0 active" id="home1">
											<p>●사업자번호:${rep_list.response.body.items.item.bizrno}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●전화번호:${rep_list.response.body.items.item.dmstcTelno}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●팩스번호:${rep_list.response.body.items.item.fxnum}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●주소:${rep_list.response.body.items.item.adres}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>
												●홈페이지:<a
													href="${rep_list.response.body.items.item.hmpgAdres}">${rep_list.response.body.items.item.hmpgAdres}</a>
											</p>
										</div>
									</div>
								</div>
								<a class="btn btn-primary" href="response.do">단체목록</a>
							</div>
						</c:if>
  
 
						<c:if test="${R==0}">
							<div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
                                  <c:if test="${R2==1}">
								<c:if test="${chk==1}">
								<div onClick="bookmark('${rep_list.organization_id}','img${status.count}','${rep_list.nanmmByNm}')">
								<img id="img"src="${pageContext.request.contextPath}/resources/images/pStar.png">
								</div>
								</c:if> 
								<c:if test="${chk==0}"> 
								<div 
								onClick="bookmark('${rep_list.organization_id}','img${status.count}','${rep_list.nanmmByNm}')">
								<img id="img"src="${pageContext.request.contextPath}/resources/images/bStar.png">
								</div>
								</c:if>
								</c:if>
								<h2 class="mb-4">${rep_list.nanmmByNm}</h2>
							
								<div class="tabulation-2 mt-4">
									<div class="tab-content bg-light rounded mt-2">
										<div class="tab-pane container p-0 active" id="home1">
											<p>●대표자명:${rep_list.rprsntvNm}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●설립일:${date}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●사업자번호:${rep_list.bizrno}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
							 				<p>●전화번호:${rep_list.dmstcTelno}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●팩스번호:${rep_list.fxnum}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1">
											<p>●주소:${rep_list.adres}</p>
										</div>
										<div class="tab-pane container p-0 active" id="home1"> 
											<p>
												●홈페이지:<a href="${rep_list.hmpadres}">${rep_list.hmpadres}</a>
											</p>
										</div> 
									</div>  
						
 
					</div>
					<a class="btn btn-primary" href="response.do">단체목록</a>
				</div>
				</c:if>
			
			
			
				<c:if test="${R==2}">
				<div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
                             
								<h2 class="mb-4"></h2>
								
								<p></p>
								<div class="tabulation-2 mt-4">
									<div class="tab-content bg-light rounded mt-2">
										<div class="tab-pane container p-0 active" id="home1">
											<p>준비중입니다</p>
										</div>
									
									</div>  
						
 
					</div>
					<a class="btn btn-primary" href="response.do">단체목록</a>
				</div>
				
			
				</c:if>
			
			
			
			
			
			
			
			
			
			
			
			
			</div>
		</div>
		</div>
		</div>
	</section>




	<section class="ftco-section testimony-section bg-primary">
		<c:if test="${R1==0}">
			<div class="container">

				<div class="row justify-content-center mb-5">

					<div
						class="col-md-8 text-center heading-section heading-section-white ftco-animate">

						<h2 class="mb-4">모집중인 프로그램이 없습니다</h2>
					</div>
				</div>
			</div>

		</c:if>

		<c:if test="${R1==1}">
			<div class="container">

				<div class="row justify-content-center mb-5">

					<div
						class="col-md-7 text-center heading-section heading-section-white ftco-animate">
						<span class="subheading">Recruitment program</span>
						<h2 class="mb-4">모집 프로그램</h2>
					</div>
				</div>

				<div class="row ftco-animate">
					<div class="col-md-12">
						<div class="carousel-testimony owl-carousel ftco-owl">






                          <c:forEach items="${program}" var="item" varStatus="status">
							<div class="item">
								<div class="testimony-wrap py-4"> 
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-quote-left"></span> 
									</div> 
									<div class="text">
										<p class="mb-5">${item.summary}</p>
										<div class="d-flex align-items-center"> 
											<div class="user-img" 
												style="background-image: url(${pageContext.request.contextPath}/resources/images/${item.banner_file_name})"></div>
											<div class="pl-3">
											  
											<c:if test="${R==1}">
												<p class="heading"><a id="aaa${status.count}" href="showProgram.do?program_id=${item.program_id}&organization_id=${rep_list.response.body.items.item.nanmmbyId}" onmouseover="onfocusTest('aaa${status.count}')" onmouseout="onblurTest('aaa${status.count}')">${item.program_subject}</a></p> 
												</c:if>
												<c:if test="${R==0}">    
												<p class="heading"><a id="aaa${status.count}" href="showProgram.do?program_id=${item.program_id}&organization_id=${rep_list.organization_id}" onmouseover="onfocusTest('aaa${status.count}')" onmouseout="onblurTest('aaa${status.count}')">${item.program_subject}</a></p> 
											
												</c:if>
												
												 
												<span class="position">${item.representative}</span>
											</div> 
										</div> 
									</div>
								</div>
							</div> 
						</c:forEach>	
						

						</div>
					</div>
				</div>

			</div>
		</c:if>
	</section>





	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>
	<script src="<c:url value="/resources/js/signup.js?v=1"/>"></script>
    <script src="<c:url value="/resources/js/bookmarksrcipt.js?"/>"></script>
 
</body>
</html>