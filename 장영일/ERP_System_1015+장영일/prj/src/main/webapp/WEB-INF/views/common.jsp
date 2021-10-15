<!-- ******************************************************** -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ******************************************************** -->
    <!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다라고 설정함 -->
    <!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
    <!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열ㅇ르 부호화 할 수 있는 방법이다.  -->
    <!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
<!-- JSP 페이지에서 사용할 [사용자 정의 태그]의 한 종류인 [JSTL의 C 코어 태그]를 사용하겠다고 선언 -->
<!-- mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--
		--------------------------------------
		JSTL 이란?
		--------------------------------------
			=>자카르타라는 단체에서 만든 [사용자 정의 태그]를 말한다.
			=>자바 문법을 HTML 과 같은 태그 형태로 표현한다.
			=>HTML 과 같은 태그 형태로 표현하면 뒤에서 자바 문법으로 바뀌어 실행된다.
			=>JSTL 사용 장점
				-태그 형태이므로 디자이너 퍼블리셔, 초급 개발자가 접근이 쉽다.
				-큰 에러가 아닌 이상 화면이 멈추지 않는다.
				-null 처리에 대해 관대하다. null에 대해 민감한 반응을 보이지않는다. 
			=>JSTL 은 EL 과 같이 쓰인다.

	-->

<!-- JSTL 숫자 포멧 선언   -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!-- --------------------------------------------------------------------- -->
<!-- JQuery 라이브러리 수입하기 -->
<!-- --------------------------------------------------------------------- -->
<script src="/resources/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/resources/common_func.js"></script>
<script src="/resources/common_data.js"></script>

<script src="/resources/common.js"></script>


<link href="/resources/common.css" rel="stylesheet" type="text/css">






<!-- --------------------------------------------------------------------- -->
<!-- JSTL 이란 커스텀 태그의 C 코어 태그를 사용하여 -->
<!-- HttpServletRequest 객체 키값-데이터 저장하기 -->

<!-- 공용 변수 만들기(JSTL 커스텀 태그 c 코어태그) -->
<!-- --------------------------------------------------------------------- -->
<c:set var="thBgColor" value="#FFE1E6" scope="request"/>
<c:set var="thBgColor" value="#D2D2FF" scope="request"/>
<c:set var="thBgColor" value="lightgray" scope="request"/>


<!-- body 태그 색상지정. -->
<!-- 같은걸 복사하고 적용하면 맨 밑에 코드 수치가 반영된다. 코드 순서만 바꿔서 비율 조절 가능. -->
<c:set var="bodyColor" value="#F0F8FF" scope="request"/>
<c:set var="bodyColor" value="#FAEBD7" scope="request"/>


<!-- 게시판 이미지 비율 및 cellpadding 조절 -->
<!-- 같은걸 복사하고 적용하면 맨 밑에 코드 수치가 반영된다. 코드 순서만 바꿔서 비율 조절 가능. -->
<c:set var="boardImgRate1" value="70%" scope="request"/>
<c:set var="boardImgRate1" value="30%" scope="request"/>

<c:set var="cellpadding" value="5" scope="request"/>
<c:set var="cellpadding" value="7" scope="request"/>


<!-- 헤더, 짝수행, 홀수행 색상 -->
<c:set var="headerTrColor" value="#FF8C8C" scope="request"/>
<c:set var="headerTrColor" value="#1E9E9E" scope="request"/>
<c:set var="headerTrColor" value="gray" scope="request"/>
<c:set var="oddTrColor" value="#F4FFFF" scope="request"/>
<c:set var="oddTrColor" value="white" scope="request"/>
<c:set var="evenTrColor" value="#FAEBD7" scope="request"/>
<c:set var="evenTrColor" value="lightgray" scope="request"/>








<script>
$(document).ready(function(){
    $("body").prepend(    
        // "<center><div><span style='cursor:pointer' "
        //    + "onclick='location.replace(\"/logout.do\");'>[로그아웃]</span></div></center>"
    );
});



// *****************************************
// table 태그 내부의 배경색 바꾸는 함수 선언
// *****************************************
function changeBgColor(  ){
	setTrBgcolor( 
		// ---------------------------------------------------
		"tbcss1"        //tableClassV  //테이블 태그의 클래스값
		// ---------------------------------------------------
		,"${requestScope.headerTrColor}"   //"#AD9AEE"        //headBgcolor  //헤드 tr 의 배경색값
		// , "gray"
		// ---------------------------------------------------
		,"${requestScope.oddTrColor}"   //"#eef7ff"     //oddTrBgcolor //헤드 tr 이후의 홀수 tr 배경색값
		// , "white"	//주석 바꿔가면서 색상변경 할 수 있다.
		// , "red"
		// ---------------------------------------------------
		,"${requestScope.evenTrColor}"   //"#D2D2FF"   //evenTrBgcolor//헤드 tr 이후의 짝수 tr 배경색값
		// ,"lightgray"
		// ---------------------------------------------------
		, "lightyellow"   //mouseOverBgcolor//마우스 댔을 때 배경색값
	);
}
</script>

