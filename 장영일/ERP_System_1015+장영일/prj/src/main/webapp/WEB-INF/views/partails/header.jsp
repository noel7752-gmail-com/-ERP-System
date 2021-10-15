<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="header">
  <div class="header-container">
    <div class="header-container_box">
      <div class="header-container_box-logo">
        <img src="/resources/img/Logo.png" />
      </div>
      <div class="header-container_box_serach-box">
        <input type="text" name="keyword" placeholder="통합검색(제품코드/제품이름)" />
        <span><i class="fas fa-search fa-2x"></i></span>
      </div>
      <div class="header-container_box_hellp-call">
        <select>
          <option value="고객센터">고객센터</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
        </select>
      </div>
      <div>
        <span>로그아웃<i class="fas fa-sign-in-alt fa-lg"></i></span>
        <br>
        <br>
        <select>
          <option value="고객센터">----지점----</option>
          <option value="A" selected>A지점</option>
          <option value="B">B지점</option>
        </select>
      </div>
    </div>
    <div class="header-container_categories">
      <span onclick="goHome();"><i class="fas fa-home fa-2x"></i></span>
      <span onclick="goSearchAll();">통합검색</span><span onclick="goSstock_management();">재고관리</span><span onclick="goBoard();">게시판</span><span onclick="goStatistics();">통계</span>
    </div>
  </div>
</header>
