<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mysite/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">

</head>


<body>
  <div id="wrap">

    <c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

    <div id="container" class="clearfix">

      <c:import url="/WEB-INF/views/includes/aside.jsp"></c:import>

      <div id="content">

        <div id="content-head">
          <h3>게시판</h3>
          <div id="location">
            <ul>
              <li>홈</li>
              <li>게시판</li>
              <li class="last">일반게시판</li>
            </ul>
          </div>
          <div class="clear"></div>
        </div>
        <!-- //content-head -->

        <div id="board">
          <div id="read">
            <form action="#" method="get">
              <!-- 작성자 -->
              <div class="form-group">
                <span class="form-text">작성자</span>
                <span class="form-value">${readBoard.name}</span>
              </div>

              <!-- 조회수 -->
              <div class="form-group">
                <span class="form-text">조회수</span>
                <span class="form-value">${readBoard.hit}</span>
              </div>

              <!-- 작성일 -->
              <div class="form-group">
                <span class="form-text">작성일</span>
                <span class="form-value">${readBoard.reg_date}</span>
              </div>

              <!-- 제목 -->
              <div class="form-group">
                <span class="form-text">제 목</span>
                <span class="form-value">${readBoard.title}</span>
              </div>

              <!-- 내용 -->
              <div id="txt-content">
                <span class="form-value">${readBoard.content}</span>
              </div>

              <c:choose>
                <c:when test="${readBoard.user_no == authUser.no}">
                  <a id="btn_modify" href="/mysite/board?action=modifyForm&no=${readBoard.no}">수정</a>
                </c:when>

              </c:choose>

              <a id="btn_modify" href="/mysite/board?action=list">목록</a>

            </form>
            <!-- //form -->
          </div>
          <!-- //read -->
        </div>
        <!-- //board -->
      </div>
      <!-- //content  -->

    </div>
    <!-- //container  -->

    <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

  </div>
  <!-- //wrap -->

</body>

</html>
