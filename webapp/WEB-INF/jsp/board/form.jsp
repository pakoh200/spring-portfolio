<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <%@ include file="../commons/header.jspf" %>

</head>

<body>
	<c:choose>
	<c:when test="${isUpdate}">
	<c:set var="actionUrl" value="/boards/${board.num}/update" />
	</c:when>
	<c:otherwise>
	<c:set var="actionUrl" value="/boards" />
	</c:otherwise>
	</c:choose>

    <div id="wrapper">

        <%@ include file="../commons/navigation.jspf" %>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            게시판 <small>Board</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-list-alt"></i> Board
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                	<form:form modelAttribute="board" cssClass="form-group" action="${actionUrl}" method="get">
  						<div class="col-lg-12">
    						<label for="title">제목</label>
     						<div class="form-group">
    						<form:input path="title" size="50"/>
    						<form:errors path="title" cssClass="error" />
    						</div>
 					 	</div>
  						<div class="col-lg-12">
    						<label for="userId">이름</label>
     						<div class="form-group">
    						<form:input path="name" value="${sessionScope.user.name}" readonly="true" />
    						<form:errors path="name" cssClass="error" />
    						</div>
 						</div>
   						<div class="col-lg-12">
  							<label for="contents">내용</label>
  							<div class="form-group">
  							<form:textarea path="contents" rows="9" cols="80"/>
    						<form:errors path="contents" cssClass="error" />
  							</div>
  						</div>
   						<div class="col-lg-12">
  							<button type="submit" class="btn btn-default">확인</button>
  							<a class="btn btn-default" href="/boards/view" role="button">취소</a>
  						</div>
					</form:form>
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
