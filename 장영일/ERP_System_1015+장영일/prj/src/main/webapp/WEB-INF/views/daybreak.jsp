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
    <%@include file="./partails/header.jsp"%> <%@include file="./partails/maincontent.jsp"%>


  </body>
</html>
