<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../commons/_head.jspf" %>
</head>
<body>
<%@ include file="../commons/_navi.jspf" %>

	<div class="container">
  <div class="form-group">
    <label for="title">제목</label>
     <div class="form-group">
        <input type="text" class="form-control" id="exampleInputTitle" name="title" value="${board.title}" readonly>
    	</div>
  </div>
  <div class="form-group">
    <label for="userId">아이디</label>
     <div class="form-group">
      <input type="text" class="form-control" id="exampleInputName" name="userId" value="${board.userId}" readonly>
    </div>
  </div>
   <div class="form-group">
  <label for="contents">내용</label>
  <div class="form-group">
  <textarea class="form-control" rows="9" name="contents" readonly>${board.contents}</textarea>
  </div>
  </div>
   <div class="form-group">
   <c:choose>
   <c:when test="${board.userId eq sessionScope.userId}">
  <a class="btn btn-default" href="/boards/view" role="button">목록</a>
   <a class="btn btn-default" href="/boards/${board.num}/form" role="button">수정</a>
  <a class="btn btn-default" href="/boards/${board.num}/delete" role="button">삭제</a>
   </c:when>
   <c:otherwise>
  <a class="btn btn-default" href="/boards/view" role="button">목록</a>
   </c:otherwise>
   </c:choose>
  </div>

	</div>


<%@ include file="../commons/_footer.jspf" %>
</body>
</html>