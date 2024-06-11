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
<script type="text/javascript">
// 게시글 삭제 기능
function goDelete(b_idx){
	  $.ajax({
			url : "board/"+b_idx,
			type : "delete",
			success : function() {
	            window.location.href = "boardList.do";
	        },
			error : function(){ alert("error"); }
	  });
}
</script>

</head>

<body>
   <div class="container">
      <jsp:include page="../common/header.jsp"></jsp:include>
      
      
      <div class="panel panel-default">
      
      <main id="main" class="main">
          <div class="pagetitle">
		      <h1>게시판</h1>
		  </div>
         <section class="section">
            <div class="row">
               <div class="col-lg-12">

                  <div class="card">
					<div class="card-header">
		                <h5 class="card-title">${vo.b_title}</h5>
		                <nav style="--bs-breadcrumb-divider: '|';">
			                <ol class="breadcrumb">
			                  <li class="breadcrumb-item active"><i class="ri-account-circle-line" style="font-size:15px;"></i>${vo.user_id}</a></li>
			                  <li class="breadcrumb-item active">${vo.created_at}</li>
			                  <li class="breadcrumb-item active">조회수 ${vo.b_views}</li> 
			                </ol>
		                </nav>
					</div>
					
					<div class="card-body">
						<div class="form-floating mb-3">
			                <label for="floatingTextarea">${fn:replace(vo.b_content, line, "<br>")}</label>
		           		</div>
                     
			 			  <!-- 버 튼 -->
			            <div class="text-center">
				              <a href="boardList.do"  class="btn btn-info">돌아가기</a>
			              <c:if test="${mvo.user_id eq vo.user_id}">
							  <a href="boardUdateForm.do?b_idx=${vo.b_idx}" class="btn btn-success">수정하기</a>
							  <button class="btn btn-warning" type="button" onclick="goDelete(${vo.b_idx})">삭제</button>
					      </c:if>
			            </div>
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