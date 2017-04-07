<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../commons/_head.jspf" %>
</head>
<body>
<%@ include file="../commons/_navi.jspf" %>

<c:choose>
<c:when test="${isUpdate}">
<c:set var="actionUrl" value="/boards/${board.num}/update" />
</c:when>
<c:otherwise>
<c:set var="actionUrl" value="/boards" />
</c:otherwise>
</c:choose>

	<div class="container">
		<form:form modelAttribute="board" cssClass="form-group" action="${actionUrl}" method="get">
  <div class="form-group">
    <label for="title">제목</label>
     <div class="form-group">
    	<form:input path="title" size="50"/>
    	<form:errors path="title" cssClass="error" />
    	</div>
  </div>
  <div class="form-group">
    <label for="userId">아이디</label>
     <div class="form-group">
    <form:input path="userId" value="${sessionScope.userId}" readonly="true" />
    	<form:errors path="userId" cssClass="error" />
    </div>
  </div>
   <div class="form-group">
  <label for="contents">내용</label>
  <div class="form-group">
  <form:textarea path="contents" rows="9" cols="80"/>
    	<form:errors path="contents" cssClass="error" />
  </div>
  </div>
   <div class="form-group">
  <button type="submit" class="btn btn-default">확인</button>
  <a class="btn btn-default" href="/boards/view" role="button">취소</a>
  </div>
</form:form>
	</div>


<%@ include file="../commons/_footer.jspf" %>
</body>
</html>