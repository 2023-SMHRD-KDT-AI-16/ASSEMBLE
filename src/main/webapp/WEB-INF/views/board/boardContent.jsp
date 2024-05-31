<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("line", "\n");%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	  <h2>게시판</h2>
	  <div class="panel panel-primary">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
			<table class="table table-hover">
				
				<tr>
					<td>글번호</td>
					<td>${vo.b_idx}</td>
					<td>조회수</td>
					<td>${vo.b_views}</td>				
				</tr>
				
				<tr>
					<td>작성자</td>
					<td>${vo.user_nick}</td>
					<td>작성일</td>
					<td>${vo.created_at}</td>				
				</tr>
				
				<tr>
					<td colspan="3">제목</td>
					<td align="left">${vo.b_title}</td>
				</tr>
				
				<tr>
					<td colspan="3">내용</td>
					<td align="left">${fn:replace(vo.b_content, line, "<br>")}</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<a href="boardList.do"  class="btn btn-info btn-sm">돌아가기</a>
						<a href="boardUdateForm.do?idx=${vo.b_idx}" class="btn btn-success btn-sm">수정화면</a>
						<a href="boardDelete.do?idx=${vo.b_idx}" class="btn btn-warning btn-sm">삭제</a>
					</td>
				</tr>
			</table>	    	    
	    </div>
	    <div class="panel-footer">스프링 - 강성훈</div>
	  </div>
	</div>

<!-- 	
		// Model 영역안에 있는 list 꺼내기 
		// ㄴ=> request영역안에 model이 있기 때문에 request.getAttribute 한다.
		List<Board> list =(List<Board>)request.getAttribute("list");
-->

	
</body>
</html>