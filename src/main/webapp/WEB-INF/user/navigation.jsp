<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LetEatGo</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<!-- 부트스트랩 JS 링크 -->

</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/WebSocket/ChatIcon.jsp"%>

	<nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
		<div class="container px-5">
			<a class="navbar-brand" href="/index.jsp"> <span class="fw-bolder text-dark" style="font-size: 1.5rem;"> <img src="../Resources/main_icon.png" class="" style="width: 2rem;" alt="로고"> <span style="position: relative; top: 3px;">&nbsp;&nbsp;LetEatGo</span>
			</span>
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
					<%
					User user = (User) session.getAttribute("user");
					if (user != null) {
					%>
					<!-- 로그인 한 경우에만 표시되는 링크들 -->
					<li class="nav-item"><a class="nav-link me-3" href="/menu" style="font-size: 1.1rem;">음식메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/person" style="font-size: 1.1rem;">사람메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/post/list" style="font-size: 1.1rem;">후기</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/logout" style="font-size: 1.1rem;">로그아웃</a></li>
					<li class="nav-item"><a class="btn btn-dark btn-lg rounded-pill" href="/myInfo?detail=profile" style="font-size: 1.1rem;">내정보</a></li>
					<%
					} else {
					%>
					<!-- 로그인하지 않은 경우에만 표시되는 링크들 -->
					<li class="nav-item"><a class="nav-link me-3" href="/menu" style="font-size: 1.1rem;">음식메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/person" style="font-size: 1.1rem;">사람메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/post/list" style="font-size: 1.1rem;">후기</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/login" style="font-size: 1.1rem;">로그인</a></li>
					<li class="nav-item"><a class="btn btn-dark btn-lg rounded-pill" href="/join/begin" style="font-size: 1.1rem;">회원가입</a></li>
					<%
					}
					%>
					<!-- 여기에 설정 링크 추가 -->
					<!-- 설정 링크 추가 끝 -->
				</ul>
			</div>
		</div>
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 채팅 아이콘 표시 여부 설정 -->
</body>
</html>
