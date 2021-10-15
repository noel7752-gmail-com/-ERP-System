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



    <!-- 구글차트 예시 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages': ['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawMaterial);

      function drawMaterial() {
          var data = google.visualization.arrayToDataTable([
              ['City', '2020년 재고수량', '2021 재고수량'],
              ['계절가전', 8175, 8008],
              ['생활가전', 3792, 3694],
              ['PC', 2690, 2896],
              ['모바일기기', 3000, 3870],

          ]);

          var materialOptions = {
              chart: {
              title: '재고현황'
              },
              hAxis: {
              title: 'Total Population',
              minValue: 0,
              },
              vAxis: {
              title: 'City'
              },
              bars: 'horizontal',
              width:800,
              height:200
          };
          var materialChart = new google.charts.Bar(document.getElementById('chart_div2'));
          materialChart.draw(data, materialOptions);
          }
    </script>

    <script type="text/javascript">
    google.charts.load('current', {'packages':['table']});
    google.charts.setOnLoadCallback(drawTable);

    function drawTable() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('number', 'Salary');
    data.addColumn('boolean', 'Full Time Employee');
    data.addRows([
      ['Mike',  {v: 10000, f: '10,000 원'}, true],
      ['Jim',   {v:8000,   f: '8,000 원'},  false],
      ['Alice', {v: 12500, f: '12,500 원'}, true],
      ['Bob',   {v: 7000,  f: '7,000 원'},  true]
    ]);

    var table = new google.visualization.Table(document.getElementById('table_div'));

    table.draw(data, {showRowNumber: true, width: '50%', height: '20%'});
    }
    </script>

    <!--Load the AJAX API-->
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['총인원', 19],
          ['Zucchini', 10],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'구글차트 테스트 입니다!!!',
            'width':500,
            'height':400,
            'is3D': true,
            'slices': {  4: {offset: 0.2},
                          2: {offset: 0.3},
                      },
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

  </head>

  <body>
    <%@include file="./partails/header.jsp"%>
      <br>
      <br>

    <center>
      <!-- 구글차트 뿌려주는 div 태그 -->
      <!--Div that will hold the pie chart-->
      

      <br>

      

      <br>
      <br>
      <br>
      <br>

      <table>
        <tr>
          <td>
            <div id="table_div"></div>
          </td>
          <td>
            <div id="chart_div"></div> 
          </td>
          <td>
            <div id="chart_div2"></div>
          </td>
        </tr>
      </table>

    </center>

  </body>
</html>
