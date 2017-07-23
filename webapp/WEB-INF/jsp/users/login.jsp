<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>로그인페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="/stylesheets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/stylesheets/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/stylesheets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

	<form:form modelAttribute="authenticate" cssClass="form-signin" action="/users/login" method="post">
        <h2 class="form-signin-heading">로그인</h2>
        <label for="inputUserId" class="sr-only">아이디</label>
        	<input type="text" id="userId" name="userId" class="form-control" placeholder="ID" required autofocus>
        	<form:errors path="userId" cssClass="error"/>
        <label for="inputPassword" class="sr-only">비밀번호</label>
        	<input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        	<form:errors path="password" cssClass="error"/>
  		<c:if test="${not empty errorMessage}">
		<div class="alert alert-danger" role="alert">
  			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
 			<span class="sr-only">Error:</span>
  				${errorMessage}
		</div>
		</c:if>
        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
        <a href="/users/naverLogin"><img src="/stylesheets/image/naver_login_Green.PNG" width="300" height="55"></a>
        <a href="/users/googleLogin"><img src="/stylesheets/image/google_signin_light.png" width="300" height="55"></a>
      <div class="form-signin" align="center">
      <span class="col-sm-4"><a href="/users/form">회원가입</a></span><span class="col-sm-6 col-sm-offset-2"></span>
      </div>
      </form:form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/stylesheets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
