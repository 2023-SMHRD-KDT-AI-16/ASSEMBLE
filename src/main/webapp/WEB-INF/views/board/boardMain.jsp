<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin Pro</title>
       <link href="resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
  
      <style>
      tbody tr:nth-child(odd) {
        background-color: lightgray;
      }
    </style>
  
    </head>
        <body class="nav-fixed">
        <jsp:include page="../common/header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <!-- Invoice-->
                        <div class="card invoice">
                            <div class="card-header p-4 p-md-5 border-bottom-0 bg-gradient-primary-to-secondary text-white-50">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-12 col-lg-auto mb-5 mb-lg-0 text-center text-lg-start">
                                        <!-- Invoice branding-->
                                        <img class="invoice-brand-img rounded-circle mb-4" src="resources/assets/img/demo/demo-logo.svg" alt="" />
                                        <div class="h2 text-white mb-0">게시판</div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-4 p-md-5">
                                <!-- Invoice table-->
                                <div class="table-responsive">
                                    <table class="table table-borderless mb-0">
                                        <thead class="border-bottom">
                                            <tr class="small text-uppercase text-muted">
                                                <th class="text-center" scope="col">No.</th>
                                                <th class="text-center" scope="col" style="width: 400px">제목</th>
                                                <th class="text-center" scope="col">작성자</th>
                                                <th class="text-center" scope="col">첨부파일</th>
                                                <th class="text-center" scope="col">조회수</th>
                                                <th class="text-center" scope="col">등록일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          	<c:forEach var="vo" items="${list}">
                                        <tr>
                                            <td class="text-center" scope="col">${vo.b_idx}</td>
                                            <td class="text-center" scope="col"  style="width: 400px"><a href="boardContent.do?b_idx=${vo.b_idx}"><c:out value="${vo.b_title}"></c:out></a></td>
                                            <td class="text-center" scope="col">${vo.user_id}</td>
                                            <td class="text-center" scope="col">${vo.b_file}</td>
                                            <td class="text-center" scope="col">${vo.b_views}</td>
                                            <td class="text-center" scope="col">${fn:split(vo.created_at, " ")[0]}</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer p-4 p-lg-5 border-top-0">
								<a class="btn btn-warning btn-sm" href="boardForm.do">글쓰기</a>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-end small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
