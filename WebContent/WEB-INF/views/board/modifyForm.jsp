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
        <div id="modifyForm">
          <form action="" method="post">
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
              <label class="form-text" for="txt-title">제목</label>
              <input type="text" id="txt-title" name="title" value="${readBoard.title}">
            </div>

            <!-- 내용 -->
            <div class="form-group">
              <textarea id="txt-content" name="content">${readBoard.content}</textarea>
            </div>

            <a id="btn_cancel" href="/mysite/board?action=list">취소</a>
            <input type="text" value="${readBoard.user_no}">
            <input type="text" value="${authUser.no}">
            <button id="btn_modify" type="submit">수정</button>
            <input type="hidden" name="action" value="modify">
            <input type="hidden" name="no" value="${readBoard.no}">

          </form>
          <!-- //form -->
        </div>
        <!-- //modifyForm -->
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