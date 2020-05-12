<%@ page contentType="text/html; charset=UTF-8"
   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page session="true"%>
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
    
    <link href="${pageContext.request.contextPath}/resources/kimcss/Table.css" rel="stylesheet" id="bootstrap-css">
    <link href="${pageContext.request.contextPath}/resources/kimcss/search.css"  rel="stylesheet" id="bootstrap-css">
    
 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head> 
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="projectURL"> 
<div class="container"> 
    <div class="row">
		
        
        <div class="col-md-12">
        <h4>기부 단체</h4>
        <div class="container">
<%-- 	<div class="row">
		<h2>단체명 검색</h2> 
        <div class="search">
 <form name="form1" action="response.do" method="get" >
 <!--  -->
<input type="text" class="form-control input-sm" maxlength="64" placeholder="Search"  name="search" value="${search}"/>
 <button type="submit" class="btn btn-primary btn-sm">검색</button>
</form>
</div>
	</div>
</div> --%>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                  
                   <!-- <th>번호</th> -->
                   <!--  <th>즐겨찾기</th> -->
                     <th>기부단체명</th>
                     <th>확인<th>
                 <!--     <th>분야</th>
                     <th>주소</th>
                      <th>전화번호</th> -->
                      
                   
                   
                   </thead>
    <tbody>
     <c:if test="${R==0}">
    <c:forEach items="${rep_List.response.body.items.item}" 
    
    var="item" varStatus="status">
    
     <c:set var="contains" value="false"/>
    <tr> 
   
  <%--   <td>${status.count}</td> --%>
    <%-- <c:forEach items="${bookmarkId}" var="bookmark">
    <c:if test="${bookmark.organization_id eq item.nanmmbyId}">
    <c:set var="contains" value="true"/>
    </c:if>
     </c:forEach>
     <c:choose>
      <c:when test="${contains eq true }">
     <td><div onClick="bookmark('${item.nanmmbyId}','img${status.count}')"><img id="img${status.count}" src="${pageContext.request.contextPath}/resources/images/pStar.png"></div></td>
    </c:when>
    <c:when test="${contains eq false}">
    <td><div onClick="bookmark('${item.nanmmbyId}','img${status.count}')"><img id="img${status.count}" src="${pageContext.request.contextPath}/resources/images/bStar.png"></div></td> 
       </c:when> 
       </c:choose>  --%>
    
       
    <td>${item.nanmmbyNm}</td>
    <td><button type="button" name="button" onclick="sendToParent('nanmmbyId${status.count}','nanmmbyNm${status.count}','rprsntvNm${status.count}','fondDe${status.count}','dmstcTelno${status.count}','fxnum${status.count}','adres${status.count}','zip${status.count}','hmpadres${status.count}','bizrno${status.count}')">입력</button></td>
    
