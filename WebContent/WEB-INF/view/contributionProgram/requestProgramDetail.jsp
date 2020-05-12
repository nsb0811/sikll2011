<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function organizationOpen(url){
		if(url == null || url == ""){
			alert("홈페이지주소를 제공하고 있지 않습니다.");
		}else{
			window.open(url,'_blank');
		}
		
	}

	// modal외의 것 클릭하면 modal close
	window.onclick = function(event) {
	    if(event.target == paymodal){
	        paymodal.style.display = "none";
	    }
	}
	//기부하기 누르면 paymodal나옴 
	function cotributionBtn(){
		document.getElementById('paymodal').style.display = "block";
	}
	function closeP() {
		paymodal.style.display = "none";
	}

	function report(organization_id, program_id, user_idx, comment_id){
		var result = confirm("이 댓글을 신고하시겠습니까?");
		if(result){
			/* var organization_id = document.getElementById("organization_id").value;
			var program_id = document.getElementById("program_id").value; */

			$.ajax({
				type : "post",
				url : "insertReportComment.do",
				data : "organization_id="+organization_id+"&program_id="+program_id+"&user_idx="+user_idx+"&comment_id="+comment_id,
				//dataType : "json"
			}).done(function(args){
				window.location.reload();
						
			}).fail(function(e){
				alert(e.responseText);	
			})	
			
		}else{
			return false;
		}
	}

	function reportBlock(){
		alert("이미 신고한 댓글입니다.");
	}

	function reportedCheck(user_idx, comment_id){
		var organization_id = document.getElementById("organization_id").value;
		var program_id = document.getElementById("program_id").value;

		$.ajax({
			type : "post",
			url : "checkComment.do",
			data : "organization_id="+organization_id+"&program_id="+program_id+"&user_idx="+user_idx+"&comment_id="+comment_id,
			dataType : "json"
		}).done(function(args){	
			//alert("return : " + args);
			if(args > 0){
				reportBlock();
			}else if(args == -1){
				alert("로그인 후에 시도해주세요.");
			}else{
				//alert("신고안됨");
				report(organization_id, program_id, user_idx, comment_id);
			}
		}).fail(function(e){
			alert(e.responseText);	
		})

		
	}
</script>
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
	
	<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.3.min.js" type="application/javascript"></script>

</head>

  <body>
   	<input type="hidden" id="organization_name" value="${organization_name}"/>
   	<input type="hidden" id="nickname" value="${nickname}"/>
   	<input type="hidden" id="program_subject" value="${requestProgram.program_subject}"/>
   	<input type="hidden" id="organization_id" value="<%=request.getParameter("organization_id")%>"/>
   	<input type="hidden" id="program_id" value="<%=request.getParameter("program_id")%>"/>
   	
    <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			<div class="col-md-6 d-flex">
    			<!-- 프로그램대표사진 -->
    			<c:choose>
           		<c:when test="${requestProgram.banner_file_name eq '' || empty requestProgram.banner_file_name}">
           		          <div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-end" style="background-image:url(${pageContext.request.contextPath}/resources/images/organization_default.jpg);">
    				</div>
           		</c:when>
           		<c:when test="${requestProgram.banner_file_name ne '' || !empty requestProgram.banner_file_name}">
           		          <div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-end" style="background-image:url(${pageContext.request.contextPath}/resources/images/${requestProgram.banner_file_name});">
    				</div>
           		</c:when>
           </c:choose>
           
           
           
    				
    			</div>
    			
    			<!-- 간단요약부분 -->
    			<div class="col-md-6 pl-md-5">
    				<div class="row justify-content-start py-5">
		          <div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
		          	<jsp:useBean id="now" class = "java.util.Date"/>
		          	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var = "today"/>
		          	<fmt:parseNumber value = "${requestProgram.end_date.time  / (1000*60*60*24)}" integerOnly = "true" var = "endDate"></fmt:parseNumber>
		          	<fmt:parseNumber value = "${now.time / (1000*60*60*24)}" integerOnly = "true" var = "startDate"></fmt:parseNumber>
		          	
		          	<span class="subheading">모집완료까지 D-${endDate - startDate}</span>
		            <h2 class="mb-4">${requestProgram.program_subject}</h2>
		            <p>기부단체명 : ${organization_name }<br> 
	            		모집기간 : <fmt:formatDate value="${requestProgram.start_date}" pattern="yyyy-MM-dd"/>&nbsp; ~ &nbsp;<fmt:formatDate value="${requestProgram.end_date}" pattern="yyyy-MM-dd"/><br>
	            		목표금액 : ${requestProgram.target_amount } 원
		            </p>
		            <div class="tabulation-2 mt-4">
									<div class="tab-content bg-light rounded mt-2">
									  <div class="tab-pane container p-0 active">
									  	<p>${requestProgram.summary}</p>
									  </div>
									</div>
									<br>
									<ul class="nav nav-pills nav-fill d-md-flex d-block">
									  <li class="nav-item mb-md-0 mb-2">
									    <a class="nav-link active py-2" data-toggle="tab" href="javascript:void(0);" onclick="cotributionBtn();">기부하기</a>
									  </li>
									  <li class="nav-item px-lg-2 mb-md-0 mb-2">
									    <a class="nav-link py-2" onclick = "organizationOpen('${requestProgram.organization_url}');" href = "#">홈페이지에서 참여하기</a>
									  </li>
									 <!--  <li class="nav-item">
									    <a class="nav-link py-2 mb-md-0 mb-2" data-toggle="tab" href="#home3">Our Value</a>
									  </li> -->
									</ul>
									
						</div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>


