<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.ZoneOffset"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="java.util.TimeZone"%>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>








<style>
@font-face {
	font-family: 'Ownglyph_eunbyul21-Rg';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-2@1.0/Ownglyph_eunbyul21-Rg.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

/* Bootstrap 3 container widths in Bootstrap 5 */
@media ( min-width : 768px) {
	.container {
		max-width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		max-width: 970px;
	}
}

@media ( min-width : 1200px) {
	.container {
		max-width: 1170px;
	}
}

.navbar-nav .nav-link {
	font-size: 14px;
}

.powerDiv {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

.powerDiv:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}
.nav-link{
color: black;
}

p {
	text-align: center
}
</style>


</head>

<body style="background: #f6f9ff;">
	<main>
		<div class="container">

<!-- 			<div style="display: flex; flex-direction: column;"> -->
				<jsp:include page="../common/head2.jsp"></jsp:include>

				<div class="container-fluid">
					<div class="row">


						<main class="col-md-12 ms-sm-auto col-lg-12 px-md-12">

							<!-- rec smp 카드 -->
							<div class="container" style="padding: 0">

								<br>
								<div class="row">

									<div class="col-lg-4 col-md-6 mb-4">
										<div
											class="card bg-white text-gray border border-default powerDiv"
											style="height: 220px;">
											<div class="card-body">
												<h4 class="card-title font-weight-bold text-center"
													style="margin: 0">SMP</h4>
												<p class="card-text font-weight-bold text-center"
													style="border-bottom: 1px solid #999999;">${smpData.smpDay}</p>


												<div style="display: flex; justify-content: space-around;">
													<div>
														<p class="card-text font-weight-bold"
															style="margin-bottom: 0px; color: red;">최고가</p>
														<p class="card-text font-weight-bold" style="color: red;">
															<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor"
																class="bi bi-caret-up-fill" viewBox="0 0 16 16"
																style="color: red">
 																		<path
																	d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
															</svg>
															${smpData.maxSmp}
														</p>
														<p class="card-text font-weight-bold"
															style="margin-bottom: 0px; color: blue;">최소가</p>
														<p class="card-text font-weight-bold" style="color: blue;">

															<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor"
																class="bi bi-caret-down-fill" viewBox="0 0 16 16"
																style="color: blue">
  <path
																	d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
</svg>

															${smpData.minSmp}
														</p>
													</div>

													<div
														style="display: flex; justify-content: space-around; flex-direction: column; font-style: bold">
														<p class="card-text font-weight-bold"
															style="font-size: 1.8rem; margin: 0;">평균가</p>
														<p class="card-text font-weight-bold"
															style="font-size: 2.2rem">${smpData.meanSmp}</p>
													</div>
												</div>



											</div>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 mb-4">

										<div
											class="card bg-white text-gray border border-default powerDiv"
											style="height: 220px;">
											<div class="card-body">
												<h4 class="card-title font-weight-bold text-center"
													style="margin: 0">REC</h4>
												<p class="card-text font-weight-bold text-center"
													style="border-bottom: 1px solid #999999;">${smpData.recDay}</p>


												<div style="display: flex; justify-content: space-around;">
													<div>
														<p class="card-text font-weight-bold"
															style="margin-bottom: 0px; color: red;">최고가</p>


														<p class="card-text font-weight-bold" style="color: red;">

															<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor"
																class="bi bi-caret-up-fill" viewBox="0 0 16 16"
																style="color: red">
 																		<path
																	d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z" />
															</svg>

															${smpData.landHgPrc}
														</p>
														<p class="card-text font-weight-bold"
															style="margin-bottom: 0px; color: blue;">최소가</p>
														<p class="card-text font-weight-bold" style="color: blue;">
															<svg xmlns="http://www.w3.org/2000/svg" width="16"
																height="16" fill="currentColor"
																class="bi bi-caret-down-fill" viewBox="0 0 16 16"
																style="color: blue">
  <path
																	d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
</svg>
															${smpData.landLwPrc}
														</p>
													</div>


													<div
														style="display: flex; justify-content: space-around; flex-direction: column; font-style: bold">
														<p class="card-text font-weight-bold"
															style="font-size: 1.8rem; margin: 0;">종가</p>
														<p class="card-text font-weight-bold"
															style="font-size: 2.2rem">${smpData.clsPrc}</p>
													</div>

												</div>











											</div>
										</div>
									</div>

									<div class="col-lg-4 col-md-6 mb-4">
										<div
											class="card bg-white text-gray border border-default powerDiv"
											style="height: 220px;">


										<div class="card-body">
											<h4 class="card-title font-weight-bold text-center"">내일
												예측된 발전량</h4>
												<p class="card-text font-weight-bold text-center"
													style="border-bottom: 1px solid #999999; padding-bottom: 16px ">
													  </p>
													  
													  
											<div id="tomorrowPredictionTotal" class="text-center"
												style="font-size: 1.8rem; margin: 60px 0"></div>
										</div>

									</div>
									</div>


								</div>
							</div>
							<!-- rec smp 카드 끝 -->

							<!-- 표 카드 -->

							<!-- **********나의발전량 그래프*********** -->
							<div class="col-12 mb-4">
								<div
									class="card bg-white text-gray border border-default shadow">
									<div class="card-body">

										<h2>실제의 하루 총발전량</h2>

										<div style="width: 100%; height: 400px;">
											<canvas id="canvas"></canvas>
										</div>

									</div>
								</div>
							</div>
							<!-- **********나의발전량 그래프*********** -->

						<div class="col-12 mb-4">
							<div class="card bg-white text-gray border border-default shadow">
								<div class="card-body">

									<h2>예측한 시간당 발전량</h2>

									<div class="container">
										<!-- 그래프 컨테이너 -->
										<div class="row">
											<div class="col-md-12">
												<canvas id="myChart" width="400" height="200"></canvas>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>



						<!-- 표 카드 끝 -->



							<div class="row">
								<!-- **********모델 정확도 원차트*********** -->

								<div class="col-lg-6 col-md-6 mb-4">
									<div
										class="card bg-white text-gray border border-default shadow"
										style="height: 350px;">
										<div class="card-body">
											<p style="font-size: 1.6rem">
											발전량 정확도
											</p> 
											<div class="container">
												<div class="row justify-content-center">
													<div class="col-md-10">
														<canvas id="accuracyChart" width="380" height="320"></canvas>
														<div class="text-center mt-4">
															<!-- <strong>발전량 정확도</strong> -->
														</div>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- **********모델 정확도 원차트*********** -->

								<!-- **********일별 예측된 발전량********** -->
							<div class="col-lg-6 col-md-6 mb-4">
								<div
									class="card bg-white text-gray border border-default shadow"
									style="height: 350px;">
									<div class="card-body">
										<p style="font-size: 1.6rem">일별 예측된 발전량</p>
										<div style="width: 100%; height: 300px;">
											<canvas id="weeklyPredictionChart"></canvas>
										</div>
									</div>
								</div>
							</div>
							<!-- **********일별 예측된 발전량********** -->
								
							</div>



							<!-- 차트 카드 -->
						 <div class="col-12 mb-4">
                        <div class="card bg-white text-gray border border-default shadow">
                            <div class="card-body">
                                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                                    <h1 class="h2">과거의 오늘 발전량</h1>
                                    <div class="btn-toolbar mb-2 mb-md-0"></div>
                                </div>
                                <canvas class="my-4 w-100 chartjs-render-monitor" id="pastFiveYearsChart" width="1055" height="444" style="display: block; height: 254px; width: 603px;"></canvas>
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
									<div
										class="card bg-white text-gray border border-default powerDiv"
										>
										<img class="card-img" alt="sample"
											src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=fourHoursAgoFormattedDate%><%=fourHoursAgoFormattedTime %>.thn.png">
										<div class="card-img-overlay">
											<h3 class="card-title " style="background-color: white;"><%=fourHoursAgoFormattedDateTimeKST %></h3>
										</div>
									</div>
								</div>

								<div class="col-lg-3 col-md-6 mb-4">
									<div
										class="card bg-white text-gray border border-default powerDiv"
										>
										<img class="card-img" alt="sample"
											src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=threeHoursAgoFormattedDate%><%=threeHoursAgoFormattedTime %>.thn.png">
										<div class="card-img-overlay">
											<h3 class="card-title " style="background-color: white;"><%=threeHoursAgoFormattedDateTimeKST %></h3>
										</div>
									</div>
								</div>

								<div class="col-lg-3 col-md-6 mb-4">
									<div
										class="card bg-white text-gray border border-default powerDiv"
										>
										<img class="card-img" alt="sample"
											src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=twoHoursAgoFormattedDate%><%=twoHoursAgoFormattedTime %>.thn.png">
										<div class="card-img-overlay">
											<h3 class="card-title " style="background-color: white;"><%=twoHoursAgoFormattedDateTimeKST %></h3>
										</div>
									</div>
								</div>


								<div class="col-lg-3 col-md-6 mb-4">
									<div
										class="card bg-white text-gray border border-default powerDiv"
										>
										<img class="card-img" alt="sample"
											src="https://www.kma.go.kr/repositary/image/sat/gk2a/KO/gk2a_ami_le1b_rgb-true_ko010lc_<%=oneHourAgoFormattedDate%><%=oneHourAgoFormattedTime %>.thn.png">
										<div class="card-img-overlay">
											<h3 class="card-title " style="background-color: white;"><%=oneHourAgoFormattedDateTimeKST%></h3>
										</div>
									</div>
								</div>



							</div>
							<!-- 위성사진 카드 끝 -->








						</main>
					</div>
				</div>


				<!-- <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
					crossorigin="anonymous"></script>

				<script
					src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
					integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
					crossorigin="anonymous"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
					integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
					crossorigin="anonymous"></script> -->


				<script>
					
					new Chart(document.getElementById("canvas"), {
					    type: 'horizontalBar',
					    data: {
					        labels: ['06-13', '06-14', '06-15', '06-16', '06-17', '06-18', '06-19'],
					        datasets: [{
					            label: "태양광",
					            data: [10, 8, 30, 8, 40, 25, 50],
					            borderColor: "rgba(255, 201, 14, 1)",
					            backgroundColor: "rgba(98,200,198, 0.5)",
					            fill: false,
					        }]
					    },
					    options: {
					    	maintainAspectRatio: false,
					        responsive: true,
					        title: {
					            display: true,
					            text: '태양광 발전량'
					        },
					        tooltips: {
					            mode: 'index',
					            intersect: false,
					        },
					        hover: {
					            mode: 'nearest',
					            intersect: true
					        },
					        scales: {
					            xAxes: [{
					                display: true,
					                scaleLabel: {
					                    display: true,
					                    labelString: '발전량(MW)'
					                },
					                    ticks: {
					                    min: 0  // x축 최소값을 0으로 설정
					                },
					            }],
					            yAxes: [{
					                display: true,
					                ticks: {
					                    autoSkip: false,
					                },
					                scaleLabel: {
					                    display: true,
					                    labelString: '날짜'
					                },
					                
					            }]
					        },
					        legend: {
					            display: false  // 범례(legend)를 숨김
					        }
					    }
					});
					
					</script>

			</div>
	</main>

	<script>
	$(document).ready(function() {
		function fetchWeeklyPredictionData() {
			$.ajax({
				url: "${pageContext.request.contextPath}/getWeeklyPredictionData",
				method: "GET",
				dataType: "json",
				success: function(data) {
					var groupedData = {};
					data.forEach(function(e) {
						var date = new Date(e.predDate).toISOString().split('T')[0];
						if (!groupedData[date]) {
							groupedData[date] = 0;
						}
						groupedData[date] += e.predPower;
					});

					var labels = Object.keys(groupedData);
					var dataPower = Object.values(groupedData);

					var chartData = {
						labels: labels,
						datasets: [{
							label: '예측된 발전량 (W)',
							data: dataPower,
							backgroundColor: 'rgba(54, 162, 235, 0.2)',
							borderColor: 'rgba(92, 154, 221, 1)',
							borderWidth: 1
						}]
					};

					var ctx = document.getElementById('weeklyPredictionChart').getContext('2d');
					new Chart(ctx, {
						type: 'bar',
						data: chartData,
						options: {
							scales: {
								xAxes: [{
									scaleLabel: {
										display: true,
										labelString: '날짜'
									}
								}],
								yAxes: [{
									scaleLabel: {
										display: true,
										labelString: '발전량 (W)'
									},
									ticks: {
										beginAtZero: true
									}
								}]
							},
							tooltips: {
								callbacks: {
									label: function(tooltipItem, data) {
										return 'Power: ' + tooltipItem.yLabel.toLocaleString() + ' W';
									}
								}
							}
						}
					});
				},
				error: function(xhr, status, error) {
					console.error("주간 예측 발전량 가져오기 실패:", error);
				}
			});
		}

		
		
		
		
		
		function fetchPredictionData() {
			$.ajax({
				url: "${pageContext.request.contextPath}/getPredictionData",
				method: "GET",
				dataType: "json",
				success: function(data) {
					console.log("Fetched Prediction Data:", data);  // 데이터 확인용 로그

					var labels = data.map(function(e) {
						var date = new Date(e.predDate);
						var dateString = date.getFullYear() + '-' + (date.getMonth() + 1).toString().padStart(2, '0') + '-' + date.getDate().toString().padStart(2, '0');
						var hours = e.predTime.toString().padStart(2, '0');
						var label = dateString + " " + hours + ":00";
						console.log("Label:", label);  // 각 레이블 로그 출력
						return label;
					});

					var dataPower = data.map(function(e) {
						return e.predPower;
					});

					console.log("Labels:", labels);  // 데이터 검증용 로그
					console.log("Data Power:", dataPower);  // 데이터 검증용 로그

					var chartData = {
						labels: labels,
						datasets: [{
							label: '예측한 발전량',
							data: dataPower,
							backgroundColor: 'rgba(54, 162, 235, 0.2)',
							borderColor: 'rgba(92, 154, 221, 1)',
							borderWidth: 1,
							pointBackgroundColor: 'rgba(255, 99, 132, 1)', // 포인트 색상
							pointBorderColor: 'rgba(255, 99, 132, 1)', // 포인트 테두리 색상
							pointRadius: 2, // 포인트 크기
							pointHoverRadius: 6, // 포인트 호버 크기
							pointHoverBackgroundColor: 'rgba(75, 192, 192, 1)', // 호버 시 포인트 색상
							pointHoverBorderColor: 'rgba(75, 192, 192, 1)', // 호버 시 포인트 테두리 색상
							fill: true // 채우기 있음
						}]
					};

					var ctx = document.getElementById('myChart').getContext('2d');

					new Chart(ctx, {
						type: 'line',
						data: chartData,
						options: {
							scales: {
								xAxes: [{
									scaleLabel: {
										display: true,
										labelString: '시간'
									},
									ticks: {
										autoSkip: true,
										maxTicksLimit: 20
									}
								}],
								yAxes: [{
									scaleLabel: {
										display: true,
										labelString: '발전량'
									},
									ticks: {
										beginAtZero: true
									}
								}]
							},
							tooltips: {
								callbacks: {
									label: function(tooltipItem, data) {
										return 'Power: ' + tooltipItem.yLabel.toLocaleString();
									}
								}
							}
						}
					});
				},
				error: function(xhr, status, error) {
					console.error("데이터 가져오기 실패:", error);
				}
			});
		}

		function drawAccuracyChart() {
			var ctx = document.getElementById('accuracyChart').getContext('2d');
			var data = {
				datasets: [{
					data: [55, 45],
					backgroundColor: ['#4caf50', '#dcdcdc'],
					hoverBackgroundColor: ['#388e3c', '#c0c0c0'],
					borderWidth: 0
				}]
			};

			var options = {
				rotation: 1 * Math.PI,
				circumference: 1 * Math.PI,
				cutoutPercentage: 80,
				tooltips: {
					enabled: true,
					callbacks: {
						label: function(tooltipItem, data) {
							var dataset = data.datasets[tooltipItem.datasetIndex];
							var currentValue = dataset.data[tooltipItem.index];
							return currentValue + '%';
						}
					}
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				plugins: {
					datalabels: {
						display: true,
						formatter: function(value, context) {
							if (context.dataIndex === 0) {
								return value + '%';
							} else {
								return '';
							}
						},
						color: '#333',
						font: {
							weight: 'bold',
							size: '16'
						}
					}
				}
			};

			var myDoughnutChart = new Chart(ctx, {
				type: 'doughnut',
				data: data,
				options: options
			});

			Chart.pluginService.register({
				beforeDraw: function(chart) {
					if (chart.config.type === 'doughnut') {
						var width = chart.chart.width,
							height = chart.chart.height,
							ctx = chart.chart.ctx;

						ctx.restore();
						var fontSize = (height / 114).toFixed(2);
						ctx.font = fontSize + "em sans-serif";
						ctx.textBaseline = "middle";

						var text = "55%",
							textX = Math.round((width - ctx.measureText(text).width) / 2),
							textY = height / 1.3;

						ctx.fillText(text, textX, textY);
						ctx.save();
					}
				}
			});

			myDoughnutChart.update();
		}

		function fetchTomorrowPredictionTotal() {
			$.ajax({
				url: "${pageContext.request.contextPath}/getTomorrowPredictionTotal",
				method: "GET",
				success: function(total) {
					console.log("Tomorrow's Total Power:", total);  // 내일 총 발전량 확인용 로그
					$("#tomorrowPredictionTotal").text(total.toFixed(2) + " MW");
				},
				error: function(xhr, status, error) {
					console.error("내일 예측 발전량 가져오기 실패:", error);
				}
			});
		}

		function fetchPastFiveYearsData() {
	        $.ajax({
	            url: "${pageContext.request.contextPath}/getPastFiveYearsData",
	            method: "GET",
	            dataType: "json",
	            success: function(data) {
	                var labels = [];
	                var values = [];
	                data.forEach(function(item) {
	                    labels.push(item.date);
	                    values.push(item.pwrAmount);
	                });

	                var ctx = document.getElementById('pastFiveYearsChart').getContext('2d');
	                new Chart(ctx, {
	                    type: 'bar',
	                    data: {
	                        labels: labels,
	                        datasets: [{
	                            label: '발전량 (W)',
	                            data: values,
	                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
	                            borderColor: 'rgba(75, 192, 192, 1)',
	                            borderWidth: 1
	                        }]
	                    },
	                    options: {
	                        scales: {
	                            xAxes: [{
	                                scaleLabel: {
	                                    display: true,
	                                    labelString: '날짜'
	                                }
	                            }],
	                            yAxes: [{
	                                scaleLabel: {
	                                    display: true,
	                                    labelString: '발전량 (W)'
	                                },
	                                ticks: {
	                                    beginAtZero: true
	                                }
	                            }]
	                        },
	                        tooltips: {
	                            callbacks: {
	                                label: function(tooltipItem, data) {
	                                    return 'Power: ' + tooltipItem.yLabel.toLocaleString() + ' W';
	                                }
	                            }
	                        }
	                    }
	                });
	            },
	            error: function(xhr, status, error) {
	                console.error("과거 5년 데이터 가져오기 실패:", error);
	            }
	        });
	    }

		fetchPredictionData();
		drawAccuracyChart();
		fetchTomorrowPredictionTotal();
		fetchWeeklyPredictionData();
	    fetchPastFiveYearsData();
	});
</script>

						






</body>
</html>
