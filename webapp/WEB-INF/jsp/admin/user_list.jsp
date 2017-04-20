<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

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
                            회원관리 <small>admin page</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-user"></i> admin
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
										<th>아이디</th><th>이름</th><th>이메일</th><th>권한</th><th>삭제</th>
									</tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${users}">
									<tr>
										<td>${user.userId}</td><td>${user.name}</td><td>${user.email}</td>
										<td>
										<form action="/admin/${user.userId}/authority" method="post">
										<select name="authority">
											<option value="ROLE_USER">사용자</option>
											<option value="ROLE_ADMIN">관리자</option>
										</select>
										<button type="submit" class="btn btn-default">수정</button>
										</form></td>
										<td><a class="btn btn-default" href="/admin/${user.userId}/delete" role="button">삭제</a></td>
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
