<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 0;">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextPath}/" style="padding: 3px">
      <img alt="logo" src="${contextPath}/resources/images/logo.png" style="height: 45px;">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#myNavbar" aria-controls="myNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="${contextPath}/">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="boardList.do">게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="${contextPath}/powerMain.do">내 발전소</a></li>
      </ul>
      
      <c:if test="${empty mvo}">
      <ul class="navbar-nav mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link" href="${contextPath}/join.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
        <li class="nav-item"><a class="nav-link" href="${contextPath}/loginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
      </ul>
      </c:if>
      
      <c:if test="${not empty mvo}">
      <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
        <li class="nav-item"><a class="nav-link" href="${contextPath}/updateMain.do"><span class="glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
        <li class="nav-item"><a class="nav-link" href="${contextPath}/logout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
        <li class="nav-item d-flex align-items-center">
          <c:choose>
            <c:when test="${not empty mvo.user_profile}">
              <img class="rounded-circle" src="${contextPath}/resources/images/${mvo.user_profile}" style="width: 40px; height: 40px; margin: 5px;">
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