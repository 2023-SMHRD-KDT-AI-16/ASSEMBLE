<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>SolarNamDo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">



<!-- Template Main CSS File -->
<link href="resources/assets/css/style.css" rel="stylesheet">


<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- Bootstrap core CSS -->
<!-- <link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script> -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        var rawData = '${apiData}';
        var parsedData = JSON.parse(rawData);
        var tmpFcstValues = [];
        var skyFcstValues = [];
        var ptyFcstValues = [];
        var popFcstValues = [];
        parsedData.response.body.items.item.forEach(function(item) {
            if (item.category === "TMP") {
                tmpFcstValues.push(item.fcstValue);
            }
             if (item.category === "SKY") {
              skyFcstValues.push(item.fcstValue);
          }
             if (item.category === "PTY") {
              ptyFcstValues.push(item.fcstValue);
          }
             if (item.category === "POP") {
              popFcstValues.push(item.fcstValue);
          }
        });
        var selectedTmpFcstValues = tmpFcstValues.slice(0, 15);
        var selectedSkyFcstValues = skyFcstValues.slice(0, 15);
        var selectedPtyFcstValues = ptyFcstValues.slice(0, 15);
        var selectedPopFcstValues = popFcstValues.slice(0, 15);
                      
        //차트 데이터 입력
        new Chart(document.getElementById("canvas"), {
            type: 'line',
            data: {
                labels: ['6', '7', '8', '9', '10', '11', '12','13','14','15','16','17','18','19','20'],
                datasets: [{
                    label: '온도',
                    data: selectedTmpFcstValues,                    
                    borderColor: "rgba(255, 201, 14, 1)",
                    backgroundColor: "rgba(255, 201, 14, 0.5)",
                    fill: false,
                    lineTension: 0
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true,
                title: {
                    display: true,
                    text: '라인 차트 테스트'
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
                            labelString: 'x축'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                            suggestedMin: 0,
                        },
                        scaleLabel: {
                            display: true,
                            labelString: 'y축'
                        }
                    }]
                }
            }
        });
        
        
         var table = document.getElementById('weatherTable');

        for (var i = 0; i < selectedPopFcstValues.length; i++) {
            table.rows[1].cells[i + 1].innerHTML = selectedPopFcstValues[i];
            table.rows[3].cells[i + 1].innerHTML = selectedSkyFcstValues[i];
        }
        
        for (var i = 0; i < selectedSkyFcstValues.length; i++) {
           
            var state = "";
            
            // 비 조건 먼저 체크
            if (selectedPtyFcstValues[i] == 1) {
                state = '<i class="bi bi-cloud-rain" style="color: coral;"></i>';
            } else if (selectedPtyFcstValues[i] == 2) {
                state = "비/눈";
            } else if (selectedPtyFcstValues[i] == 3) {
                state = "눈";
            } else if (selectedPtyFcstValues[i] == 4) {
                state = "소나기";
            } else {
                // 비가 아닐 경우 하늘 상태 체크
                if (selectedSkyFcstValues[i] <= 3) {
                    state = '<i class="bi bi-brightness-high-fill" style="color: coral;"></i>';
                } else if (selectedSkyFcstValues[i] <= 8) {
                	state = '<i class="bi bi-cloud-fill" style="color: coral;"></i>';
                } else {
                    state = "흐림";
                }
            }
            
            table.rows[2].cells[i + 1].innerHTML = state;
        }
                
        
        
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

     
     function noticeInsert(){   
     $("#noticeModal").modal("show");          
     }

     
   function showNoticeDetails(index) {
      
       $.ajax({
                 url: 'board/noticeContent.do', 
                 method: 'GET',
                 data: { b_idx : index },
                 dataType:'json',
                 success: function(data) {
                	 document.getElementById("titleDetail").innerText = data.b_title;
                	 document.getElementById("contentDetail").innerText = data.b_content;
                	 document.getElementById("created_atDetail").innerText = data.created_at;                	 
                      document.getElementById("hiddenIdx").value = data.b_idx;
                $('#noticeContent').modal('show');
                 },
                 error: function() {
                    alert("에러"); 
                    
                 }
             });
      
               
   }
     
     
    
  </script>


<style>

#notice p{
font-size:18px;
}

.n_detail{
   cursor: pointer;
}

#noticeContent{
z-index:9999;
}

.n_detail:hover p{
  text-decoration: underline;
}
    
</style>


