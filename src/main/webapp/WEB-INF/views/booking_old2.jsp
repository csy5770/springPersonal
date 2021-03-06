<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
				<select size=1 style='width:120px;' id=selType>
        			<c:forEach items="${list2}" var="roomtype">
	        			<option id=tc value='${roomtype.typecode}'>${roomtype.name}</option>
	        		</c:forEach> 
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
 					
 				</select>
	 		</td>
	 </tr>
</table>
</div>
<div class=area2 style='float:left; margin-left: 50px;'>
<table>
	<tr>
		<td>객실명</td>
			<td><input type=text id="txtRoomName" readonly></td>
			<td><input type=hidden id=bookCode></td>
			<td><input type=hidden id=roomCode></td>
	</tr>
	<tr>
		<td>객실종류</td>
			<td><input type=text id="txtType" readonly></td>
	</tr>
	<tr>
		<td>예약인원</td>
			<td><input type=number id=txtNum> 명</td>
	</tr>
	<tr>
		<td>최대인원</td>
			<td><input type=number id="txtMaxNum" readonly> 명</td>
	</tr>
	<tr>
		<td>예약기간</td>
			<td><input type=date id="sDate2" readonly> ~ <input type=date id="eDate2" readonly></td>
	</tr>
	<tr>
		<td>총 숙박비</td>
			<td><input type=number id="txtPrice" readonly> 원</td>
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
    		<input type=button value='비우기' id=btnEmpty>&nbsp;
    		<input type=button value='예약수정' id=btnUpdate>&nbsp;
    		<input type=button value='예약취소' id=btnCancel>&nbsp;
    	</td>
	</tr>
</table>
</div>
<div class=area3 style='float:left; margin-left: 50px;'>
<table border=1 id=tbl_list>
	<tr>
		<td colspan=2 align=left>예약된 객실</td>
	</tr>
	<tr>
		<td>
			<select size=10 style='width:500px;' id=reserveList></select>
		</td>
	</tr>
</table>
</div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

$(document)
.on('click','#btnSearch',function(){
	if($('#sDate').val()==''||$('#eDate').val()=='') {
		alert('조회 전 예약 기간을 선택하세요.');
		return false;
	}
	if($('#sDate').val()>=$('#eDate').val()) {
		alert('예약 시작일과 종료일을 맞게 선택하세요.')
		return false;
	}
	$.post("http://localhost:8079/getReservList",{checkin:$('#sDate').val(),checkout:$('#eDate').val()},function(result){
		$('#reserveList').empty();
		$.each(result,function(ndx,value) {
			str='<option value="'+value['bookcode']+'">'+value['roomcode']+','+value['roomname']+','+value['typename']+','+value['person']+','+value['howmany']+','+value['checkin']+','+value['checkout']+','+value['name']+','+value['mobile']+','+value['price']+'</option>';
			$('#reserveList').append(str);	
		})
	},'json');
	
	$.post("http://localhost:8079/getAvailRoom",{checkin:$('#sDate').val(),checkout:$('#eDate').val(),typecode:$('#selType option:selected').val()},function(result){
		$('#selRoom').empty();
		console.log(result);
		$.each(result,function(ndx,value) {
			str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
			$('#selRoom').append(str);
		})
	},'json');
})

.on('click', '#reserveList option:selected', function(){
	let info = $(this).text().split(",");
	let code = $(this).val();
	console.log(info);
	$('#bookCode').val(code);
	$('#roomCode').val(info[0]);
	$('#txtRoomName').val(info[1]);
	$('#txtType').val(info[2]);
	$('#txtNum').val(info[3]);
	$('#txtMaxNum').val(info[4]);
	$('#sDate2').val(info[5]);
	$('#eDate2').val(info[6]);
	$('#txtName').val(info[7]);
	$('#mobile').val(info[8]);
	$('#txtPrice').val(info[9]);
	return false;	
})

.on('click','#btnUpdate',function(){
	let bookcode = $('#reserveList option:selected').val();
	let person = $('#txtNum').val();
	let name = $('#txtName').val();
	let mobile = $('#mobile').val();
	if(person>$('#txtMaxNum').val()) {
		alert('최대 인원 수를 초과할 수 없습니다.');
		return false;
	}
	if(person==''||name==''||mobile=='') {
		alear('수정 내용을 입력해주세요.');
		return false;
	}
	$.post('http://localhost:8079/updateBook',{bookcode:bookcode,person:person,name:name,mobile:mobile},
			function(result){
				if(result=='ok'){
					location.reload();
				}
	},'text');	
})
.on('click','#selRoom option:selected',function(){
	let info = $(this).text().split(",");
	let code = $(this).val();
	let sDate = $('#sDate').val();
	let eDate = $('#eDate').val();
	let sDateAr = sDate.split("-");
	let eDateAr = eDate.split("-");
	let elDate1 = new Date(sDateAr[0],sDateAr[1]-1,sDateAr[2]);
	let elDate2 = new Date(eDateAr[0],eDateAr[1]-1,eDateAr[2]);
	let elSec = elDate2.getTime()-elDate1.getTime();
	let elDay = elSec/1000/60/60/24;
	
	if(elDay <= 0) {
		alert('예약 시작일자와 종료일자를 확인하세요.')
		return false;
	}
	$('#roomCode').val(code);
	$('#txtRoomName').val(info[0]);
	$('#txtType').val(info[1]);
	$('#txtMaxNum').val(info[2]);
	$('#roomcode').val(code);
	$('#sDate2').val(sDate);
	$('#eDate2').val(eDate);
	$('#txtPrice').val(elDay*info[3]);
	return false;
})
.on('click','#btnAdd',function(){
	let roomcode=$('#roomCode').val();
	let person=$('#txtNum').val();
	let max_person=$('#txtMaxNum').val();
	let checkin=$('#sDate2').val();
	let checkout=$('#eDate2').val();
	let name=$('#txtName').val();
	let mobile=$('#mobile').val();
	let price=$('#txtPrice').val();
	
	
	if(roomcode==''||person==''||checkin==''||checkout==''||name==''||mobile==''||price==''){
		alert('누락된 값이 있습니다.');
		return false;
	}
	else if(person>$('#txtMaxNum').val()) {
		alert('최대 인원을 초과하여 예약할 수 없습니다.')
		return false;
	}
	else {
		$.post('http://localhost:8079/addReserv',{roomcode:roomcode,person:person,checkin:checkin,checkout:checkout,name:name,mobile:mobile,price:price,max_person:max_person},
				function(result){
					if(result=='ok'){
						location.reload();
					}
				},'text');
	}
})
.on('click','#btnEmpty',function(){
	$('#txtRoomName,#txtType,#txtNum,#txtMaxNum,#txtPrice,#sDate2,#eDate2,#txtName,#mobile,#roomcode').val('');
	return false;
})
.on('click','#btnCancel',function(){
	$.post('http://localhost:8079/deleteReserv',{bookcode:$('#reserveList option:selected').val()},
			function(result){
		console.log(result);
		if(result=="ok") {
			$('#btnEmpty').trigger('click');//입력칸 비우기
			$('#reserveList option:selected').remove();//room 리스트에서 제거.
		}
	},'text');
})
</script>
</html>