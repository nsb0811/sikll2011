<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<!--문자열 받아 올땐 ":getAsString"  -->
<title>기부니가조아</title>

</head>
<body>

	<!--경로 받아 올때 ":insertAttribute"  -->
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer"/>
	
  
</body>
</html>