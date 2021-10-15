<!-- ******************************************************** -->
<!-- JSP 기술의 한 종류인 [Page Directive]를 이용하여 현 JSP 페이지 처리 방식 선언하기 -->
<!-- ******************************************************** -->
    <!-- 현재 이 JSP 페이지 실행 후 생성되는 문서는 HTML 이고, 이 문서 안의 데이터는 UTF-8 방식으로 인코딩한다라고 설정함 -->
    <!-- 현재 이 JSP 페이지는 UTF-8 방식으로 인코딩 한다. -->
    <!-- UTF-8 인코딩 방식은 한글을 포함 전 세계 모든 문자열ㅇ르 부호화 할 수 있는 방법이다.  -->
    <!-- 모든 JSP 페이지 상단에는 무조건 아래 설정이 들어간다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ***************************************************** -->
<!-- 현재 JSP 페이지에서 사용할 클래스 수입하기 -->
<!-- ***************************************************** -->
<%@ page import="com.daybreak.prj.BoardDTO"%>


<!-- *********************************************************** -->
<!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 -->
<!-- common.jsp 파일 내의 소스를 삽입하기 -->
<!-- *********************************************************** -->
<%@include file="common.jsp"%>  


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardContentForm2</title>

    <script>

        $(document).ready(function(){

            
        })


        // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
        // 게시판 수정/삭제 화면으로 이동하는 함수 선언
        // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
        function goBoardUpDelForm(){
            // -----------------------------------------
            // name=boardUpDelForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
            // -----------------------------------------
            document.boardUpDelForm.submit();
        }


        // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
        // 게시판 댓글 화면으로 이동하는 함수 선언
        // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
        function goBoardRegFrom(){

            // alert("댓글쓰기 확인"); // 테스트용. 버튼 작동 확인.  
            
            // -----------------------------------------
            // name=boardRegForm 을 가진 form 태그의 action 값을 URL로 서버에 접속하라
            // -----------------------------------------
            document.boardRegForm.submit();
        }


    </script>


</head>
<body><center>

    
    <span style="font-size:30px; font-weight: bold; color: blue;">
        boardContentForm2.jsp 접속 성공!!
    </span>

    <% System.out.println("============================"); %>
    <% System.out.println("boardContentForm.jsp 접속 성공!!"); %>
    <% System.out.println("============================"); %>

        <hr> 

    <%
    /*
        BoardDTO boardDTO = (BoardDTO)request.getAttribute("boardDTO");
        int b_no = 0;
        if( boardDTO!=null ){
            b_no = boardDTO.getB_no();
            String subject = boardDTO.getSubject();
            String writer = boardDTO.getWriter();
            String reg_date = boardDTO.getReg_date();
            String content = boardDTO.getContent();
            int readcount = boardDTO.getReadcount();
            String email = boardDTO.getEmail();
    */  
    %>

    <c:if test="${!empty requestScope.boardDTO}">

        <b>[글 상세 보기]</b>

        <div style="height: 10px;"></div> <!-- 공백조절용 div 태그 -->

        <!-- 아래는 requestScope. 을 생략한 키값 EL 을 작성함 -->
        <table class="tbcss2" border="1" style="border-collapse:collapse" cellpadding='${requestScope.cellpadding}'>
            <tr align="center">
                <th bgcolor="${requestScope.thBgColor}">글번호</th>
                <td>${boardDTO.b_no}</td>
                <th bgcolor="${thBgColor}">조회수</th>
                <td>${boardDTO.readcount}</td>
            </tr>
            <tr align="center">
                <th bgcolor="${thBgColor}">작성자</th>
                <td>${boardDTO.writer}</td>
                <th bgcolor="${thBgColor}">작성일</th>
                <td>${boardDTO.reg_date}</td>
            </tr>
            <tr >
                <th bgcolor="${thBgColor}">글제목</th>
                <td colspan="3">${boardDTO.subject}</td>
            </tr>
            <tr >
                <th bgcolor="${thBgColor}">글내용</th>
                <td colspan="3">
                    <textarea name="content" rows="13" cols="45" style="border: 0;" readonly>${boardDTO.content}</textarea></td>
            </tr>
            <tr >
                <th bgcolor="${thBgColor}">이미지</th>
                <td colspan="3">
                    <c:if test="${!empty requestScope.boardDTO.pic}">
                        <img src="/resources/img/${requestScope.boardDTO.pic}" width="${requestScope.boardImgRate1}">
                    </c:if>
                </td>
            </tr>

    </c:if>



    </table><br>
    <input type="button" value="댓글쓰기" onclick="goBoardRegFrom();">&nbsp;
    <input type="button" value="수정/삭제" onclick="goBoardUpDelForm();">&nbsp;
    <input type="button" value="글 목록 보기" onclick="location.replace('/${requestScope.naverPath}boardList.do')">
    <%
    /*
    }
    else{
        out.print("<script>alert('삭제된 글입니다.'); location.replace('/${requestScope.naverPath}boardList.do');</script>");
    }
    */
    %>

    <c:if test="${empty requestScope.boardDTO}">
        <script>
            alert('삭제된 글입니다.'); 
            location.replace('/${requestScope.naverPath}boardList.do');
        </script>
    </c:if>

    <br>
    <br>

    [현재 게시글 총개수 : ${requestScope.totCnt}개]
    <div>${sessionScope.msg}</div>

    <!-- ****************************************************** -->
    <!-- [게시판 수정/삭제] 화면으로 이동하는 form 태그 선언 -->
    <!-- ****************************************************** -->
    <form name="boardUpDelForm" method="POST" action="/${requestScope.naverPath}boardUpDelForm.do">
        <input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
    </form>

    <!-- ****************************************************** -->
    <!-- [게시판 댓글쓰기] 화면으로 이동하는 form 태그 선언 -->
    <!-- ****************************************************** -->
    <form name="boardRegForm" method="POST" action="/${requestScope.naverPath}boardRegForm.do">
        <input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
    </form>



    <hr> 


</body>

</html>