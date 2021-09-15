<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>로그인</title>
<style> body { 
	min-height: 100vh; 
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); 
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); 
} 
.input-form { 
	max-width: 680px; 
	margin-top: 80px; 
	padding: 32px; 
	background: #fff; 
	-webkit-border-radius: 10px; 
	-moz-border-radius: 10px; 
	border-radius: 10px; 
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) 
} 
</style>
</head>
<body> 
	<div class="container"> 
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto"> 
				<h4 class="mb-3">로그인</h4> 
				<form method=post action="/check_user" id="frmLogin"> 
					<div class="mb-3">
						<label for="newid">아이디</label>
						<input type="text" class="form-control" name="userid">
					</div> 
					<div class="mb-3"> 
						<label for="password">암호</label> 
						<input type="password" class="form-control" name="password">
					</div> 
 					<br>
 					<input type="submit" class="btn btn-primary btn-lg btn-block" type="submit" value="로그인"> 					 
				</form> 
 			</div> 
 		</div> 
 		<footer class="my-3 text-center text-small"> 
 			<p class="mb-1">&copy; 2021 CSY</p> 
 		</footer>
 	</div> 
</body>
<!-- <body>
<form method=post action="/check_user" id="frmLogin">
	아이디: <input type=text name="userid"><br>
	비밀번호: <input type=password name="password"><br><br>
	<input type=submit value="로그인">&nbsp; <a href="/">취소</a>&nbsp; <a href="/newbie">회원가입</a>
</form>
</body> -->
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