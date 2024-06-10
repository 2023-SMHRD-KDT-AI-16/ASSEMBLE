<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("line", "\n");%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <title>게시글상세</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/favicon.png" rel="icon">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

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

  <main id="main" class="main">

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
		                <textarea class="form-control" readonly="readonly" id="floatingTextarea" style="resize:none; height: 100px;"></textarea>
		                <label for="floatingTextarea">${fn:replace(vo.b_content, line, "<br>")}</label>
		            </div>
		        </div>
          </div>
                     		 <!-- 버 튼 -->
              <div class="text-center">
	              <a href="boardList.do"  class="btn btn-info">돌아가기</a>
				  <a href="boardUdateForm.do?b_idx=${vo.b_idx}" class="btn btn-success">수정하기</a>
				  <button class="btn btn-warning" type="button" onclick="goDelete(${vo.b_idx})">삭제</button>
              </div>
          <!-- End Card with header and footer -->
		</div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      <strong><span>SolarNamdo</span></strong>
    </div>

  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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

</body>

</html>