<%--     <td>${item.rcritRealm}</td>
    <td>${item.adres}</td>
    <td>${item.dmstcTelno}</td> --%>
       
    </tr>
    <input type="hidden" name="nanmmbyId" id="nanmmbyId${status.count}" value="${item.nanmmbyId}"/>
     <input type="hidden" name="nanmmbyNm" id="nanmmbyNm${status.count}" value="${item.nanmmbyNm}"/>
      <input type="hidden" name="rprsntvNm" id="rprsntvNm${status.count}" value="${item.rprsntvNm}"/>
       <input type="hidden" name="fondDe" id="fondDe${status.count}" value="${item.fondDe}"/>
        <input type="hidden" name="dmstcTelno" id="dmstcTelno${status.count}" value="${item.dmstcTelno}"/>
         
          <input type="hidden" name="fxnum" id="fxnum${status.count}" value="${item.fxnum}"/>
          <input type="hidden" name="adres" id="adres${status.count}" value="${item.adres}"/>
          <input type="hidden" name="zip" id="zip${status.count}" value="${item.zip}"/>
          <input type="hidden" name="hmpadres" id="hmpadres${status.count}" value="${item.hmpgAdres}"/>
          <input type="hidden" name="bizrno" id="bizrno${status.count}" value="${item.bizrno}"/>
          
    </c:forEach>   
   </c:if> 
      
    
    <c:if test="${R==1}">
    <tr>
    <!-- <td>1</td>  -->
   <c:set var="contains" value="false"/>
    <tr> 
   
  <%--   <td>${status.count}</td> --%>
   <%--  <c:forEach items="${bookmarkId}" var="bookmark">  
    <c:if test="${bookmark.organization_id eq rep.response.body.items.item.nanmmbyId}"> 
    <c:set var="contains" value="true"/>
    </c:if> 
     </c:forEach>
        
     <c:choose>
      <c:when test="${contains eq true }">
     <td><div onClick="bookmark('${rep.response.body.items.item.nanmmbyId}','img${status.count}')"><img id="img${status.count}" src="${pageContext.request.contextPath}/resources/images/pStar.png"></div></td>
    </c:when>    
    <c:when test="${contains eq false}">
    <td><div onClick="bookmark('${rep.response.body.items.item.nanmmbyId}','img${status.count}')"><img id="img${status.count}" src="${pageContext.request.contextPath}/resources/images/bStar.png"></div></td> 
       </c:when>
       </c:choose> --%>
    
    <td><%-- <a href="board.do?nanmmbyId=${rep.response.body.items.item.nanmmbyId}"> --%>${rep.response.body.items.item.nanmmbyNm}<!-- </a> --></td>
    <td><button type="button" name="button" onclick="sendToParent('nanmmbyId','nanmmbyNm','rprsntvNm','fondDe','dmstcTelno','fxnum','adres','zip','hmpadres','bizrno')">입력</button></td>
    <%-- <td>${rep.response.body.items.item.rcritRealm}</td>
    <td>${rep.response.body.items.item.adres}</td>
    <td>${rep.response.body.items.item.dmstcTelno}</td> --%>
    
    </tr>
      <input type="hidden" name="nanmmbyId" id="nanmmbyId" value="${rep.response.body.items.item.nanmmbyId}"/>
     <input type="hidden" name="nanmmbyNm" id="nanmmbyNm" value="${rep.response.body.items.item.nanmmbyNm}"/>
      <input type="hidden" name="rprsntvNm" id="rprsntvNm" value="${rep.response.body.items.item.rprsntvNm}"/>
       <input type="hidden" name="fondDe" id="fondDe" value="${rep.response.body.items.item.fondDe}"/>
        <input type="hidden" name="dmstcTelno" id="dmstcTelno" value="${rep.response.body.items.item.dmstcTelno}"/>
         
          <input type="hidden" name="fxnum" id="fxnum" value="${rep.response.body.items.item.fxnum}"/>
          <input type="hidden" name="adres" id="adres" value="${rep.response.body.items.item.adres}"/>
          <input type="hidden" name="zip" id="zip" value="${rep.response.body.items.item.zip}"/>
          <input type="hidden" name="hmpadres" id="hmpadres" value="${rep.response.body.items.item.hmpgAdres}"/>
          <input type="hidden" name="bizrno" id="bizrno" value="${rep.response.body.items.item.bizrno}"/>
    </c:if>
    <c:if test="${R==2}">
    <tr>
    <td>
    검색결과가 없습니다!! 
    <td> 
    
    <tr>
    
    
    
    </c:if>
    </tbody>
    
    
    
    
        
</table>

<div class="clearfix" >
<ul class="pagination pull-right">
   <c:if test="${Page.curPage ne 1}">
  <li class="disabled"><a href="searchOrganiztion.do?curPage=${Page.prevPage}&nanmmByNm=${nanmmByNm}"><span class="">&lt;</span></a></li>
   </c:if>
  <c:forEach var="PageNum" begin="${Page.startPage}" end="${Page.endPage}">
     <c:if test="${PageNum eq Page.curPage}">
  <li class="active"><a href="searchOrganiztion.do?curPage=${PageNum}&nanmmByNm=${nanmmByNm}">${PageNum}</a></li>
  </c:if> 
   <c:if test="${PageNum ne Page.curPage}">
  <li><a href="searchOrganiztion.do?curPage=${PageNum}&nanmmByNm=${nanmmByNm}">${PageNum}</a></li>
  </c:if>
  </c:forEach>
   <c:if test="${Page.curPage ne Page.pageCnt && Page.pageCnt > 0}">
  <li><a href="searchOrganiztion.do?curPage=${Page.nextPage}&nanmmByNm=${nanmmByNm}"><span class="">&gt;</span></a></li>
  </c:if>
</ul>    
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

  <script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>
  <script src="<c:url value="/resources/js/signup.js?v=1"/>"></script>
  <script src="<c:url value="/resources/js/bookmarksrcipt.js"/>"></script>
  <script src="<c:url value="/resources/js/searchOrganiztion.js"/>"></script>

</body>
</html>