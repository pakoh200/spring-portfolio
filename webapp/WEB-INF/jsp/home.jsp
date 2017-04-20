<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="./commons/header.jspf" %>

</head>

<body>

    <div id="wrapper">

       <%@ include file="./commons/navigation.jspf" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Main <small>소개</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-home"></i> Main
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i>  <strong>환영합니다!</strong> 나날이 발전하고 있는 프로그래머 <strong>박호철</strong>입니다!
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-4">
                        <p>이 프로젝트는....<br>이프</p>
                        <p>이 프로젝트는....</p>
                        히히히
                        <ol>
                        	<li>하하하</li>
                        	<li>히히히</li>
                        	<li>호호호</li>
                        	<li>헤헤헤</li>
                        	<li>후후후</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <%@ include file="./commons/github.jspf" %>
                 <!-- /.github -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <%@ include file="./commons/footer.jspf" %>

</body>

</html>
