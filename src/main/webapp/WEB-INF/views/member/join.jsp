<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입 화면 샘플 - Bootstrap</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;
      margin-top: 40px;
      padding: 32px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    }

    .separator {
      border-top: 1px solid #e9ecef;
      margin-top: 20px;
      margin-bottom: 20px;
    }
  </style>
</head>

<body>


<form id="content" action="join.do" method="post" onsubmit="return modifyEmailAndSubmit()">
  <div class="container">
    <div class="input-form-background row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate>
          <h5 class="mb-3">내 정보</h5>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="username">아이디</label>
              <div class="input-group">
                <input type="text" class="form-control" id="username" placeholder="아이디를 입력해주세요" name="user_id" required>
                <div class="input-group-append">
                  <button type="button" class="btn btn-sm btn-primary" onclick="checkDuplicate()">중복확인</button>
                </div>
                <div class="invalid-feedback">
                  아이디를 입력해주세요.
                </div>
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <div class="input-group">
                <input type="text" class="form-control" id="nickname" placeholder="닉네임을 입력해주세요" name="user_nick" required>
                <div class="input-group-append">
                  <button type="button" class="btn btn-sm btn-primary" onclick="checkNickDuplicate()">중복확인</button>
                </div>
                <div class="invalid-feedback">
                  닉네임을 입력해주세요.
                </div>
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password1" placeholder="비밀번호를 입력해주세요" name="user_pw" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="password">비밀번호 확인</label><p id="passwordMatchMessage"></p>
            <input type="password" class="form-control" id="password2" placeholder="비밀번호를 입력해주세요" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="phone">휴대폰</label>
            <input type="tel" class="form-control" id="phone" placeholder="010-1234-1234" name="user_phone" required>
            <div class="invalid-feedback">
              휴대폰 번호를 입력해주세요.
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-5">              
              <input type="text" class="form-control" id="email1" placeholder="이메일" required>
              <div class="invalid-feedback">
                이메일을 입력해주세요.
              </div>
            </div>
            <div class="col-md-1" style="line-height: 2.3em;">
              @              
              </div>
            <div class="col-md-4">
              <input type="text" class="form-control" id="email2" placeholder="이메일" required>
              <div class="invalid-feedback">
                이메일
              </div>
            </div>
            <div class="col-md-2 d-flex align-items-end">
              <button type="button" class="btn btn-sm btn-primary w-100" onclick="checkEmail()">중복확인</button>
            </div>
          </div>

          <div class="mb-3">
            <label>발전소를 보유하고 계십니까?</label>
            <div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="user_type" id="powerPlantYes" value="plant">
                <label class="form-check-label" for="powerPlantYes">네</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="user_type" id="powerPlantNo" value="normal" checked>
                <label class="form-check-label" for="powerPlantNo">아니요</label>
              </div>
            </div>
          </div>



          <hr class="mb-4">
          <button class="btn btn-primary btn-lg btn-block" type="submit" >가입 완료</button>
          <button class="btn btn-secondary btn-lg btn-block" type="reset">취소</button>
        </form>
      </div>
    </div>
    
    </form>
    
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2024 The Sun</p>
    </footer>
  </div>

  <!-- Bootstrap 및 JavaScript 라이브러리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- 폼 유효성 검사 -->
  <script>
    
    function checkDuplicate(field) {
      
    	// 아이디 중복체크
		var user_id = $("#username").val();
		
				$.ajax({
					url : "idCheck.do",
					type : "get",
					data : {
						"user_id" : user_id
					},
					success : function(data) {
						
						if (data != 1) {
							alert("사용할 수 없는 아이디 입니다.다른 아이디를 입력해 주세요.");
						} else {
							alert("사용할 수 있는 아이디 입니다.");
						}
					},
					error : function() {
						alert("error");
					}
				})
    }
    
    
    function checkNickDuplicate() {
        
    	// 아이디 중복체크
		var nickName = $("#nickname").val();
		
				$.ajax({
					url : "nickCheck.do",
					type : "get",
					data : {
						"nickName" : nickName
					},
					success : function(data) {
						
						if (data != 1) {
							alert("사용할 수 없는 닉네임 입니다.다른 닉네임을 입력해 주세요.");
						} else {
							alert("사용할 수 있는 닉네임 입니다.");
						}
					},
					error : function() {
						alert("error");
					}
				})
    }
    
    $('#password1, #password2').on('keyup', function() {
        // 입력된 비밀번호 값 가져오기
        var password1 = $('#password1').val();
        var password2 = $('#password2').val();
        
        // 비밀번호가 일치하는지 확인하여 메시지 출력
        if(password1 === password2) {
            $('#passwordMatchMessage').text('비밀번호가 일치합니다.').css('color', 'green');
        } else {
            $('#passwordMatchMessage').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
        }
    });
    
    
    function checkEmail() {
        
    	// 아이디 중복체크
		var email = $("#email1").val()+"@"+ $("#email2").val();
    	
				$.ajax({
					url : "checkEmail.do",
					type : "get",
					data : {
						"email" : email
					},
					success : function(data) {
						
						if (data != 1) {
							alert("사용할 수 없는 이메일 입니다.다른 이메일를 입력해 주세요.");
						} else {
							alert("사용할 수 있는 이메일 입니다.");
						}
					},
					error : function() {
						alert("error");
					}
				})
    }
    
    
    function modifyEmailAndSubmit() {
    	  // 이메일 입력 필드 값 가져오기
    	  var email1 = document.getElementById('email1').value;
    	  var email2 = document.getElementById('email2').value;
    	  var fullEmail = email1 + '@' + email2;

    	  // 숨겨진 입력 필드에 이메일 설정
    	  var emailInput = document.createElement('input');
    	  emailInput.type = 'hidden';
    	  emailInput.name = 'user_email';
    	  emailInput.value = fullEmail;
    	  document.getElementById('content').appendChild(emailInput);
			
    	  alert(emailInput);
    	  return true; // 폼을 정상적으로 제출
    	}
    
    
  </script>
</body>

</html>