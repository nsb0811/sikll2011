<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<c:if test="${R==1 }">
	${rep_list.response.body.items.item.adres}
	<br> ${rep_list.response.body.items.item.dmstcTelno}
	<br> ${rep_list.response.body.items.item.fondDe}
	<br> ${rep_list.response.body.items.item.fondMbyCode}
	<br> ${rep_list.response.body.items.item.fxnum}
	<br> ${rep_list.response.body.items.item.hmpgAdres}
	<br> ${rep_list.response.body.items.item.nanmmbyId}
	<br> ${rep_list.response.body.items.item.nanmmbyNm}
	<br> ${rep_list.response.body.items.item.rcritRealm}
	<br> ${rep_list.response.body.items.item.bizrno}
	<br> ${rep_list.response.body.items.item.cntrDdcTy}
	<br> ${rep_list.response.body.items.item.ctbgrpAppnNo}
	<br> ${rep_list.response.body.items.item.grpGroupId}
	<br> ${rep_list.response.body.items.item.rprsntvNm}
	<br> ${rep_list.response.body.items.item.zip}
	<br>
</c:if>
<c:if test="${R==0 }">

<br>데이터 준비중입니다!
</c:if>



</body>
</html>