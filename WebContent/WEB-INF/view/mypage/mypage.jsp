<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!-- -------------------------------------기부이력 페이지------------------------------------------------- -->

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
	 
	/* 기부내역 추가 누를 시 입력 창(modal) */
	$("#testBtn").on('click', function() {
		$("#modal").show();
	});

	/* 기부 이력 상세 글 보기(modal) */
	$("p").click(
		function() {
			var param = "num=" + $(this).attr("title");
			var url = "ContributionContent.do";
			$.ajax({
				type : "post",
				url : url,
				data : param,
				dataType : "json"
			}).done(
				function(args) {
					var organization_name = args.organization_name;
					var program_name = args.program_name;
					var date = args.date;
					var contribution = args.contribution;								
					var note = args.note;
					var date1 = new Date(date); 
					var text_date = date1.getFullYear() + "년  " + (date1.getMonth() + 1) + "월 " + date1.getDate() + "일";

					$("#organization_name").append("<br class='a'><div style='color:black' class='a'>"+organization_name+"</div>");
					$("#program_name").append("<br class='a'><div style='color:black' class='a'>"+program_name+"</div>");
					$("#date").append("<br class='a'><div style='color:black' class='a'>"+text_date+"</div>");
					$("#contribution").append("<br class='a'><div style='color:black' class='a'>"+contribution+"원"+"</div>");								
                               
                       if(note == null){
                            $("#note").append("<br class='a'><textarea id='c' style='width:650px; resize: none;'cols='4' readonly name='note' class='a'>" + "</textarea>");
                       }else{
							$("#note").append("<br class='a'><textarea id='c' style='width:650px; resize: none;'cols='4' readonly name='note' class='a'>" + note + "</textarea>");}
					   });
					$("#contentmodal").show();
					return false;
				});

	/* 수정을 누를 경우 수정 modal 창 띄우기 */
	$(".update").click(function() {
			var param = "num2=" + $(this).attr("title");
			var url = "ContributionUpdate.do";
				$.ajax({
					type : "post",
					url : url,
					data : param,
					dataType : "json"
						}).done(
						   function(args) {
                                var contribution_history_idx=args.contribution_history_idx;
							    var organization_name = args.organization_name;
							    var program_name = args.program_name;
								var date = args.date;
								var contribution = args.contribution;												
								var note = args.note;
								var date1 = new Date(date);

								//DB에서 받아온 날짜 0000-00-00 형식으로 바꿔줘야 date형식에 맞게 가져옴
								var month1 = date1.getMonth() + 1 < 10? '0'+(date1.getMonth() + 1) : date1.getMonth() + 1;
								var date2 = date1.getDate() < 10? '0'+date1.getDate(): date1.getDate();
								var text_date = date1.getFullYear() + "-" + month1 + "-" + date2;
										
								$("#organization_name2").append("<br class='a'> <input type='text' style='width:650px; height:50px;'  
										name='organization_name' class='a' value='"+organization_name+"'>");
								$("#program_name2").append("<br class='a'> <input type='text' style='width:650px; height:50px;'  
										name='program_name' class='a' value='"+program_name+"'>");
								$("#date2").append("<br class='a'> <input type='date' style='width:650px; height:50px;' 
										 name='date' class='a' value='"+text_date+"'>");
								$("#contribution2").append("<br class='a'> <input type='text' style='width:650px; height:50px;'  
										onkeyup='this.value=this.value.replace(/[^0-9]/g,'');' name='contribution' class='a' value='"+contribution+"'>");
								$("#note2").append("<br class='a'> <textarea cols='4' name='note' class='a' style='width:650px; 
										resize: none;'>" + note + "</textarea>");
								$("#hidden").append("<input type='hidden' name='contribution_history_idx' value='"+contribution_history_idx+"' />");
											});
							$("#updatemodal").show();
							return false;
						});
	});

    /* 기부이력 삭제 클릭시 */
	function deletelist(a){
      if(confirm("삭제하시겠습니까?")){
            location.href="delete.do?contribution_history_idx="+a;
          }else{
            close();
              }}

    /* 문자 입력 막는 function */
    function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
    }

    /* modal창 닫기 */
	function closeModal() {
		$('#updatemodal').hide();
		$('#modal').hide();
		$('.a').remove();
	}

	/* modal창 닫기 */
	function closeModal2() {
		$('#contentmodal').hide();
		$('.a').remove();
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
	overflow: auto;
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding: 2em;
}
/* 기부추가 버튼 꾸미기 */
.button {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	margin-right: -4px;
	border: 1px solid #00043c;
	background-color: #00043c;
	color: white;
	padding: 5px;
}
.button:hover {
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

	<!-- <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"></nav> -->
	
	<!-- 기부이력 리스트 시작 -->
	<div id="content-wrapper" class="d-flex flex-column" style = "margin-top:70px">
		<div id="content">
			<div class="container-fluid" style="width: 1300px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h4 class="m-0 font-weight-bold text-primary">기부내역관리</h4>
						<a style="position: absolute; right: 20px; top: 10px;">
							<button class="button" id="testBtn" style="font-size: 15px;margin-top:5px; ">기부내역 추가</button>
						</a>
						<form>
							<input type="button" style="font-size: 15px; position: absolute; right: 160px; top: 10px; margin-top:5px; margin-right:-30px; padding-left:15px; padding-right:15px;" 
							       class="button" value="화면 출력" onclick="window.print()" />
						</form>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" style="table-layout: fixed;">
								<thead>
									<tr>
										<th style="font-size: 20px; width: 250px;">기관명</th>
										<th style="font-size: 20px;">프로그램명</th>
										<th style="font-size: 20px; width: 150px;">기부금액</th>
										<th style="font-size: 20px; width: 150px;">날짜</th>
										<th style="font-size: 20px; width: 150px;"></th>
									</tr>
								</thead>
								<tbody>
									<c:set var="total" value="0" />
									<c:forEach var="list" items="${list}">
										<tr>
											<td style="font-size: 15px">${list.organization_name}</td> <!-- 기관명  -->
											
											<c:if test="${list.register_type_flg eq 1}"> <!-- 프로그램명 , 기부이력 수동 입력시 상세보기 -->
												<td style="font-size: 15px"><p id="content" title="${list.contribution_history_idx}">
												   <a href="#"> ${list.program_name}</a> 
												</p></td>
											</c:if>
											
											<c:if test="${list.register_type_flg eq 2}"> <!-- 프로그램명 , 기부이력 자동 입력시 프로그램 상세페이지로 이동 -->
												<td style="font-size: 15px">
													<a href="${pageContext.request.contextPath}/showProgram.do?program_id=${list.program_id}
													         &organization_id=${list.organization_id}">${list.program_name}</a>													
												</td>
											</c:if>
											
											<td style="font-size: 15px"><fmt:formatNumber value="${list.contribution}" pattern="#,###원" /></td> <!-- 기부금액 -->
											
											<td style="font-size: 15px"><fmt:formatDate value="${list.date}" pattern="yyyy년 MM월 dd일" /></td> <!-- 기부 날짜 -->
											
											<td align="center" style="font-size: 15px"> <!-- 수동으로 입력 했을 경우만 수정,삭제 버튼 생성 -->
											<c:choose> 
												<c:when test="${list.register_type_flg eq 1}">
													<a href="#" title="${list.contribution_history_idx}" class="update" style="color: blue">수정 / </a>
													<a href="#" onclick="deletelist(${list.contribution_history_idx})" style="color: blue">삭제</a> 
												</c:when>												
												<c:when test="${list.register_type_flg eq 2}"> </c:when>
											</c:choose></td>
											
											<c:set var="total" value="${total + list.contribution}" /> <!-- 본인 기부 총액 -->
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr align="right">
										<th style="font-size: 20px" colspan="5">${nickname}님의 총 기부액은 <fmt:formatNumber value="${total}" pattern="#,###원" />입니다.
										</th>
									</tr>
								</tfoot>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기부이력 리스트 끝 -->

		<!-- 기부 내역 추가 폼(modal창) -->
		<div id="modal" class="searchModal">
			<div class="container" style="width: 900px;">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4" style="font-size: 40px">기부 내역 추가</h3>
								<hr width="700px" color="black" noshade />
								<div id="form-message-warning" class="mb-4"></div>
								<form method="POST" action="insert.do" name="form" onsubmit="return checkAll()"> <!-- 추가 버튼 누를시 공백체크 및 insert 요청-->
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px;">기관명</label> 
												<input type="text" class="form-control" name="organization_name" placeholder="기관명">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px;">프로그램명</label>
												<input type="text" class="form-control" name="program_name" placeholder="프로그램명">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px;">기부금액</label> 
												<input type="text" class="form-control" name="contribution" placeholder="기부금액" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px;"> 날짜</label>
												<input type="Date" class="form-control" name="date" placeholder="날짜">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px;"> 비고</label>
												<textarea name="note" class="form-control" id="message" cols="30" rows="4" placeholder="메모할 내용을 적으세요." style="resize: none;"></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="button" onclick="closeModal()" style="float: right; height: 50px; 
												       width: 150px; font-size: 20px;" value="취소" class="btn btn-primary" /> 
												<input type="submit" style="float: right; margin-right: 1%; height: 50px; width: 150px; 
												       font-size: 20px;" value="추가" class="btn btn-primary" />
											</div>
										</div>
									</div>
									<input type="hidden" name="register_type_flg" value="1"> <!-- 수동입력 이므로 강제로 타입을 1로 보냄 -->
									<input type="hidden" name="user_idx" value="${user_idx}">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기부 내역 추가 종료 -->

		<!-- 기부 내역 상세 내역(modal)-->
		<div id="contentmodal" class="searchModal">
			<div class="container" style="width: 900px;">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h1 class="mb-4" style="font-size: 40px">기부 내역</h1>
								<hr width="700px" color="black" noshade />
								<form method="POST" action="ContributionContent.do">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="organization_name">기관명 </label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="program_name">프로그램명</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="contribution">기부 금액</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="date">날짜</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="note">메모</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="button" onclick="closeModal2()" id="cancel" style="float: right; height: 50px;
												       width: 150px; font-size: 20px;" value="취소" class="btn btn-primary" />
											</div>
										</div>
									</div>
									<input type="hidden" name="register_type_flg" value="1">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기부 내역 상세내역 종료 -->

		<!-- 기부내역 수정 시작(modal) -->
		<div id="updatemodal" class="searchModal">
			<div class="container" style="width: 900px;">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4" style="font-size: 40px">기부 내역 수정</h3>
								<hr width="700px" color="black" noshade />
								<div id="form-message-warning" class="mb-4"></div>
								<form method="POST" action="update.do" name="form2" onsubmit="return checkAll2()"> <!-- 공백체크 -->
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="organization_name2">기관명 </label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="program_name2">프로그램명</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="contribution2">기부 금액</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="date2">날짜</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 25px" id="note2">메모</label> <!-- 상단의 <script>의 내용을 통해 <label>뒤에 append로 붙여짐 -->
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="button" onclick="closeModal()" id="cancel" style="float: right; height: 50px;
												       width: 150px; font-size: 20px;" value="취소" class="btn btn-primary" /> 
												<input type="submit" id="hidden" style="float: right; margin-right: 1%; height: 50px;
                                                       width: 150px; font-size: 20px;" value="수정" class="btn btn-primary" />
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
		<!-- 기부내역 수정 끝 -->
	
	</div>
	<!-- End of Content Wrapper -->

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