<%@page import="kr.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create Post - SB Admin Pro</title>
    <link href="resources/css/styles.css" rel="stylesheet" />
    <link href="https://unpkg.com/easymde/dist/easymde.min.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="resources/assets/img/favicon.png" />
    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
	  function goInsert(){
		  // 제목, 내용, 작성자를 DB에 입력
		  var fData = $("#insertF").serialize();
		  console.log(fData);
		  
		  $.ajax({
			  url : "board/new",
			  type : "post",
			  data : fData,
			  success : "board/boardMain",
			  error : function(){ alert("error"); }
		  });		  
		  
		  $("#fclear").trigger("click");
		  
	  }
    
    </script>
</head>
<body>
	<div class="container">
	  <h2>Spring Day1</h2>
	  <div class="panel panel-primary">
	    <div class="panel-heading">Board</div>
	    <div class="panel-body">
	    
	    	<form id="insertF">
	    	<input type="hidden" name="user_nick" value="${mvo.user_nick}">
			<table class="table table-hover">

				<tr>
					<td>제목</td>
					<td><input required="required" class="form-control" type="text" name="b_title" ></td>
				</tr>
				<tr>
					<td>내용</td>
                    <td class="card-body"><textarea id="postEditor" type="text" required="required" name="b_content"></textarea></td>
                </tr>
                
				<tr>
					<td colspan="2" align="center">
						<a class="btn btn-info btn-sm" href="boardMain.do">돌아가기</a>
						<button type="reset" class="btn btn-success btn-sm" id="fclear">취소</button>
						<button class="btn btn-sm btn-success" type="button" onclick="goInsert()">등록</button>
					</td>
				</tr>
			</table>
			</form>	    	    
	    </div>
	  </div>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://unpkg.com/easymde/dist/easymde.min.js" crossorigin="anonymous"></script>
    <script src="js/markdown.js"></script>

	
</body>
</html>