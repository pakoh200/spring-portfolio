<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>관리자 페이지</title>
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
                            관리자 페이지 <small>admin page</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-wrench"></i> admin
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">
                        <p>관리자 페이지입니다. 관리자 권한이 아닐경우 Exception페이지로 이동합니다.
                        <br>현재는 누구나 접근이 가능하게 Exception처리는 주석처리하였습니다. spring-security를 적용하면 Exception페이지와는 다른 denied페이지로 이동 될 것입니다.</p>
                        <br>
                        <h3>회원 관리</h3>
                        <ol>
                        	<li>왼쪽 메뉴에서 회원 관리를 클릭시 해당 페이지로 이동합니다.</li>
                        	<li>모든 회원리스트가 나오며 관리자권한을 가진 관리자만 권한을 변경할 수 있고 회원을 삭제 가능합니다.</li>
                        </ol>
                        <br>
                        <h3>게시판 관리</h3>
                        <ol>
                        	<li>왼쪽 메뉴에서 게시판 관리를 클릭시 해당 페이지로 이동합니다.</li>
                        	<li>기존 게시판과는 다르게 게시글 앞에 체크박스가 나타납니다.</li>
                        	<li>다중 체크가 가능하며 관리자권한을 가진 관리자만 삭제 가능합니다.</li>
                        	<li>게시판 고유번호를 배열로 받아 for문으로 삭제하게 하였습니다.</li>
                        </ol>
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
