<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

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
                            회원정보 <small>Member Info</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-user"></i> Member Info
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-xs-4">
                    	<div class="thumbnail">
                    		<img src="/stylesheets/image/member.jpg" class="img-responsive" alt="Responsive image">
      						<div class="caption">
      							<p class="text-center">${user.name} 님</p>
      						</div>
    					</div>
                    </div>
                     <div class="col-xs-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="glyphicon glyphicon-user"></i> 회원정보</h3>
                            </div>
                            <div class="panel-body">
                            	<form:form modelAttribute="sns" cssClass="form-horizontal" action="/users/updateSnsUser" method="get">
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
  		<input type="hidden" name="id" value="${user.id}">
	 	<div class="form-group">
   			<div class="col-sm-offset-2 col-sm-10">
     			<button type="submit" class="btn btn-default">개인정보수정</button>
     			<a href="/users/${user.id}/delete" class="btn btn-default" role="button">회원탈퇴</a>
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
