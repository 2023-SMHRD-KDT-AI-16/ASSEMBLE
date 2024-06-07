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
  	
  	
</script>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>

		<div class="panel-body">

			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">사진등록</a></li>
				<li><a data-toggle="tab" href="#menu1">개인정보수정</a></li>
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
									<img class="img-circle " id="imageTemp" src="${pageContext.request.contextPath}/resources/images/${mvo.user_profile }"
										style="width: 300px; height: 300px; border-radius:50%;">																			
								</c:when>
								<c:otherwise>  
									<img class="img-circle " id="imagePreview"
										src="${contextPath}/resources/images/person.png"
										style="width: 300px; height: 300px;">
								</c:otherwise>
							</c:choose>
							
						</div>

						<input type="file" class="form-control" id="user_profile"
							name="user_profile" onchange="chooseImage(this)" required> <br>

						<div class="text-center">
							<button class="btn btn-primary" type="submit">등록</button>
						</div>

					</form>






				</div>


				<div id="menu1" class="tab-pane fade">
					<h3>개인정보수정</h3>
					<div class="panel-heading">개인정보수정</div>

				</div>



				<div id="menu2" class="tab-pane fade">
					<h3>발전소 등록</h3>
					<p>발전소를 등록합니다.</p>
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




