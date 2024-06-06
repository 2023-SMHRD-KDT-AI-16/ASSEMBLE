<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>SolarNamDo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
  		if(${not empty msgType}){
  			if(${msgType eq "성공 메세지"}){
  				$("#messageType").attr("class", "modal-content panel-success");
  			}
  			if(${msgType eq "로그아웃 메세지"}){
  				$("#messageType").attr("class", "modal-content panel-primary");
  			}
  			$("#myMessage").modal("show");
  		}
  		//loadList();
  	});
  
	function loadList(){
		  // BoardController에서 게시글 전체목록을 가져오는 기능
		  // JavaScript에서 객체 표현법 {key:value}
		  $.ajax({
			  url : "board/all",
			  type : "get",
			  dataType : "json",
			  success : makeView,
			  error : function(){ alert("error"); }
		  });
	  }
	                           //           0              1         2
	  function makeView(data){ // data = [{title="하하"}, {     }, {     }]
		  console.log(data);
		  var listHtml = "<table class='table table-bordered'>";
		  listHtml += "<tr>";
		  listHtml += "<td>번호</td>";
		  listHtml += "<td>제목</td>";
		  listHtml += "<td>작성자</td>";
		  listHtml += "<td>작성일</td>";
		  listHtml += "<td>조회수</td>";
		  listHtml += "</tr>";
		  
		  // 게시글을 반복문을 통해 만들어주는 부분
		  $.each(data, function(index, obj){
			  listHtml += "<tr>";
			  listHtml += "<td>" + (index + 1) + "</td>";
			  listHtml += "<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>" + obj.title + "</a></td>";
			  listHtml += "<td>" + obj.writer + "</td>";
			  listHtml += "<td>" + obj.indate + "</td>";
			  listHtml += "<td>" + obj.count + "</td>";
			  listHtml += "</tr>";
			  
			  // 상세 게시글 보여주기
			  listHtml += "<tr id='c"+obj.idx+"' style='display:none;'>";
			  listHtml += "<td>내용</td>";
			  listHtml += "<td colspan='4'>";
			  listHtml += "<textarea id='ta"+obj.idx+"' readonly rows='7' class='form-control'>";
			  listHtml += "</textarea>";
			  listHtml += "</td>";
			  listHtml += "</tr>";
		  });
		  listHtml += "</table>";
		  
		  $("#view").html(listHtml);
		  goList();
		  
	  }
	   
	                           
	  // 게시글 상세보기 기능
	  function goContent(idx){
		  if($("#c"+idx).css("display") == "none"){
			  
			  $.ajax({
				  url : "board/"+idx,
				  type : "get",
				  dataType : "json",
				  success : function(data){
					  $("#ta"+idx).val(data.content);
				  },
				  error : function(){ alert("error"); }
			  });
			  
			  $("#c"+idx).css("display","table-row");
			  $("#ta"+idx).attr("readonly", true);
		  }else{
			  $("#c"+idx).css("display","none");
			  
			  $.ajax({
				  url : "board/count/"+idx,
				  type : "put",
				  success : loadList,
				  error : function(){ alert("error"); }
			  });
			  
			  
			  
		  }
	  }
	  
	  
	  
  
  </script>

</head>
<body>


	<div class="container">
		<jsp:include page="common/header.jsp"></jsp:include>




		<div class="panel panel-default">
			<div>
				<!-- 상대경로 -->
				<!-- 꽉채우기 -->
				<!-- 높이 -->
				<img src="${contextPath}/resources/images/main1.jpg"
					style="width: 100%; height: 400px;">
			</div>
			<div class="panel-body">


				<div class="col-sm-6 panel panel-default" style="height: 260px;" >
					<h3>오늘의 SMP</h3>
					<p style="text-align: right;">(단위:원/kWh)</p>
					<table class="table">
						<colgroup>
							<col style="width: 133px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr >
								<th scope="row" class="info">거래일</th>
								<td data-label="거래일">${smpData.smpDay }</td>
							</tr>
							<tr>
								<th scope="row" class="info">최고가</th>
								<td data-label="최고가">${smpData.maxSmp }</td>
							</tr>
							<tr>
								<th scope="row" class="info">최소가</th>
								<td data-label="최소가">${smpData.minSmp }</td>
							</tr>
							<tr>
								<th scope="row" class="info">평균가</th>
								<td data-label="평균가">${smpData.meanSmp }</td>
							</tr>
						</tbody>
					</table>



				</div>

				<div class="col-sm-6 panel panel-default" style="height: 260px;">

					<h3>REC</h3>
					<p style="text-align: right;">※ 매주 화, 목요일 10 : 00 ~ 16 :
						00 개장 (단위:REC, 원/REC)</p> 

					<table class="table">

						<tr>
							<th scope="row" class="info">거래일</th>
							<td data-label="거래일">${smpData.recDay }</td>
							<th scope="row" class="info">거래량</th>
							<td data-label="거래량">${smpData.totRecValue }</td>
						</tr>
						<tr>
							<th scope="row" class="info">평균가</th>
							<td data-label="평균가">${smpData.landAvgPrc }</td>
							<th scope="row" class="info">최고가</th>
							<td data-label="최고가">${smpData.landHgPrc }</td>
						</tr>
						<tr>
							<th scope="row" class="info">최저가</th>
							<td data-label="최저가">${smpData.landLwPrc }</td>
							<th scope="row" class="info">종가</th>
							<td data-label="종가">${smpData.clsPrc }</td>
						</tr>

					</table>


				</div>

			</div>
			<div class="panel-footer">

				<table border="1">
					<tr>
						<c:forEach var="item" items="${weather}" varStatus="loop"
							begin="0" end="179" step="12">
							<%-- 현재 아이템의 인덱스가 12의 배수인 경우에만 출력합니다. --%>
							<td>${item.fcstTime}<br>
							</td>
						</c:forEach>
					</tr>

					<tr>
						<c:forEach var="item" items="${weather}" varStatus="loop"
							begin="7" end="186" step="12">
							<%-- 현재 아이템의 인덱스가 12의 배수인 경우에만 출력합니다. --%>
							<td>${item.category}${item.fcstValue }<br>
							</td>
						</c:forEach>
					</tr>

					<tr>
						<c:forEach var="item" items="${weather}" varStatus="loop"
							begin="5" end="184" step="12">
							<%-- 현재 아이템의 인덱스가 12의 배수인 경우에만 출력합니다. --%>
							<td>${item.category}${item.fcstValue }<br>
							</td>
						</c:forEach>
					</tr>

				</table>

			</div>
		</div>


	</div>




	<!-- 회원가입 성공 시 나오게될 모달창 -->
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


</body>
</html>








