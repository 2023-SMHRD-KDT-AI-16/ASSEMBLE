<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.ZoneOffset" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.util.TimeZone" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>내 발전소</title>


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
	
	
	
	
	
	
	
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
       
        /* Bootstrap 3 container widths in Bootstrap 5 */

        @media (min-width: 768px) {
          .container {
            max-width: 750px;
          }
        }

        @media (min-width: 992px) {
          .container {
            max-width: 970px;
          }
        }

        @media (min-width: 1200px) {
          .container {
            max-width: 1170px;
          }
        }
    	
    	.navbar-nav .nav-link {
		    font-size: 14px;
		  }
		  
		  
		  .powerDiv {
 			 box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  			transition: all 0.3s cubic-bezier(.25,.8,.25,1);
			}

		.powerDiv:hover {
  			box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
				}
				
		 p{
		 text-align: center
		 }
    </style>
    
    	
</head>

<body style="background: #f6f9ff">
	<main>
		<div class="container">

				<div style="display: flex; flex-direction: column;">
				<jsp:include page="../common/head2.jsp"></jsp:include>

				<div class="container-fluid">
					<div class="row">
						

						<main class="col-md-12 ms-sm-auto col-lg-12 px-md-12">
						
						<!-- rec smp 카드 -->
							<div class="container" style=" padding: 0">
							
							<br>
							  <div class="row">
							  							    
							      <div class="col-lg-4 col-md-6 mb-4">
							        <div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
							          <div class="card-body">
							            <h4 class="card-title font-weight-bold text-center" style="margin: 0">SMP</h4>
							            <p class="card-text font-weight-bold text-center" style="border-bottom: 1px solid #999999;">${smpData.smpDay}</p>
		

												<div style="display: flex; justify-content: space-around;">
													<div>
														<p class="card-text font-weight-bold" style="margin-bottom: 0px; color: red;">최고가</p>
														<p class="card-text font-weight-bold" style="color: red;">
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor"
																class="bi bi-caret-up-fill" viewBox="0 0 16 16" style="color: red">
 																		<path
																	d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
															</svg>
														${smpData.maxSmp}</p>
														<p class="card-text font-weight-bold" style="margin-bottom: 0px; color: blue;">최소가</p>
														<p class="card-text font-weight-bold" style="color: blue;">
														
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16" style="color: blue">
  <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>
														
														${smpData.minSmp}</p>
													</div>

													<div style="display: flex; justify-content:space-around; flex-direction: column; font-style: bold">
														<p class="card-text font-weight-bold" style=" font-size: 1.8rem; margin: 0;">평균가</p>
														<p class="card-text font-weight-bold" style=" font-size: 2.2rem">${smpData.meanSmp}</p>
													</div>
												</div>



											</div>
							        </div>
							      </div>
							   
							      <div class="col-lg-4 col-md-6 mb-4">

							       	<div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
							          <div class="card-body">						          
							            <h4 class="card-title font-weight-bold text-center" style="margin: 0">REC</h4>
							            <p class="card-text font-weight-bold text-center" style="border-bottom: 1px solid #999999;">${smpData.recDay}</p>


												<div style="display: flex; justify-content: space-around;">
													<div>
														<p class="card-text font-weight-bold"
															style="margin-bottom: 0px; color: red;">최고가</p>
														
														
														<p class="card-text font-weight-bold" style="color: red;">
														
														<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor"
																class="bi bi-caret-up-fill" viewBox="0 0 16 16" style="color: red">
 																		<path
																	d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
															</svg>
															
														${smpData.landHgPrc}</p>
														<p class="card-text font-weight-bold" style="margin-bottom: 0px; color: blue;">최소가</p>
														<p class="card-text font-weight-bold" style="color: blue;">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16" style="color: blue">
  <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
