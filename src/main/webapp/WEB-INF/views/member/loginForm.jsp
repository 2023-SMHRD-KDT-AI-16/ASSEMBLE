<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Login</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="resources/assets/img/favicon.png" rel="icon" />
    <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link
      href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
      rel="stylesheet"
    />
    <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="resources/assets/vendor/quill/quill.snow.css" rel="stylesheet" />
    <link href="resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
    <link href="resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="resources/assets/vendor/simple-datatables/style.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="resources/assets/css/style.css" rel="stylesheet" />
  
          <script type="text/javascript">
  
		  	$(document).ready(function(){
		  		if(${not empty msgType}){
		  			if(${msgType eq "실패 메세지"}){
		  				$("#messageType").attr("class", "modal-content panel-warning");
		  			}
		  			$("#myMessage").modal("show");
		  		}
		  	});
	  
	   </script>
  
  
  </head>

  <body style="background-image: url('/controller/resources/images/logopa1.png'); background-repeat: no-repeat; background-size: cover;">
    <main>
      <div class="container">
        <section
          class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4"
        >
          <div class="container">
            <div class="row justify-content-center">
              <div
                class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center"
              >
                <div class="d-flex justify-content-center py-4">
                    <a class="logo d-flex align-items-center w-auto" href="${contextPath}/" style="padding: 3px">
                        <img alt="logo" src="${contextPath}/resources/images/logo.png" style="height: 45px;">
                        <span class="d-none d-lg-block">SolarNamdo</span>
                    </a>
                </div>
                <!-- End Logo -->

                <div class="card mb-3">
                  <div class="card-body">
                    <div class="pt-4 pb-2">
                      <h5 class="card-title text-center pb-0 fs-4">회원 로그인</h5>
                    </div>

                    <form action="${contextPath}/login.do" method="post" class="row g-3 needs-validation" novalidate>
                      <div class="col-12">
                        <label class="form-label" for="yourUsername">아이디</label>
                        <input class="form-control" type="text" name="user_id" id="user_id" required placeholder="아이디를 입력해주세요."/>
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                      </div>

                      <div class="col-12">
                        <label class="form-label" for="yourPassword">비밀번호</label>
                        <input class="form-control" name="user_pw"  id="user_pw" type="password" required placeholder="비밀번호를 입력해주세요." />
                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                    </div>

                      <div class="col-12">
                        <button class="btn btn-pr w-100" type="submit">
                          로그인
                        </button>
                      </div>
                    </form>
                      <hr>
                      <div style="text-align: left;">
                      	<div class="small">
                         	* 아직회원이 아니신가요?
                            <a href="${contextPath}/join.do""><span class="btn btn-outline-primary btn-sm">회원가입</span></a>
                        </div>
                     </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </main>
    <!-- End #main -->

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
        <!-- 다이얼로그창(모달) -->
	<!-- 회원가입 실패시 나오게될 모달창 -->
	<!-- Modal -->
	  <div class="modal fade" id="myMessage" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div id="messageType" class="modal-content panel-info">
	        <div class="modal-header panel-heading">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">${msgType}</h4>
	        </div>
	        <div class="modal-body">
	          <p id="">${msg}</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	
	
	
	<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div id="checkType" class="modal-content panel-info">
	        <div class="modal-header panel-heading">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">메세지 확인</h4>
	        </div>
	        <div class="modal-body">
	          <p id="checkMessage"></p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
    
  </body>
</html>
