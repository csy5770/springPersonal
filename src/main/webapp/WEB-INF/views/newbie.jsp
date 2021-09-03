<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method=post action="/signin" id="formSignin">
	이름: <input type=text name=rName><br>
	아이디: <input type=text name=newid><br>
	비밀번호: <input type=password name=passcode1 id=pw1><br>
	비밀번호 확인: <input type=password name=passcode2 id=pw2><br>
	<input type=submit value="회원가입">&nbsp; <a href="/">취소</a>
</form>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.on('submit','#formSignin',function(){
	if($('input[name=rName]').val()=='') {
		alert('이름을 입력하세요.');
		return false;
	}
	if($('input[name=newid]').val()=='') {
		alert('아이디를 입력하세요.');
		return false;
	}
	if($('input[name=passcode1]').val()=='') {
		alert('비밀번호를 입력하세요.');
		return false;
	}
	if($('#pw1').val()!=$('#pw2').val()) {
		alert('비밀번호가 비밀번호 확인과 일치해야합니다.');
		return false;
	}
	return true;
	
})
</script>
</html>