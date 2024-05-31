<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
      tbody tr:nth-child(odd) {
        background-color: beige;
      }
    </style>



</head>
<body>
	<div class="container">
	<jsp:include page="../common/header.jsp"></jsp:include>
	  <h2>게시판</h2>
	  <div class="panel panel-primary">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
			<table class="table table-hover">
				<thead>
					<tr class = "warning">
						<th>번호</th>
						<th style="width: 500px">제목</th>
						<th>작성자</th>
						<th>첨부파일</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- BoardController에서 받아온 게시판 리스트를 아래에 출력 -->
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.b_idx}</td>
							<td><a href="boardContent.do?b_idx=${vo.b_idx}"><c:out value="${vo.b_title}"></c:out></a></td>
							<td>${vo.user_nick}</td>
							<td>${vo.b_file}</td>
							<td>${vo.b_views}</td>
							<td>${fn:split(vo.created_at, " ")[0]}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	    
	    	
	    	<a class="btn btn-warning btn-sm" href="boardForm.do">글쓰기</a>
	    
	    </div>
	    <div class="panel-footer">스프링 - 강성훈</div>
	  </div>
	</div>
	
		<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">

	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">게시글 안내</h4>
	      </div>
	      <div class="modal-body">
	        게시글이 등록되었습니다 \^o^/
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>

  </div>
</div>


<script type="text/javascript">

	$(document).ready(function(){
		let result = '${result}';
		
		if(result == 'ok'){
			$("#myModal").modal("show");
		}
	});

</script>
<!-- 	
		// Model 영역안에 있는 list 꺼내기 
		// ㄴ=> request영역안에 model이 있기 때문에 request.getAttribute 한다.
		List<Board> list =(List<Board>)request.getAttribute("list");
-->

	
</body>
</html>