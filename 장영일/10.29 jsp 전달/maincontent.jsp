
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!-- ************************************************** -->
<!-- 현재 JSP 페이지에서 사용할 클래스의 패키지 수입하기 -->
<!-- ************************************************** -->
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ include file="../common.jsp"%>  



<!-- 풀캘린더 사용코드 복붙. -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script>
        function goBoardContentForm( b_no ){

            // alert("상세보기 화면 활성화 성공! PK 번호는 => " + b_no) // 테스트 확인용. PK 번호 확인. 
            
            // ---------------------------------------
            // name=boardContentForm 가진 form 태그 내부의 name=b_no 가진 입력 양식에  
            // 클릭한 행의 게시판 번호 저장하기
            // ---------------------------------------
            $("[name=boardContentForm] [name=b_no]").val(b_no) 
                // $("[name=boardContentForm]").find("[name=b_no]").val(b_no); // 위 코드와 같다.   
            // ---------------------------------------
            // name=boardContentForm 가진 form 태그 내부의 action 값의 URL 주소로 서버에 접속하기
            // 즉, 상세보기 화면으로 이동하기  
            // form 태그를 이용한 웹서버 접속 방법. POST 방식.
            // ---------------------------------------
            //alert( $("[name=boardContentForm] [name=b_no]").val() );
            document.boardContentForm.submit();
            
        }
</script>


<style>
/* body 스타일 */
html, body {
/* overflow: hidden; */
font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
padding-top: 1em;
padding-left: 1em;
padding-right: 1em;
}
</style>
<!-- 출처: https://nowonbun.tistory.com/368 [명월 일지] -->











