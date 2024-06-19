<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0; box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextPath}/" style="padding: 3px">
      <img alt="logo" src="${contextPath}/resources/images/logo.png" style="height: 45px;">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#myNavbar" aria-controls="myNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="${contextPath}/index">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="boardList.do">게시판</a></li>
         <c:if test="${mvo.plant_idx != null && mvo.plant_idx > 0}">
	        <li class="nav-item"><a class="nav-link" href="${contextPath}/powerMain.do">내 발전소</a></li>
        	
         </c:if>
      </ul>
      
      <c:if test="${empty mvo}">
      <ul class="navbar-nav mb-2 mb-lg-0">
      
        <li class="nav-item"><a class="nav-link" href="${contextPath}/join.do"> 
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16"> <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/></svg>회원가입</a></li> 
        <li class="nav-item"><a class="nav-link" href="${contextPath}/loginForm.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/></svg>로그인</a> </li>
  
  
      </ul>
      </c:if>
      
      <c:if test="${not empty mvo}">
      <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
        <li class="nav-item"><a class="nav-link" href="${contextPath}/updateMain.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wrench-adjustable" viewBox="0 0 16 16">
  <path d="M16 4.5a4.5 4.5 0 0 1-1.703 3.526L13 5l2.959-1.11q.04.3.041.61"/>
  <path d="M11.5 9c.653 0 1.273-.139 1.833-.39L12 5.5 11 3l3.826-1.53A4.5 4.5 0 0 0 7.29 6.092l-6.116 5.096a2.583 2.583 0 1 0 3.638 3.638L9.908 8.71A4.5 4.5 0 0 0 11.5 9m-1.292-4.361-.596.893.809-.27a.25.25 0 0 1 .287.377l-.596.893.809-.27.158.475-1.5.5a.25.25 0 0 1-.287-.376l.596-.893-.809.27a.25.25 0 0 1-.287-.377l.596-.893-.809.27-.158-.475 1.5-.5a.25.25 0 0 1 .287.376M3 14a1 1 0 1 1 0-2 1 1 0 0 1 0 2"/>
</svg> 회원정보수정</a></li>
        <li class="nav-item"><a class="nav-link" href="${contextPath}/logout.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
</svg> 로그아웃</a></li>
        <li class="nav-item d-flex align-items-center">
          <c:choose>
            <c:when test="${not empty mvo.user_profile}">
              <img class="rounded-circle" src="data:image;base64,${mvo.user_profile}" style="width: 40px; height: 40px; margin: 5px;">
            </c:when>
            <c:otherwise>
              <img class="rounded-circle" src="${contextPath}/resources/images/person.png" style="width: 40px; height: 40px; margin: 5px;">
            </c:otherwise>
          </c:choose>
        </li>
        <li class="nav-item d-flex align-items-center">
          <a class="nav-link" style="color:black;"><span>${mvo.user_nick}님</span></a>
        </li>
      </ul>
      </c:if>
    </div>
  </div>
</nav>