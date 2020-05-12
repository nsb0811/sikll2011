<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>

<!-- -------------------------------------공지사항 리스트 페이지------------------------------------------------- -->

<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">

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
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script type="text/javascript">
    //공지사항 상세 페이지로 이동
	function noticeContent(a) {
		location.href="noticeContent.do?notice_idx="+a;
	};
	</script>
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>

	<!-- 공지사항 리스트 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="container-fluid" style="width: 1300px;">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h2 class="m-0 font-weight-bold text-primary">공지사항</h2>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th style="font-size: 20px; width: 150px;">작성일자</th>
									<th style="font-size: 20px">제목</th>
									<th style="font-size: 20px; width: 150px;">작성자</th>
									<th style="font-size: 20px; width: 150px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
									<tr >
										<td style="font-size: 15px">
										<fmt:formatDate value="${list.register_date}" pattern="yyyy년 MM월 dd일" /> <!-- 공지사항 작성일 -->
										</td>
										<td style="font-size: 15px"><a href="#" onclick="noticeContent(${list.notice_idx})">${list.subject}</a></td> <!-- 공지사항 제목 -->
										<td style="font-size: 15px">admin</td> <!-- 작성자 admin으로 고정 -->
										<td style="font-size: 15px">${list.readcount}</td> <!-- 조회수 -->
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 공지사항 리스트 끝 -->

	<div id="ftco-loader" class="show fullscreen"></div>

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

	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/check.js?v=2"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/check3.js?v=2"></script>
	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>