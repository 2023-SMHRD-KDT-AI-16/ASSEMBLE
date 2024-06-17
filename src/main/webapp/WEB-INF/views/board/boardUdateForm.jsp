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

<title>SolarNamdo</title>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

  <script type="text/javascript">
  
  function is_checked() {  //공지글 체크여부
	  const checkbox = document.getElementById('gridCheck');
	  var is_checked = checkbox.checked;
		if(is_checked==true){
			is_checked=1; // 공지글
		}else{
			is_checked=0;
		}
	  //결과출력
	  console.log(is_checked);
	}
  
  $(document).ready(function(){
      $('#editorForm').on('submit', function(e){
          e.preventDefault();
          var content = tinymce.get('editorForm').getContent();
          console.log(content);
      });
  });
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
					<div class="card-body">
						<form action="boardUpdate.do" method="post" class="row g-3" id="#editorForm" enctype="multipart/form-data">
						<input type="hidden" name="b_idx" value="${vo.b_idx}">
							<div class="col-md-12" style="display: none;"><!-- 관리자에게만 노출될수 있도록 -->
			                	<label class="form-check-label" for="gridCheck">공지글
								   <input class="form-check-input" type='checkbox' id='gridCheck' onclick='is_checked()'name="checkbox"> 
								</label>
			                </div>
			                
							<div class="col-md-12">
			                  <label for="inputName5" class="card-title">제목</label>
			                  <input type="text" required="required" value="${vo.b_title}" class="form-control" id="inputName5" name="b_title">
			                </div>
			                
							<div class="col-12">
                   				 <div class="form-label">
                       				 <h5 class="card-title">내용</h5>        
                  
	                                <!-- TinyMCE Editor -->
		                            <textarea class="tinymce-editor" required="required" name="b_content" style="resize: none;">
		                            ${vo.b_content}</textarea><!-- End TinyMCE Editor -->
			                  
			                     </div>          
			                </div>
                     
			         		 <!-- 버 튼 -->
			                 <div class="text-center">
				                  <a href="boardList.do"  class="btn btn-success">돌아가기</a>
				                  <button type="submit" class="btn btn-pr">등록</button>
				                  <button type="reset" class="btn btn-secondary" id="fclear">취소</button>
			                </div>
			              </form>
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
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="resources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="resources/assets/vendor/quill/quill.js"></script>
  <script src="resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
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