<!-- 금액 / 퍼센트 -->
    <section class="ftco-counter" id="section-counter" >
    	<div class="container" >
				<div class="row" >
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text-2">
              	<span style = "width : 100px">모집금액</span>
              </div>
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${totalAmount}">0</strong>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text-2">
              	<span style = "width : 200px; padding-left : 100px">목표금액</span>
              </div>
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${requestProgram.target_amount }">0</strong>
              </div>
              
            </div>
          </div>
           <!-- <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="378">0</strong>
              </div>
              <div class="text-2">
              	<span>Professional <br>Expert</span>
              </div>
            </div>
          </div> -->
          <!--<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="1200">0</strong>
              </div>
              <div class="text-2">
              	<span>Machineries <br>Equipments</span>
              </div>
            </div>
          </div> -->
        </div>
    	</div>
    </section>


	<!-- 상세 글 -->
	
	
<!-- 	<section>
	<div class="col-md-6 pl-md-5">
	<div class="row justify-content-start py-5">
	<div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
		<div class="tabulation-2 mt-4">
			<ul class="nav nav-pills nav-fill d-md-flex d-block">
									  <li class="nav-item mb-md-0 mb-2">
									    <a class="nav-link2 active py-2" data-toggle="tab" href="#home1">모집내용</a>
									  </li>
									  <li class="nav-item px-lg-2 mb-md-0 mb-2">
									    <a class="nav-link2 py-2" data-toggle="tab" href="#home2">기관소개</a>
									  </li>

									</ul>
		</div>
		</div>
		</div>
	</div>
	</section> -->


