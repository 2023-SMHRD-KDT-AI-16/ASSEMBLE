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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	
    <script type="text/javascript">
    
	  function goInsert(){
		  // 제목, 내용, 작성자를 DB에 입력
		  var postEditor = document.getElementById("postEditor").value;
          console.log(postEditor);
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
	  
	 /*  function reload(){
			location.reload(); // 성공 시 페이지 새로고침} */
	  
    </script>
    
    <style type="text/css">
    	:root {
  --bgColor: #3a3a3a;
  --hoverBg: #616161;
  --text: #bbb;
}

.container {
  width: 100%;
  margin: 32px auto;
  text-align: center;
}

.label {
  width: 100%;
  height: 100%;
  margin: 0px auto;
  cursor: pointer;
  background-color: var(--bgColor);
}

.inner {
  width: 100%;
  height: 128px
  margin: 64px auto;
  border-radius: 8px;
  font-size: 16px;
  line-height: 128px;
  background-color: var(--bgColor);
  color: var(--text);
}

@media (any-hover: hover){
  .inner:hover{
    background-color: var(--hoverBg);
  }
}

.label--hover{
  background-color: var(--hoverBg);
}

.preview-title{
  font-size: 32px;
  margin-bottom: 8px;
}

.preview {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 16px;
  padding: 16px;
  margin-bottom: 16px;
  border-radius: 8px;
  align-items: center;
  background-color: var(--bgColor);
}

.embed-img{
  width: 100%;
  height: 128px;
  object-position: center;
  object-fit: cover;
  border-radius: 8px;
}
.embed-img:hover{
	opacity: 50%;
}  
    
    </style>
</head>
<body>
	<div class="container">
	  <h2>게시판업로드</h2>
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
					<td>첨부파일</td>
					<td>
					   <label class="label" id="label" for="input">
					      <div class="inner" id="inner">드래그하거나 클릭해서 업로드</div>
					   </label>
					   <input id="input" class="input" accept="image/*" type="file" required="true" multiple="true" hidden="true">
					   <p class="preview-title">preview</p>
					   <div class="preview" id="preview"></div>.
					<td>
				</tr>
		
		<script>
		   var input = document.getElementById("input");
		   var initLabel = document.getElementById("label");
		
		   input.addEventListener("change", (event) => {
		      const files = changeEvent(event);
		      handleUpdate(files);
		   });
		
		   initLabel.addEventListener("mouseover", (event) => {
		      event.preventDefault();
		      const label = document.getElementById("label");
		      label?.classList.add("label--hover");
		   });
		
		   initLabel.addEventListener("mouseout", (event) => {
		      event.preventDefault();
		      const label = document.getElementById("label");
		      label?.classList.remove("label--hover");
		   });
		
		   document.addEventListener("dragenter", (event) => {
		      event.preventDefault();
		      console.log("dragenter");
		      if (event.target.className === "inner") {
		         event.target.style.background = "#616161";
		      }
		   });
		
		   document.addEventListener("dragover", (event) => {
		      console.log("dragover");
		      event.preventDefault();
		   });
		
		   document.addEventListener("dragleave", (event) => {
		      event.preventDefault();
		      console.log("dragleave");
		      if (event.target.className === "inner") {
		         event.target.style.background = "#3a3a3a";
		      }
		   });
		
		   document.addEventListener("drop", (event) => {
		      event.preventDefault();
		      console.log("drop");
		      if (event.target.className === "inner") {
		         const files = event.dataTransfer?.files;
		         event.target.style.background = "#3a3a3a";
		         handleUpdate([...files]);
		      }
		   });
		
		   function changeEvent(event) {
		      const { target } = event;
		      return [...target.files];
		   };
		
		   function handleUpdate(fileList) {
		      const preview = document.getElementById("preview");
		
		      fileList.forEach((file) => {
		         const reader = new FileReader();
		         reader.addEventListener("load", (event) => {
		            const img = el("img", {
		               className: "embed-img",
		               src: event.target?.result,
		            });
		            const imgContainer = el("div", { className: "container-img" }, img);
		            preview.append(imgContainer);
		         });
		         reader.readAsDataURL(file);
		      });
		   };
		
		   function el(nodeName, attributes, ...children) {
		      const node =
		         nodeName === "fragment"
		            ? document.createDocumentFragment()
		            : document.createElement(nodeName);
		
		      Object.entries(attributes).forEach(([key, value]) => {
		         if (key === "events") {
		            Object.entries(value).forEach(([type, listener]) => {
		               node.addEventListener(type, listener);
		            });
		         } else if (key in node) {
		            try {
		               node[key] = value;
		            } catch (err) {
		               node.setAttribute(key, value);
		            }
		         } else {
		            node.setAttribute(key, value);
		         }
		      });
		
		      children.forEach((childNode) => {
		         if (typeof childNode === "string") {
		            node.appendChild(document.createTextNode(childNode));
		         } else {
		            node.appendChild(childNode);
		         }
		      });
		
		      return node;
		   }
		</script>
									
				<tr>
					<td>내용</td>
                    <td class="card-body"><textarea id="postEditor" type="text" required="required" name="b_content"></textarea></td>
                </tr>
                
				<tr>
					<td colspan="2" align="center">
						<a class="btn btn-info btn-sm" href="board/boardList.do">돌아가기</a>
						<button type="reset" class="btn btn-success btn-sm" id="fclear">취소</button>
						<button class="btn btn-sm btn-warning" type="button" onclick="goInsert()">등록</button>
					</td>
				</tr>
			</table>
			</form>	    	    
	    </div>
	  </div>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/scripts.js"></script>
    <script src="https://unpkg.com/easymde/dist/easymde.min.js" crossorigin="anonymous"></script>
    <script src="resources/js/markdown.js"></script>

	
</body>
</html>