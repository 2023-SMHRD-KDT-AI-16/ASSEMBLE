<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="kr">
<head>
<title>SolarNamDo</title>
<meta charset="UTF-8">


 <style>
 @import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
 @font-face{
 font-family: "Sinoreta_PERSONAL_USE_ONLY";
 }
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: white;
        }

        .bg-video-wrap {
            position: relative;
            height: 100%;
            width: 100%;
            overflow: hidden;
        }

        .bg-video-wrap video {
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: 1;
            background: url('your-image.jpg') no-repeat;
            background-size: cover;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Optional: Adds a dark overlay */
            z-index: 2;
        }

        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            z-index: 3;
        }

        .content h1 {
            font-size: 3rem;
        }

        .content p {
            font-size: 1.5rem;
        }

        .content .btn {
            margin-top: 20px;
        }
        .explore-link {
        color: white; /* 텍스트 색상 */
        background-color: white; /* 배경 색상 */
        padding: 10px 20px; /* 패딩 */
        text-decoration: none; /* 밑줄 제거 */
        border-radius: 5px; /* 모서리 둥글게 */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        transition: background-color 0.3s, box-shadow 0.3s; /* 효과 전환 */
    }
    .explore-link:hover {
        background-color: #FF6347; /* 호버 시 배경 색상 */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 */
    }
    </style>
    
</head>
<body>
    <div class="bg-video-wrap" >
        <video src="${pageContext.request.contextPath}/resources/video/intro_down.mp4" autoplay loop muted></video>
        <div class="overlay"></div>
        <div class="content">
            <h1>SOLLANAMDO</h1>
            <h2 style="margin-bottom: 1px">POWER GENERATION PREDICTION SOLUTION</h3>
            <p style="font-size: 1rem; margin: 0px" >INNOVATIVE GREEN SOLUTIONS FOR A BETTER TOMORROW</p>
            <span>
            <br>오직 단 하루! 퍼포먼스 퀸 효린이 준비한 ONE&ONLY 【 2024 효린쇼 】 월드투어 콘서트
            </span>
				<div>
					<a href="${contextPath}/index" class="btn btn-primary explore-link">EXPLORE</a>
				</div>
		</div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>