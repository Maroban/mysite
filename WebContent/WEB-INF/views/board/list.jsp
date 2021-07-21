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
          <div id="list">
            <form action="" method="get">
              <div class="form-group text-right">
                <input type="hidden" name="action" value="list">
                <input type="text" name="keyword" value="">
                <button type="submit" id=btn_search>검색</button>

              </div>
            </form>

            <table>
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>조회수</th>
                  <th>작성일</th>
                  <th>관리</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${boardList}" var="bList" varStatus="status">
                  <tr>
                    <td>${bList.rownum}</td>
                    <td class="text-left"><a href="/mysite/board?action=read&no=${bList.no}">${bList.title}</a></td>
                    <td>${bList.name}</td>
                    <td>${bList.hit}</td>
                    <td>${bList.reg_date}</td>
                    <td><a href="/mysite/board?action=delete&no=${bList.no}">
                        <c:choose>
                          <c:when test="${authUser.no == bList.user_no}">[삭제]</c:when>

                          <c:otherwise></c:otherwise>

                        </c:choose>
                      </a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

            <div id="paging">
              <ul>
                <li><a href="">◀</a></li>
                <li><a href="">1</a></li>
                <li><a href="">2</a></li>
                <li><a href="">3</a></li>
                <li><a href="">4</a></li>
                <li class="active"><a href="">5</a></li>
                <li><a href="">6</a></li>
                <li><a href="">7</a></li>
                <li><a href="">8</a></li>
                <li><a href="">9</a></li>
                <li><a href="">10</a></li>
                <li><a href="">▶</a></li>
              </ul>


              <div class="clear"></div>
            </div>
            <c:choose>
              <c:when test="${authUser != null}">
                <a id="btn_write" href="/mysite/board?action=writeForm">글쓰기</a>
              </c:when>

              <c:otherwise></c:otherwise>

            </c:choose>


          </div>
          <!-- //list -->
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
