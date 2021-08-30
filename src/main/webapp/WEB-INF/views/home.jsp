<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
	<title>Hotel Home</title>
</head>
<body>
<h1>
	호텔 홈페이지 입니다!
</h1>
<h2>현재 시각은 ${serverTime} 입니다.</h2>
<a href='/login'>관리자<br>로그인</a>&nbsp;&nbsp;
<a href='/newbie'>회원가입</a>
</body>
</html>