</svg>
														${smpData.landLwPrc}</p>
													</div>


													<div style="display: flex; justify-content:space-around; flex-direction: column; font-style: bold">
														<p class="card-text font-weight-bold" style=" font-size: 1.8rem; margin: 0;">종가</p>
														<p class="card-text font-weight-bold" style=" font-size: 2.2rem">${smpData.clsPrc}</p>
													</div>

												</div>











											</div>
							        </div>
							      </div>
							      
							    <div class="col-lg-4 col-md-6 mb-4">
							        <div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
							          <div class="card-body">
							            <h4 class="card-title font-weight-bold text-center">여기다가는 무엇을 넣을까</h4>
							            <p class="card-text font-weight-bold">ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
							            <p class="card-text font-weight-bold">ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
							            <p class="card-text font-weight-bold">ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
							         s
							          </div>
							        </div>
							      </div>
							      
							      
							  </div>
							</div>
						<!-- rec smp 카드 끝 -->
						
						<!-- 표 카드 -->
							<div class="col-12 mb-4">
						      <div class="card bg-white text-gray border border-default shadow">
						        <div class="card-body">	

							<h2>나의 발전소의 발전량</h2>
							<div class="table-responsive">
								<table class="table table-striped table-sm">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Header</th>
											<th scope="col">Header</th>
											<th scope="col">Header</th>
											<th scope="col">Header</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1,001</td>
											<td>random</td>
											<td>data</td>
											<td>placeholder</td>
											<td>text</td>
										</tr>
										<tr>
											<td>1,002</td>
											<td>placeholder</td>
											<td>irrelevant</td>
											<td>visual</td>
											<td>layout</td>
										</tr>
										<tr>
											<td>1,003</td>
											<td>data</td>
											<td>rich</td>
											<td>dashboard</td>
											<td>tabular</td>
										</tr>
										<tr>
											<td>1,003</td>
											<td>information</td>
											<td>placeholder</td>
											<td>illustrative</td>
											<td>data</td>
										</tr>
										<tr>
											<td>1,004</td>
											<td>text</td>
											<td>random</td>
											<td>layout</td>
											<td>dashboard</td>
										</tr>
										<tr>
											<td>1,005</td>
											<td>dashboard</td>
											<td>irrelevant</td>
											<td>text</td>
											<td>placeholder</td>
										</tr>
										<tr>
											<td>1,006</td>
											<td>dashboard</td>
											<td>illustrative</td>
											<td>rich</td>
											<td>data</td>
										</tr>
										<tr>
											<td>1,007</td>
											<td>placeholder</td>
											<td>tabular</td>
											<td>information</td>
											<td>irrelevant</td>
										</tr>
										<tr>
											<td>1,008</td>
											<td>random</td>
											<td>data</td>
											<td>placeholder</td>
											<td>text</td>
										</tr>
										<tr>
											<td>1,009</td>
											<td>placeholder</td>
											<td>irrelevant</td>
											<td>visual</td>
											<td>layout</td>
										</tr>
										<tr>
											<td>1,010</td>
											<td>data</td>
											<td>rich</td>
											<td>dashboard</td>
											<td>tabular</td>
										</tr>
										<tr>
											<td>1,011</td>
											<td>information</td>
											<td>placeholder</td>
											<td>illustrative</td>
											<td>data</td>
										</tr>
										<tr>
											<td>1,012</td>
											<td>text</td>
											<td>placeholder</td>
											<td>layout</td>
											<td>dashboard</td>
										</tr>
										<tr>
											<td>1,013</td>
											<td>dashboard</td>
											<td>irrelevant</td>
											<td>text</td>
											<td>visual</td>
										</tr>
										<tr>
											<td>1,014</td>
											<td>dashboard</td>
											<td>illustrative</td>
											<td>rich</td>
											<td>data</td>
										</tr>
										<tr>
											<td>1,015</td>
											<td>random</td>
											<td>tabular</td>
											<td>information</td>
											<td>text</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							</div>
							</div>
							</div>
							<!-- 표 카드 끝 -->
						
						
						
						 <div class="row">
							  							    
							      <div class="col-lg-6 col-md-6 mb-4">
							        <div class="card bg-white text-gray border border-default shadow" style="height: 350px;">
							          <div class="card-body">
							            발전량 정확도 원 차트
							            
							          </div>
							        </div>
							      </div>
						
						
							      <div class="col-lg-6 col-md-6 mb-4">
							        <div class="card bg-white text-gray border border-default shadow" style="height: 350px;">
							          <div class="card-body">
							            
							            내일 예측 발전량
							            
							          </div>
							        </div>
							      </div>
							      
						</div>
						
						
						
						
						
						
						
						<!-- 차트 카드 -->
							<div class="col-12 mb-4">
						      <div class="card bg-white text-gray border border-default shadow">
						        <div class="card-body">
						
						
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							
							<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
								<h1 class="h2">나의 발전소의 (예측한)발전량</h1>
								<div class="btn-toolbar mb-2 mb-md-0">
									<div class="btn-group me-2">
										<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
									</div>
									<button type="button"
										class="btn btn-sm btn-outline-secondary dropdown-toggle">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-calendar"
											aria-hidden="true">
											<rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
											<line x1="16" y1="2" x2="16" y2="6"></line>
											<line x1="8" y1="2" x2="8" y2="6"></line>
											<line x1="3" y1="10" x2="21" y2="10"></line></svg>
										This week
									</button>
								</div>
							</div>
							
							<canvas class="my-4 w-100 chartjs-render-monitor" id="myChart"
								width="1055" height="444"
								style="display: block; height: 254px; width: 603px;"></canvas>
							
						</div>
						</div>
						</div>	
						<!-- 차트 카드 끝 -->	
						
						
							
							<!-- 위성사진 카드  -->	
					
				<%
				    // 현재 시각과 날짜를 GMT로 가져옵니다. 
				    LocalDateTime currentDateTime = LocalDateTime.now(ZoneOffset.UTC);
				    LocalDate currentDate = currentDateTime.toLocalDate();
				    LocalTime currentTime = currentDateTime.toLocalTime();
				
				    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
				    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH00");
				
				    // 1시간 전, 2시간 전, 3시간 전 시각을 계산합니다.
				    LocalDateTime oneHourAgo = currentDateTime.minus(1, ChronoUnit.HOURS);
				    LocalDateTime twoHoursAgo = currentDateTime.minus(2, ChronoUnit.HOURS);
				    LocalDateTime threeHoursAgo = currentDateTime.minus(3, ChronoUnit.HOURS);
				    LocalDateTime fourHoursAgo = currentDateTime.minus(4, ChronoUnit.HOURS);
				
				    // 시각과 날짜를 문자열로 변환합니다.
				    String oneHourAgoFormattedDate = oneHourAgo.format(dateFormatter);
				    String twoHoursAgoFormattedDate = twoHoursAgo.format(dateFormatter);
				    String threeHoursAgoFormattedDate = threeHoursAgo.format(dateFormatter);
				    String fourHoursAgoFormattedDate = fourHoursAgo.format(dateFormatter);
				
				    String oneHourAgoFormattedTime = oneHourAgo.format(timeFormatter);
				    String twoHoursAgoFormattedTime = twoHoursAgo.format(timeFormatter);
				    String threeHoursAgoFormattedTime = threeHoursAgo.format(timeFormatter);
				    String fourHoursAgoFormattedTime = fourHoursAgo.format(timeFormatter);
				
				    
				    LocalDateTime oneHourAgoKST = oneHourAgo.plusHours(9);
				    LocalDateTime twoHoursAgoKST = twoHoursAgo.plusHours(9);
				    LocalDateTime threeHoursAgoKST = threeHoursAgo.plusHours(9);
				    LocalDateTime fourHoursAgoKST = fourHoursAgo.plusHours(9);
				
				    // 한국 시간을 원하는 형식으로 포맷팅합니다.
				    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:00");
				    String oneHourAgoFormattedDateTimeKST = oneHourAgoKST.format(formatter);
				    String twoHoursAgoFormattedDateTimeKST = twoHoursAgoKST.format(formatter);
				    String threeHoursAgoFormattedDateTimeKST = threeHoursAgoKST.format(formatter);
				    String fourHoursAgoFormattedDateTimeKST = fourHoursAgoKST.format(formatter);
				%>
				
					 <div class="row">
					 
				 	     <div class="col-lg-3 col-md-6 mb-4">
				 	     	<div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
								<img class="card-img" alt="sample" src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=oneHourAgoFormattedDate%><%=oneHourAgoFormattedTime %>.thn.png">
					          <div class="card-img-overlay" >
					          	<h3 class="card-title " style="background-color:white; "><%=oneHourAgoFormattedDateTimeKST%></h3>
				          	  </div>
							</div>
					     </div>
				 	     
				 	     <div class="col-lg-3 col-md-6 mb-4">
				 	     	<div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
								<img class="card-img" alt="sample" src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=twoHoursAgoFormattedDate%><%=twoHoursAgoFormattedTime %>.thn.png">
					          <div class="card-img-overlay" >
					          	<h3 class="card-title " style="background-color:white; "><%=twoHoursAgoFormattedDateTimeKST %></h3>
				          	  </div>
							</div>
					     </div>
				 	     
				 	     <div class="col-lg-3 col-md-6 mb-4">
				 	     	<div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
								<img class="card-img" alt="sample" src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=threeHoursAgoFormattedDate%><%=threeHoursAgoFormattedTime %>.thn.png">
					          <div class="card-img-overlay" >
					          	<h3 class="card-title " style="background-color:white; "><%=threeHoursAgoFormattedDateTimeKST %></h3>
				          	  </div>
							</div>
					     </div>
				 	     
				 	     <div class="col-lg-3 col-md-6 mb-4">
				 	     	<div class="card bg-white text-gray border border-default powerDiv" style="height: 220px;">
								<img class="card-img" alt="sample" src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=fourHoursAgoFormattedDate%><%=fourHoursAgoFormattedTime %>.thn.png">
					          <div class="card-img-overlay" >
					          	<h3 class="card-title " style="background-color:white; "><%=fourHoursAgoFormattedDateTimeKST %></h3>
				          	  </div>
							</div>
					     </div>
					</div>		
					<!-- 위성사진 카드 끝 -->	
							
	
					
					
						
							
							
							
						</main>
					</div>
				</div>


				<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
					crossorigin="anonymous"></script>

				<script
					src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
					integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
					crossorigin="anonymous"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
					integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
					crossorigin="anonymous"></script>
				<script src="${contextPath}/resources/js/dashboard.js"></script>




		</div>
	</main>




</body>
</html>
