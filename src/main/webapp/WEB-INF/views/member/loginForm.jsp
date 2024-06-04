<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login</title>
        <link href="resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        
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
	   

    <body class="bg-primary" style="background-image: url('/controller/resources/images/logopa1.png'); background-repeat: no-repeat; background-size: cover;">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <!-- Basic login form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="fw-light my-4">회원로그인</h3></div>
                                    <div class="card-body">
                                    
                                    
                                        <!-- Login form-->
                                        <form action="${contextPath}/login.do" method="post">
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputEmailAddress">아이디</label>
                                                <input class="form-control" type="text" name="user_id" id="user_id" placeholder="아이디를 입력해주세요." />
                                            </div>
                                            <!-- Form Group (password)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="inputPassword">비밀번호</label>
                                                <input class="form-control" name="user_pw"  id="user_pw" type="password" placeholder="비밀번호를 입력해주세요." />
                                            </div>
                                            
                                            
                                            <!-- Form Group (login box)-->
                                            <div class="d-flex align-items-center justify-content-center mt-4 mb-0">
                                                <input type="submit" class="btn btn-primary" value="로그인">
                                            </div>
                                        </form>
                                    </div>
                                    <hr>
                                    <div style="text-align: center;">
                                        <div class="small">
                                        	* 아직회원이 아니신가요?
                                        	<a href="${contextPath}/joinForm.do"><span class="btn btn-outline-primary btn-sm">회원가입</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
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
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
