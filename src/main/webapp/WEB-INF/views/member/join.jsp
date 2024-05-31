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
                <input type="text" class="form-control" id="username" placeholder="아이디를 입력해주세요" required>
                <div class="input-group-append">
                  <button type="button" class="btn btn-sm btn-primary" onclick="checkDuplicate('username')">중복확인</button>
                </div>
                <div class="invalid-feedback">
                  아이디를 입력해주세요.
                </div>
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <div class="input-group">
                <input type="text" class="form-control" id="nickname" placeholder="닉네임을 입력해주세요" required>
                <div class="input-group-append">
                  <button type="button" class="btn btn-sm btn-primary" onclick="checkDuplicate('nickname')">중복확인</button>
                </div>
                <div class="invalid-feedback">
                  닉네임을 입력해주세요.
                </div>
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요" required>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="phone">휴대폰</label>
            <input type="text" class="form-control" id="phone" placeholder="010-1234-1234" required>
            <div class="invalid-feedback">
              휴대폰 번호를 입력해주세요.
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-5">
              <label for="email1">이메일</label>
              <input type="text" class="form-control" id="email1" placeholder="이메일" required>
              <div class="invalid-feedback">
                이메일을 입력해주세요.
              </div>
            </div>
            <div class="col-md-5">
              <label for="email2">이메일</label>
              <input type="text" class="form-control" id="email2" placeholder="이메일" required>
              <div class="invalid-feedback">
                이메일
              </div>
            </div>
            <div class="col-md-2 d-flex align-items-end">
              <button type="button" class="btn btn-sm btn-primary w-100" onclick="checkDuplicate('email')">중복확인</button>
            </div>
          </div>

          <div class="mb-3">
            <label>발전소를 보유하고 계십니까?</label>
            <div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="powerPlant" id="powerPlantYes" value="yes">
                <label class="form-check-label" for="powerPlantYes">네</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="powerPlant" id="powerPlantNo" value="no">
                <label class="form-check-label" for="powerPlantNo">아니요</label>
              </div>
            </div>
          </div>

          <div class="separator"></div>

          <h5 class="mb-3">발전소 정보</h5>
          <div class="mb-3">
            <label for="powerStationName">발전소 명</label>
            <input type="text" class="form-control" id="powerStationName" placeholder="발전소 명을 입력하세요" required>
            <div class="invalid-feedback">
              발전소 명을 입력해주세요.
            </div>
          </div>

           <div class="mb-3">
            <label for="powerStationAddress">주소</label>
            <div class="input-group">
              <input type="text" class="form-control" id="powerStationAddress" placeholder="주소를 입력하세요" required>
              <div class="input-group-append">
                <button type="button" class="btn btn-sm btn-primary">검색</button>
              </div>
              <div class="invalid-feedback">
                주소를 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="powerStationPhone">전화번호</label>
            <input type="text" class="form-control" id="powerStationPhone" placeholder="전화번호를 입력하세요" required>
            <div class="invalid-feedback">
              전화번호를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="area">면적</label>
            <div class="input-group">
              <input type="text" class="form-control" id="area" placeholder="면적을 입력하세요" required>
              <div class="input-group-append">
                <span class="input-group-text">㎡</span>
              </div>
              <div class="invalid-feedback">
                면적을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="capacity">용량</label>
            <div class="input-group">
              <input type="text" class="form-control" id="capacity" placeholder="용량을 입력하세요" required>
              <div class="input-group-append">
                <span class="input-group-text">kW</span>
              </div>
              <div class="invalid-feedback">
                용량을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="image">이미지</label>
            <div class="custom-file">
              <input type="file" class="custom-file-input" id="image" required>
              <label class="custom-file-label" for="image">파일을 선택하세요</label>
              <div class="invalid-feedback">
                이미지를 업로드해주세요.
              </div>
            </div>
          </div>

          <hr class="mb-4">
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
          <button class="btn btn-secondary btn-lg btn-block" type="reset">취소</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2024 The Sun</p>
    </footer>
  </div>

  <!-- Bootstrap 및 JavaScript 라이브러리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- 폼 유효성 검사 -->
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);

    function checkDuplicate(field) {
      // 이 함수는 중복 확인 기능을 수행합니다.
      // 예: 서버에 AJAX 요청을 보내고, 결과에 따라 적절한 동작을 수행합니다.
      alert(field + " 중복 확인 기능을 구현하세요.");
    }
  </script>
</body>

</html>