<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>board_main</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

<!-- Vendor CSS Files -->
<!-- <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet"> 이부분이 다른 부트스트랩 css랑 충돌이 나는거 같음 일단 꺼놈.-->  
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
   rel="stylesheet">
<link href="resources/assets/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="resources/assets/vendor/quill/quill.snow.css"
   rel="stylesheet">
<link href="resources/assets/vendor/quill/quill.bubble.css"
   rel="stylesheet">
<link href="resources/assets/vendor/remixicon/remixicon.css"
   rel="stylesheet">
<link href="resources/assets/vendor/simple-datatables/style.css"
   rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/style.css" rel="stylesheet">
</head>

<body>
   <div class="container">
      <jsp:include page="../common/header.jsp"></jsp:include>
      
      
      <div class="panel panel-default">
      
      <main id="main" class="main">
         <section class="section">
            <div class="row">
               <div class="col-lg-12">

                  <div class="card">
                     <div class="card-body">
                        <h5 class="card-title">게시판</h5>

                        <!-- Table with stripped rows -->
                        <table class="table datatable">
                           <thead>
                              <tr>
                                 <th>No.</th>
                                 <th>제목</th>
                                 <th>작성자</th>
                                 <th>첨부파일</th>
                                 <th>조회수</th>
                                 <th>등록일</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="vo" items="${list}">
                                 <tr>
                                    <td>${vo.b_idx}</td>
                                    <td style="width: 400px"><a
                                       href="boardContent.do?b_idx=${vo.b_idx}"><c:out
                                             value="${vo.b_title}"></c:out></a></td>
                                    <td>${vo.user_id}</td>
                                    <td>${vo.b_file}</td>
                                    <td>${vo.b_views}</td>
                                    <td>${fn:split(vo.created_at, " ")[0]}</td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                        <!-- End Table with stripped rows -->
						<a class="btn btn-warning btn-sm" style="align-content : center;" href="boardForm.do">글쓰기</a>
						
                     </div>
                  </div>
               </div>
            </div>
         </section>

      </main>
      </div>
      <!-- End #main -->
   </div>
   <a href="#"
      class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

   <!-- Vendor JS Files -->
   <script src="resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
   <script
      src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="resources/assets/vendor/chart.js/chart.umd.js"></script>
   <script src="resources/assets/vendor/echarts/echarts.min.js"></script>
   <script src="resources/assets/vendor/quill/quill.js"></script>
   <script
      src="resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
   <script src="resources/assets/vendor/tinymce/tinymce.min.js"></script>
   <script src="resources/assets/vendor/php-email-form/validate.js"></script>

   <!-- Template Main JS File -->
   <script src="resources/assets/js/main.js"></script>
   
   <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   
</body>

</html>