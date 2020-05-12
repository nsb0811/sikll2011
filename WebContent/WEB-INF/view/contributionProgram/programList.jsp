<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <script type="text/javascript">
		function searchProgram(type_id){
			//alert("분야검색 : " + type_id);
			var searchKeyword = $("#searchKeyword").val();
			var url = "";
			var data = "";
			if(type_id == 0){//전체검색
				url = "searchProgram.do";
				data = "searchKeyword="+searchKeyword;
			}else{//분야별검색
				url = "searchProgramType.do";
				data = "type_id="+type_id+"&searchKeyword="+searchKeyword;
			}


			$.ajax({
				type : "post",
				url : url,
				data : data,
				dataType : "json"
			}).done(function(args){
				var msg = "";
				if(args.length != 0){
					for(var index = 0; index <= args.length - 1; index++){
						msg += "<div class='col-md-4 d-flex ftco-animate' style = 'opacity:100;visibility:visible'>";
						msg += "<div class='blog-entry align-self-stretch'>";
						if(args[index].banner_file_name == "" || args[index].banner_file_name == null){
							msg += "<a class='block-20 rounded' style='background-image: url(${pageContext.request.contextPath}/resources/images/organization_default.jpg);' href = '${pageContext.request.contextPath}/showProgram.do?program_id="+args[index].program_id+"&organization_id="+args[index].organization_id+"'>";
						}else{
							msg += "<a class='block-20 rounded' style='background-image: url(${pageContext.request.contextPath}/resources/images/"+args[index].banner_file_name+");' href = '${pageContext.request.contextPath}/showProgram.do?program_id="+args[index].program_id+"&organization_id="+args[index].organization_id+"'>";
						}
						msg += "</a>";
						msg += "<div class='text mt-3 text-center'>";
						msg += "<div class='meta mb-2'>";
						msg += "<div><a href='${pageContext.request.contextPath}/showProgram.do?program_id="+args[index].program_id+"&organization_id="+args[index].organization_id+"'>"+args[index].program_subject+"</a></div>";
						msg += "</div>";
						msg += "<h3 class='heading'><a href='${pageContext.request.contextPath}/showProgram.do?program_id="+args[index].program_id+"&organization_id="+args[index].organization_id+"'>"+args[index].summary+"</a></h3>";
						msg += "</div>";
						msg += "</div>";
						msg += "</div>";
					}
				}else{
					msg = "검색결과가 존재하지 않습니다.";
				}
				//console.log(msg);
				$("#programItems").html(msg);
				//alert("end!");
				/* $("#programItems").show(); */
						
			}).fail(function(e){
				alert(e.responseText);	
			})
		}
    </script>
</head>
<body>
<!-- 아이콘 -->

<section class="testimony-section bg-mainicon">
      <div class="container">
        <div class="row ftco-animate">
          <div class="col-md-12">
           <div class="carousel-testimony owl-carousel ftco-owl">
           
           <table style="width: 100%;">
           <tr>
           	<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=2" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-old"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">노인</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=3">
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-wheelchair"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">장애인</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           </tr>
           </table>
           <table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=4" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-multicultural"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">다문화</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=6" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-family"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">가족</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           	</tr>
           </table>
           <table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=5" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-earth"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">지구촌</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=8" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-eco"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">환경</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           	</tr>
           	</table>
           	<table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=7" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-animal"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">동물</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=9" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-ect"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">기타</h3>
								</div>
							</div>
						</div>
					</a>	 
           		</td>
           	</tr>
           </table>
   			<table style="width: 100%;">
           	<tr>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=0" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-all"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">전체</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		<td>
           		<a href="${pageContext.request.contextPath}/programList.do?type=1" >
						<div class="col-md-3 d-flex services align-self-stretch p-4 py-md-5 ftco-animate">
							<div class="media block-6 d-block text-center pt-md-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-children"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">청소년</h3>
								</div>
							</div>
						</div>
					</a>
           		</td>
           		
           	</tr>
           </table>
                        
           </div>
          </div>
        </div>
      </div>
 </section>
 <!-- 검색 -->
 <section>
          
        
        
        <!-- <div class="form-group d-flex"> -->
<div style = "text-align : center;padding-top : 30px">
			<input type="text" class="form-control pl-3" placeholder="프로그램명 검색" style = "width : 50%; display:inline;" id = "searchKeyword">
            <button type="button" onclick = "searchProgram('<%=request.getParameter("type")%>');"class="form-control search"  style = "width : 45px; display : inline;"><span class="fa fa-search"></span></button>
          </div>
          <!-- </div> -->
 </section>
 	<!--모집프로그램 -->
    <section class="ftco-section">
      <div class="container">

        <div class="row d-flex" id = "programItems">
        
        
        <c:forEach var = "program" items="${programList}">
         <!-- 프로그램당 반복구간-->
          <div class="col-md-4 d-flex ftco-animate">
           <div class="blog-entry align-self-stretch">
		<c:set var = "leg" value="${fn:length(program.banner_file_name)}"></c:set>
           <c:choose>
           		<c:when test="${program.banner_file_name eq '' || empty program.banner_file_name || leg eq 0}">
           		          <a class="block-20 rounded" style="background-image: url(${pageContext.request.contextPath}/resources/images/organization_default.jpg);" href = "${pageContext.request.contextPath}/showProgram.do?program_id=${program.program_id}&organization_id=${program.organization_id}"></a>
           		</c:when>
           		<c:when test="${program.banner_file_name ne '' || !empty program.banner_file_name}">
           		          <a class="block-20 rounded" style="background-image: url(${pageContext.request.contextPath}/resources/images/${program.banner_file_name});" href = "${pageContext.request.contextPath}/showProgram.do?program_id=${program.program_id}&organization_id=${program.organization_id}"></a>
           		</c:when>
           </c:choose>
              
              <div class="text mt-3 text-center">
              	<div class="meta mb-2">
                  <div><a href="${pageContext.request.contextPath}/showProgram.do?program_id=${program.program_id}&organization_id=${program.organization_id}">${program.program_subject}</a></div>
                </div>
                <h3 class="heading"><a href="${pageContext.request.contextPath}/showProgram.do?program_id=${program.program_id}&organization_id=${program.organization_id}">${program.summary}</a></h3>
              </div>
            </div>
          </div>
 		<!-- 프로그램당 반복구간-->
        </c:forEach>
        
        
       
        </div>
      </div>
    </section>
    
    
<%-- <table border = "1">
	<tr>
		<th>프로그램제목</th>
		<th>시작일자</th>
		<th>종료일자</th>
		<th>승인상태</th>
		
	</tr>
	
	<c:if test="${!empty programList}">
		<c:forEach var = "requestProgram" items="${programList}">
			<tr>
				<td><a href = "${pageContext.request.contextPath}/showProgram.do?program_id=${requestProgram.program_id}&organization_id=${requestProgram.organization_id}">${requestProgram.program_subject}</a></td>

			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty programList }">
	<tr>
		<td rowspan="4">신청한 프로그램이 없습니다.</td>
	</tr>
	</c:if>
</table> --%>


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