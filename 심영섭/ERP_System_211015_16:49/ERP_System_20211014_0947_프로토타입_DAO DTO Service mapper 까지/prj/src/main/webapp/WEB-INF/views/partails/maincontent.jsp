
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
    <span class="caption"> 스케쥴 달력 </span>
    <div class="calendar-container">


  <!-- 풀캘린더 사용코드 복붙. -->
  <!-- 스케줄 삭제기능이 안됨. 구현해야함 -->
  <!-- calendar 태그 -->
  <div id='calendar-container'>
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
    </script>
    <!-- 출처: https://nowonbun.tistory.com/368 [명월 일지] -->

    




    </div>
  </div>
  <div class="content-container_summary-infomation">
    <div class="summary-infomation_board">
      <span class="caption"> 게시판 </span>
      <div class="summary-infomation_board-container"></div>
    </div>
    <div class="summary-infomation_stock">
      <span class="caption"> 재고요약 </span>
      <div class="summary-infomation_stock-container"></div>
    </div>
  </div>
</div>
