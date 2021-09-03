<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method=post action="/check_user" id="frmLogin">
	아이디: <input type=text name="userid"><br>
	비밀번호: <input type=text name="password"><br><br>
	<input type=submit value="로그인">&nbsp; <a href="/">취소</a>&nbsp; <a href="/newbie">회원가입</a>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#frmLogin',function(){
	let pstr=$.trim($('input[name=userid]').val());
	$('input[name=userid]').val(pstr);
	pstr=$.trim($('input[name=password]').val());
	$('input[name=password]').val(pstr);
	if($('input[name=userid]').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('input[name=password]').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
})
</script>
</html>