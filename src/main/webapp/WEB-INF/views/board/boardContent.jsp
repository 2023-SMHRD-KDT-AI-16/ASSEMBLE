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

<script type="text/javascript">
// 게시글 삭제 기능
function goDelete(b_idx){
	  $.ajax({
			url : "board/"+b_idx,
			type : "delete",
			success : function() {
	            window.location.href = "boardList.do";
	        },
			error : function(){ alert("error"); }
	  });
}
</script>

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
					<td>${vo.user_id}</td>
					<td>작성일</td>
					<td>${vo.created_at}</td>				
				</tr>
				
				<tr>
					<td>제목</td>
					<td colspan="3" align="left">${vo.b_title}</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td colspan="3" align="left" style="height: 300px;">${fn:replace(vo.b_content, line, "<br>")}</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<a href="boardList.do"  class="btn btn-info btn-sm">돌아가기</a>
						<a href="boardUdateForm.do?b_idx=${vo.b_idx}" class="btn btn-success btn-sm">수정화면</a>
						<button class="btn btn-sm btn-warning" type="button" onclick="goDelete(${vo.b_idx})">삭제</button>
					</td>
				</tr>
			</table>	    	    
	    </div>
	  </div>
	</div>

	
</body>
</html>