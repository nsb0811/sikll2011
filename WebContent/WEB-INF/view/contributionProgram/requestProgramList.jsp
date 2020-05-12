<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
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
	
	<!--===============================================================================================-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor_dk/animate/animate.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor_dk/select2/select2.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor_dk/perfect-scrollbar/perfect-scrollbar.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/util.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<!--===============================================================================================-->

<script type="text/javascript">
	/* function {
		window.location
	} */
</script>
</head>
<body>
<br>

	        
	        
	<div class="limiter">
	<div class="button-group-area mt-40">
				<a href="${pageContext.request.contextPath}/registerForm.do" class="genric-btn success radius" style = "margin-left : 100px">프로그램 신청</a>
			</div>
		<div class="container-table100">
		
				<div class="table100 ver2 m-b-110">
				
			
				<div class="wrap-table100">
				
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">프로그램제목</th>
									<th class="cell100 column2">시작일자</th>
									<th class="cell100 column3">종료일자</th>
									<th class="cell100 column4">승인상태</th>
									<th class="cell100 column5"></th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:if test="${!empty programLists}">
									<c:forEach var = "requestProgram" items="${programLists}">
										<tr class="row100 body">
											<td class="cell100 column1">
											<c:choose>
												<c:when test="${requestProgram.approval_flg == 0}">
													<a href = "#" style = "color : #000000">${requestProgram.program_subject}</a>
												</c:when>
												<c:when test="${requestProgram.approval_flg == 1}">
													<a style = "color : #000000" href = "${pageContext.request.contextPath}/showProgram.do?program_id=${requestProgram.program_id}&organization_id=<%=session.getAttribute("organization_id")%>">${requestProgram.program_subject}</a>
												</c:when>
											</c:choose>
											</td>
											<td class="cell100 column2"><fmt:formatDate value="${requestProgram.start_date}" pattern = "yyyy-MM-dd"/></td>
											<td class="cell100 column3"><fmt:formatDate value="${requestProgram.end_date}" pattern="yyyy-MM-dd"/></td>
											<td class="cell100 column4"><c:if test="${requestProgram.approval_flg == 0}">미승인</c:if>
												<c:if test="${requestProgram.approval_flg == 1}">승인</c:if></td>
											<td class="cell100 column5">
											<div class="button-group-area mt-40">
												<c:choose>
												<c:when test="${requestProgram.approval_flg == 0}">
													<a href="${pageContext.request.contextPath}/updateForm.do?program_id=${requestProgram.program_id}&organization_id=<%=session.getAttribute("organization_id")%>" class="update-btn success circle">수정</a>
												</c:when>
												<c:when test="${requestProgram.approval_flg == 1}">
												<a href="${pageContext.request.contextPath}/updateFormApproval.do?program_id=${requestProgram.program_id}&organization_id=<%=session.getAttribute("organization_id")%>" class="update-btn success circle">수정</a>
												</c:when>
											</c:choose>
											</div>
											</td>
										</tr>
										
									</c:forEach>
								</c:if>
								<c:if test="${empty programLists }">
								<tr>
									<td rowspan="4">신청한 프로그램이 없습니다.</td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			
			</div>
		</div>
	</div>

				


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
  <script src="<c:url value="/resources/js/main2.js"/>"></script> 
  <script src="<c:url value="/resources/js/logoutcheck.js"/>"></script>
  <script src="<c:url value="/resources/vendor_dk/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value="/resources/vendor_dk/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor_dk/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value="/resources/vendor_dk/perfect-scrollbar/perfect-scrollbar.min.js"/>"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
    

</body>
</html>