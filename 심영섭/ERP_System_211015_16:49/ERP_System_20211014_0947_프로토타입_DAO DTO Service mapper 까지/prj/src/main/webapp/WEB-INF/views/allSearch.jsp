<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>  
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

    <script>
      function goHome( ){

          // alert("ddd")
          // Location 객체의 replace() 메소드 호출로 
          // [새글쓰기 화면]으로 이동하기.
          // 이 이동방법은 form 태그를 이용한 웹서버 접속 방법이 아니므로
          // 파라미터값을 가지고 가려면 URL 주소 뒷 부분에 ?파면=파값 을 붙여야만 한다.  
          // 즉, get 방식으로 웹서버에 접속하는 방법이다.  
          location.replace('/daybreak.do');
      }

      function goSearchAll( ){
          // alert("통합검색")
          // Location 객체의 replace() 메소드 호출로 
          // [새글쓰기 화면]으로 이동하기.
          // 이 이동방법은 form 태그를 이용한 웹서버 접속 방법이 아니므로
          // 파라미터값을 가지고 가려면 URL 주소 뒷 부분에 ?파면=파값 을 붙여야만 한다.  
          // 즉, get 방식으로 웹서버에 접속하는 방법이다.  
          location.replace('/searchAll.do');
      }

      function goBoard( ){
          // alert("통합검색")
          // Location 객체의 replace() 메소드 호출로 
          // [새글쓰기 화면]으로 이동하기.
          // 이 이동방법은 form 태그를 이용한 웹서버 접속 방법이 아니므로
          // 파라미터값을 가지고 가려면 URL 주소 뒷 부분에 ?파면=파값 을 붙여야만 한다.  
          // 즉, get 방식으로 웹서버에 접속하는 방법이다.  
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
    </script>    

  </head>
  <body>
    <%@include file="./partails/header.jsp"%>
    <div>
      <br>
      <br>
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
  <br>
  <br>
<c:if test="${requestScope.searchListAllCnt>0}">
<table border=1 width=1311px style="border-collapse: collapse;">
<tr><th>번호</th><th>이미지</th><th>제품코드</th><th>제품명</th><th>브랜드</th><th>제품종류</th><th>소비전력</th><th>수량</th></tr>
			<c:forEach var="searchAll" items="${requestScope.searchALLList}" varStatus="loopTagStatus">
				<c:if test="${requestScope.searchALLList!=null}">
					<tr>
						<td>${pagingNos.selectPageNo*pagingNos.rowCntPerPage-pagingNos.rowCntPerPage+1+loopTagStatus.index}
						<td>${searchAll.pic }
						<td>${searchAll.g_item_code}
						<td>${searchAll.g_item_name}
						<td>${searchAll.brand_name}
						<td>${searchAll.g_category_name}
						<td>${searchAll.power_consum}
						<td>${searchAll.stock}
				</c:if>
			</c:forEach>	
</table>
</c:if>
		<div class="pageNo">

			
			
			
			<c:if test="${requestScope.searchListAllCnt>0}">
					<!-- 선택한 페이지 번호가 1보다 크면 [처음], [이전] 글씨 보이기. 단 클릭하면 함수호출하도록 이벤트 걸기 -->
					<c:if test="${pagingNos.selectPageNo>1}">
						<span style='cursor:pointer'; onClick='search_with_changePageNo(1)'>[처음]</span>
						<span style='cursor:pointer'; onClick='search_with_changePageNo(${pagingNos.selectPageNo}-1);'>[이전]</span>
						&nbsp;&nbsp;
					</c:if>
					<!-- 선택한 페이지 번호가 1이하이면 [처음], [이전] 문자 표현하기. 함수호출 X-->
					<c:if test="${pagingNos.selectPageNo<=1}">
						<span>[처음]</span>
						<span>[이전]</span>
						&nbsp;&nbsp;
					</c:if>
					
					
					
			
					
					<c:forEach var="no" begin="${pagingNos.min_pageNo}" end="${pagingNos.max_pageNo}" step="1">
						<!-- 만약 출력되는 페이지번호와 선택한 페이지 번호가 일치하면 그냥 번호만 표현하기 -->
						<c:if test="${no==pagingNos.selectPageNo}">
							<span>${no}</span>
						</c:if>
						<!-- 만약 출력되는 페이지번호와 선택한 페이지 번호가 일치하지 않으면 클릭하면 함수호출하도록 클릭 이벤트 걸기 -->
						<c:if test="${no!=pagingNos.selectPageNo}">
							<span style='cursor:pointer'; onClick='search_with_changePageNo(${no});'>[${no}]</span>
						</c:if>
					
					</c:forEach>

					
					
					<!-- 선택한 페이지 번호가 마지막 페이지 번호보다 작으면 [다음], [마지막] 문자 표현하기. 단 클릭하면 함수호출하도록 이벤트 걸기 -->
					<c:if test="${pagingNos.selectPageNo<pagingNos.last_pageNo}">
						&nbsp;&nbsp;
						<span style='cursor:pointer'; onClick='search_with_changePageNo(${pagingNos.selectPageNo}+1);'>[다음]</span>
						<span style='cursor:pointer'; onClick='search_with_changePageNo(${pagingNos.last_pageNo});'>[마지막]</span>
					</c:if>
					<!-- 선택한 페이지 번호가 마지막 페이지 번호가 크거나 같으면 [다음], [마지막] 문자 표현하기. 함수호출 X-->
					<c:if test="${pagingNos.selectPageNo>=pagingNos.last_pageNo}">
						&nbsp;&nbsp;
						<span>[다음]</span>
						<span>[마지막]</span>
					</c:if>
			</c:if>
		</div>
</center>
</div>
    
</html>