<!-- 모집내용/기관소개섹션 -->
	<section class="ftco-section ftco-no-pt ftco-no-pb">
	<div class="tabulation-2 mt-4">
	<!-- 탭버튼영역 -->
	<ul class="nav nav-pills nav-fill d-md-flex d-block" style = "width: 1100px; margin: auto; padding-bottom: 15px;">
	<li class="nav-item px-lg-2 mb-md-0 mb-2">
	
	<a data-toggle = "tab" class = "nav-link2 active py-2" href = "#programContent" style="padding: 230px;">모집내용</a>
	</li>
	<li class="nav-item px-lg-2 mb-md-0 mb-2">
	<a data-toggle = "tab" href = "#organization" class="nav-link2 py-2"style="padding: 230px;">기관소개</a>
	</li></ul>
	
	
	
	<!-- 탭내용영역 -->
	<div class="tab-content bg-light rounded mt-2">
	<div class="tab-pane container p-0 active" id="programContent">
  		<h3>모집목적</h3>
  		<br>
  		<p>${requestProgram.purpose}</p>
  		<h3>상세내용</h3>
		<br>
		<p>${requestProgram.content}</p>
		<h3>기부금 사용계획</h3>
		<br>
		<p>${requestProgram.usage_plan }</p>
	  </div>
	  <div class="tab-pane container p-0 fade" id="organization">
	  	<div class="tabulation-2 mt-4">
			<h3>기관소개</h3>
				<div class="tab-content bg-light rounded mt-2">
					<c:choose>
						<c:when test="${organizationCnt > 0}">
						<!-- 공공데이터에서 습득한 정보 -->
							<c:if test="${dataFlg eq 1}">
					<div class="tab-pane container p-0 active" >
						<h2><a href="board.do?nanmmbyId=${requestProgram.organization_id}">${organization_name}</a></h2>
					</div>
					
					<div class="tab-pane container p-0 active" >
						<p>●대표자명:${organizationInfo.response.body.items.item.rprsntvNm}</p>
					</div>
					<div class="tab-pane container p-0 active">
						<p>●설립일:${organizationInfo.response.body.items.item.fondDe}</p>
					</div> 
					<div class="tab-pane container p-0 active" >
						<p>●사업자번호:${organizationInfo.response.body.items.item.bizrno}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>●전화번호:${organizationInfo.response.body.items.item.dmstcTelno}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>●팩스번호:${organizationInfo.response.body.items.item.fxnum}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>●주소:${organizationInfo.response.body.items.item.adres}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>
							●홈페이지:<a
								href="${organizationInfo.response.body.items.item.hmpgAdres}">${organizationInfo.response.body.items.item.hmpgAdres}</a>
						</p>
					</div>
					</c:if>
					<c:if test="${dataFlg eq 2 }">
					<div class="tab-pane container p-0 active" >
						<h2><a href="board.do?nanmmbyId=${requestProgram.organization_id}">${organization_name}</a></h2>
					</div>
					
					<div class="tab-pane container p-0 active" >
						<p>●대표자명:${organizationInfo.rprsntvNm}</p>
					</div>
					<div class="tab-pane container p-0 active">
						<p>●설립일:${organizationInfo.fondDe}</p>
					</div> 
					<div class="tab-pane container p-0 active" >
						<p>●사업자번호:${organizationInfo.bizrno}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>●전화번호:${organizationInfo.dmstcTelno}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>●팩스번호:${organizationInfo.fxnum}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>●주소:${organizationInfo.adres}</p>
					</div>
					<div class="tab-pane container p-0 active" >
						<p>
							●홈페이지:<a
								href="${organizationInfo.hmpadres}">${organizationInfo.hmpadres}</a>
						</p>
					</div>
					</c:if>
					</c:when>
					<c:when test="${organizationCnt == 0 }">
						준비중입니다.
					</c:when>
					</c:choose>
				</div>
								</div>
	  	
		
	  </div>
	  </div>
	  </div>

	</section><!-- 모집내용/기관소개섹션 -->



	<!-- 사진 -->
    <section class="ftco-section ftco-no-pt ftco-no-pb">
		  <div class="container-fluid px-md-0">
        <div class="row no-gutters">
			<!-- 사진단위 반복  -->
			<c:forEach var = "image" items="${images}">
          <div class="col-md-4 ftco-animate">
          <!-- 화면에 깔리는 img -->
            <div class="work img d-flex align-items-end" style="background-image: url(${pageContext.request.contextPath}/resources/images/${image});">
            	<!-- 클릭시 확대되는 이미지. 위아래 둘다 일치시켜줄 것!-->
            	<a href="${pageContext.request.contextPath}/resources/images/${image}" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
            	<div class="desc w-100 px-4">
	              <div class="text w-100 mb-3">
	              	<span></span>
	              	<h2><a href="work-single.html"></a></h2>
	              </div>
              </div>
            </div>
          </div>
		</c:forEach>
		
		
		
        </div>
      </div> 
		</section>

  


    <section class="ftco-section testimony-section bg-primary">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
          	<span class="subheading">기부니가좋아 에서 기부해주신 분들</span>
            <h2 class="mb-4">기부후기</h2>
          </div>
        </div>
        
        
        <!-- 댓글영역 -->
        <!-- 등록된 댓글이 없는 경우 & 빈자리에 기부를 기다립니다. 표시 -->
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <c:choose>
              	<c:when test="${empty comments}">
              		<h3 style = "color : #ffffff">희망을 전해주세요</h3>
              	</c:when>
              	<c:otherwise>
              	 <c:forEach var = "comment" items = "${comments}">
              	<%--  <c:set var = "idx" value = "<%=session.getAttribute("user_idx")%>"></c:set> --%>
