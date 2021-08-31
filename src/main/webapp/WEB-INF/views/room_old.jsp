<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 관리</title>
</head>
<body>
	<div class="area1" style="float:left;">
        <a href='/room' id="roomControl">객실관리</a>
        <a href='/booking' id="roomReserve">예약관리</a>
        <br>
        
        <select size=10 style='width:250px;'>
        <c:forEach items="${list}" var="room">
        	<option>${room.roomcode},${room.name},${room.type},${room.howmany},${room.howmuch}</option>
        </c:forEach>
        </select>
        
        <table style="border: 1px solid black;">
            <tr>
                <th>숙박기간</th>
                <td>
                    <input type="date" name='sdate' id='sdate'>~<input type="date" name='edate' id='edate'>
                </td>
            </tr>
            <tr>
            	<th>객실분류</th>
                <td>
                	<select id="roomselect" name="roomselect" >
                    	<optgroup label="등급">
                        	<option value="sr">Suite Room</option>
                            <option value="fr">Family Room</option>
                            <option value="dr">Double Room</option>
                            <option value="sgr">Single Room</option>
                            <option value="dm">Domitory</option>
                        </optgroup>
                     </select>
                 </td>
             </tr>
		</table>
        <br>
    	<table style="border: 1px solid black;">
        	<caption>예약가능</caption>
            <tr>
            	<th>방 선택</th>
                <td>
                	<select id="roomselect" name="roomselect" size="6">
                    	<optgroup label="예약가능">
                        	<option value="han">한라</option>
                            <option value="bak">백두</option>
                            <option value="kwan">관악</option>
                            <option value="nam">남산</option>
                            <option value="soo">수명</option>
                            <option value="tz">태조</option>
                        </optgroup>
                     </select>
                 </td>
             </tr>
		</table>
	</div>
    <!--예약 끝-->
    <div class="area2" style="float:left; margin-left: 50px;">
        객실이름 <input type="text" name='rn' id='rn' value=''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="/logout">로그아웃</a><br><br>
        숙박기간 <input type="date" name='sdate1' id='sdate1' value=''>~<input type="date" name='edate1' id='edate1' value=''><br><br>
        숙박인원 <input type="number"min=1 name='heads' id='heads' value=''>명<br><br>
        1박비용 <input type="text" name='cost' id='cost' value=''><br><br>
        총 숙박비 <input type="text" name='ecost' id='ecost' value=''><br><br>
        예약자 모바일 <input type="text" name='mobile' id='mobile' value=''><br><br>
        <input type="button" name='submit' id='submit' value='등록'>
        <input type="button" name='cancel' id='cancel' value='취소'>
        <input type="button" name='claer' id='claer' value='clear'>
    </div>
    <div class="area3" style="float:left; margin-left: 50px;">
        <table style="border: 1px solid black;">
            <caption>예약된 객실</caption>
            <colgroup>
            	<col width="50%">
                <col width="50%">
            </colgroup>
            <tr>
                <td>
                    광덕산<br>
                    흑성산<br>
                    태조산<br>
                    관악산<br>
                </td>
            </tr>
        </table>    

    </div>
</body>
</html>