</head>
<body style="background: #f6f9ff">
   <div class="container">

      <div>

         <jsp:include page="common/header.jsp"></jsp:include>


         <div class="panel panel-default">
         
                     
         
            <div class="panel-body " >
         
         
         <div style="display: flex; justify-content: space-between; flex-wrap: wrap;">      
                  
               <div class="card col-md-6 col-sm-12 col-xs-12" id="notice" style="height: 400px; overflow-y: auto;">
                   <h3 class="ps-3">공지사항
                   
                   <c:if test="${mvo.user_id == 'admin'}">                                                                                      
                                   <button type="button" class="btn btn-danger" onclick="noticeInsert()">공지사항 등록</button>                                                                      
                               
                   </c:if>  </h3>
                   <hr>
                   <c:forEach var="item" items="${notice}" varStatus="status">
                         <c:if test="${status.index < 8}">
                             <div class="row">
                                 <div class="col-xs-8 text-left n_detail" onclick="showNoticeDetails('${item.b_idx}')">
                                     <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" >${item.b_title}</p>
                                 </div>
                                 <div class="col-xs-4 text-right">
                                     <p>${fn:split(item.created_at, " ")[0]}</p>
                                 </div>
                             </div>
                         </c:if>
                     </c:forEach>
                   
                   
               </div>
               
               
               
               
      <div class=" col-md-6 col-sm-12 col-xs-12 " style="height: 400px; overflow:hidden;">
      
      <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:100%; height: 100%;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active" >
      <img  src="${contextPath}/resources/images/card1.jpg"  >
    </div>

    <div class="item" >
       <img  src="${contextPath}/resources/images/card2.jpg" >
    </div>

    <div class="item">
      <img  src="${contextPath}/resources/images/card3.jpg" >
    </div>
  </div>

  <!-- Left and right controls
  <a class="left carousel-control" href="#myCarousel" data-slide="prev" >
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>  -->
</div>
      
      
      
      </div> <!-- 오른쪽 패널 -->
               
               
      </div>         
                  
      </div>            
         
    
            <div class="panel-body"
               style="display: flex; justify-content: space-evenly; flex-wrap: wrap;">


               <div class="col-md-5 col-sm-5 col-xs-12 card"
                  style="height: 260px;">
                  <h3>오늘의 SMP</h3>
                  <p style="text-align: right;">(단위:원/kWh)</p>
                  <table class="table" style="text-align: center;" >
                     <colgroup>
                        <col style="width: 133px;">
                        <col style="width: auto;">
                     </colgroup>
                     <tbody>
                        <tr>
                           <th scope="row" class="info" style="text-align: center;">거래일</th>
                           <td data-label="거래일">${smpData.smpDay }</td>
                        </tr>
                        <tr>
                           <th scope="row" class="info" style="text-align: center;">최고가</th>
                           <td data-label="최고가">${smpData.maxSmp }</td>
                        </tr>
                        <tr>
                           <th scope="row" class="info" style="text-align: center;">최소가</th>
                           <td data-label="최소가">${smpData.minSmp }</td>
                        </tr>
                        <tr>
                           <th scope="row" class="info" style="text-align: center;">평균가</th>
                           <td data-label="평균가">${smpData.meanSmp }</td>
                        </tr>
                     </tbody>
                  </table>



               </div>

               <div class="col-md-5 col-sm-5 col-xs-12 card"
                  style="height: 260px;">

                  <h3>REC</h3>
                  <p style="text-align: right;">※ 매주 화, 목요일 10 : 00 ~ 16 : 00 개장
                     (단위:REC, 원/REC)</p>

                  <table class="table" style="text-align: center;">

                     <tr>
                        <th scope="row" class="info" style="text-align: center;">거래일</th>
                        <td data-label="거래일">${smpData.recDay }</td>
                        <th scope="row" class="info" style="text-align: center;">거래량</th>
                        <td data-label="거래량">${smpData.totRecValue }</td>
                     </tr>
                     <tr>
                        <th scope="row" class="info" style="text-align: center;">평균가</th>
                        <td data-label="평균가">${smpData.landAvgPrc }</td>
                        <th scope="row" class="info" style="text-align: center;">최고가</th>
                        <td data-label="최고가">${smpData.landHgPrc }</td>
                     </tr>
                     <tr>
                        <th scope="row" class="info" style="text-align: center;">최저가</th>
                        <td data-label="최저가">${smpData.landLwPrc }</td>
                        <th scope="row" class="info" style="text-align: center;">종가</th>
                        <td data-label="종가">${smpData.clsPrc }</td>
                     </tr>

                  </table>


               </div>

            </div>
           
            <!-- 온도 차트 -->
         <div class="col-md-12 col-sm-12 col-xs-12 panel ">
            <div style="width: 100%; height: 150px;">
               <canvas id="canvas"></canvas>
            </div>
         </div>
       <%
        // 현재 시간을 가져옵니다.   날씨 API 아침 5시 데이터를 이용-> 5:30분 전에는 어제 데이터 5:30분 이후에는 오늘데이터를 출력
        java.util.Calendar now = java.util.Calendar.getInstance();
        
        // 어제 날짜를 계산하기 위한 Calendar 객체를 복사합니다.
        java.util.Calendar targetDate = (java.util.Calendar) now.clone();
        
        // 현재 시간이 05:30:00 이전인지 확인합니다.
        if (now.get(java.util.Calendar.HOUR_OF_DAY) < 5 || 
            (now.get(java.util.Calendar.HOUR_OF_DAY) == 5 && now.get(java.util.Calendar.MINUTE) < 30)) {
            // 어제 날짜를 설정합니다.
            targetDate.add(java.util.Calendar.DATE, -1);
        }
        
        // 설정된 날짜를 YYYY-MM-DD 형식의 문자열로 변환합니다.
        int year = targetDate.get(java.util.Calendar.YEAR);
        int month = targetDate.get(java.util.Calendar.MONTH) + 1; // Calendar.MONTH는 0부터 시작하므로 1을 더합니다.
        int day = targetDate.get(java.util.Calendar.DAY_OF_MONTH);
        
        String formattedDate = String.format("%04d-%02d-%02d", year, month, day);
          %>




            <div class="panel-body table-responsive">
               <h3 id="tempDay"><%=formattedDate %>의 날씨</h3>
               <table class="table " id="weatherTable">

                  <tr>
                     <td>시간</td>
                     <td>06</td>
                     <td>07</td>
                     <td>08</td>
                     <td>09</td>
                     <td>10</td>
                     <td>11</td>
                     <td>12</td>
                     <td>13</td>
                     <td>14</td>
                     <td>15</td>
                     <td>16</td>
                     <td>17</td>
                     <td>18</td>
                     <td>19</td>
                     <td>20</td>

                  </tr>
                  <tr>
                     <td>강수확률(%)</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>

                  </tr>
                  <tr>
                     <td>날씨</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                  </tr>
                  <tr>
                     <td>구름량(0~10)</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                  </tr>

               </table>

            <div class="panel-body " >
               <section class="section dashboard">
                  <div class="row">
                    <div class="col-lg-12">
            
                      <!-- News & Updates Traffic -->
                      <div class="card">
                        <div class="filter">
                          <a class="icon" href="https://search.daum.net/search?w=news&nil_search=btn&DA=STC&enc=utf8&cluster=y&cluster_page=1&q=%ED%83%9C%EC%96%91%EA%B4%91&p=1&sort=accuracy" 
                          >더보기</a>
                        </div>
            
                        <div class="card-body">
                          <h5 class="card-title">News &amp; Updates</h5>
            
                          <div class="news">
                        <c:forEach var="article" items="${articles}">
                               <div class="post-item clearfix">
                               <c:if test="${empty article.thumbnailUrl}">
                                 <img src="${contextPath}/resources/images/news_null.jpg" alt="${article.title}" style="height: 100px; width: 85px;">
                               </c:if>
                               <c:if test="${not empty article.thumbnailUrl}">
                                 <img src="${article.thumbnailUrl}" alt="${article.title}" style="height: 100px; width: 85px;">
                               </c:if>
                                 <h4><a href="${article.link}">${article.title}</a></h4>
                                  <p><a href="${article.link}"style="color: inherit;">${article.summary}</a></p>
								  <p style="color: black;">${article.w_date}</p>
                               </div>
                        </c:forEach>
               
                          </div><!-- End sidebar recent posts-->
            
                        </div>
                      </div><!-- End News & Updates -->
            
                    </div><!-- End Right side columns -->
            
                  </div>
                </section>
            </div>

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
      
      
    
      
      <!-- 공지사항 등록  -->
      <div id="noticeModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
      
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">공지사항 등록하기</h4>
                 </div>
                       <form action="noticeInsert.do" method="get">
                    <div class="modal-body">제목
                      <input class="form-control" type="text" id="title" name="b_title" required="required" ><br>
                      <div class="form-label">
                      내용
                      <textarea class="form-control" required="required" name="b_content" style="resize: none; height:200px;">
   
                        </textarea>
                     </div> 
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-default" >등록하기</button>
            </div>
          </div>
            </form>
        </div>
      </div>
   </div>
      
   
      <!-- Modal 
      <div id="noticeContent" class="modal fade" role="dialog">
        <div class="modal-dialog">      
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">공지사항</h4>
                   </div>
                 <div class="modal-body">제목
                   <input class="form-control" type="text" id="titleDetail" name="b_title" readonly><br>
                   <div class="form-label">
                   내용
                   <textarea class="form-control" readonly id="contentDetail" name="b_content" style="resize: none; height:200px;">

                     </textarea>
                    </div>
            <div class="modal-footer">
               <form action="noticeDelete.do" method="get">              
                <input class="hidden" type="text" name="b_idx" id="hiddenIdx"><br>              
                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                 <c:if test="${mvo.user_id == 'admin'}">              
                <button type="submit" class="btn btn-default" >삭제하기</button>
                </form>
                
              </c:if>
              
           
            </div>
          </div>
      
        </div>
      </div>
   
   </div>   -->
    
   <!-- Modal -->
<div id="noticeContent" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                
                <h4 id="titleDetail" class="form-control-static"></h4>
                <p id="created_atDetail" ></p>
            </div>
            <div class="modal-body">                
                
                
                <div class="form-label">
                    
                    <div id="contentDetail" class="form-control-static" style="height: 200px; overflow-y: auto; font-size:16px;"></div>
                </div>
            </div>
            <div class="modal-footer">
                <form action="noticeDelete.do" method="get">
                    <input class="hidden" type="text" name="b_idx" id="hiddenIdx">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <c:if test="${mvo.user_id == 'admin'}">
                        <button type="submit" class="btn btn-danger">삭제하기</button>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</div>


  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; 2024 <strong><span>SolarNamdo</span></strong>
    </div>
  </footer>

      
       
</body>
</html>