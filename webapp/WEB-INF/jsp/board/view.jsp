<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>게시판</title>
    <%@ include file="../commons/header.jspf" %>
	<script type="text/javascript">
		$(function(){
			$('#board').addClass('active');
		});
	</script>
</head>

<body>

    <div id="wrapper">

        <%@ include file="../commons/navigation.jspf" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            게시판 <small>Board</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-list-alt"></i> Board
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                	
                	<div class="panel-heading">spring + mybatis 게시판</div>
                	
                    <div class="col-lg-12">
                        <div class="table-responsive">
							<div class="col-md-8">
								<form class="form-inline" action="/boards/view">
									<label for="search">검색</label>
									<select class="form-control" name="skey">
  										<option value="title">제목</option>
  										<option value="name">이름</option>
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
							<!-- search -->
		
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
										<th width="7%">#</th><th width="50%">제목</th><th width="15%">아이디</th><th width="20%">날짜</th><th width="8%">조회수</th>
									</tr>
                                </thead>
                                <tbody>
                                <c:forEach var="list" items="${list}">
									<tr>
										<td>${list.num}</td><td><a href="/boards/${list.num}/detail">${list.title}</a>
										<c:if test="${list.countOfAnswer > 0 }">
										(+${list.countOfAnswer})
										</c:if>
										</td><td>${list.name}</td><td><fmt:formatDate value="${list.createDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td><td>${list.count}</td>
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
