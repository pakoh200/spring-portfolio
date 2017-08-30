<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>게시판 보기</title>
	<script type="text/javascript" src="/stylesheets/js/jquery.js"></script>
	<link rel="stylesheet" href="/stylesheets/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
	<script src="/stylesheets/daumeditor/js/editor_loader.js?environment=development" type="text/javascript" charset="utf-8"></script>
	<script src="/stylesheets/js/daumeditor.js?ver=2"></script>
    <%@ include file="../commons/header.jspf" %>
    <script type="text/javascript">
		$(function(){
			$('#board').addClass('active');
		});
	</script>
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
 						댓글 수 : ${board.countOfAnswer}
 						<article class="answer-template">
 						<c:forEach var="listAnswer" items="${listAnswer}">
 						<article class="answer-article" id="answer-article">
 							<div class="panel panel-default">
  								<div class="panel-heading">
    								<h3 class="panel-title">작성자: ${listAnswer.writer}</h3>
    								<span><fmt:formatDate value="${listAnswer.createDate}" pattern="yyyy.MM.dd HH:mm:ss"/></span>
    								<span>
    								
    								<a class="answer-delete" href="/answer/${listAnswer.id}">삭제</a>
    								</span>
 								</div>
  								<div class="panel-body">
    								${listAnswer.contents}
  								</div>
							</div>
 						</article>
 						</c:forEach>
 						</article>
 						</div>
 						<c:if test="${answer.contents ne null}">
 						</c:if>
 						
 						<c:choose>
 						<c:when test="${sessionScope.user.name ne null}">
 						<!-- answer ajax를 이용하여 댓글 추가하기 댓글 나오는 폼 만들기-->
 						<form class="write-answer" id="form-group" action="/answer" method="get">
   						<div class="col-lg-12">
  							<label for="contents">댓글</label>
  							<div class="form-group">
     							<div id="editor_frame"></div>
     							<input type="hidden" name="writer" value="${sessionScope.user.name}">
     							<input type="hidden" name="boardId" value="${board.num}">
     							<textarea id="sample_contents_source" style="display:none;">
								</textarea>
    							<form:errors path="contents" cssClass="error" />
  							</div>
  						</div>
   						<div class="col-md-2 col-md-offset-10">
  							<button type="submit" id="save_button" class="btn btn-default">댓글등록</button>
  						</div>
					</form>
               		<!-- /.answer -->
 						</c:when>
 						<c:otherwise>
 						<div class="col-lg-12">
 							<div class="bg-info">
 								<a href="/users/login/form">로그인</a>을 해야 댓글을 작성할 수 있습니다.
  							</div>
 						</div>
 						</c:otherwise>
 						</c:choose>				
 						<br>
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
