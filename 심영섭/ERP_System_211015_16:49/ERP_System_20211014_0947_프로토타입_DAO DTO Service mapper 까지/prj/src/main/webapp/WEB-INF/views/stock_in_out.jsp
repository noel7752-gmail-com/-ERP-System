<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//w3c//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="https://kit.fontawesome.com/93bb0ea092.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/header.css" />
    <link rel="stylesheet" href="/resources/css/maincontent.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="/resources/jquery-1.11.0.min.js"></script>


    <!-- *********************************************************** -->
    <!-- JSP 기술의 한 종류인 [Include Directive]를 이용하여 -->
    <!-- common.jsp 파일 내의 소스를 삽입하기 -->
    <!-- *********************************************************** -->
    <%@include file="common.jsp"%>  


    <title>Day Break</title>
    

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



    <script>
    $(document).ready(function(){
    	 $("input:text[numberOnly]").on("keyup", function() {
    	      $(this).val($(this).val().replace(/[^0-9]/g,""));
    	   });

    	 
    });



    
    function plus(){ 
        var num = parseInt( $(".in_out_inputKeyword").val() )+1;
    	$(".in_out_inputKeyword").val( num );
    	
    }
    function minus(){
        if( $(".in_out_inputKeyword").val()<=0 ){
            return;
        }else{
            var num = parseInt( $(".in_out_inputKeyword").val() )-1;
    	    $(".in_out_inputKeyword").val( num );
        }
    } 
    function stock_in(){
        alert( $(".in_out_inputKeyword").val() + "개 입고!" );
        
    } 
    function stock_out(){
        alert( $(".in_out_inputKeyword").val() + "개 출고!" );
    }
    
    function zeroCut(number){ 
        var inp = $(".in_out_inputKeyword").val();
        if( inp.length==0 ){  $(".in_out_inputKeyword").val( 0 );  }
        $(".in_out_inputKeyword").val( parseInt( $(".in_out_inputKeyword").val() ) ); 
    }
    
    </script>

    
  </head>
  <body>
  <center>
    <%@include file="./partails/header.jsp"%>
    <br>

    <div>
        <table style="border-collapse:collapse;position:absolute;left:170px;border-bottom:1px solid" 
          cellpadding="10" frame=void>
            <tr><th style="font-size:3em;border-bottom:1px solid">가전
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;<div onclick="goJaego_search();">검색 </div>
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;입/출고관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;제품관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;불량/이월 관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;반품관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;통계       
        </table>
    </div>
    
    <!-- ===================================================================================================== -->
    <!-- 효재님구현 검색 부분 복붙. -->
    <!-- 나중에 for 로 돌려서 코드 줄이기. 너무 김. -->
    <table border=1 cellpadding=10 style="borderCollapse:collapse" width=58% >

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
          <option value="0000"></option>
          <c:forEach var="i" begin="2000" end="2021" step="1">
            <option value="${2021 - i + 2000}">${2021 - i + 2000}
          </c:forEach>
        </select> 년 /&nbsp

        <select name="JaejoDate_min_month">
          <option value="00"></option>
          <c:forEach var="i" begin="1" end="12" step="1">
            <option value="${i}">${i}
          </c:forEach>
        </select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
        <!----------------------------------------------------------------->
        <select name="jaejoDate_max_year">
          <option value="0000"></option>
          <c:forEach var="i" begin="2000" end="2021" step="1">
            <option value="${2021 - i + 2000}">${2021 - i + 2000}
          </c:forEach>
        </select> 년 /&nbsp
        <select name="JaejoDate_max_month">
          <option value="00"></option>
          <c:forEach var="i" begin="1" end="12" step="1">
            <option value="${i}">${i}
          </c:forEach>
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
          <option value="0000"></option>
          <c:forEach var="i" begin="2000" end="2021" step="1">
            <option value="${2021 - i + 2000}">${2021 - i + 2000}
          </c:forEach>
        </select> 년 /&nbsp
        <select name="comeDate_min_month">
          <option value="00"></option>
          <c:forEach var="i" begin="1" end="12" step="1">
            <option value="${i}">${i}
          </c:forEach>
        </select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
        <!----------------------------------------------------------------->
        <select name="comeDate_max_month">
          <option value="0000"></option>
          <c:forEach var="i" begin="2000" end="2021" step="1">
            <option value="${2021 - i + 2000}">${2021 - i + 2000}
          </c:forEach>
        </select> 년 /&nbsp
        <select name="comeDate_max_month">
          <option value="00"></option>
          <c:forEach var="i" begin="1" end="12" step="1">
            <option value="${i}">${i}
          </c:forEach>
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
          <option value="0000"></option>
          <c:forEach var="i" begin="2000" end="2021" step="1">
            <option value="${2021 - i + 2000}">${2021 - i + 2000}
          </c:forEach>
        </select> 년 /&nbsp
        <select name="comeDate_min_month">
          <option value="00"></option>
          <c:forEach var="i" begin="1" end="12" step="1">
            <option value="${i}">${i}
          </c:forEach>
        </select> 월&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp;
        <!----------------------------------------------------------------->
        <select name="comeDate_max_month">
          <option value="0000"></option>
          <c:forEach var="i" begin="2000" end="2021" step="1">
            <option value="${2021 - i + 2000}">${2021 - i + 2000}
          </c:forEach>
        </select> 년 /&nbsp
        <select name="comeDate_max_month">
          <option value="00"></option>
          <c:forEach var="i" begin="1" end="12" step="1">
            <option value="${i}">${i}
          </c:forEach>
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
    
    <br>
    
    <input type="button" style="width:725pt;position:absolute;left:455px;" value="검색"></button>
    <!-- ===================================================================================================== -->










    <br><br>   
    <table border=1 cellpadding="5" bordercolor="black" style="border-collapse:collapse;position:absolute;left:455px;">
        <tr bordercolor="lightgray">
            <th>제품코드
            <th>제품이름  
            <th>제조일  
            <th>에너지소비등급  
            <th>소비전력  
            <th>색상  
            <th>사이즈 
            <th>브랜드
            <th colspan=4>                          
        </tr>   
        <tr>
            <td>KQ75QA70AFXKR
            <td>QLED 4K 
            <td>2021-O3  
            <td>4등급 
            <td>320W
            <td>블랙 
            <td>1677.5x1025.9x320.6
            <td>삼성전자
            <td><input type="text" name="in_out_inputKeyword" class="in_out_inputKeyword" 
                 value="0" style="width:30pt;text-align:right;" numberOnly onChange="zeroCut();">            
            <td><input type="button" value="입고" onClick="stock_in();">
            <td><input type="button" value="출고" onClick="stock_out();">
            <td><input type="button" style="width:20pt;height:20pt;" value="+" onClick="plus();"><br>
                <input type="button" style="width:20pt;height:20pt;" value="-" onClick="minus();">                                                          
        </tr>                          
    </table>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  </center>  
  </body>
</html>