<div class="content-container">
  <div class="content-container_calendar">


    
    <!-- <span class="caption"> 스케쥴 달력 </span> -->
    <span class="caption"> 지점 현황 </span>
    <div class="calendar-container">


  <!-- 풀캘린더 사용코드 복붙. -->
  <!-- 스케줄 삭제기능이 안됨. 구현해야함 -->
  <!-- calendar 태그 -->
  <!-- <div id='calendar-container'>
    <div id='calendar'></div>
    </div>
    <script>
    (function(){
    $(function(){
    // calendar element 취득
    var calendarEl = $('#calendar')[0];
    // full-calendar 생성하기
    var calendar = new FullCalendar.Calendar(calendarEl, {
    // height: '200px', // calendar 높이 설정
    width: '100px',
    expandRows: true, // 화면에 맞게 높이 재설정
    slotMinTime: '08:00', // Day 캘린더에서 시작 시간
    slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
    // 해더에 표시할 툴바
    headerToolbar: {
    left: 'prev,next today',
    center: 'title',
    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    },
    initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
    initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
    navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
    editable: true, // 수정 가능?
    selectable: true, // 달력 일자 드래그 설정가능
    nowIndicator: true, // 현재 시간 마크
    dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
    locale: 'ko', // 한국어 설정
    eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
    console.log(obj);
    },
    eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
    console.log(obj);
    },
    eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
    console.log(obj);
    },
    select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
    var title = prompt('Event Title:');
    if (title) {
    calendar.addEvent({
    title: title,
    start: arg.start,
    end: arg.end,
    allDay: arg.allDay
    })
    }
    calendar.unselect()
    }
    // 이벤트
    
    });
    // 캘린더 랜더링
    calendar.render();
    });
    })();
    </script> -->
    <!-- 출처: https://nowonbun.tistory.com/368 [명월 일지] -->

    


    <!-- ================================================================================================================================ -->
    <!-- 카카오 지도 테스트  -->
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d7ebcca28afd7b57341db73139c86da"></script> -->
    <div class="kako_map" id="map" style="width:100%;height:100%;"></div>  <!-- 지도가 나오는 div-->

    <br> 

    <!-- 지도정보 클릭하는 체크박스 -->
    <p>
        <input type="checkbox" id="chkUseDistrict" onclick="setOverlayMapTypeId()" /> 지적편집도 정보 보기
        <input type="checkbox" id="chkTerrain" onclick="setOverlayMapTypeId()" /> 지형정보 보기 
        <input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기       
    </p>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d7ebcca28afd7b57341db73139c86da"></script>
	<script>
		var container = document.getElementById('map');   // 지도를 표시할 div 
		var options = {
			center: new kakao.maps.LatLng(37.48572713809489, 126.88729893225243),  
			level: 6  // 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(container, options); // 지도를 생성합니다

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


        // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
        // map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    

        // 아래 코드는 위에서 추가한 교통정보 지도타입을 제거합니다
        // map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 



        // 지도 타입 정보를 가지고 있을 객체입니다
        // map.addOverlayMapTypeId 함수로 추가된 지도 타입은
        // 가장 나중에 추가된 지도 타입이 가장 앞에 표시됩니다
        // 이 예제에서는 지도 타입을 추가할 때 지적편집도, 지형정보, 교통정보, 자전거도로 정보 순으로 추가하므로
        // 자전거 도로 정보가 가장 앞에 표시됩니다
        var mapTypes = {
            terrain : kakao.maps.MapTypeId.TERRAIN,    
            traffic :  kakao.maps.MapTypeId.TRAFFIC,
            useDistrict : kakao.maps.MapTypeId.USE_DISTRICT
        };

        // 체크 박스를 선택하면 호출되는 함수입니다
        function setOverlayMapTypeId() {
            var chkTerrain = document.getElementById('chkTerrain'),  
                chkTraffic = document.getElementById('chkTraffic'),
                chkUseDistrict = document.getElementById('chkUseDistrict');
            
            // 지도 타입을 제거합니다
            for (var type in mapTypes) {
                map.removeOverlayMapTypeId(mapTypes[type]);    
            }

            // 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
            if (chkUseDistrict.checked) {
                map.addOverlayMapTypeId(mapTypes.useDistrict);    
            }
            
            // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
            if (chkTerrain.checked) {
                map.addOverlayMapTypeId(mapTypes.terrain);    
            }
            
            // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
            if (chkTraffic.checked) {
                map.addOverlayMapTypeId(mapTypes.traffic);    
            }

            
        }  


        // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
        var positions = [
            {
                content: '<div><br> &nbsp;&nbsp;&nbsp;A지점 <br><br> &nbsp;&nbsp;&nbsp; 총 재고 :  ${searchListAllCnt}  개  <br><br> </div>', 
                latlng: new kakao.maps.LatLng(37.48188590434773, 126.87975693151623)
            },
            {
                content: '<div>B지점</div>', 
                latlng: new kakao.maps.LatLng(37.494682426531234, 126.90517247819032)
            },
            {
                content: '<div>C지점</div>', 
                latlng: new kakao.maps.LatLng(37.47439325223621, 126.90869390935603)
            },
            {
                content: '<div>D지점</div>',
                latlng: new kakao.maps.LatLng(37.488081962559, 126.8662836296649)
            }
        ];

        for (var i = 0; i < positions.length; i ++) {
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng // 마커의 위치
            });

            // 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow = new kakao.maps.InfoWindow({
                content: positions[i].content // 인포윈도우에 표시할 내용
            });

            // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
            // 이벤트 리스너로는 클로저를 만들어 등록합니다 
            // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            // kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            // kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));


            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker); 
        }

      

        // // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        // function makeOverListener(map, marker, infowindow) {
        //     return function() {
        //         infowindow.open(map, marker);
        //     };
        // }

        // // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        // function makeOutListener(infowindow) {
        //     return function() {
        //         infowindow.close();
        //     };
        // }

        /* 아래와 같이도 할 수 있습니다 */
        /*
        for (var i = 0; i < positions.length; i ++) {
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng // 마커의 위치
            });

            // 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow = new kakao.maps.InfoWindow({
                content: positions[i].content // 인포윈도우에 표시할 내용
            });

            // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
            // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
            (function(marker, infowindow) {
                // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    infowindow.open(map, marker);
                });

                // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });
            })(marker, infowindow);
        }
        */

	</script>
    <!-- ================================================================================================================================ -->














    </div>
  </div>
  <div class="content-container_summary-infomation">
    <div class="summary-infomation_board">
      <span class="caption"> 게시판 </span>
      <div class="summary-infomation_board-container"> <!-- 주간 게시판 안쪽 시작 -->     
      <div style="height: 5px;"></div><span>&nbsp;</span>
      <font size="5">[${requestScope.weeklyBoardList.get(0).beforeSeven} ~ ${requestScope.weeklyBoardList.get(0).today}] 최근 7일간 최고 조회수 </font>
      <table class="tbcss0" cellpadding="4">
          <tr>
                <th>조회수 순위</th><th>제목</th><th>작성자</th><th>조회수</th><th>등록일</th>
          </tr>
      <c:forEach var="weeklyBoard" items="${requestScope.weeklyBoardList}" varStatus="loopTagStatus">
          <tr style='cursor: pointer;' onClick='goBoardContentForm("${weeklyBoard.b_no}")'>  
                <th>${loopTagStatus.index+1}</th>
                <th style="width:165pt;">${weeklyBoard.subject}</th>
                <th style="width:80pt;">${weeklyBoard.writer}</th>
                <th>${weeklyBoard.readcount}</th>
                <th style="width:80pt;">${weeklyBoard.reg_date}</th>         
          </tr>      
      </c:forEach> 
      </table>
      
      </div><!-- 주간 게시판 안쪽 끝 -->
    </div>
    <div class="summary-infomation_stock">
      <span class="caption"> 재고요약 </span> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                              &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;    
                                              <input type="button" name="staffSearchAll"value="1" onClick="">
                                              <input type="button" name="staffSearchAll"value="2" onClick="">
                                              <input type="button" name="staffSearchAll"value="3" onClick="">
                                              <input type="button" name="staffSearchAll"value="4" onClick="">
      <div class="summary-infomation_stock-container">
      <div style="height: 4px;"></div>
      <table class="buttonOneTable">
      
      
          <tr>
              <th>순위<th>가전<th>TV<th>PC<th>모바일             
          </tr>
          <tr>
              <th>1
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(0).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(5).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(10).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(15).item_code}        
          </tr>
          <tr>
              <th>2
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(1).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(6).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(11).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(16).item_code}        
          </tr>
          <tr>
              <th>3
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(2).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(7).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(12).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(17).item_code}        
          </tr> 
          <tr>
              <th>4
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(3).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(8).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(13).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(18).item_code}        
          </tr>
          <tr>
              <th>5
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(4).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(9).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(14).item_code}
              <th style="width:105pt;height:40;">${requestScope.bestItemByCategoryList.get(19).item_code}        
          </tr>             
      </table>     
      </div>
    </div>
  </div>
</div>


    <form name="boardContentForm" method="post" action="/${requestScope.naverPath}boardContentForm.do">
        <!-- ------------------------------------------------------ -->
        <!-- [클릭한 게시판 글의 고유번호]가 저장되는 [hidden 입력양식] 선언. -->
        <!-- ------------------------------------------------------ -->
        <input type="hidden" name="b_no">  
    
    </form>







