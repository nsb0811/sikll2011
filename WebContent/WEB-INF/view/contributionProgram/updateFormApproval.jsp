<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
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

	function deleteBanner(){
		/* alert("deleteBanner in!");
		 */
		var organization_id = document.getElementById("organization_id").value;
		var program_id = document.getElementById("program_id").value;

		$.ajax({
			type : "post",
			url : "deleteBanner.do",
			data : "organization_id="+organization_id+"&program_id="+program_id
			//dataType : "json"
		}).done(function(args){
			$("#bannerInfo").html("등록된 배너이미지가 없습니다.");

			/* if(args.length != 0){
				var msg = "<table border = '1'>";
				msg += "<tr><td>책번호</td><td>책제목</td><td>출판사</td><td>가격</td><td>판매가</td><td>주문번호</td></tr>"
				for(var id = 0; id <= args.length - 1; id++){
					msg += "<tr><td>"+args[id].bookid+"</td><td>"+args[id].bookname+"</td>";
					msg += "<td>"+args[id].publisher+"</td><td>"+args[id].price+"</td>";
					msg += "<td>"+args[id].saleprice+"</td><td>"+args[id].orderid+"</td></tr>";
				}
				$("#bookList").html(msg);	
			} */
					
		}).fail(function(e){
			alert(e.responseText);	
		})
			
	}


/* 	function deleteImage(stored_file_name){
		var organization_id = document.getElementById("organization_id").value;
		var program_id = document.getElementById("program_id").value;

		$.ajax({
			type : "post",
			url : "deleteImage.do",
			data : "organization_id="+organization_id+"&program_id="+program_id+"&stored_file_name="+stored_file_name
			//dataType : "json"
		}).done(function(args){
			$("#"+stored_file_name+"").html("");

			/* if(args.length != 0){
				var msg = "<table border = '1'>";
				msg += "<tr><td>책번호</td><td>책제목</td><td>출판사</td><td>가격</td><td>판매가</td><td>주문번호</td></tr>"
				for(var id = 0; id <= args.length - 1; id++){
					msg += "<tr><td>"+args[id].bookid+"</td><td>"+args[id].bookname+"</td>";
					msg += "<td>"+args[id].publisher+"</td><td>"+args[id].price+"</td>";
					msg += "<td>"+args[id].saleprice+"</td><td>"+args[id].orderid+"</td></tr>";
				}
				$("#bookList").html(msg);	
			} 
					
		}).fail(function(e){
			alert(e.responseText);	
		})
		
			
	} */

	function deleteImage(msg){
		var organization_id = document.getElementById("organization_id").value;
		var program_id = document.getElementById("program_id").value;
		$.ajax({
			type : "post",
			url : "deleteImage.do",
			data : "organization_id="+organization_id+"&program_id="+program_id+"&stored_file_name="+msg,
			dataType : "json"
		}).done(function(args){
			console.log(args);
			var msg = "";
			if(args.length != 0){
				for(var i = 0; i <= args.length - 1; i++){
					msg += args[i].original_file_name+"<a onclick = \"deleteImage('"+args[i].stored_file_name+"');\" href = 'javascript:void(0);'>&times;</a><br>"
				}
			}else{
				msg += "등록된 이미지가 없습니다.";
			}

			$("#imagesInfo").html(msg);
					
		}).fail(function(e){
			alert(e.responseText);	
		})
	}
	
	
/* 	function deleteImage(stored_file_name){
		var organization_id = document.getElementById("organization_id").value;
		var program_id = document.getElementById("program_id").value;
		alert("deleteImages in!");
		$.ajax({
			type : "post",
			url : "deleteImage.do",
			data : "organization_id="+organization_id+"&program_id="+program_id+"&stored_file_name="+stored_file_name
 			dataType : "json" 
		}).done(function(args){
			alert("success in");
			 console.log(args);
			 /*if(args.length != 0){
				var msg = "";
				for(var i = 0; i <= args.length - 1; i++){
					msg += args[i].original_file_name+"<a onclick='deleteImage(${args[i].stored_file_name})' href = 'javascript:void(0);' style = 'color : #000000'>&times;</a><br />";
				}
			}
			$("#imagesInfo").html(msg); */

			/* if(args.length != 0){
				var msg = "<table border = '1'>";
				msg += "<tr><td>책번호</td><td>책제목</td><td>출판사</td><td>가격</td><td>판매가</td><td>주문번호</td></tr>"
				for(var id = 0; id <= args.length - 1; id++){
					msg += "<tr><td>"+args[id].bookid+"</td><td>"+args[id].bookname+"</td>";
					msg += "<td>"+args[id].publisher+"</td><td>"+args[id].price+"</td>";
					msg += "<td>"+args[id].saleprice+"</td><td>"+args[id].orderid+"</td></tr>";
				}
				$("#bookList").html(msg);	
			} 
					
		}).fail(function(e){
			alert(e.responseText);	
		})
		
			
	} */


	
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
										<h3 class="mb-4">모집프로그램수정</h3>
										<form:form commandName="updateProgram" action="${pageContext.request.contextPath}/updateProgramApproval.do" enctype="multipart/form-data">
											 <input type = "hidden" id = "organization_id" name = "organization_id" value = "<%=session.getAttribute("organization_id")%>"/>
											 <input type = "hidden" id = "program_id" name = "program_id" value = "${updateProgram.program_id}"/>
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
														<form:input path="target_amount" class = "form-control"/>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="start_date">모집시작일</label>
														<c:set value = "${updateProgram.start_date }" var = "startDate" ></c:set>
														<fmt:formatDate value="${updateProgram.start_date}" pattern="yyyy-MM-dd" var="startDate"/>
														<input type = "date" id = "start_date" name = "start_date" class = "form-control" value = "${startDate}">
														
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="end_date">모집종료일</label>
														<fmt:formatDate value="${updateProgram.end_date}" pattern="yyyy-MM-dd" var="endDate"/>
														<input type = "date" id = "end_date" name = "end_date" class = "form-control" value = "${endDate}">
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
												<div class="col-md-6">
													<div class="form-group">
														<form:hidden path="original_file_name"/>
														<form:hidden path="banner_file_name"/>
														<label class="label" for="banner">배너이미지</label>
															<input type = "file" id = "banner" name = "banner" class = "form-control" >
															<div id = "bannerInfo">
															<c:choose>
																<c:when test="${updateProgram.original_file_name eq ''}">
																등록된 배너이미지가 없습니다.<br>
																</c:when>
																<c:otherwise>
																${updateProgram.original_file_name}
																<a onclick="deleteBanner('${updateProgram.banner_file_name}');" href = "javascript:void(0);" style = "color : #000000">&times;</a>
																</c:otherwise>
															</c:choose>
															
															</div>					
													
													</div>
												</div>
	
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="images">이미지</label>
															<input type = "file" id = "images" name = "images" multiple="multiple" class = "form-control" >
															<div id = "imagesInfo">
															<c:choose>
																<c:when test="${empty programImageList}">
																등록된 이미지가 없습니다.<br>
																</c:when>
																<c:when test="${!empty programImageList}">
																<c:forEach var = "image" items = "${programImageList}">
 																${image.original_file_name}<a onclick = "deleteImage('${image.stored_file_name}')" href = "javascript:void(0)">&times;</a>
 																<br>
																</c:forEach>
																</c:when>
															</c:choose>
															
															</div>	
															
															
															
													
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<input type="submit" value="프로그램 신청" class="btn btn-primary">
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