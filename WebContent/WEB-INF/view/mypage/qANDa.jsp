<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!-- -------------------------------------Q&A 리스트 페이지------------------------------------------------- -->


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

<script>
	$(function() {
		
		//Q&A 추가 누를시 modal창 띄우는 jquery
		$("#testBtn").on('click',function() {
			$("#modal").show();
		});		
	});

	//modal창 닫기 
	function closeModal() {
		$('.searchModal').hide();
		$('.searchModal2').hide();
		$('.a').remove();	
	};

	//Q&A 상세페지로 이동
	function qAndaContent(a){
        location.href="QandAContent.do?board_idx="+a;
		}
	
</script>

<style>
/* modal창의 배경 */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding: 3em;
}
/* Q&A 추가 버튼 꾸미기 */
#testBtn {
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	margin-right: -4px;
	border: 1px solid #00043c;
	background-color: #00043c;
	color: white;
	padding: 5px;
}
#testBtn:hover {
	color: white;
	background-color: skyblue;
}
/* 입력칸 스타일 */
.a {
	color: black;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	border: 10px solid transparent;
}
</style>
</head>

<body id="page-top">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>
	
	<!-- Q&A 리스트 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="container-fluid" style="width: 1300px;">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h4 class="m-0 font-weight-bold text-primary">Q&A 리스트</h4>
					<a style="position: absolute; right: 40px; top: 10px;">
						<button id="testBtn" style="font-size: 20px;">Q&A 작성</button>
					</a>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							style="table-layout: fixed;" cellspacing="0">
							<thead>
								<tr>
									<th style="font-size: 20px; width: 150px;">답변상태</th>
									<th style="font-size: 20px;">제목</th>
									<th style="font-size: 20px; width: 150px;">작성일</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="dto" items="${list}">
									<tr>
									    <!-- status_id의 상태에 따라 답변상태 란에 보이는 내용 -->
										<c:if test="${dto.status_id eq 1}">
											<td style="font-size: 15px">접수중</td>
										</c:if>
										<c:if test="${dto.status_id eq 2}">
											<td style="font-size: 15px">처리중</td>
										</c:if>
										<c:if test="${dto.status_id eq 3}">
											<td style="font-size: 15px">답변완료</td>
										</c:if>
										
										<td style="font-size: 15px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										<a href="#" onclick="qAndaContent(${dto.board_idx})">${dto.subject}</a> <!-- 문의사항 제목 -->
										</td>
										<td style="font-size: 15px">
										<fmt:formatDate value="${dto.register_date}" pattern="yyyy년 MM월 dd일" /> <!-- 문의 날짜 -->
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Q&A리스트 끝 -->

	<!-- Q&A 추가 폼(modal) -->
	<div id="modal" class="searchModal">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<div class="contact-wrap w-100 p-md-5 p-4">
							<h3 class="mb-4" style="font-size: 40px">Q&A작성</h3>
							<div id="form-message-warning" class="mb-4"></div>
							<form method="POST" action="qANDaInsert.do" name="form" onsubmit="return checkAll()"> <!-- 공백체크 -->
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="label" style="font-size: 20px">제목</label> 
											<input type="text" class="form-control" name="subject" placeholder="제목">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label class="label" style="font-size: 20px">문의내용</label>
											<textarea name="content" class="form-control" cols="50" rows="10" 
											          placeholder="문의할 내용을 작성해 주세요."></textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="button" onclick="closeModal()" style="float: right; height: 50px; width: 150px; 
											       font-size: 20px;" value="취소" class="btn btn-primary" />
										    <input type="submit" style="float: right; margin-right: 1%; height: 50px; width: 150px; 
										           font-size: 20px;" value="보내기" class="btn btn-primary" />
										</div>
									</div>
								</div>
								<input type="hidden" name="user_idx" value="${user_idx}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Q&A 추가 종료 -->

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