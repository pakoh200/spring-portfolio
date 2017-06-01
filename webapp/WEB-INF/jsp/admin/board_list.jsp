<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>게시판 관리</title>
    <%@ include file="../commons/header.jspf" %>

</head>

<body>

    <div id="wrapper">

       <%@ include file="../commons/admin_navi.jspf" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            게시판 관리 <small>admin page</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-list-alt"></i> admin
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">
                        <div class="table-responsive">
							<div class="col-md-8">
								<form class="form-inline">
  				 					<label for="search">검색</label>
									<select class="form-control">
  										<option>제목</option>
  										<option>아이디</option>
									</select>
  									<div class="form-group">
  				 						<input type="text" class="form-control" id="search" placeholder="검색">
 									</div>
 									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
								</form>
							</div>	
							<!-- search -->
		
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
										<th></th><th>#</th><th>제목</th><th>아이디</th><th>날짜</th><th>조회수</th>
									</tr>
                                </thead>
                                <tbody>
                                <form action="/admin/delete">
                                <c:forEach var="list" items="${list}">
									<tr>
										<td><input type="checkbox" name="checkboxNum" value="${list.num}"></td>
										<td>${list.num}</td><td><a href="/boards/${list.num}/detail">${list.title}</a></td><td>${list.name}</td><td><fmt:formatDate value="${list.createDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td><td>${list.count}</td>
									</tr>
								</c:forEach>
                                </tbody>
                            </table>
								<input class="btn btn-default" type="submit" value="삭제">
								</form>
                    		<nav align="center">
								<ul class="pagination">
									<c:if test="${startPage>limit}">
									<li><a href="/admin/boards?pageNum=${startPage-limt}${returnpage}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
									<c:choose>
									<c:when test="${i==pageNUM}">
									<li class="active"><a href=#>${i}</a></li>
									</c:when>					
									<c:otherwise>
									<li><a href="/admin/boards?pageNum=${i}${returnpage}">${i}</a></li>
									</c:otherwise>
									</c:choose>
									</c:forEach>
									<c:if test="${endPage<pageCount}">
									<li><a href="/admin/boards?pageNum=${startPage+limt}${returnpage}" aria-label="Next"> <span	aria-hidden="true">&raquo;</span></a></li>
									</c:if>
								</ul>
							</nav>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                
                <%@ include file="../commons/github.jspf" %>
                 <!-- /.github -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <%@ include file="../commons/footer.jspf" %>

</body>

</html>
