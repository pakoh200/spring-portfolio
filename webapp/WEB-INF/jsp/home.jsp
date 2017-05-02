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
                    <div class="col-lg-12">
                        <p>이 프로젝트는 <strong>Java / JSP / Spring Framwork / Mybatis / Maven / Ajax / Naver Open API / BootStrap Template</strong>을 사용하였습니다.
                        <br>첫 포트폴리오 프로젝트는 ibatis 와 Spring Tool Suite Spring lagacy 프로젝트 설정 그대로 사용하였으나 처음부터 다시 시작하였습니다.
                        <br>모든 코드는 github에 저장되어 있으며 github링크는 화면 하단에 있습니다.</p>
                        <p>프로젝트 개발환경 : <strong>Spring Tool Suite 3.8.3.RELEASE / JDK 1.8 / Apache Tomcat 8.0 / h2 Database</strong>
                        <br>호스팅 : 카페24
                        <br>첫 프로젝트에서의 DB는 카페24에서 제공되는 MySql을 연동하여 사용하였으나 다시 준비하면서 테스트 하기 쉬운 h2 DB를 사용하게 되었습니다.
                        <br>보여주기 프로젝트인 만큼 향후 발전을 하게되면 db는 변경할 것입니다.</p>
                        <p>프로젝트 설명</p>
                        <h3>로그인과 회원가입</h3>
                        <ol>
                        	<li>화면 상단에 로그인과 회원가입 버튼이 있으며 클릭했을 시에 해당 페이지로 이동합니다.</li>
                        	<li>각각의 페이지에 네이버 아이디와 연동하여 로그인이 가능합니다.</li>
                        	<li>기본 회원가입시에는 USERS db테이블에 저장이 되며 네이버 아이디로 연동시에는 USERS db테이블과 SNS_INFO db테이블에 저장이 됩니다.
                        	SNS_INFO db테이블의 id값은 USERS의 외래키(FOREIGN KEY)를 갖습니다.</li>
                        	<li>SNS_INFO db테이블에는 가입확인을 위한 고유식별 id와 후에 구글 아이디 연동등에 확장하기 위한 소셜 이름 그리고 이름만을 저장합니다.</li>
                        	<li>네이버 회원정보는 JSON형식으로 넘어오기 때문에 파싱 후에 db에 저장하였습니다.</li>
                        	<li>네이버에서 아이디와 비밀번호를 제공해주지 않기 때문에 USERS db테이블에는 아이디와 비밀번호는 저장되지 않습니다.</li>
                        	<li>USERS db테이블에는 후에 spring-security도 적용을 위한 권한 컬럼을 만들어 저장가능하게 하였습니다.</li>
                        	<li>자체 회원가입 아이디는 로그인 할때 인증 클래스를 만들어 아이디와 비밀번호를 확인하는 방법을 선택했습니다.</li>
                        	<li>네이버 아이디 로그인시에는 네이버 로그인이 되어야만 정보를 가져올 수 있기 때문에 따로 확인을 하지 않아도 로그인이 가능합니다.</li>
                        </ol>
                        
                        <h3>로그인과 회원가입</h3>
                        <ol>
                        	<li>화면 상단에 로그인과 회원가입 버튼이 있으며 클릭했을 시에 해당 페이지로 이동합니다.</li>
                        	<li>각각의 페이지에 네이버 아이디와 연동하여 가입과 로그인이 가능합니다.</li>
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
