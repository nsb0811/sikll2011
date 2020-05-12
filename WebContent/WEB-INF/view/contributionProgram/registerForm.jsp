<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 	function zipSearch(){
		new daum.Postcode({
            oncomplete: function(data) {
            	var roadAddr = data.roadAddress; // 도로명 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zip").value = data.zonecode;
                document.getElementById("address").value = roadAddr;
            }
        }).open();
	} */

	function nullCheck(){
		var subject = document.getElementById("program_subject").value;
		var target_amount = document.getElementById("target_amount").value;
		var start_date = document.getElementById("start_date").value;
		var end_date = document.getElementById("end_date").value;

		if(subject == ""){
			document.getElementById("program_subject").focus();
			alert("프로그램명을 입력해주세요");
			return false;
		}else if(target_amount == ""){
			document.getElementById("target_amount").focus();
			alert("목표금액을 입력해주세요");
			return false;
		}else if(start_date == ""){
			document.getElementById("start_date").focus();
			alert("모집시작일을 입력해주세요.");
			return false;
		}else if(end_date == ""){
			document.getElementById("end_date").focus();
			alert("모집종료일을 입력해주세요.");
			return false;
		}

		$("#registerForm").submit();
	
	}
</script>
</head>
<body>

   	
<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters mb-5" style="background: #e8edf0;">
								<!-- <div class="col-md-7"> -->
									<div class="contact-wrap w-100 p-md-5 p-4">
										<h3 class="mb-4">모집프로그램신청</h3>
										<form:form commandName="program" action="${pageContext.request.contextPath}/registerProgram.do" id = "registerForm">
											 <input type = "hidden" id = "organization_id" name = "organization_id" value = "<%=session.getAttribute("organization_id")%>"/>
											<div class="row">
												<div class="col-md-9">
													<div class="form-group">
														<label class="label" for="program_subject">프로그램명</label>
														<form:input path="program_subject" class="form-control"/>
													</div>
												</div>
												<div class="col-md-3"> 
													<div class="form-group">
														<label class="label" for="type_id">분류</label>
													<form:select path="type_id" class = "form-control">
													<form:options items = "${typeList }" itemLabel="type" itemValue="type_id"/>
													</form:select>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label class="label" for="organization_url">url</label>
														<form:input path="organization_url" class="form-control"/>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label class="label" for="representative">담당자명</label>
													<form:input path="representative" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label class="label" for="phone_number">연락처</label>
														<form:input path="phone_number" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label class="label" for="bank_name">은행명</label>
													<form:input path="bank_name" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label class="label" for="account">계좌번호</label>
														<form:input path="account" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label class="label" for="target_amount">목표금액</label>
														<input type = "number" id = "target_amount" name = "target_amount" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="start_date">모집시작일</label>
														<input type = "date" id = "start_date" name = "start_date" class = "form-control">
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="end_date">모집종료일</label>
														<input type = "date" id = "end_date" name = "end_date" class = "form-control">
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="purpose">모집목적</label>
														<form:input path="purpose" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="summary">모집내용(요약)</label>
														<form:textarea path="summary" class = "form-control" cols = "30" rows = "2"/>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="content">모집내용(상세)</label>
														<form:textarea path="content" class = "form-control" cols = "30" rows = "5"/>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="usage_plan">기부내역 사용계획</label>
														<form:textarea path="usage_plan" class = "form-control" cols = "30" rows = "5"/>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<input type="button" onclick = "nullCheck();" value="프로그램 신청" class="btn btn-primary">
														<div class="submitting"></div>
													</div>
												</div>
											</div>
										</form:form>
									</div> 
								<!-- </div> -->
								
							</div>
							
						</div>
					</div>
				</div>
    	</div>
    	<input type="hidden" id="user_type_id" name="user_type_id" value="1">
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
  <script src="<c:url value="/resources/js/logoutcheck.js"/>"></script>
    

</body>
</html>