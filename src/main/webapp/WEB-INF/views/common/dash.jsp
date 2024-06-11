<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
	style="width: 280px;">
	
		
		
		 <a href="${contextPath}/" style="padding: 3px"><img alt="logo" src="${contextPath}/resources/images/logo.png" style="height: 45px; width: 45px">

    
    <c:if test="${empty mvo}">
     <ul class="nav navbar-nav navbar-right">
             <li><a href="${contextPath}/join.do"><span class="glyphicon glyphicon-user">회원가입</span></a></li>
        	 <li><a href="${contextPath}/loginForm.do"><span class="glyphicon glyphicon-log-in">로그인</span></a></li>
      </ul>
      </c:if>

		<c:if test="${not empty mvo}">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${contextPath}/updateMain.do"> <span
						class="glyphicon glyphicon-wrench">회원정보수정</span></a></li>
				<li><a href="${contextPath}/logout.do"><span
						class="glyphicon glyphicon-log-out">로그아웃</a></span></li>
						
						
				<li><c:choose>
						<c:when test="${not empty mvo.user_profile }">
							<img class="img-circle "
								src="${pageContext.request.contextPath}/resources/images/${mvo.user_profile }"
								style="width: 40px; height: 40px; margin: 5px;">
						</c:when>
						<c:otherwise>
							<img class="img-circle " id="imagePreview"
								src="${contextPath}/resources/images/person.png"
								style="width: 40px; height: 40px; margin: 5px;">
						</c:otherwise>
					</c:choose></li>
					
					
				<li><span style="color: black;">${mvo.user_nick}님</span>				
				
				</li>
			</ul>
		</c:if>


	</a>
	<hr>
	
		
			
	
	
	<ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="${contextPath}/" class="nav-link active" aria-current="page">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
          Home
        </a>
      </li>
      <li>
        <a href="boardList.do" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
          게시판
        </a>
      </li>
      <li>
        <a href="${contextPath}/powerMain.do" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
          내 발전소
        </a>
      </li>
      
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
           - 00 그래프
        </a>
      </li>
      
      <li>
        <a href="#" class="nav-link link-dark">
          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
           - 00 그래프
        </a>
      </li>
      
      
      
    </ul>
	
	
	
	
	<hr>
	
	
	
	<div class="dropdown">
	
	
	
	<c:if test="${not empty mvo}">
			
		
		
		<a href="#"
			class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
			id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
			
			<li><c:choose>
						<c:when test="${not empty mvo.user_profile }">
							<img class="img-circle "
								src="${pageContext.request.contextPath}/resources/images/${mvo.user_profile }"
								style="width: 40px; height: 40px; margin: 5px;">
						</c:when>
						<c:otherwise>
							<img class="img-circle " id="imagePreview"
								src="${contextPath}/resources/images/person.png"
								style="width: 40px; height: 40px; margin: 5px;">
						</c:otherwise>
					</c:choose></li>
			
			
			<li><span style="color: black;">${mvo.user_nick}님</span></li>
		</a>
		<ul class="dropdown-menu text-small shadow"
			aria-labelledby="dropdownUser2">
			<li><a class="dropdown-item" href="${contextPath}/updateMain.do"> <span class="glyphicon glyphicon-wrench">회원정보수정</span></a></li>
			
			
			
			<li><a class="dropdown-item" href="#">Settings</a></li>
			<li><a class="dropdown-item" href="#">Profile</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><a class="dropdown-item" href="${contextPath}/logout.do"><span class="glyphicon glyphicon-log-out">로그아웃</a></span></li>
		</ul>
		</c:if>
	</div>
	
	
	
	
</div>
<div class="b-example-divider"></div>





