<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예외 발생</title>
<style type="text/css">
body{
background-image: url("${pageContext.request.contextPath}/resources/images/error.png");
background-size: cover;
background-repeat: no-repeat;

}
</style>
</head>
<body>
요청을 처리하는 도중에 예외가 발생하였습니다:
<p>
${message}
</p>

<p>
<a href="main.do"> [HOME] </a>을 클릭하시면, 홈으로 돌아갑니다.
</p>
</body>
</html>