<%--               	 <c:if test="${comment.reporter_idx eq user_idx}">
              	 	<div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">신고된 댓글입니다.</p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/person_1.jpg)"></div> -->
                    	<div class="pl-3">
		                    <p class="name">${comment.nickname}</p>
		                    <span class="position"><fmt:formatDate value="${comment.register_date}" pattern = "yyyy-MM-dd"/></span>
		                    <a onclick = "reportBlock();" href = "javascript:void()">
		                    <img alt="신고" src="${pageContext.request.contextPath}/resources/images/alert_1.png" style = "width : 30px; float: right;" >
		                  	</a>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              	 </c:if> --%>
              <!-- 댓글한세트 -->
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">${comment.content}</p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/person_1.jpg)"></div> -->
                    	<div class="pl-3">
		                    <div class= "row" style = "padding-left: 0px">
		                    <p class="name">${comment.nickname}</p>
		                    <c:if test="${comment.user_type_id ne 2}">
		                    <c:choose>
		                    	<c:when test="${comment.grade eq 0 }">
		                    	<img alt="Lv.0" src="${pageContext.request.contextPath}/resources/images/battery_0.png" style = "width : 20px;height : 21px;">
		                    	</c:when>
		                    	<c:when test="${comment.grade eq 1 }">
		                    	<img alt="Lv.1" src="${pageContext.request.contextPath}/resources/images/battery_1.png" style = "width : 20px;height : 21px;">
		                    	</c:when>
		                    	<c:when test="${comment.grade eq 2 }">
		                    	<img alt="Lv.2" src="${pageContext.request.contextPath}/resources/images/battery_2.png" style = "width : 20px;height : 21px;">
		                    	</c:when>
		                    	<c:when test="${comment.grade eq 3 }">
		                    	<img alt="Lv.3" src="${pageContext.request.contextPath}/resources/images/battery_3.png" style = "width : 20px;height : 21px;">
		                    	</c:when>
	                    		<c:when test="${empty comment.grade}">
		                    	<%-- <img alt="Lv.0" src="${pageContext.request.contextPath}/resources/images/battery_0.png" style = "width : 20px;height : 25px;"> --%>
		                    	</c:when>
		                    </c:choose>
		                    </c:if>
		                    </div>
		                    <span class="position"><fmt:formatDate value="${comment.register_date}" pattern = "yyyy-MM-dd"/></span>
		                    <a onclick = "reportedCheck('${comment.user_idx}','${comment.comment_id}');" href = "javascript:void()">
		                    <img alt="신고" src="${pageContext.request.contextPath}/resources/images/alert_1.png" style = "width : 30px; float: right;" >
		                  	</a>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <!-- 댓글세트 end -->
              </c:forEach>
              	</c:otherwise>
              </c:choose>
             
             
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- The Modal -->
<div id="paymodal" class="modal_box">
	
	<!-- Modal content -->
	<div class="modal-content_box_pay">
		<div onclick="closeP()">
			<span class="close_m">&times;</span>
		</div>
		<p></p>
		<label class="label" for="contribution" style="margin-left: 10%;">기부금액</label>
		<div style="margin-bottom: 10%; margin-left: 10%;">
		<input type="text" id="contribution" name="contribution" style="width:70%;"/> &nbsp;원
		</div>
		<a id="kakaoPayBtn" onclick="kakaoPay();" style="float:right; margin-right:10%; margin-bottom: 20%;"> <img alt="카카오페이결제버튼" src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"></a>
		<%-- 
		<a id="naverPayBtn" onclick="naverPay();"><img alt="네이버페이결제버튼" src="${pageContext.request.contextPath}/resources/images/npay_logo.PNG"></a> 
		 --%>
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
  <script src="<c:url value="/resources/js/logoutcheck.js"/>"></script>
  <script src="<c:url value="/resources/js/signup.js"/>"></script>
  <script src="<c:url value="/resources/js/payment.js?v=1"/>"></script>
  </body>


</html>