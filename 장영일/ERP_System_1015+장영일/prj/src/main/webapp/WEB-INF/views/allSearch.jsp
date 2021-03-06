<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//w3c//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="https://kit.fontawesome.com/93bb0ea092.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/reset.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/common.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/header.css" />
    <link rel="stylesheet" href="/resources/css/maincontent.css" type="text/css" />
    <script src="/resources/jquery-1.11.0.min.js"></script>
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

      function item_registration(){
          alert("확인");
    	  //$("#test>tbody").prepend("<tr><td>pic<td></tr>");
      }

    </script>    


    <script>
    $(document).ready(function(){
   	    $("input:text[numberOnly]").on("keyup", function() {
	        $(this).val($(this).val().replace(/[^0-9]/g,""));
	    });
	    
    	$(".onlyInDel").hide();
    	$(".reg_cancel").hide();
        $(".item_reg").hide();
    	
    	$(".middleDivisionTag").hide();     	
    	$(".middleDivisionTag_G").hide();
    	$(".middleDivisionTag_T").hide();
    	$(".middleDivisionTag_P").hide();
    	$(".middleDivisionTag_M").hide();    	
    	    	
    	$(".smallDivisionTag").hide();
    	$(".smallDivisionTag_G_season").hide();
    	$(".smallDivisionTag_G_kitchen").hide();
    	$(".smallDivisionTag_G_life").hide();
    	$(".smallDivisionTag_T_qled").hide();
    	$(".smallDivisionTag_T_mini").hide();
    	$(".smallDivisionTag_T_oled").hide();
    	$(".smallDivisionTag_P_desk").hide();
    	$(".smallDivisionTag_P_lap").hide();
    	    	
    	 
    	$(".bigDivision").change(function(){

    		var selected = $(".bigDivision").val();
        	$(".middleDivisionTag").show(); 

        	$(".smallDivisionTag").hide();
        	$(".smallDivisionTag_G_season").hide();
        	$(".smallDivisionTag_G_kitchen").hide();
        	$(".smallDivisionTag_G_life").hide();
        	$(".smallDivisionTag_T_qled").hide();
        	$(".smallDivisionTag_T_mini").hide();
        	$(".smallDivisionTag_T_oled").hide();
        	$(".smallDivisionTag_P_desk").hide();
        	$(".smallDivisionTag_P_lap").hide();

            if( selected=="가전" ){             
            	$(".middleDivisionTag_G").show();         	
            	$(".middleDivisionTag_T").hide();
            	$(".middleDivisionTag_P").hide();
            	$(".middleDivisionTag_M").hide(); 
            }else if( selected=="TV" ){
            	$(".middleDivisionTag_T").show();        	
            	$(".middleDivisionTag_G").hide();
            	$(".middleDivisionTag_P").hide();
            	$(".middleDivisionTag_M").hide();   
            }else if( selected=="PC" ){
            	$(".middleDivisionTag_P").show();
            	$(".middleDivisionTag_G").hide();
            	$(".middleDivisionTag_T").hide();
            	$(".middleDivisionTag_M").hide(); 
            }else if( selected=="모바일" ){
            	$(".middleDivisionTag_M").show();
            	$(".middleDivisionTag_G").hide();
            	$(".middleDivisionTag_T").hide();
            	$(".middleDivisionTag_P").hide();
            }

    	})

        $(".middleDivisionTag_G").change(function(){
    		var selected = $(".middleDivision_G").val();
        	$(".smallDivisionTag").show();   

            if( selected=="계절가전" ){            
            	$(".smallDivisionTag_G_season").show();         	
            	$(".smallDivisionTag_G_kitchen").hide();
            	$(".smallDivisionTag_G_life").hide();
            }else if( selected=="주방가전" ){
            	$(".smallDivisionTag_G_season").hide();         	
            	$(".smallDivisionTag_G_kitchen").show();
            	$(".smallDivisionTag_G_life").hide(); 
            }else if( selected=="생활가전" ){
            	$(".smallDivisionTag_G_season").hide();         	
            	$(".smallDivisionTag_G_kitchen").hide();
            	$(".smallDivisionTag_G_life").show();
            }      		
            
        }); 

        $(".middleDivisionTag_P").change(function(){
    		var selected = $(".middleDivision_P").val();
        	$(".smallDivisionTag").show();   

            if( selected=="데스크탑" ){            
            	$(".smallDivisionTag_P_desk").show();         	
            	$(".smallDivisionTag_P_lap").hide();
            }else if( selected=="노트북" ){
            	$(".smallDivisionTag_P_desk").hide();         	
            	$(".smallDivisionTag_P_lap").show();
            }  		
            
        }); 

    });

    
    function item_reg_show(){
        //alert("확인");
        $(".onlyInDel").show();
        $(".reg_cancel").show();
        $(".reg_show").hide();
        $(".item_reg").show();
    }
    function item_reg_hide(){
        //alert("확인");
        $(".onlyInDel").hide();
        $(".reg_cancel").hide();
        $(".reg_show").show();
        $(".item_reg").hide();
        $(".smallDivisionTag").hide(); 
    }    
    function item_reg(){
    	if(confirm("정말 등록 하시겠습니까??")==false) {return;}
        alert( $("[name=itemRegForm]").serialize()  );

        $.ajax({
            // ----------------------------------------------------------
            // 서버쪽 호출 URL 주소 지정
            // ----------------------------------------------------------
            url       : "/itemRegProc.do"
            // ----------------------------------------------------------
            // form 태그 안의 입력양식 데이터 즉, 파라미터값을 보내는 방법 지정
            // ----------------------------------------------------------
            ,type     : "post"
            // **********************************************************
            // 파일업로드를 위한 설정.    
            // **********************************************************
            //-----------------------------------
            // 서버로 보내는 데이터에 파일이 있으므로
            // 전송하는 파라미터명, 파라미터값을 serialize를 하여 Query String으로 변경하지 않케 설정하기.
            // 서버로 보내는 데이터에 파일이 없으면  processData: false 을 생략한다.
            //-----------------------------------
            ,processData    :    false
            //-----------------------------------
            // 서버로 보내는 데이터에 파일이 있으므로
            // 현재 form 태그에 설정된 enctype 속성값을 Content-Type 으로 사용하도록 설정하기.
            // 이게 없으면 현재 form 태그에 설정된 enctype 속성값과 관계없이 무조건 enctype 이 application/x-www-form-urlencoded 로 설정된다.
            // 서버로 보내는 데이터에 파일이 없으면  ,contentType: false  을 생략한다.
            //-----------------------------------
            ,contentType    :    false
            //-----------------------------------
            // 서버로 보내는 데이터 설정하기.
            // 서버로 보내는 데이터에 파일이 있으므로 FormData 객체 설정.
            //-----------------------------------
            ,data           :    new FormData(  $("[name=itemRegForm").get(0)  )   // 커마부분 

            // 아래코드는 입력양식의 name 값과 value 값만 보내지는것. 위쪽 코드는 파일까지 되는 코드.   
            // ,data     : $("[name=boardRegForm]").serialize()
            // ----------------------------------------------------------
            // 서버의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
            // 익명함수의 매개변수에는 서버가 보내온 Map<String,String> 를 JSON 객체로 바뀌어 들어온다.
            // ----------------------------------------------------------
            ,success  : function(  ){
                alert("서버 접속 성공");
                                   
   
             }

            ,error : function( ){
                alert("서버 접속 실패");
             }


        });


        
    }     
    function zeroCut(){ 
        var inp = $(".stock_num").val();
        if( inp.length==0 ){  $(".stock_num").val( 0 );  }
        $(".stock_num").val( parseInt( $(".stock_num").val() ) ); 
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
  <br>
  <br>
  

<table align="right">
    <tr>
        <td><input type="button" value="등록취소" class="reg_cancel" onClick="item_reg_hide();">
        <td><input type="button" value="제품등록" class="reg_show" onClick="item_reg_show();">
            <input type="button" value="등록하기" class="item_reg" onClick="item_reg();">
        <td>&emsp;&emsp;<td>&emsp;&emsp;<td>&emsp;&emsp;<td>&emsp;&emsp;<td>&emsp;&emsp;<td>&emsp;&emsp;
    </tr>
</table>


<br><br>
<center>
<table border=1 width=1311px style="border-collapse: collapse;" class="searchWindow">
    <tr>
        <th>번호<th>사진<th>제품코드<th>제품명<th>브랜드<th class="bigDivisionTag">제품종류<th class="middleDivisionTag">세부분류<th class="smallDivisionTag">세부분류2
        <th>소비전력<th class="onlyInDel">제조일<th class="onlyInDel" style="width:90pt;">에너지소비등급
        <th class="onlyInDel">색상<th class="onlyInDel">사이즈<th class="onlyInDel">단종여부<th>수량
    </tr>
    <!-------------------------- 제품등록 누르면 나오는 화면 ------------------------------------------------------------->
    <form name="itemRegForm" method="POST" action="/itemRegProc.do" enctype="multipart/form-data">
    <tr class="onlyInDel">
        <th>&emsp;&emsp;&emsp;
        <th><input type="file" name="img" class="img" style="width:60pt;">
        <th><input type="text" name="item_code" class="item_code" style="width:60pt;">
        <th><input type="text" name="item_name" class="item_name" style="width:60pt;">
        <th><input type="text" name="brand" class="brand" style="width:60pt;">
        <th class="bigDivisionTag"><select name="bigDivision" class="bigDivision">
                                       <option>대분류</option>
                                       <option value="가전">가전</option>
                                       <option value="TV">TV</option>
                                       <option value="PC">PC</option>
                                       <option value="모바일">모바일</option>                                              
                                   </select>
        <!-- 세부분류 ------------------------------------------------------------------------------------->                           
        <th class="middleDivisionTag_G"><select name="middleDivision_G" class="middleDivision_G">
                                       <option>세부분류</option>
                                       <option value="계절가전">계절가전</option>
                                       <option value="주방가전">주방가전</option>
                                       <option value="생활가전">생활가전</option>                                              
                                   </select>
        <th class="middleDivisionTag_T"><select name="middleDivision_T" class="middleDivision_T">
                                       <option>세부분류</option>
                                       <option value="QLED">QLED</option>
                                       <option value="미니LED">미니LED</option>
                                       <option value="올레드">올레드</option>                                              
                                   </select>                                   
        <th class="middleDivisionTag_P"><select name="middleDivision_P" class="middleDivision_P">
                                       <option>세부분류</option>
                                       <option value="데스크탑">데스크탑</option>
                                       <option value="노트북">노트북</option>                                             
                                   </select>
        <th class="middleDivisionTag_M"><select name="middleDivision_M" class="middleDivision_M">
                                       <option>세부분류</option>
                                       <option value="휴대폰">휴대폰</option>
                                       <option value="태블릿">태블릿</option>                                             
                                   </select>                                                                       
         <th class="smallDivisionTag_G_season"><select name="smallDivision_G_season" class="smallDivision_G_season">
                                                   <option>세부분류2</option>
                                                   <option value="에어컨">에어컨</option>
                                                   <option value="공기청정기">공기청정기</option>
                                                   <option value="난방기기">난방기기</option>                                               
                                               </select> 
        <th class="smallDivisionTag_G_kitchen"><select name="smallDivision_G_kitchen" class="smallDivision_G_kitchen">
                                                   <option>세부분류2</option>
                                                   <option value="냉장고">냉장고</option>
                                                   <option value="전기밥솥">전기밥솥</option>
                                                   <option value="에어프라이어" style="width:50pt;">에어프라이어</option>                                               
                                               </select>        
        <th class="smallDivisionTag_G_life"><select name="smallDivision_G_life" class="smallDivision_G_life">
                                                   <option>세부분류2</option>
                                                   <option value="세탁기">세탁기</option>
                                                   <option value="건조기">건조기</option>
                                                   <option value="청소기">청소기</option>                                               
                                               </select> 
        <th class="smallDivisionTag_P_desk"><select name="smallDivision_P_desk" class="smallDivision_P_desk">
                                                   <option>세부분류2</option>
                                                   <option value="사무/인강">사무/인강</option>
                                                   <option value="게이밍">게이밍</option>                                             
                                               </select>                          
        <th class="smallDivisionTag_P_lap"><select name="smallDivision_P_lap" class="smallDivision_P_lap">
                                                   <option>세부분류2</option>
                                                   <option value="비즈니스">비즈니스</option>
                                                   <option value="게이밍">게이밍</option>                                             
                                               </select>               
        <!-- 세부분류 ------------------------------------------------------------------------------------->                                                   
        <th><input type="text" name="power_consum" class="power_consum" style="width:60pt;">
        <th><input type="text" name="build_day" class="build_day" style="width:60pt;">
        <th style="width:90pt;"><input type="text" name="energy_grade" class="energy_grade" style="width:60pt;">
        <th><input type="text" name="color" class="color" style="width:60pt;">
        <th><input type="text" name="whatsize" class="whatsize" style="width:60pt;">
        <th><select name="discontinued" class="discontinued" style="width:60pt;">
                <option>단종여부</option>
                <option value="Y">Y</option>
                <option value="N">N</option>                                             
            </select>  
        <th><input type="text" name="stock_num" class="stock_num" style="width:60pt;text-align:right;" numberOnly onChange="zeroCut();">
    </tr>
    </form>
    <!-------------------------- 제품등록 누르면 나오는 화면 ------------------------------------------------------------->    
    
        
</table>
</center>
</div>
    
</html>
