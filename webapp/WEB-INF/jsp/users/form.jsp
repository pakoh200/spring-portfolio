<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>회원가입</title>
    <%@ include file="../commons/header.jspf" %>

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
                            회원가입 <small>Member Sign Up</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-edit"></i> Member Sign Up
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                     <div class="col-xs-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="glyphicon glyphicon-edit"></i> 회원가입</h3>
                            </div>
                            <div class="panel-body">
                            	<form:form modelAttribute="user" cssClass="form-horizontal" action="/users" method="post">
		<c:if test="${not empty errorMessage}">
		<div class="alert alert-danger" role="alert">
  			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
 			<span class="sr-only">Error:</span>
  				${errorMessage}
		</div>
		</c:if>
		<div class="form-group">
    		<label for="userId" class="col-sm-2 control-label">User Id</label>
    		<div class="col-sm-6">
    			<form:input path="userId"/>
    			<form:errors path="userId" cssClass="error"/>
    		</div>
  		</div>
 		<div class="form-group">
    		<label for="Password" class="col-sm-2 control-label">Password</label>
    		<div class="col-sm-6">
    			<form:password path="password"/>
    			<form:errors path="password" cssClass="error"/>
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="Name" class="col-sm-2 control-label">Name</label>
    		<div class="col-sm-6">
    			<form:input path="name"/>
    			<form:errors path="name" cssClass="error"/>
    		</div>
  		</div>
  		<div class="form-group">
    		<label for="Email" class="col-sm-2 control-label">Email</label>
    		<div class="col-sm-6">
    			<form:input path="email"/>
    			<form:errors path="email" cssClass="error"/>
    		</div>
  		</div>
  		<input type="hidden" name="authority" value="ROLE_USER">
	 	<div class="form-group">
   			<div class="col-sm-offset-2 col-sm-10">
     			<button type="submit" class="btn btn-default">회원가입</button><br>
     			<a href="/users/naverLogin"><img src="/stylesheets/image/naver_login_Green.PNG" width="160"></a>
     			<a href="/users/googleLogin"><img src="/stylesheets/image/google_signin_light.png" width="160"></a>
   			</div>
  		</div>
	</form:form>
                            </div>
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
