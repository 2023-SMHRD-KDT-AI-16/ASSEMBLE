<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Users / Profile - NiceAdmin Bootstrap Template</title>
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  	  <!--우편번호 daum_API-->
      function sample6_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample6_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample6_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode;
                  document.getElementById("sample6_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample6_detailAddress").focus();
              }
          }).open();
      }
  </script>


  <script>

  
  	$(document).ready(function(){
  		if(${not empty msgType}){
  			
  			$("#myMessage").modal("show");
  		}
  			
  		
  		// 2번탭 클릭시 데이터가 있으면 수정하기 
  		
  		 $('#menu2Tab').on('click', function() {
  	         
  			 var plant = "${plant}";
  			 
  		    if (plant === "" || plant === null) {
  		        alert("플랜트정보가 없습니다.");
  		    } else {
  		        alert("플랜트정보가 있습니다."); 
  		    } 	  			 
  			 			 
  	     });
		 
  	});
  	
  	function chooseImage(obj){
  	  console.log("chooseImage function called");
      $('#user_profile').click();
      
  		let reader = new FileReader();
  		reader.onload = function (e){ 
  		  // 콜백함수를 등록 readAsDataURL 끝나면 다음 함수를 실행해라 !
  		  	   // console.log(e);
  		       $('#imagePreview').attr("src",e.target.result);
  		       $('#imageTemp').attr("src",e.target.result);
  		    }
  		 reader.readAsDataURL(obj.files[0]); // 파일 읽기 시작
  	}
  	
  	function validateForm() {
  	    var fileInput = document.getElementById('user_profile');
  	    if (fileInput.files.length === 0) {
  	        alert('파일을 선택해주세요.');
  	        return false;
  	    }
  	    return true;
  	}
  	

  	
    var tempPw = "${mvo.user_pw}";
  	
  	function changePassword() {
        
        var currentPassword = $('#currentPassword').val();
        var newPassword = $('#newPassword').val();
        var renewPassword = $('#renewPassword').val();
	       
        if (!newPassword || !renewPassword) {
            alert('비밀번호를 입력해주세요.');
            return;
        }     
        
        if (tempPw !== currentPassword) {
            alert('현재 비밀번호가 일치하지 않습니다.');
            return;
        }
                	
        if (newPassword !== renewPassword) {
            alert('바꿀 비밀번호 확인이 일치하지 않습니다.');
            return;
        }

        $.ajax({
       	    url: 'pwChange.do', // 서버의 비밀번호 변경 엔드포인트
       	    method: 'POST',
       	    data: { user_pw : newPassword },
       	    success: function() {
       	       alert("비밀번호 변경 성공");
       	       $('#currentPassword').val('');
       	       $('#newPassword').val('');
       	       $('#renewPassword').val('');
       	       tempPw = newPassword;
       	    },
       	    error: function() {
       	    	alert("에러"); 	        
       	    }
       	});
                 
    }
  	
  	var user_id = "${mvo.user_id}";
  	function goProDel(user_id){
  		console.log("goProDel function called");
  	  $.ajax({
  			url : "goProDel.do",
  			method: 'POST',
  			data : {"user_id" : user_id},
  			type : "delete",
  			success : function() {
  	            window.location.href = "updateMain.do";
  	        },
  			error : function(){ alert("error"); }
  	  });
  }
  	
</script>

</head>

