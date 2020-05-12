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

<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js" defer></script>

<script type="text/javascript">

   $(document).ready(function() {
	$('#summernote').summernote('disable');
   });

 /* 목록 버튼 누를시 Q&A리스트로 돌아감 */
  function returnQandA(){
    location.href="qANDa.do";
	  }
</script>

</head>

<body id="page-top">
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav>

	<!-- Q&A 상세 시작 -->
	<div id="wrapper">
		<div class="container">
			<div class="col-md-12">
				<h1 class="mb-4">Q&A</h1>
				
				<button onclick="returnQandA()" class="btn btn-primary" style="position: relative; left: 800px; 
				        width: 250px; font-size: 20px;">목록</button>
				        
				<div class="row no-gutters mb-5" style="background: #e8edf0;">
					<div class="contact-wrap w-100 p-md-5 p-4">
						<div id="form-message-warning" class="mb-4"></div>
							<div class="form-group" style="width: 900px;">
							<div class="col-md-12" style="display: inline;">
								<h2>${list.subject}</h2>
							</div>
							<hr width="900px" color="black" noshade />
							
							<ul style="width: 100%; position: relative; top: 10px;">
							    <!-- staust_id의 상태에 따라서 보여지는게 달라짐 -->
								<c:if test="${list.status_id==1}">
									<li style="display: inline; color: black; position: relative; right: 30px; font-size: 20px;" >접수중</li>
								</c:if>
								<c:if test="${list.status_id==2}">
									<li style="display: inline; color: black; position: relative; right: 30px; font-size: 20px;">처리중</li>
								</c:if>
								<c:if test="${list.status_id==3}">
									<li style="display: inline; color: black; position: relative; right: 30px; font-size: 20px;">처리완료</li>
								</c:if>
								
								<li style="display: inline; color: black; position: relative; left: 500px; font-size: 20px;">작성일
									: <fmt:formatDate value="${list.register_date}" pattern="yyyy년 MM월 dd일" />
								</li>
							</ul>
							
							<hr width="900px" color="black" noshade />
							
							<div style="font-size: 20px;">문의내용</div>
							<textarea class="form-control" name=subject id="subject" style="margin: auto; display: inline-block;" 
							          rows="10" readonly="readonly">${list.content}</textarea>

                           <%--  status상태가 접수완료일 경우만  ${list.answer}로 내용을 가져옴 --%>
							<c:if test="${list.status_id==1}">
								<div style="font-size: 20px;">
									답변내용<textarea class="form-control" name=answer id="answers"
										style="margin: auto; display: inline-block;" cols="100"rows="10" readonly="readonly">접수중 입니다..</textarea>
								</div>
							</c:if>
							<c:if test="${list.status_id==2}">
								<div style="font-size: 20px;">
									답변내용<textarea class="form-control" name=answer id="answers"
										style="margin: auto; display: inline-block;" cols="100"rows="10" readonly="readonly">처리중 입니다...</textarea>
								</div>
							</c:if>
							<c:if test="${list.status_id==3}">
								<div style="font-size: 20px;">
									답변내용
									<textarea class="form-control" name=answer id="summernote"
										style="margin: auto; display: inline-block;" cols="150"rows="10" readonly="readonly">${list.answer}</textarea>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Q&A상세 페이지 끝 -->

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
