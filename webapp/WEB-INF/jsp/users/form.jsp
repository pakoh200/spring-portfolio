<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
 <%@ include file="../commons/_head.jspf" %>
  </head>
  <body>
 <%@ include file="../commons/_navi.jspf" %>
<div class="container">
	<div class="page-header">
		<c:choose>
		<c:when test="${isUpdate}">
		<c:set var="pageName" value="개인정보수정" />
		</c:when>
		<c:otherwise>
		<c:set var="pageName" value="회원가입" />
		</c:otherwise>
		</c:choose>
		<h1>${pageName}</h1>
	</div>
	
	<c:choose>
		<c:when test="${isUpdate}">
		<c:set var="method" value="put" />
		</c:when>
		<c:otherwise>
		<c:set var="method" value="post" />
		</c:otherwise>
		</c:choose>
	
	<form:form modelAttribute="user" cssClass="form-horizontal" action="/users" method="${method}">
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
	 	<div class="form-group">
   			<div class="col-sm-offset-2 col-sm-10">
     			<button type="submit" class="btn btn-default">${pageName}</button>
   			</div>
  		</div>
	</form:form>
</div>
   <%@ include file="../commons/_footer.jspf" %>
  </body>
</html>