<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>






<center>
<table border=1 cellpadding=10 style="borderCollapse:collapse" width=68% >

			<tr align="center">
				<th bgcolor="lightgray">지점</th>
				<td>
			<!------------------------------------------------------------------------------------------->
				<select name="jijuem">
					<option value="">
					<option value="A지점">A지점
					<option value="A지점">B지점

				</select>
			<!------------------------------------------------------------------------------------------->
				</td>
				<th bgcolor="lightgray">  제조일  </th><br>
				<td>
			<!------------------------------------------------------------------------------------------->
				<select name="jaejoDate_min_year">
			<c:forEach var="item" begin="2000" end="2021" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 년 /&nbsp
			<!------------------------------------------------------------------------------------------->
				<select name="JaejoDate_min_month">
			<c:forEach var="item" begin="1" end="31" step="1">
                <option>${item}</option>
            </c:forEach
				</select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
			<!------------------------------------------------------------------------------------------->
				<select name="jaejoDate_max_year">
			<c:forEach var="item" begin="2000" end="2021" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 년 /&nbsp
			<!------------------------------------------------------------------------------------------->
				<select name="JaejoDate_max_month">
			<c:forEach var="item" begin="1" end="31" step="1">
                <option>${item}</option>
            </c:forEach
				</select> 월
				</td>
			</tr>
			<!------------------------------------------------------------------------------------------->
			<tr align="center">
				<th bgcolor="lightgray">제품명</th>
				<td>
			<!------------------------------------------------------------------------------------------->
						<input type="text" name="product_name"   >				
			<!------------------------------------------------------------------------------------------->	
				</td>
				<th bgcolor="lightgray">입고일자  
				<td colspan = 3>
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_min_year">
			<c:forEach var="item" begin="2000" end="2021" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 년 /&nbsp
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_min_month">
			<c:forEach var="item" begin="1" end="31" step="1">
                <option>${item}</option>
            </c:forEach
				</select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_max_month">
			<c:forEach var="item" begin="2000" end="2021" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 년 /&nbsp
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_max_month">
			<c:forEach var="item" begin="1" end="31" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 월	
			<!------------------------------------------------------------------------------------------->	
				</td>
			<!-- 	<td></td>	-->
			<!-- 	<td></td>	-->
			<!-- 	<td></td>	-->

			</tr>
			<tr align="center">
				<th bgcolor="lightgray">제품코드</th>
				<td>
			<!------------------------------------------------------------------------------------------->
				<input type="text" name="product_code">
			<!------------------------------------------------------------------------------------------->				
				</td>
				<th bgcolor="lightgray">출고일자</th>
				<td colspan = 3>
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_min_year">
			<c:forEach var="item" begin="2000" end="2021" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 년 /&nbsp
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_min_month">
			<c:forEach var="item" begin="1" end="31" step="1">
                <option>${item}</option>
            </c:forEach
				</select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_max_month">
			<c:forEach var="item" begin="2000" end="2021" step="1">
                <option>${item}</option>
            </c:forEach>
				</select> 년 /&nbsp
			<!------------------------------------------------------------------------------------------->
				<select name="comeDate_max_month">
			<c:forEach var="item" begin="1" end="31" step="1">
                <option>${item}</option>
            </c:forEach
				</select> 월
			<!------------------------------------------------------------------------------------------->
				</tr>

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
 <body>
  
 </body>
</html>
