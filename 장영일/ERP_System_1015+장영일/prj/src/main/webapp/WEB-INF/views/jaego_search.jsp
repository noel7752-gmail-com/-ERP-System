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


	<!-- *********************************************************** -->
	<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 -->
	<!-- common.jsp 파일 내의 소스를 삽입하기 -->
	<!-- *********************************************************** -->
	<%@include file="common.jsp"%>  

    <title>jaego_search</title>

	<script>
		function goHome( ){
  
			// alert("ddd")
			// Location 객체의 replace() 메소드 호출로 
			location.replace('/daybreak.do');
		}
  
		function goSearchAll( ){
			// Location 객체의 replace() 메소드 호출로 
			location.replace('/searchAll.do');
		}
		function goBoard( ){
			// Location 객체의 replace() 메소드 호출로 
			location.replace('/boardList.do');
		}
		function goStatistics( ){
			// Location 객체의 replace() 메소드 호출로 
			location.replace('/statistics.do');
		}
		function goSstock_management( ){
			// Location 객체의 replace() 메소드 호출로 
			location.replace('/stock_management.do');
		}
		function goJaego_search( ){
			// Location 객체의 replace() 메소드 호출로 
			location.replace('/jaego_search.do');
		}
	  </script>



</head>

<body>
	<center>
		<%@include file="./partails/header.jsp"%>
	<table border=1 cellpadding=10 style="borderCollapse:collapse" width=68% >

		<tr align="center">
			<th bgcolor="lightgray">지점</th>
			<td>
			<!----------------------------------------------------------------->
			<select name="jijuem">
				<option value="">
				<option value="A지점">A지점
				<option value="A지점">B지점

			</select>
			<!----------------------------------------------------------------->
			</td>
			<th bgcolor="lightgray">  제조일  </th><br>
			<td>
			<!----------------------------------------------------------------->
			<select name="jaejoDate_min_year">
				<option value="2010">2010
				<option value="2011">2011
				<option value="2012">2012
				<option value="2013">2013
				<option value="2014">2014
				<option value="2015">2015
				<option value="2016">2016
				<option value="2017">2017
				<option value="2018">2018
				<option value="2019">2019
				<option value="2020">2020
				<option value="2021">2021
			</select> 년 /&nbsp
			<select name="JaejoDate_min_month">
				<option value="01">01
				<option value="02">02
				<option value="03">03
				<option value="04">04
				<option value="05">05
				<option value="06">06
				<option value="07">07
				<option value="08">08
				<option value="09">09
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
			<!----------------------------------------------------------------->
			<select name="jaejoDate_max_year">
				<option value="2010">2010
				<option value="2011">2011
				<option value="2012">2012
				<option value="2013">2013
				<option value="2014">2014
				<option value="2015">2015
				<option value="2016">2016
				<option value="2017">2017
				<option value="2018">2018
				<option value="2019">2019
				<option value="2020">2020
				<option value="2021">2021
			</select> 년 /&nbsp
			<select name="JaejoDate_max_month">
				<option value="01">01
				<option value="02">02
				<option value="03">03
				<option value="04">04
				<option value="05">05
				<option value="06">06
				<option value="07">07
				<option value="08">08
				<option value="09">09
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select> 월
			</td>
		</tr>
		<tr align="center">
			<th bgcolor="lightgray">제품명</th>
			<td>
			<!----------------------------------------------------------------->
					<input type="text" name="product_name"   >				
			<!----------------------------------------------------------------->	
			</td>
			<th bgcolor="lightgray">입고일자  
			<td colspan = 3>
			<!----------------------------------------------------------------->
			<select name="comeDate_min_year">
				<option value="2010">2010
				<option value="2011">2011
				<option value="2012">2012
				<option value="2013">2013
				<option value="2014">2014
				<option value="2015">2015
				<option value="2016">2016
				<option value="2017">2017
				<option value="2018">2018
				<option value="2019">2019
				<option value="2020">2020
				<option value="2021">2021
			</select> 년 /&nbsp
			<select name="comeDate_min_month">
				<option value="01">01
				<option value="02">02
				<option value="03">03
				<option value="04">04
				<option value="05">05
				<option value="06">06
				<option value="07">07
				<option value="08">08
				<option value="09">09
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
			<!----------------------------------------------------------------->
			<select name="comeDate_max_month">
				<option value="2010">2010
				<option value="2011">2011
				<option value="2012">2012
				<option value="2013">2013
				<option value="2014">2014
				<option value="2015">2015
				<option value="2016">2016
				<option value="2017">2017
				<option value="2018">2018
				<option value="2019">2019
				<option value="2020">2020
				<option value="2021">2021
			</select> 년 /&nbsp
			<select name="comeDate_max_month">
				<option value="01">01
				<option value="02">02
				<option value="03">03
				<option value="04">04
				<option value="05">05
				<option value="06">06
				<option value="07">07
				<option value="08">08
				<option value="09">09
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select> 월	
			<!----------------------------------------------------------------->	
			</td>
		<!-- 	<td></td>	-->
		<!-- 	<td></td>	-->
		<!-- 	<td></td>	-->

		</tr>
		<tr align="center">
			<th bgcolor="lightgray">제품코드</th>
			<td>
			<!----------------------------------------------------------------->
			<input type="text" name="product_code">
			<!----------------------------------------------------------------->					
			</td>
			<th bgcolor="lightgray">출고일자</th>
			<td colspan = 3>
			<!----------------------------------------------------------------->
			<select name="comeDate_min_year">
				<option value="2010">2010
				<option value="2011">2011
				<option value="2012">2012
				<option value="2013">2013
				<option value="2014">2014
				<option value="2015">2015
				<option value="2016">2016
				<option value="2017">2017
				<option value="2018">2018
				<option value="2019">2019
				<option value="2020">2020
				<option value="2021">2021
			</select> 년 /&nbsp
			<select name="comeDate_min_month">
				<option value="01">01
				<option value="02">02
				<option value="03">03
				<option value="04">04
				<option value="05">05
				<option value="06">06
				<option value="07">07
				<option value="08">08
				<option value="09">09
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
			<!----------------------------------------------------------------->
			<select name="comeDate_max_month">
				<option value="2010">2010
				<option value="2011">2011
				<option value="2012">2012
				<option value="2013">2013
				<option value="2014">2014
				<option value="2015">2015
				<option value="2016">2016
				<option value="2017">2017
				<option value="2018">2018
				<option value="2019">2019
				<option value="2020">2020
				<option value="2021">2021
			</select> 년 /&nbsp
			<select name="comeDate_max_month">
				<option value="01">01
				<option value="02">02
				<option value="03">03
				<option value="04">04
				<option value="05">05
				<option value="06">06
				<option value="07">07
				<option value="08">08
				<option value="09">09
				<option value="10">10
				<option value="11">11
				<option value="12">12
			</select> 월
			</tr>
			<!----------------------------------------------------------------->
			<tr align="center">
			<th bgcolor="lightgray">브랜드</th>
			<td>
			<select name="Gajun_product_list">
				<option value="">
				<option value="삼성">삼성
				<option value="LG">LG
				<option value="기타">기타
			</select>
			</td>
			<th bgcolor="lightgray">색상</th>
			<td>
			<select name="product_color">
				<option value="">
				<option value="화이트">화이트
				<option value="블랙">블랙
			</select>
			</td>
		</tr>
		<tr align="center">
			<th bgcolor="lightgray">품목</th>
			<td>
			<select name="Gajun_product_list">
				<option value="">
				<option value="삼성">삼성
				<option value="LG">LG
				<option value="기타">기타
			</select>					
			</td>
			<th bgcolor="lightgray">에너지 소비등급</th>
			<td>
				<input type="checkbox" name="" value="1등급">1등급
				<input type="checkbox" name="" value="2등급">2등급
				<input type="checkbox" name="" value="3등급">3등급
			</td>
		</tr>
		<tr align="center">
			<th bgcolor="lightgray">세부품목1</th>
				<td>
					<input type="checkbox" name="" value="">에어컨
					<input type="checkbox" name="" value="">공기청정기
					<input type="checkbox" name="" value="">난방기기
				</td>
				<th bgcolor="lightgray">소비전력</th><br>
				<td>
					<select>
						<option value="1000w">1000w</option>
					</select>
				</td>
		</tr>
		<tr align="center">
			<th bgcolor="lightgray">세부품목2</th>
				<td>
					<input type="checkbox" name="" value="">냉장고
					<input type="checkbox" name="" value="">전기밥솥
					<input type="checkbox" name="" value="">에어프라이어
				</td>
				<th bgcolor="lightgray">사이즈</th><br>
				<td>
					<select>
						<option value="50인치">50인치</option>
					</select>
				</td>
		</tr>
		<tr align="center">
			<th bgcolor="lightgray">세부품목3</th>
				<td>
					<input type="checkbox" name="" value="">세탁기
					<input type="checkbox" name="" value="">청소기
					<input type="checkbox" name="" value="">건조기
				</td>
				<td colspan=3>
				<input type="checkbox" name="" value="">재고수량&nbsp;
				<input type="checkbox" name="" value="">단품제품
				</td>
		</tr>
		</tr>			
	</table>
	</center>




 </body>
</html>
