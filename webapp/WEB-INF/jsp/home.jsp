<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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
                        	<li>hashmap으로 JSON정보를 가져와 저장할까 고민했지만 클래스로 받는것을 택하였습니다.</li>
                        	<li>네이버에서 아이디와 비밀번호를 제공해주지 않기 때문에 USERS DB테이블에는 아이디와 비밀번호는 저장되지 않습니다.</li>
                        	<li>USERS DB테이블에는 후에 spring-security를 적용하기 위해 권한 컬럼을 만들어 저장하게 하였습니다.</li>
                        	<li>관리자를 가입시키기 위해 admin아이디로 가입하게 되면 관리자 권한을 갖게 하였습니다.</li>
                        	<li>admin아이디를 초기화하지 않은 이유는 데이터 유실이 될 경우와 또는 spring-security 라이브러리에 있는 shaEncoder를 사용할때 초기 password로 로그인이 안되는 현상 때문입니다.</li>
                        	<li>shaEncoder로 복호화하여 로그인하는 방법을 생각했지만 테스트는 아직 하지 않았습니다.</li>
                        	<li>자체 회원가입 아이디는 로그인 할때 인증 클래스를 만들어 아이디와 비밀번호를 확인하는 방법을 선택했습니다.</li>
                        	<li>네이버 아이디 로그인시에는 네이버 로그인이 되어야만 정보를 가져올 수 있기 때문에 따로 확인을 하지 않아도 로그인이 가능합니다.</li>
                        	<li>모든 회원가입은 spring-jdbc 라이브러리의 JdbcDaoTemplate을 상속받은 UserDAO에서 기능을 수행합니다. 의도적이며 Jdbc로도 구현을 할 수 있다는것을 보여드리고 싶었습니다.</li>
                        	<li>테스트 프로젝트에 MyBatis와 연동한 mapper파일을 dao/users패키지에 포함시켰습니다. UserDAO를 MyBatis로 연동하면 바로 사용가능합니다.</li>
                        </ol>
                        <br>
                        <h3>●회원정보 수정</h3>
                        <ol>
                        	<li>화면 상단에 로그인시 메뉴가 바뀌며 Profile 버튼을 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>로그인을 해야만 session이 저장되기 때문에 저장된 session이 없으면 exception페이지로 이동합니다.(@PathVariable은 null값을 처리하지 않는다. RequestParam으로 처리하기보단 삭제를 택했다.)</li>
                        	<li>혹시 다른아이디를 주소에 입력하여 이동하고 수정을 요청하면 저장된 session값과 다를경우 exception페이지로 이동합니다.</li>
                        	<li>수정이 완료될 경우 session값이 바뀌기때문에 기존 session값을 지우고 수정된 값을 session에 저장합니다.</li>
                        	<li>기존 회원들의 정보를 수정할 때 아이디와 비밀번호가 꼭 필요하기때문에 hibernate validation을 살리기위해 SNS이용자와 분리하여 수정 요청 주소를 달리했습니다.</li>
                        	<li>네아로 연동 가입자는 아이디와 비밀번호가 없기때문에 아이디와 비밀번호는 수정할 수 없습니다.</li>
                        	<li>네이버 아이디에서 가져온 정보를 수정하더라도 네이버 프로필에는 적용되지 않습니다.</li>
                        </ol>
                        <br>
                        <h3>●회원탈퇴</h3>
                        <ol>
                        	<li>회원정보 페이지에 회원탈퇴 버튼이 있으며 버튼 클릭시 회원정보가 삭제됩니다.</li>
                        	<li>따로 탈퇴 확인페이지가 없으며 후에 문자열을 받거나 비밀번호를 다시 확인하는 방법을 적용시킬 예정입니다.</li>
                        	<li>SNS연동 가입자면 SNS_INFO DB테이블에 정보가 있는지 확인 후에 존재하면 같이 삭제됩니다.</li>
                        </ol>
                        <br>
                        <h3>●게시판</h3>
                        <ol>
                        	<li>화면 왼쪽 메뉴의 게시판 메뉴를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>페이징 확인용으로 10개 이상의 글을 입력시켰습니다. 순서는 최신글 순입니다.(날짜 오름차순)</li>
                        	<li>로그인을 하지 않았을 경우 글을 쓸 수 없습니다.</li>
                        	<li>제목을 클릭하면 내용을 확인 할 수 있는 상세페이지로 이동합니다.</li>
                        	<li>게시글을 쓴 이름과 로그인정보의 이름이 같으면 수정과 삭제가 가능합니다.</li>
                        	<li>후에 답글 기능을 추가하게 되면 게시글 번호와 매핑할 컬럼을 만들고 게시글 번호를 저장하고 게시글과 차이를 알 수 있는 컬럼을 만들어 원본 게시글과 차이를 두게합니다.</li>
                        	<li>게시글의 댓글은 AJAX로 구현할것이며 답글기능과 같습니다. 만약 댓글의 답글기능을 추가할 경우는 댓글 번호를 매핑할 컬럼을 하나 더 만듭니다.</li>
                        </ol>
                        <br>
                        <h3>●네이버 영화 검색</h3>
                        <ol>
                        	<li>화면 왼쪽 메뉴의 영화 검색 메뉴를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>검색어를 입력하면 검색어가 포함된 제목들의 영화 정보가 개봉날짜 순으로 검색됩니다.</li>
                        	<li>이미지를 클릭했을시에 해당 영화의 네이버 영화페이지로 이동됩니다.</li>
                        	<li>네이버 영화 검색도 요청시 JSON형식으로 정보가 넘어오지만 파싱하지 않고 AJAX를 이용하여 페이지 바로 뿌려주는 방법으로 구현했습니다.</li>
                        	<li>AJAX구동은 scripts.js파일에 있습니다.</li>
                        </ol>
                        <br>                        
                        <h3>●호스팅</h3>
                        <ol>
                        	<li>호스팅은 cafe24 Tomcat광호스팅을 사용하였습니다.</li>
                        	<li>STS에서 프로젝트 우클릭 후 Export를 클릭하여 war파일로 저장을 합니다.</li>
                        	<li>FTP프로그램을 이용하여 기본디렉토리 폴더명과 파일명을 같게 하여 파일을 업로드합니다.</li>
                        	<li>putty나 다른 프로그램으로 ssh로 접속 후 Tomcat서버가 실행이 되어있다면 정지를 시키고 다시 시작합니다.</li>
                        	<li>Tomcat을 실행하였다면 war파일이 알아서 풀리게 됩니다.</li>
                        	<li>도메인을 구매했기 때문에 구매한 도메인과 연결해 줍니다.</li>
                        	<li>aws서비스는 좀 더 알아봐야하겠습니다.</li>
                        </ol>
                        <br>                        
                        <h3>●SSL</h3>
                        <ol>
                        	<li>SSL의 자세한 설명은 <a href="https://wiki.kldp.org/HOWTO/html/SSL-Certificates-HOWTO/x70.html">여기</a>를 참고하시기를 바랍니다.</li>
                        	<li>SSL인증서는 COMODO에서 한달무료를 사용하였습니다.</li>
                        	<li>로컬 톰캣 서버에서는 java keytool과 톰캣 서버의 server.xml의 수정으로 포트번호 443 또는 8443으로 간편하게 테스트를 할 수 있습니다.</li>
                        	<li>하지만 cafe24에서는 사이트내에서 SSL인증서를 구매하거나 외부인증서일 경우 private key와 public키를 보내면 443포트가 아닌 임의의 포트로 된 주소를 받게됩니다.</li>
                        	<li>당연히 443포트로 접속이 가능할 줄 알았으나 임의의포트번호를 받게되었습니다. (웹호스팅업체 포트에 대해 공부)</li>
                        	<li>만약 443포트라면 프로젝트의 web.xml파일에 https설정을 추가하면 https로 접속하게됩니다. 또는 spring-security를 이용하여 https로 접속 가능합니다.(aws는 tomcat설정이 가능하기때문에 가능할듯)</li>
                        	<li>cafe24에서 server.xml수정을 지원하지 않기 때문에 임의의 포트번호의 주소로 리다이렉트를 사용하였습니다.</li>
                        	<li>Controller에서 url변경을하여 리다이렉트를 시도하였으나 실패하여 자바스크립트로 페이지 이동을 하였습니다.</li>
                        	<li>home리다이렉트가 아닐경우 http로 리다이렉트 되기 때문에 https주소를 추가하였습니다.</li>
                        </ol>
                        <br>     
                        <br>   
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
