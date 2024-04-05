<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>LetEatGo</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<!-- 부트스트랩 JS 링크 -->
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
    <div class="container px-5">
        <a class="navbar-brand" href="/index.jsp">
            <span class="fw-bolder text-dark" style="font-size: 1.5rem;">
                <img src="../Resources/main_icon.png" class="" style="width: 2rem;" alt="로고">&nbsp;&nbsp;LetEatGo
            </span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                <li class="nav-item"><a class="nav-link me-3" href="#" style="font-size: 1.1rem;">음식메뉴</a></li>
                <li class="nav-item"><a class="nav-link me-3" href="#" style="font-size: 1.1rem;">사람메뉴</a></li>
                <li class="nav-item"><a class="nav-link me-3" href="#" style="font-size: 1.1rem;">후기</a></li>
                <li class="nav-item"><a class="nav-link me-3" href="/login" style="font-size: 1.1rem;">로그인</a></li>
                <li class="nav-item"><a class="btn btn-dark btn-lg rounded-pill" href="/join/begin" style="font-size: 1.1rem;">회원가입</a></li>
            </ul>
        </div>
    </div>
</nav>
<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
