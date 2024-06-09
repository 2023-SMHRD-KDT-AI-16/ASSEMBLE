<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<nav class="navbar navbar-default" >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/" style="padding: 3px"><img alt="logo" src="${contextPath}/resources/images/logo.png" style="height: 45px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${contextPath}/">Home</a></li>
        <li><a href="boardList.do">게시판</a></li>
        <li><a href="${contextPath}/powerMain.do">내 발전소</a></li>
      </ul>
      
      <c:if test="${empty mvo}">
     <ul class="nav navbar-nav navbar-right">
             <li><a href="${contextPath}/join.do"><span class="glyphicon glyphicon-user">회원가입</span></a></li>
        	 <li><a href="${contextPath}/loginForm.do"><span class="glyphicon glyphicon-log-in">로그인</span></a></li>
      </ul>
      </c:if>
      
      <c:if test="${not empty mvo}">
      <ul class="nav navbar-nav navbar-right">
             <li><a href="${contextPath}/updateMain.do">
             <span class="glyphicon glyphicon-wrench">회원정보수정</span></a></li>
        	 <li><a href="${contextPath}/logout.do"><span class="glyphicon glyphicon-log-out">로그아웃</a></span> </li>
          	
          	
          	<li>
          		<c:choose>
								<c:when test="${not empty mvo.user_profile }">
									<img class="img-circle " src="${pageContext.request.contextPath}/resources/images/${mvo.user_profile }"
										style="width: 40px; height: 40px; margin:5px;">																			
								</c:when>
								<c:otherwise>  
									<img class="img-circle " id="imagePreview"
										src="${contextPath}/resources/images/person.png"
										style="width: 40px; height: 40px; margin:5px;">
								</c:otherwise>
							</c:choose>
          	</li>
          	<li>
          		<a style="color:black;"><span>${mvo.user_nick}님</span></a>
          	</li>
          	
          
      </ul>
      </c:if>
      
    </div>
  </div>
</nav>











