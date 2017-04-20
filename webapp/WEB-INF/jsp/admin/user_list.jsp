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
