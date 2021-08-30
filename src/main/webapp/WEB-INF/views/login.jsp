<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method=post action="/check_user">
	아이디: <input type=text name="userid"><br>
	비밀번호: <input type=text name="password"><br><br>
	<input type=submit value="로그인">&nbsp; <a href="/">취소</a>&nbsp; <a href="/newbie">회원가입</a>
</form>
</body>
</html>