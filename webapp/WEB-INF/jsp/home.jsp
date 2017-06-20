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
                    	<h2>들어가기에 앞서</h2>
                        <p>저는 처음 배운 것은 숙달되게끔 반복하여 학습해야한다고 생각합니다. 이는 한 선생님을 만나며 영향을 받았는데 사람은 망각의 동물이라 잊어버리는 것이 당연해서 잊어버리지 않기 위해 반복 학습이 중요하다고 늘 말씀 하셨습니다. 그래서 학원에서 배운 것은 그날그날 구현해보며 매일매일 익숙해지도록 반복하며 제 것으로 만들기 위해 노력했습니다. 어느 정도 익숙해지면 그냥 지나쳤던 궁금했던 것들을 찾아 궁금증을 해소했습니다. 
                        <br>포트폴리오를 준비할 때는 대부분 검색을 통해서 새로운 기능들을 구현했는데 이해 못하는 부분은 일일이 타이핑해서 구현해 보고 그래도 이해가 안되는 부분들은 다시 검색을 통해 알아가며 이해를 도왔습니다. 글을 읽고 이해하는 것 보다 구현을 먼저 해보고 글을 읽는 것이 더욱더 이해하기 쉽기 때문에 이렇게 하고 있습니다. 그래도 이해 못하는 것은 좀 더 수준이 올라간 다음을 기약하며 넘어갔습니다.
                        <br>아쉬운 점은 포트폴리오를 준비하며 새로운 기능들을 반복학습하지 않고 너무 새로운 것만 추구했다는 점이지만 앞으로는 블로그에 그날그날 정리하며 올릴 것입니다.</p>
                        <h3>●과정</h3>
                        <ol>
                        	<li>내가 아는 한도에서 생각해보고 가정을 해본다.</li>
                        	<li>그 가정대로 구현해 본다.</li>
                        	<li>오류가 난다면 조금씩 다른 것을 시도해 본다.</li>
                        	<li>그래도 안되면 검색을 해본다.</li>
                        	<li>검색한 내용을 우선 내 식대로 생각해 본다.</li>
                        	<li>다시 1번부터 반복</li>
                        </ol>
                        <h3>●시작</h3>
                        <p>첫 포트폴리오 프로젝트를 만들기 시작한 것은 2016년 학원 교육이 끝나고 무엇을 해야할지 몰랐을 때 학원 선생님과의 대화로 시작하게 되었다.
                        <br>처음에는 내가 가진 기술로 무엇을 만들지 고민했다. ‘무엇을 만들어야 하나...?’ 이내 내가 할 수 있는 것만 해보기로 했다.
                        <br>그렇게 첫 포트폴리오 프로젝트를 만들었다. </p>
                        
                        <h3>●게시판</h3>
                        <p>달랑 게시판 하나뿐이었다. JSP교육 때 HTML의 TEXT와 TEXTAREA을 배웠기에 SPRING에서 배운  IBATIS 연동 후 HTML로 리스트를 뽑아 페이징 처리하는 것과 함께 응용해 보았다. 
                        <br>게시판 리스트는 TR, TD로 구현했고 DB테이블도 간단하게 만들었다. 구현하고 보니 TEXTAREA의 글이 줄바꿈 되지 않는 문제가 생겼는데 검색을 통해 간단히 해결하였다. 그리고 할 수 있는 한 가지 더, 로그인을 구현했다.
                        <br>이때의 나는 SPRING이란 SPRING TOOL SUITE로 만드는 것이 SPRING이라 생각하였다. 그래서 SPRING을 할 줄 안다고 생각했다.</p>
                        
                        <h3>●회원가입, 로그인, 로그아웃</h3>
                        <p>로그인을 구현하기 위해서는 회원가입이 먼저 되어야 하기 때문에 우선 회원가입을 구현했다. 회원정보에 주소란도 만들어 주소를 입력하게 만들었는데 구주소 excel파일을 db에 입력시켜 검색하는 방법으로 구현했다. 
                        이 외에도 아이디 검색과 같은 원리로 닉네임 검색 기능도 넣었다. 내가 알던 회원가입을 최대한 구현하기 위해 노력했다. 이때 당시에는 오픈소스를 사용하지 못할 때여서 하나하나 유효성 처리를 했었다. 로그인과 로그아웃은 구현하기 쉬웠다. 로그인을 해야지만 게시판 글쓰기가 가능하게 하였다. </p>
                        
                        <h3>●CSS</h3>
                        <p>막상 저렇게 구현해 놓고 보니 없어보였다. 그리고 내가 원하는 홈페이지의 모습도 아니었다. 그래서 내가 꾸며보기로 하고 CSS를 검색하여 익히기 시작했다. 
                        일단 따라해보며 결과물을 보고 이해하기 때문에 처음부터 차근차근 따라했다. 그리고 조금씩 이것저것 해보며 내가 원하는 디자인으로 바꿔갔다. 
                        <br>초반에는 링크로 연결하는 법을 몰라 head에 그대로 노출시켰었는데 어느 사이트에도 CSS가 보이지 않아 ‘이게맞나’ 싶었다. 후에 CSS파일을 따로 만들어 관리하는 것을 알고 따로 만들어 연결시켰다.
                        <br>CSS에 대해서는 대략적으로만 알고 있는데 CSS보다는 JAVA를 더 파고들고싶어서 자세하게 들어가진 않았다. 초기 포트폴리오 메인은 사진과 같다.
                        <br><img src="/stylesheets/image/main.jpg" onClick="window.open('/stylesheets/image/main.jpg')" style="cursor:hand" title="클릭시 원본파일을 보실 수 있습니다."></p>
                        
                        <h3>●JQUERY</h3>
                        <p>다음으로 진행한 것은 JQUERY다. JQUERY는 익혀두면 도움이 될것이라고 하기에 익히게 되었는데 JQUERY는 애니메이션 효과를 위해 존재하는지만 알고 딱 사진으로 보이듯 박스를 늘리고 줄어게들게만 구현했다. 
                        <br>그리곤 자랑스럽게 JQUERY를 할 줄 안다고 생각했다...
                        <br>후에 JAVASCRIPT와 비슷한 것을 알고 그때그때 상황에 필요한 것을 찾아 사용했다.</p>
                        
                        <h3>●게시판 답변과 댓글</h3>
                        <p>이렇게 구현하고 보니 확실히 이전보다 풍성해 지긴 했다. 하지만 내가 생각했던 게시판은 아니었다. 게시판이라 하면 당연히 답변과 댓글이 있어야하지 않는가. 그래서 답변과 댓글을 구현했다. 
                        답변을 먼저 구현했는데 생각 외로 어려웠다. 검색을 통해 본 글들을 이해 못하는 것이 컸다. 그러다 DB테이블 구조만 나온 글을 보았는데 구조만을 보고 추측하고 추측대로 구현해 보았다. 
                        구현은 성공적이었다. 내 힘으로 문제를 풀어갈 때의 짜릿함은 다른 즐거움을 선사했는데 이것이 프로그래밍의 매력이라 생각한다. 
                        <br>이때에 나는 DB와의 연동을 크게 생각하지 않았을 때여서 조금은 생각을 전환하는 계기가 되었다.
                        <br>댓글의 경우 답변의 구조와 비슷하여 크게 어려운 것은 없었으나 JAVASCRIPT로 댓글 입력폼을 나오게하는 것이 어려웠는데 원하는 곳에 나오게 하기위해 정말 여러 가지 시도해본 기억이 있다. 이 역시도 마지막은 성공하였는데 그 뿌듯함은 말로 표현할 수 없다.</p>
                        
                        <h3>●호스팅과 도메인</h3>
                        <p>초창기에는 호스팅이 무엇인지도 몰랐다. 어떻게 도메인을 사용할 지도 몰랐다. 어느 정도 검색을 통해 알아 본 뒤 무료도메인을 신청했다. 
                        내 컴퓨터에서 톰캣서버를 켜놓고 유동아이피를 확인하여 바뀔 때마다 도메인에 등록해서 사용하여서 어딜 가든 컴퓨터를 켜놓고 다녔었다. 
                        이게 몬가 싶어 호스팅에 대해서 알아보니 카페24와 같은 호스팅 업체에서 서버를 사야한다는 것을 알고는 호스팅에 꽂혔다. 
                        <br>본래 내 성격이 어떠한 한 가지에 꽂히면 다른 생각은 접어두고 끝까지 하는 성격이고 염원하던 나만의 홈페이지를 드디어 갖는다는 생각에 될 때까지 해보았다. 
                        리눅스 서버는 처음이라 생소했지만 새로운 세계를 알아가는 설렘으로 재밌었다. 그리고 카페24는 ftp를 이용하여 배포하기에 톰캣 실행과 정지 명령어만 알고 넘어갔다. 
                        기억에 남는 것은 카페24측의 실수로 그날 호스팅은 실패했지만 다음날 드디어 내 홈페이지를 갖게 되었다.
                        <br>도메인은 도메인을 구입한뒤 호스팅 네임서버와 연결하면 되었기에 크게 어려운 점은 없었다.</p>
                        
                        <h3>●MySql</h3>
                        <p>호스팅을 하기 전까지는 oracle db를 사용하였다. 지금까지 구현한 db테이블이 아까워서 그대로 사용하려고 했으나 로컬의 db이기 때문에 연결하려면 내 아이피를 연결해야 될것이라 생각하곤 호스팅 전과 다를 것이 없기에 다른 방법을 생각했다.
                        <br>oracle db를 구매하든지 호스팅 업체에서 제공하는 mysql을 사용할지 선택에 있어 mysql을 선택했다. mysql이 처음이라 막막하긴 했지만 다행히 oracle과 비슷하고 crud쿼리문만을 사용했기 때문에 크게 어려운 점은 없었다. </p>
                        
                        <h3>●게시판에 댓글에 개수 나타내기</h3>
                        <p>첫 포트폴리오 프로젝트를 제작할 때 가장 기억에 남는 것은 바로 이것이다. 무던히 많은 시도를 해보았기에 가장 기억에 남는다. CSS때의 이것저것과는 다르게 댓글의 개수를 나타내기위한 시도와 고민은 2~3일은 걸린 것 같다. 
                        될 것 같은 일말의 희망이 나를 끝까지 하게 했다. 지금에서야 생각하는 거지만 서브쿼리 보다는 db테이블에 컬럼을 하나 만들어 댓글이 추가할때마다 update쿼리를 날리는 것이 더 좋아보이긴 하다만....</p>
                        
                        <h3>●파일 업로드</h3>
                        <p>여기에 더해 파일 업로드까지 추가하기로 하였다. 어떻게 할지 고민하다가 배운 것을 활용하기로 했다. JAVA에서 FTP를 배웠기에 FTP를 이용하기로 했다. 호스팅으로 내 ftp 주소가 있기 때문에 ftp로 파일 업로드를 했다.</p>
                        <br>                        
                        <p>또 무엇이 있을까 찾아보다가 AJAX에 구미가 당겼다. 그래서 검색을 해보았지만 내가 이해할 수 있는 글이 없었다. 동영상을 보는게 더 이해를 돕기에 혹시나 하는 마음으로 유튜브에 검색을 하였는데 역시 유튜브 답게 많은 관련 동영상이 나왔다. 그 중 박재성님의 동영상 강의를 보았다.</p>
                        <br>
                        <h3>●자바지기 박재성님과의 만남</h3>
                        <p>박재성님의 채널에 가게 되면 AJAX는 spring-boot 동영상 강의중의 일부분이다. 이때의 나는 아주 기고만장할 때라 다른 것은 다 아니까 AJAX강의만 보면 된다고 생각해서 AJAX강의만 보았다. 
                        하지만 동영상을 보아도 이해가 가지 않았고 이전 강의들을 보지 않은 그 찝찝함은 spring-boot강의를 처음부터 정독하게 만들었다.
                        처음부터 본 것이 정말 행운이랄까? 어떻게 검색을 해야하고 처음 보는 오픈소스를 어떤 식을 접근을 해야하는지 얽매여있던 나를 일깨우고 웹프로그래머로서 한단계 더 내디딜수 있는 정말 귀중한 시간이었다. 
                        <br>spring-boot 강의만이 아니다. spring-boot강의를 보고 난뒤 나는 이제까지 굉장히 큰 착각속에 준비했다는 것을 알았다. 그리고 다른 강의들의 호기심도 있었고 그때부터 모든 강의를 보았다. 
                        이때도 매일매일 반복하면 내것으로 만들기 위해 노력했다. 이때부터 SPRING을 SPRING TOOL로 만드는 것이 아닌 것으로 인식하고 나는 한참이나 모자르다는 것을 깨달았다.</p>
                        
                        <h3>●BOOTSTRAP</h3>
                        <p>SPRING-BOOT강의를 통해 BOOTSTRAP을 처음 알게 되었다. 학원 교육 중에 잠깐 스쳐지나간 단어였는데 이런 것이 BOOTSTRAP인걸 알고는 반가웠다. 
                        더욱더 반가운 것은 CSS를 창조하지 않는 점이었다. 여기서 말하는 창조는 예를 들어 박스 하나를 만든다고 했을 때 색은 무슨색으로 할지 사이즈는 어떻게 해야할지 여백 등등에 대해 고민을 안해도 된다는 의미다. 
                        물론 내 기호에 맞게 디자인을 하려면 고민을 해야겠지만...</p>
                        
                        <h3>●JSP/SERVLET</h3>
                        <p>학원에서 배운 JSP를 재정립하고 새로운 것을 알게되는 시간이었다. 특히나 오픈소스의 활용과 SERVLET 그리고 리팩토링. 이중에 리팩토링은 오픈소스를 만드는 과정을 살짝 들여다본 느낌이었고 잘 짜여진 코드라는 인식을 갖게했다. </p>
                        
                        <h3>●SPRING</h3>
                        <p>지금껏 내가 알던 SPRING은 SPRING이 아니다를 절실히 깨닫게 해주는 시간이었다. SPRING LAGACY로 만드는 불필요한 라이브러리들이 즐비한 이전과는 다르게 MAVEN으로 하나하나 세팅하는 것과 spring은 이런 것이다를 알게 해주는 정말로 새로운 세계를 알게 해주는 시간이었다.</p>
                        
                        <h3>●아마존 웹 서비스</h3>
                        <p>SPRING-BOOT에서 다룬 내용인데 리눅스 서버를 좀 더 알아가는 시간이었다. 기억에 남는 건 1년간 무료 서비스를 받았는데 한달 씩 1년인줄 모르고 1달 넘게 나뒀다가 요금을 낸적이 있다. 다행히 AWS에서 이해를 해주고 결재금액을 다 돌려줌과 함께 따로 cash를 넣어주었다.</p>
                        
                         <h3>●TEST코드와 MyBatis 그리고 Transaction과 Mockito, db migration</h3>
                         <p>동영상 강의를 보고 난 후의 최대의 수혜는 JUNIT TEST코드다. 친구에게 오래된 노트북 하나를 얻게 되었는데 오래된 노트북이라 TOMCAT실행조차 오래 걸렸다. 다행히 TEST코드의 실행은 바로 되어서 노트북으로 많이 연습했다. 
                         <br>MyBatis의 경우 새로운 기능에 어떤 식으로 접근을 해야하는지 알게 해주는 강의였는데 이 강의로 조금 더 spring을 알게 되는 강의였다.
                         <br>Transaction과 Mockito의 경우는 좀 더 연습해서 구현해야 할 것이고 db migration의 경우는 좀 더 이해를 해야할 것 같아 아직 구현하지 않았다.</p>
                        
                        <h3>●현재의 포트폴리오</h3>
                        <p>동영상 강의를 다 보고나니 포트폴리오를 수정을 해야겠다는 생각을 하게되었다. bootstrap을 적용하기 위한 생각이기도 했지만 동영상 강의에서 배운 부분을 반복만 했지 따로 사용하지 않아 온전히 내 것이라고 하기엔 무리가 있어 배운 것을 활용하며 다시 만듬으로써 내 것이 되리라 생각해서 전면 다시 만들기로 하였다.
                        <br>지금의 포트폴리오에는 답변과 댓글 기능을 넣지 않은 대신 네이버 open api를 사용하기로 했다. 첫 포트폴리오에서도 AJAX전에 open api를 활용하려 했으나 이해가 가지 않아 다음으로 미뤘는데 지금의 나라면 가능할 것이라 생각해서 도전해 보았다. 
                        물론 온전히 내 힘으로 했다고는 말 못하나 github을 통해 다른사람의 코드를 볼 수 있고 전에는 몰랐던 것을 아는 시간이었다.
                        <br>이렇게 완성된 것이 지금의 포트폴리오다.</p>
                        
                        <p>앞으로는 블로그를 운영하며 다시 한번 JAVA와 JSP, SPRING을 정리하는 시간을 갖을 것이다.
                        <br>피라미드를 생각해 보자. 기초가 튼튼해야 나머지를 쌓아 올릴 수 있듯이 공부도 마찬가지라 생각한다.
                        <br>지금은 새로운 것을 추구하기 보다는 기초를 다시 한번 다져야하는 시기인것 같다.</p>
                        
                        <br>
                        <h2>프로젝트 설명</h2>
                        <p>이 프로젝트는 <strong>Java / JSP / Spring Framwork / Mybatis / Maven / Ajax / Naver Open API / BootStrap Template</strong>을 사용하였습니다.
                        <br>첫 포트폴리오 프로젝트는 ibatis 와 Spring Tool Suite Spring lagacy 프로젝트 설정 그대로 사용하였으나 정확하게 설명할 수 없어 처음부터 다시 시작하였습니다.
                        <br>모든 코드는 github에 저장되어 있으며 github링크는 화면 하단에 있습니다.</p>
                        <p>프로젝트 개발환경 : <strong>Spring Tool Suite 3.8.3.RELEASE / JDK 1.8 / Apache Tomcat 8.0 / h2 Database</strong>
                        <br>호스팅 : 카페24
                        <br>첫 프로젝트에서의 DB는 카페24에서 제공되는 MySql을 연동하여 사용하였으나 다시 준비하면서 테스트 하기 쉬운 h2 DB를 사용하게 되었습니다.</p>
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
                        
                        <h3>●회원탈퇴</h3>
                        <ol>
                        	<li>회원정보 페이지에 회원탈퇴 버튼이 있으며 버튼 클릭시 회원정보가 삭제됩니다.</li>
                        	<li>따로 탈퇴 확인페이지가 없으며 후에 문자열을 받거나 비밀번호를 다시 확인하는 방법을 적용시킬 예정입니다.</li>
                        	<li>SNS연동 가입자면 SNS_INFO DB테이블에 정보가 있는지 확인 후에 존재하면 같이 삭제됩니다.</li>
                        </ol>
                        
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
                        
                        <h3>●네이버 영화 검색</h3>
                        <ol>
                        	<li>화면 왼쪽 메뉴의 영화 검색 메뉴를 클릭하면 해당 페이지로 이동합니다.</li>
                        	<li>검색어를 입력하면 검색어가 포함된 제목들의 영화 정보가 개봉날짜 순으로 검색됩니다.</li>
                        	<li>이미지를 클릭했을시에 해당 영화의 네이버 영화페이지로 이동됩니다.</li>
                        	<li>네이버 영화 검색도 요청시 JSON형식으로 정보가 넘어오지만 파싱하지 않고 AJAX를 이용하여 페이지 바로 뿌려주는 방법으로 구현했습니다.</li>
                        	<li>AJAX구동은 scripts.js파일에 있습니다.</li>
                        </ol>
                        
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
