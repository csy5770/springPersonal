<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<style>
table {
	width: 100%;
	border: 1px solid #444444;
}
</style>
</head>
<body>
<a href='/room' id="roomControl">객실관리</a>
<a href='/booking' id="roomReserve">예약관리</a>
<a href="/logout">로그아웃</a>
<br>

<div class=area1 style='float:left;'>
<table>
	<tr>
		<td>예약기간</td>
			<td><input type=date id=sDate> ~ <input type=date id=eDate></td>
	</tr>
	<tr>
		<td>객실종류</td>
			<td>
				<select size=1 style='width:250px;' id=selType>
		    		<option>더미</option>
		    	</select>
		    	<input type=button id='btnSearch' value='조회'>
	    	</td>
	 </tr>
	 <tr>
	 	<td>예약가능 객실</td>
	 </tr>
	 <tr>
	 		<td colspan=2>
 				<select size=10 style='width:400px;' id=selRoom>
 					<option>더미</option>
 				</select>
	 		</td>
	 </tr>
</table>
</div>
<div class=area2 style='float:left; margin-left: 50px;'>
<table>
	<tr>
		<td>객실명</td>
			<td><input type=text id=txtRoomName></td>
	</tr>
	<tr>
		<td>객실종류</td>
			<td><input type=text id=txtType></td>
	</tr>
	<tr>
		<td>예약인원</td>
			<td><input type=number id=txtNum> 명</td>
	</tr>
	<tr>
		<td>최대인원</td>
			<td><input type=number id=txtMaxNum> 명</td>
	</tr>
	<tr>
		<td>예약기간</td>
			<td><input type=date id=sDate2> ~ <input type=date id=eDate2></td>
	</tr>
	<tr>
		<td>예약자명</td>
			<td><input type=text id=txtName></td>
	</tr>
	<tr>
		<td>모바일</td>
			<td><input type=text id=mobile></td>
	</tr>
	<tr>
    	<td colspan=2 align=center>
    		<input type=button value='예약완료' id=btnAdd>&nbsp;
    		<input type=button value='비우기' id=btnDelete>&nbsp;
    		<input type=button value='예약취소' id=btnEmpty>&nbsp;
    	</td>
	</tr>
</table>
</div>
<div class=area3 style='float:left; margin-left: 50px;'>
<table border=1>
	<tr>
		<td colspan=2 align=left>예약된 객실</td>
	</tr>
	<tr>
		<td>객실명,종류,예약인원,최대인원,예약기간,모바일번호,예약자명 더미</td>
	</tr>
</table>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

</script>
</html>