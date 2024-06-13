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
    </style>
    
</head>
<body>
    <div class="bg-video-wrap">
        <video src="your-video.mp4" autoplay loop muted></video>
        <div class="overlay"></div>
        <div class="content">
            <h1>SOLLANAMDO</h1>
            <h2>POWER GENERATION PREDICTION SOLUTION</h3>
            <p>ONLY ONE DAY! PERFORMANCE QUEEN HYOLYN PREPARED THE ONE&ONLY SHOW<br>오직 단 하루! 퍼포먼스 퀸 효린이 준비한 ONE&ONLY 【 2024 효린쇼 】 월드투어 콘서트</p>
            <a href="${contextPath}/index" class="btn btn-primary">EXPLORE</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>