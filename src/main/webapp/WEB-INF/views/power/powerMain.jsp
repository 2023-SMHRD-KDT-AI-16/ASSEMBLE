<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    </style>
    
    	
</head>

<body>
	<main>
		<div class="container">

				<div style="display: flex; flex-direction: row;">
				<jsp:include page="../common/dash.jsp"></jsp:include>

				<div class="container-fluid">
					<div class="row">
						

						<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
								<h1 class="h2">Dashboard</h1>
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

							<h2>Section title</h2>
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
