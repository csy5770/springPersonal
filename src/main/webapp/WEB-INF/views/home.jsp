<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Hotel Home</title>
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
				<h4 class="mb-3">홈 페이지</h4>
				<h5>현재 시각은 ${serverTime} 입니다.</h5>
				<br><br> 
 					<input type="button" class="btn btn-primary btn-lg btn-block" value="로그인" onclick="location.href ='/login';" style="width:200px; margin-left:200px;">
 					<br><br>
 					<input type="button" class="btn btn-primary btn-lg btn-block" value="회원가입" onclick="location.href ='/newbie';" style="width:200px; margin-left:200px;">
 					<br><br> 					  
 			</div>
 		</div> 
 		<footer class="my-3 text-center text-small"> 
 			<p class="mb-1">&copy; 2021 CSY</p> 
 		</footer>
 	</div> 
</body>

</html>
