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
    <title>Day Break</title>
    
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
             $(".in_out_inputKeyword").val( parseInt( $(".in_out_inputKeyword").val() ) ); 
    }
    
    </script>

    
  </head>
  <body>
  <center>
    <%@include file="./partails/header.jsp"%>
    <br><br><br>

    <div>
        <table style="border-collapse:collapse;position:absolute;left:170px;border-bottom:1px solid" 
          cellpadding="10" frame=void>
            <tr><th style="font-size:3em;border-bottom:1px solid">가전
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;검색
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;입/출고관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;제품관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;불량/이월 관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;반품관리
            <tr><td style="align:left;cursor:pointer;">&emsp;&emsp;&emsp;통계       
        </table>
    </div>
    
    <input type="button" style="width:725pt;position:absolute;left:455px;" value="검색"></button>
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