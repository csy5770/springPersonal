<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
</head>
<body>
	<div class="area" style="float:left;">
        <a href='/room' id="roomControl">객실관리</a>
        <a href='/booking' id="roomReserve">예약관리</a>
        <br><br>
        <table style="border: 1px solid black;">
            <caption>예약된 객실</caption>
            <colgroup>
            	<col width="50%">
                <col height="100%">
            </colgroup>
            <tr>
                <td>
                    백두산<br>
                    한라산<br>
                    태조산<br>
                    흑성산<br>
                </td>
            </tr>
        </table>
    </div>
        <div class="area1" style="float:left; margin-left: 100px;">
            객실이름 <input type="text" id="rname" name="rname">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="/logout">로그아웃</a><br><br>
            <table style="border: 1px solid black;">
                <tr>
                    <th>객실분류</th>
                    <td>
                        <select id="roomselect" name="roomselect" size="5" >
                            <optgroup label="등급">
                                <option value="sr">Suite Room</option>
                                <option value="fr">Family Room</option>
                                <option value="dr">Double Room</option>
                                <option value="sgr">Single Room</option>
                                <option value="dm">Dormitory</option>
                            </optgroup>
                         </select>
                     </td>
                 </tr>
            </table>
            <br>
            숙박가능인원 <input type="number" id="headcount" name="headcount" min="1">명<br><br>
            1박요금 <input type="text" id="cost" name="cost">원<br><br>
            <input type="button" name='submit' id='submit' value='등록'>
            <input type="button" name='cancel' id='cancel' value='취소'>
            <input type="button" name='claer' id='claer' value='clear'>
        </div>
</body>
</html>