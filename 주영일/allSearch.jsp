<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//w3c//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="https://kit.fontawesome.com/93bb0ea092.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/reset.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/header.css" />
    <link rel="stylesheet" href="/resources/css/maincontent.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Day Break</title>
  </head>
  <body>
    <%@include file="./partails/header.jsp"%>
    <div>
<center>
<table cellpading="5" border=1 style="border-collapse: collapse;">
<tr>
<td>지점</td>
<td>
<select>
<option></option>
<option value="A">A지점</option>
<option value="B">B지점</option>
</select>
</td>
<td>제조일</td>
<td>
<select>
<option></option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
</select> 년 
<select>
<option></option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select> 월 ~ 
<select>
<option></option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
</select> 년 
<select>
<option></option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select> 월
</td>
</tr>
<tr>
<td>제품명</td>
<td><input type="text"></td>
<td>입고일자</td>
<td>
<select>
<option></option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
</select> 년 
<select>
<option></option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select> 월 ~ 
<select>
<option></option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
</select> 년 
<select>
<option></option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select> 월
</td>
</tr>
<tr>
<td>제품코드</td>
<td><input type="text"></td>
<td>출고일자</td>
<td>
<select>
<option></option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
</select> 년 
<select>
<option></option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select> 월 ~ 
<select>
<option></option>
<option value="1998">1998</option>
<option value="1999">1999</option>
<option value="2000">2000</option>
</select> 년 
<select>
<option></option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select> 월
</td>
</tr>
<tr>
<td>브랜드</td>
<td>
<select>
<option></option>
<option>삼성전자</option>
<option>LG전자</option>
</select>
</td>
<td>색상</td>
<td>
<select>
<option></option>
<option>핑크</option>
<option>미스릴</option>
<option>팝핀블루</option>
</select>
</td>
</tr>
<tr>
<td>품목</td>
<td>
<select>
<option></option>
<option>가전</option>
<option>TV</option>
<option>PC</option>
<option>모바일</option>
</select>
</td>
<td>에너지 소비등급</td>
<td>
<input type="checkbox">1등급<input type="checkbox">2등급<input type="checkbox">3등급
</td>
</tr>
<tr>
<td>세부 품목</td>
<td>
<select>
<option></option>
<option>계절가전</option>
<option>주방가전</option>
<option>생활가전</option>
</select>
<select>
<option></option>
<option>QLED</option>
<option>miniLED</option>
<option>OLED</option>
</select>
<select>
<option></option>
<option>데스크탑</option>
<option>노트북</option>
</select>
<select>
<option></option>
<option>휴대폰</option>
<option>태블릿</option>
</select>
</td>
<td>세부 품목2</td>
<td><input type="checkbox">에어컨<input type="checkbox">공기청정기<input type="checkbox">난방기기
<input type="checkbox">냉장고<input type="checkbox">전기밥솥<input type="checkbox">에어프라이어
<input type="checkbox">세탁기<input type="checkbox">청소기<input type="checkbox">건조기
</td>
</tr>
<tr>
<td>소비전력</td>
<td><input type="text"> ~ <input type="text"></td>
<td>사이즈</td>
<td><input type="text"> ~ <input type="text"></td>
</tr>

<tr><td colspan=4><input type="checkbox">재고수량<input type="checkbox">단종제품</td></tr>
</center>
</table>
</div>
<div>
<center>
<table border=1 width=1311px style="border-collapse: collapse;">
<tr><th>제품코드</th><th>제품명</th><th>제조일</th><th>에너지 소비 등급</th><th>소비전력</th><th>색상</th><th>사이즈</th><th>브랜드</th></tr>
</table>
</center>
</div>
    
</html>
