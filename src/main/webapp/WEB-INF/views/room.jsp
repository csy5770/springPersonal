<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<body>
    <a href='/room' id="roomControl">객실관리</a>
    <a href='/booking' id="roomReserve">예약관리</a>
    <a href="/logout">로그아웃</a>
    <br>
	<table border=1>
	<tr>
		<td>        
	       <%--  <select size=10 style='width:250px;'>
	        <c:forEach items="${list}" var="room">
	        	<option id=rn value='${room.roomcode}'>${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
	        </c:forEach>
	        </select> --%>
        </td>
        <td>
        	<table>
        	<tr>
        		<td align=right>객실명</td>
        		<td><input type=text id=txtName><input type=hidden id=roomcode></td>
        	</tr>
        	<tr>
        		<td align=right>타입</td>
        		<td>
        			<select size=5 style='width:120px;' id=selType>
        			<c:forEach items="${list2}" var="roomtype">
	        			<option id=tc value='${roomtype.typecode}'>${roomtype.name}</option>
	        		</c:forEach> 
        			</select>	
        		</td>
        	</tr>
        	<tr>
        		<td align=right>최대숙박인원</td><td><input type=number id=txtNum></td>
        	</tr>
        	<tr>
        		<td align=right>1박가격</td><td><input type=number id=txtPrice></td>
        	</tr>
        	<tr>
        		<td colspan=2 align=center>
        			<input type=button value='등록' id=btnAdd>&nbsp;
        			<input type=button value='삭제' id=btnDelete>&nbsp;
        			<input type=button value='취소' id=btnEmpty>&nbsp;
        		</td>
        	</tr>
        	</table>
        </td>
      </tr>
      </table> 

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$(document)
.ready(function(){
	$.post("http://localhost:8079/getRoomList",{},function(result){
		console.log(result);
	},'json');
})
.on('click','#rn',function(){
	let info = $(this).text().split(",");
	let code = $(this).val();
	$('#txtName').val(info[0]);
	//option:contains -> 선택된 옵션 중 해당 내용이 있는 것.
	$('#selType option:contains("'+info[1]+'")').prop("selected", true);
	$('#txtNum').val(info[2]);
	$('#txtPrice').val(info[3]);
	$('#roomcode').val(code);
	return false;
	
	/*  하드코딩 , 선택된 옵션(this)의 val을 조건으로.
		if($(this).val()==1) {
			$('#txtName').val(info[0]);
			$('#txtNum').val(info[2]);
			$('#txtPrice').val(info[3]);
			$('#selType option:contains("'+info[1]+'")').prop("selected", true);
		return false;		
	} */
	
})
.on('click','#btnEmpty',function(){
	$('#txtName,#txtNum,#txtPrice,#roomcode').val('');
	$('#selType option:selected').prop('selected',false);
	return false;
})

</script>
</html>