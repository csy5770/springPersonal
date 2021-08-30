<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method=post action="/login">
	이름: <input type=text name=rName><br>
	아이디: <input type=text name=newid><br>
	비밀번호: <input type=text name=passcode1><br>
	비밀번호 확인: <input type=text name=passcode2><br>
	모바일: <input type=text name=mobile><br><br>
	<input type=submit value="회원가입">&nbsp; <a href="/">취소</a>
</form>
</body>
</html>