<body>
<div class="container">
	 <jsp:include page="../common/head2.jsp"></jsp:include>
  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Profile</h1>
    </div><!-- End Page Title -->
    <section class="section profile">
     <div class="row">

	  <form action="profileUpdate.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="col-xl-4">
		
          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
            	<div class="panel-body" id="view" align="center">
	
					<c:choose>
						<c:when test="${not empty mvo.user_profile}">
							<img style="width: 100px; height: 100px; border-radius: 50%;" id="imageTemp" alt="Profile" 
								src="${pageContext.request.contextPath}/resources/images/${mvo.user_profile }">
						</c:when>
						<c:otherwise>
							<img style="width: 100px; height: 100px; border-radius: 50%;" id="imagePreview" alt="Profile" 
								src="${contextPath}/resources/images/person.png">
						</c:otherwise>
					</c:choose>
					<div class="col-md-8 col-lg-9">
                        <div class="pt-2">
                          <button class="btn btn-pr btn-sm" title="Upload new profile image" type="submit">
                          	<i class="bi bi-upload" onclick="chooseImage()"></i><input style="display: none;" type="file" class="form-control" id="user_profile" name="user_profile">
                          </button>
                          <a class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash" onclick="goProDel(${mvo.user_id })"></i></a>
                        </div>
                    </div>
	 				<h3>[ ${mvo.user_id } ]</h3>
				</div>
          
             </div>
           </div>
        </div>
      </form>  
        
        

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">개인정보수정</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호 변경</button>
                </li>
                
                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#plant_info">발전소등록</button>
                </li>
              </ul>
              
              
                       
                <div class="tab-pane fade show active profile-overview" id="plant_info">
					<main id="main" class="main">
						<c:choose>
							<c:when test="${empty plant}">

								<section class="section">

									<div class="row" style="justify-content: center">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-heading">
												</div>
												<div class="panel-body">
													<form action="plantInsert.do" id="plantForm">
														<div class="form-group">
															<label for="inputText" class="col-sm-2 control-label">발전소명</label>
															<div class="col-lg-12">
																<input type="text" class="form-control" id="inputText" name="plant_name" required>
															</div>
														</div>

														<div class="form-group">
															<label for="inputText" class="col-sm-2 control-label">주소</label>
															<div class="col-lg-12">
																<div
																	style="position: relative; display: flex; padding-left: 0;">
																	<input type="text" class="form-control"
																		id="sample6_postcode" name="region" placeholder="우편번호">
																	<input type="button" class="btn btn-primary btn-sm"
																		onclick="sample6_execDaumPostcode()"
																		style="position: absolute; right: 5px; top: 5px; bottom: 5px;"
																		value="우편번호 찾기">
																</div>
																<br>
																<div style="margin-bottom: 10px;">
																	<input type="text" class="form-control"
																		id="sample6_address" placeholder="주소" required name="plant_addr"><br>
																	<input type="text" class="form-control"
																		id="sample6_detailAddress" placeholder="상세주소" name="plant_addr_add">
																</div>
																<div>
																	<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
																</div>
																<br>
															</div>
														</div>

														<div class="form-group">
															<label for="inputPassword" class="col-sm-2 control-label">전화번호</label>
															<div class="col-lg-12">
																<input type="text" class="form-control"
																	id="inputPassword" name="plant_tel" required>
															</div>
														</div>

														<div class="form-group">
															<label for="inputNumber" class="col-sm-2 control-label">면적</label>
															<div class="col-lg-12">
																<div class="input-group" style="width: 70%;">
																	<input type="number" class="form-control" name="plant_are" required> <span class="input-group-addon" style="font-size: large;">㎡</span>
																</div>
															</div>
														</div>

														<div class="form-group">
															<label for="inputNumber" class="col-sm-2 control-label">용량</label>
															<div class="col-lg-12">
																<div class="input-group" style="width: 70%;">
																	<input type="number" class="form-control"
																		name="plant_volume" required> <span
																		class="input-group-addon" style="font-size: large;">kW</span>
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10 text-center">
																<br>
																<button type="submit" class="btn btn-primary">등록</button>
																<button type="reset" class="btn btn-default">취소</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</section>
							</c:when>
							<c:otherwise>
       
       						<section class="section">
					        	<div class="row" style="justify-content: center">
										<div class="col-lg-12">
											<div class="panel panel-default">
												<div class="panel-body">
													<form action="plantUpdate.do" id="plantForm">
														<div class="form-group">
															<label for="inputText" class="col-sm-2 control-label">발전소이름</label>
															<div class="col-lg-12">
																<input type="text" class="form-control" id="inputText"
																	name="plant_name" required value="${plant.plant_name }">
															</div>
														</div>

														<div class="form-group">
															<label for="inputText" class="col-sm-2 control-label">주소</label>
															<div class="col-lg-12">
																<div
																	style="position: relative; display: flex; padding-left: 0;">
																	<input type="text" class="form-control"
																		id="sample6_postcode" name="region" placeholder="우편번호" value="${plant.region }" required>
																	<input type="button" class="btn btn-pr btn-sm"
																		onclick="sample6_execDaumPostcode()"
																		style="position: absolute; right: 5px; top: 5px; bottom: 5px;"
																		value="우편번호 찾기">
																</div>
																<br>
																<div style="margin-bottom: 10px;">
																	<input type="text" class="form-control"
																		id="sample6_address" placeholder="주소" required name="plant_addr" value="${plant.plant_addr }"><br>
																	<input type="text" class="form-control"
																		id="sample6_detailAddress" placeholder="상세주소" name="plant_addr_add" value="${plant.plant_addr_add }">
																</div>
																<div>
																	<input type="hidden" id="sample6_extraAddress" name="plant_idx" value="${plant.plant_idx }">
																</div>
																<br>
															</div>
														</div>

														<div class="form-group">
															<label for="inputPassword" class="col-sm-2 control-label">전화번호</label>
															<div class="col-lg-12">
																<input type="text" class="form-control"
																	id="inputPassword" name="plant_tel" required value="${plant.plant_tel }">
															</div>
														</div>

														<div class="form-group">
															<label for="inputNumber" class="col-sm-2 control-label">면적</label>
															<div class="col-lg-12">
																<div class="input-group" style="width: 70%;">
																	<input type="number" class="form-control"
																		name="plant_are" required value="${plant.plant_are }"> <span
																		class="input-group-addon" style="font-size: large;">㎡</span>
																</div>
															</div>
														</div>

														<div class="form-group">
															<label for="inputNumber" class="col-sm-2 control-label">용량</label>
															<div class="col-lg-12">
																<div class="input-group" style="width: 70%;">
																	<input type="number" class="form-control"
																		name="plant_volume" required value="${plant.plant_volume }"> <span
																		class="input-group-addon" style="font-size: large;">kW</span>
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-offset-2 col-sm-10 text-center">
																<br>
																<button type="submit" class="btn btn-pr">수정</button>
																<button class="btn btn-secondary" type="reset">취소</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
							</section>				        
					    </c:otherwise>
						</c:choose>
					</main>
                </div>
                

                  <!-- Change Password Form -->
                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <form>
                    <div class="row mb-3">
                      <label for="password" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="currentPassword" type="password" class="form-control" id="currentPassword" placeholder="사용중인 비밀번호를 입력해주세요" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword" placeholder="새로운 비밀번호를 입력해주세요" required>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" style="outline-color: primary;" class="form-control" id="renewPassword" placeholder="한번 더 비밀번호를 입력해주세요" required>
                      </div>
                    </div>

                    <div class="text-center">
                      <button class="btn btn-pr" type="button"
								onclick="changePassword()">비밀번호 변경</button>
                      <button class="btn btn-secondary" type="reset">취소</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
</div>	
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
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
  
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>

</html>