<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../commons/_head.jspf" %>
</head>
<body>
<%@ include file="../commons/_navi.jspf" %>

	<div class="container">
		<div class="row">			
			<div class="col-md-8">
				<form class="form-inline" action="/boards/view">
				<label for="search">검색</label>
				<select class="form-control" name="skey">
  				<option value="title">제목</option>
  				<option value="userId">아이디</option>
				</select>
  				<div class="form-group">
  				  <input type="text" class="form-control" id="search" name="sval" placeholder="검색">
 				 </div>
 				 <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
				</form>
			</div>	
			<div class="col-md-2 col-md-offset-2">
				<a class="btn btn-default" href="/boards/form" role="button"><span class="glyphicon glyphicon-pencil"></span> 새 글 쓰기</a>
			</div>
		</div>
		<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">spring + mybatis 게시판</div>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th><th>제목</th><th>아이디</th><th>날짜</th><th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.num}</td><td><a href="/boards/${list.num}/detail">${list.title}</a></td><td>${list.userId}</td><td><fmt:formatDate value="${list.createDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td><td>${list.count}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav align="center">
				<ul class="pagination">
					<c:if test="${startPage>limit}">
					<li><a href="/boards/view?pageNum=${startPage-limt}${returnpage}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
					<c:when test="${i==pageNUM}">
						<li class="active"><a href=#>${i}</a></li>
					</c:when>					
					<c:otherwise>
						<li><a href="/boards/view?pageNum=${i}${returnpage}">${i}</a></li>
					</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPage<pageCount}">
					<li><a href="/boards/view?pageNum=${startPage+limt}${returnpage}" aria-label="Next"> <span	aria-hidden="true">&raquo;</span></a></li>
				</c:if>
				</ul>
			</nav>
			</div>
		</div>
	</div>

<%@ include file="../commons/_footer.jspf" %>
</body>
</html>