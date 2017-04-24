<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="../commons/header.jspf" %>
    <script type="text/javascript" src="/stylesheets/js/jquery.js"></script>
    <script src="/stylesheets/js/scripts.js"></script>

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
                            네이버 오픈 API 영화 검색 <small>Search Movie</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="glyphicon glyphicon-search"></i> Search Movie
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                <div class="col-md-8">
                	<form class="form-inline" id="form" action="/api/movie" method="get">
						<div class="form-group">
 	   						<label for="exampleInputName2">영화 제목</label>
    						<input type="text" class="form-control" id="exampleInputName2" name="title" placeholder="제목">
						</div>
						<input type="submit" class="btn btn-default" value="검색">
					</form>
				</div>
                
                     <div class="col-xs-18 col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="glyphicon glyphicon-film"></i> 영화 검색</h3>
                            </div>
                            <div class="panel-body">
                            	
                            </div>
                        </div>
                        
                        
                    <nav align="center">
						<ul class="pagination" id="search_pagination">
						
						</ul>
					</nav>
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
