<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>게시판 보기</title>
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
                            게시판 보기 <small>Board Read</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-eye-open"></i> Board Read
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                	
  						<div class="col-lg-12">
    						<label for="title">제목</label>
     						<div class="form-group">
        						<input type="text" class="form-control" id="exampleInputTitle" name="title" value="${board.title}" readonly>
    						</div>
 						</div>
 						<div class="col-lg-12">
    						<label for="userId">아이디</label>
     						<div class="form-group">
      							<input type="text" class="form-control" id="exampleInputName" name="userId" value="${board.name}" readonly>
    						</div>
  						</div>
   						<div class="col-lg-12">
  							<label for="contents">내용</label>
  							<div class="form-group">
  								<div class="well" style="line-height:2.8em; width:100%;">
  								${board.contents}
  								</div>
  							</div>
 						</div>
   						<div class="col-lg-12">
   							<c:choose>
   							<c:when test="${board.name eq sessionScope.user.name}">
  							<a class="btn btn-default" href="/boards/view" role="button">목록</a>
   							<a class="btn btn-default" href="/boards/${board.num}/form" role="button">수정</a>
  							<a class="btn btn-default" href="/boards/${board.num}/delete" role="button">삭제</a>
   							</c:when>
  							<c:otherwise>
  							<a class="btn btn-default" href="/boards/view" role="button">목록</a>
  							</c:otherwise>
  							</c:choose>
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
