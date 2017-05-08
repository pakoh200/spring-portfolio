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
                        <br>첫 포트폴리오 프로젝트는 ibatis 와 Spring Tool Suite Spring lagacy 프로젝트 설정 그대로 사용하였으나 정확하게 설명할 수 없어 처음부터 다시 시작하였습니다.
                        <br>모든 코드는 github에 저장되어 있으며 github링크는 화면 하단에 있습니다.</p>
                        <p>프로젝트 개발환경 : <strong>Spring Tool Suite 3.8.3.RELEASE / JDK 1.8 / Apache Tomcat 8.0 / h2 Database</strong>
                        <br>호스팅 : 카페24
                        <br>첫 프로젝트에서의 DB는 카페24에서 제공되는 MySql을 연동하여 사용하였으나 다시 준비하면서 테스트 하기 쉬운 h2 DB를 사용하게 되었습니다.</p>
                        <h2>프로젝트 설명</h2>
                        <h3>●로그인과 회원가입</h3>
                        <ol>
                        	<li>화면 상단에 로그인과 회원가입 버튼이 있으며 클릭했을 시에 해당 페이지로 이동합니다.</li>
                        	<li>각각의 페이지에 네이버 아이디와 연동하여 로그인이 가능합니다.</li>
                        	<li>기본 회원가입시에는 USERS DB테이블에 저장이 되며 네이버 아이디로 연동시에는 USERS DB테이블과 SNS_INFO DB테이블에 저장이 됩니다.
                        	SNS_INFO DB테이블의 ID값은 USERS의 외래키(FOREIGN KEY)를 갖습니다.(좀더공부해야함)</li>
                        	<li>USERS 클래스의 필드명에 null값을 받지 않기 위해 hibernate validator의 @NotEmpty 어노테이션을 사용하였지만 DB테이블에는 네이버 정보를 저장할때 
                        	아이디와 비밀번호의 정보가 없기때문에 null값을 저장 가능하게 하였습니다.</li>
                        	<li>SNS_INFO DB테이블에는 가입확인을 위한 고유식별 ID와 후에 구글 아이디 연동등에 확장하기 위한 소셜 이름 그리고 이름만을 저장합니다.</li>
                        	<li>네이버 회원정보는 JSON형식으로 넘어오기 때문에 파싱 후에 DB에 저장하였습니다.</li>
                        	<li>hashmap으로 JSON정보를 저장할까 고민했지만 클래스로 받는것을 택하였습니다.</li>
                        	<li>네이버에서 아이디와 비밀번호를 제공해주지 않기 때문에 USERS DB테이블에는 아이디와 비밀번호는 저장되지 않습니다.</li>
                        	<li>USERS DB테이블에는 후에 spring-security를 적용하기 위해 권한 컬럼을 만들어 저장하게 하였습니다.</li>
                        	<li>관리자를 가입시키기 위해 admin아이디로 가입하게 되면 관리자 권한을 갖게 하였습니다.</li>
                        	<li>admin아이디를 초기화하지 않은 이유는 데이터 유실이 될 경우와 또는 spring-security 라이브러리에 있는 shaEncoder를 사용할때 초기 password로 로그인이 안되는 현상 때문이고 복호화 테스트는 아직 하지 않았습니다.</li>
                        	<li>자체 회원가입 아이디는 로그인 할때 인증 클래스를 만들어 아이디와 비밀번호를 확인하는 방법을 선택했습니다.</li>
                        	<li>네이버 아이디 로그인시에는 네이버 로그인이 되어야만 정보를 가져올 수 있기 때문에 따로 확인을 하지 않아도 로그인이 가능합니다.</li>
                        	<li>모든 회원가입은 spring-jdbc 라이브러리의 JdbcDaoTemplate을 상속받은 UserDAO에서 기능을 수행합니다. 의도적이며 Jdbc로도 구현을 할 수 있다는것을 보여드리고 싶었습니다.</li>
                        	<li>테스트 프로젝트에 MyBatis와 연동한 mapper파일을 dao/users패키지에 포함시켰습니다. UserDAO를 MyBatis로 연동하면 바로 사용가능합니다.</li>
                        </ol>
                        <br>
                        <h3>회원정보 수정</h3>
                        <ol>
                        	<li>화면 상단에 로그인시 메뉴가 바뀌며 Profile 또는 왼쪽 메뉴에 회원정보를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>로그인을 해야만 session이 저장되기 때문에 저장된 session이 없으면 exception페이지로 이동합니다.</li>
                        	<li>혹시 다른아이디를 수정페이지에 접속하여 수정을 요청하면 저장된 session값이 다를경우 exception페이지로 이동합니다.</li>
                        	<li>네아로 연동 가입자는 아이디와 비밀번호가 없기때문에 아이디와 비밀번호는 수정할 수 없습니다.</li>
                        	<li>네이버 아이디에서 가져온 정보를 수정하더라도 네이버 프로필에는 적용되지 않습니다.</li>
                        </ol>
                        <br>
                        <h3>게시판</h3>
                        <ol>
                        	<li>화면 왼쪽 메뉴의 영화 검색 메뉴를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>검색어를 입력하면 검색어가 포함된 제목들의 영화 정보가 개봉날짜 순으로 검색됩니다.</li>
                        	<li>이미지를 클릭했을시에 해당 영화의 네이버 영화페이지로 이동됩니다.</li>
                        	<li>네이버 영화 검색도 요청시 JSON형식으로 정보가 넘어오지만 파싱하지 않고 AJAX를 이용하여 페이지 바로 뿌려주는 방법으로 구현했습니다.
                        	<br>이는 db에 저장하지 않기때문에 굳이 파싱을 하지않고 화면에 나타내기만 하면되지 JSON으로 충분히 가능하다고 판단했기 때문에 AJAX를 이용하였습니다.</li>
                        </ol>
                        <br>
                        <h3>네이버 영화 검색</h3>
                        <ol>
                        	<li>화면 왼쪽 메뉴의 영화 검색 메뉴를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>검색어를 입력하면 검색어가 포함된 제목들의 영화 정보가 개봉날짜 순으로 검색됩니다.</li>
                        	<li>이미지를 클릭했을시에 해당 영화의 네이버 영화페이지로 이동됩니다.</li>
                        	<li>네이버 영화 검색도 요청시 JSON형식으로 정보가 넘어오지만 파싱하지 않고 AJAX를 이용하여 페이지 바로 뿌려주는 방법으로 구현했습니다.
                        	<br>이는 db에 저장하지 않기때문에 굳이 파싱을 하지않고 화면에 나타내기만 하면되지 JSON으로 충분히 가능하다고 판단했기 때문에 AJAX를 이용하였습니다.</li>
                        </ol>
                        <br>                        
                        <h3>관리자페이지</h3>
                        <ol>
                        	<li>화면 왼쪽 메뉴의 영화 검색 메뉴를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>검색어를 입력하면 검색어가 포함된 제목들의 영화 정보가 개봉날짜 순으로 검색됩니다.</li>
                        	<li>이미지를 클릭했을시에 해당 영화의 네이버 영화페이지로 이동됩니다.</li>
                        	<li>네이버 영화 검색도 요청시 JSON형식으로 정보가 넘어오지만 파싱하지 않고 AJAX를 이용하여 페이지 바로 뿌려주는 방법으로 구현했습니다.
                        	<br>이는 db에 저장하지 않기때문에 굳이 파싱을 하지않고 화면에 나타내기만 하면되지 JSON으로 충분히 가능하다고 판단했기 때문에 AJAX를 이용하였습니다.</li>
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
