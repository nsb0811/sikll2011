<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>기부단체 목록</title>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="<c:url value="/resources/css/animate.css"/>">

<link
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/magnific-popup.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/css/ionicons.min.css"/>">

<link rel="stylesheet"
	href="<c:url value="/resources/css/flaticon.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/icomoon.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">

<%-- <link
	href="${pageContext.request.contextPath}/resources/kimcss/Table.css"
	rel="stylesheet" id="bootstrap-css"> --%>
<link
	href="${pageContext.request.contextPath}/resources/kimcss/search.css"
	rel="stylesheet" id="bootstrap-css">


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<%--  <link href="${pageContext.request.contextPath}/resources/search.css"  rel="stylesheet" id="bootstrap-css"> --%>
<!-- <script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
 -->
<%-- 
  <link href="${pageContext.request.contextPath}/resources/kimcss/search.css"  rel="stylesheet" id="bootstrap-css"> --%>
</head>
<body> 
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="main.do">Home</a> <a
							href="response.do">
								<h1 class="mb-0 bread">기부단체</h1>
						</a>
							<div>
								<form action="response.do" method="get"
									class="searchform order-lg-last">
									<div class="form-group d-flex">
										<input type="text" class="form-control pl-3"
											placeholder="Search" name="search" value="${search}">
										<button type="submit" placeholder=""
											class="form-control search">
											<span class="fa fa-search"></span>
										</button>
									</div>
								</form>
							</div>
				</div>
			</div>
		</div>

	</section>
	<div>
		<br>
	</div>





	<section class="ftco-section" style = "margin-bottom:-50px;">

		<div class="container">

			<div class="row d-flex">
				<c:if test="${R==0}">
					<c:forEach items="${rep_List.response.body.items.item}" var="item"
						varStatus="status">
						<div class="col-md-4 d-flex ftco-animate">
							<div class="blog-entry align-self-stretch">
                       <c:choose>
                       <c:when test="${item.stored_file_name==null}">
						
								<a href="board.do?nanmmbyId=${item.nanmmbyId}"
									class="block-20 rounded"
						 			style="background-image: url('${pageContext.request.contextPath}/resources/images/organization_default.jpg');">
								</a>
                            </c:when>
                            <c:otherwise>
                            <a href="board.do?nanmmbyId=${item.nanmmbyId}"
									class="block-20 rounded"
									style="background-image: url('http://192.168.0.83:8081/GibunigajoaSample/resources/images/${item.stored_file_name}');">
								</a>
                            </c:otherwise>
                                                       
                            </c:choose>
								<div class="text mt-3 text-center">
									<div class="meta mb-2">
										<div>${item.rcritRealm}</div>
										<div>${item.dmstcTelno}</div>
										<!-- 로그인 한 상태이거나 단체회원이아닌경우 뿌려줌 -->
										<c:if test="${R2==1}"> 
										
											<c:set var="contains" value="false" />
											<c:forEach items="${bookmarkId}" var="bookmark">
												<c:if test="${bookmark.organization_id eq item.nanmmbyId}">
													<c:set var="contains" value="true" />
												</c:if>
											</c:forEach>
											<c:choose>
												<c:when test="${contains eq true }">
													<div
														onClick="bookmark('${item.nanmmbyId}','img${status.count}','${item.nanmmbyNm}')">
														<img id="img${status.count}"
															src="${pageContext.request.contextPath}/resources/images/pStar.png">
													</div>
												</c:when>
												<c:when test="${contains eq false}">
													<div
														onClick="bookmark('${item.nanmmbyId}','img${status.count}','${item.nanmmbyNm}')">
														<img id="img${status.count}"
															src="${pageContext.request.contextPath}/resources/images/bStar.png">
													</div>

												</c:when>
											</c:choose>
										</c:if>
									</div>
									<h3 class="heading">
									<c:set var="leg" value="${fn:length(item.nanmmbyNm)}"></c:set>
									<c:choose>
										<c:when test="${leg < 25}">
										<a href="board.do?nanmmbyId=${item.nanmmbyId}">${item.nanmmbyNm}</a>
										<span style="color:#fff; opacity: 0;">
											<c:forEach var="i" begin="${leg}" end="25">
												d
											</c:forEach>
										</span>
										</c:when>
										<c:otherwise>
										<a href="board.do?nanmmbyId=${item.nanmmbyId}">${item.nanmmbyNm}</a>
										</c:otherwise>
									</c:choose>
																											
										
									</h3>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:if>
			</div>



			<c:if test="${R==1}">


				
							<div class="col-md-4 d-flex ftco-animate">
								<div class="blog-entry align-self-stretch">
								
									<c:choose>
                       <c:when test="${banner==null}">
						
								<a href="board.do?nanmmbyId=${rep.response.body.items.item.nanmmbyId}"
									class="block-20 rounded"
									style="background-image: url('${pageContext.request.contextPath}/resources/images/organization_default.jpg');">
								</a>
                            </c:when>
                            <c:otherwise>
                            <a href="board.do?nanmmbyId=${rep.response.body.items.item.nanmmbyId}"
									class="block-20 rounded" 
									style="background-image: url('http://192.168.0.83:8081/GibunigajoaSample/resources/images/${banner}');">
								</a>
                            </c:otherwise>
                                                       
                            </c:choose>
									
									
									
									
									
									<div class="text mt-3 text-center">
										<div class="meta mb-2">
											<div>${rep.response.body.items.item.rcritRealm}</div>
											<div>${rep.response.body.items.item.dmstcTelno}</div>
											<c:if test="${R2==1}">
												<c:set var="contains" value="false" />
												<c:forEach items="${bookmarkId}" var="bookmark">
													<c:if
														test="${bookmark.organization_id eq rep.response.body.items.item.nanmmbyId}">
														<c:set var="contains" value="true" />
													</c:if>
												</c:forEach>
												<c:choose>
													<c:when test="${contains eq true }">
														<div
															onClick="bookmark('${rep.response.body.items.item.nanmmbyId}','img${status.count}','${rep.response.body.items.item.nanmmbyNm}')">
															<img id="img${status.count}"
																src="${pageContext.request.contextPath}/resources/images/pStar.png">
														</div>
													</c:when>
													<c:when test="${contains eq false}">
														<div
															onClick="bookmark('${rep.response.body.items.item.nanmmbyId}','img${status.count}','${rep.response.body.items.item.nanmmbyNm}')">
															<img id="img${status.count}"
																src="${pageContext.request.contextPath}/resources/images/bStar.png">
														</div>

													</c:when>
												</c:choose>
											</c:if>
										</div>
										<h3 class="heading">
											<a
												href="board.do?nanmmbyId=${rep.response.body.items.item.nanmmbyId}">${rep.response.body.items.item.nanmmbyNm}</a>
										</h3>
									</div>
								</div>
							</div>
			</c:if>
			<c:if test="${R==2}">
				<tr>
					<td>
						<h2>검색결과가 없습니다!!</h2>
					<td>
				<tr>
			</c:if>
		</div>
	</section>

	<div class="row mt-5">
		<div class="col text-center">
			<div class="block-27">
				<ul style = "margin-bottom :50px;">
					<c:if test="${Page.curPage ne 1}">
						<li><a
							href="response.do?curPage=${Page.prevPage}&search=${search}">&lt;</a></li>
					</c:if>
					<c:forEach var="PageNum" begin="${Page.startPage}"
						end="${Page.endPage}">
						<c:if test="${PageNum eq Page.curPage}">
							<li class="active"><a
								href="response.do?curPage=${PageNum}&search=${search}">${PageNum}</a></li>
						</c:if>
						<c:if test="${PageNum ne Page.curPage}">
							<li><a
								href="response.do?curPage=${PageNum}&search=${search}">${PageNum}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${Page.curPage ne Page.pageCnt && Page.pageCnt > 0}">
						<li><a
							href="response.do?curPage=${Page.nextPage}&search=${search}">&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<input type="hidden" value="${pageContext.request.contextPath}"
		id="projectURL">
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<c:url value="/resources/js/google-map.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>

	<script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>
	<script src="<c:url value="/resources/js/signup.js?v=1"/>"></script>
	<script src="<c:url value="/resources/js/bookmarksrcipt.js?"/>"></script>
</body>
</html>