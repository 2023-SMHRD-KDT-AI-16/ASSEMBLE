<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


  <title>Forms / Elements - NiceAdmin Bootstrap Template</title>
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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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




<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  
  	$(document).ready(function(){
  		if(${not empty msgType}){
  			if(${msgType eq "실패 메세지"}){
  				$("#messageType").attr("class", "modal-content panel-warning");
  			}
  			$("#myMessage").modal("show");
  		}
  		
  		
  		
  		
  		
  	});
  	
  	function chooseImage(obj){
  		
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
        var confirmPassword = $('#confirmPassword').val();
	       
        if (!newPassword || !confirmPassword) {
            alert('비밀번호를 입력해주세요.');
            return;
        }     
        
        if (tempPw !== currentPassword) {
            alert('현재 비밀번호가 일치하지 않습니다.');
            return;
        }
                	
        if (newPassword !== confirmPassword) {
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
       	       $('#confirmPassword').val('');
       	       tempPw = newPassword;
       	    },
       	    error: function() {
       	    	alert("에러"); 	        
       	    }
       	});
                 
    }

  	
  	
  	
</script>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>

		<div class="panel-body">

			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">사진등록</a></li>
				<li><a data-toggle="tab" href="#menu1">비밀번호 변경</a></li>
				<li><a data-toggle="tab" href="#menu2">발전소등록</a></li>
			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active ">

					<form action="profileUpdate.do" method="post"
						enctype="multipart/form-data" onsubmit="return validateForm()">

						<h3 align="center">프로필사진 등록 및 변경</h3>

						<div class="panel-body" id="view" align="center">

							<c:choose>
								<c:when test="${not empty mvo.user_profile }">
									<img class="img-circle " id="imageTemp"
										src="${pageContext.request.contextPath}/resources/images/${mvo.user_profile }"
										style="width: 300px; height: 300px; border-radius: 50%;">
								</c:when>
								<c:otherwise>
									<img class="img-circle " id="imagePreview"
										src="${contextPath}/resources/images/person.png"
										style="width: 300px; height: 300px;">
								</c:otherwise>
							</c:choose>

						</div>

						<input type="file" class="form-control" id="user_profile"
							name="user_profile" onchange="chooseImage(this)" required>
						<br>

						<div class="text-center">
							<button class="btn btn-primary" type="submit">등록</button>
						</div>

					</form>


				</div>


			<div id="menu1" class="tab-pane fade">


				<form action="pwChange.do" method="post" id="pwChangeForm">

						<div class="input-form col-md-12 mx-auto">
							<h3 class="mb-3">아이디 : ${mvo.user_id }님</h3>							
							
							<div class="mb-3">
								<h4>닉네임 : ${mvo.user_nick }</h4>
							</div>
							<div class="mb-3">
								<h4>이메일 : ${mvo.user_email }</h4>
							</div>
							<div class="mb-3">
								<h4>휴대폰번호 : ${mvo.user_phone }</h4>
							</div>
							
							<div class="mb-3">
								<label for="password">현재 비밀번호</label> <input type="password"
									class="form-control" id="currentPassword" placeholder="비밀번호를 입력해주세요"
									required>
							</div>
							<div class="mb-3">
								<label for="password">바꿀 비밀번호</label> <input type="password"
									class="form-control" id="newPassword" placeholder="비밀번호를 입력해주세요"
									required>
							</div>
							<div class="mb-3" style="margin-bottom:20px;">
								<label for="password">비밀번호 확인</label> <input type="password"
									class="form-control" id="confirmPassword" placeholder="비밀번호를 입력해주세요"
									required>
							</div>
						</div>
					

						<div class="input-form col-md-12 mx-auto">
							<button class="btn btn-primary btn-sm btn-block" type="button" onclick="changePassword()">비밀번호 변경</button>
							<button class="btn btn-secondary btn-sm btn-block" type="reset">취소</button>
						</div>
					</form>
					
					<footer class="my-3 text-center text-small">
					<p class="mb-1">&copy; 2024 The Sun</p>
					</footer>
			</div>
			
			
				
			
				
			
			
	



	<div id="menu2" class="tab-pane fade">
			<h3>발전소 등록</h3>	
		  <main id="main" class="main">

			    <section class="section">
			      <div class="row" style="justify-content: center">
			        <div class="col-lg-6">
			
			          <div class="card">
			            <div class="card-body">
			              <h5 class="card-title"></h5>
			
			              <!-- General Form Elements -->
			              <form>
			                <div class="row mb-3">
			                  <label for="inputText" class="col-sm-2 col-form-label">발전소이름</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control">
			                  </div>
			                </div>
			
			                <div class="row mb-3">
			                    <label for="inputText" class="col-sm-2 col-form-label">주소</label>
			                    <div class="col-sm-10">
			                        <div class="col-md-6"  style="position: relative; display: flex;">
			                            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
			                            <input type="button" class="btn btn-primary btn-sm" onclick="sample6_execDaumPostcode()" style="position: absolute; right: 5px; top: 5px; bottom: 5px;" value="우편번호 찾기"><br>
			                        </div>
			                        <div class="col-12">
			                            <input type="text" class="form-control" id="sample6_address" placeholder="주소">
			                            <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
			                        </div>
			                        <div class="col-md-6">
			                            <input type="hidden"  id="sample6_extraAddress" placeholder="참고항목">
			                        </div>
			                    </div>
			                  </div>
			
			                <div class="row mb-3">
			                  <label for="inputPassword" class="col-sm-2 col-form-label">전화번호</label>
			                  <div class="col-sm-10">
			                    <input type="text" class="form-control">
			                  </div>
			                </div>
			
			                <div class="row mb-3">
			                  <label for="inputNumber" class="col-sm-2 col-form-label">면적</label>
			                  <div  class="input-group mb-3" style="width: 50%;">
			                      <input type="number" class="form-control" style="width: 300px;">
			                      <span class="input-group-text" style="font-size: large;">㎡</span>
			                  </div>
			                </div> 
			                
			                <div class="row mb-3">
			                    <label for="inputNumber" class="col-sm-2 col-form-label">용량</label>
			                    <div  class="input-group mb-3" style="width: 50%;">
			                        <input type="number" class="form-control" style="width: 300px;">
			                        <span class="input-group-text">wh</span>
			                    </div>
			                  </div> 
			
			                <div class="text-center">
			                    <button type="submit" class="btn btn-primary">등록</button>
			                    <button type="reset" class="btn btn-secondary">취소</button>
			                  </div>
			              </form><!-- End General Form Elements -->
			            </div>
			        </div>			
			        </div>
			      </div>
			    </section>

 			 </main><!-- End #main -->
 		</div>
	</div>
	</div>
	</div>


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




