<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function registerComment(){
		var organization_id = document.getElementById("organization_id").value;
		var program_id = document.getElementById("program_id").value;
		var content = document.getElementById("content").value;

		$.ajax({
			type : "post",
			url : "insertComment.do",
			data : "organization_id="+organization_id+"&program_id="+program_id+"&content="+content
			//dataType : "json"
		}).done(function(args){
			opener.location.reload();
			window.close();
			//window.open("about:blank","_self").close();

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
										<h3 class="mb-4">기부후기댓글</h3>
										<form:form commandName="comment" >
											<form:hidden path="organization_id"/>
											<form:hidden path="program_id"/>
											 <%-- <input type = "hidden" id = "organization_id" name = "organization_id" value = "${comment.organization_id}"/>
											  <input type = "hidden" id = "program_id" name = "program_id" value = "${comment.program_id}"/> --%>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="content">기부후기댓글</label>
														<form:textarea path="content" class = "form-control" cols = "30" rows = "5"/>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<input type="button" value="댓글등록" class="btn btn-primary" onclick = "registerComment();">
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