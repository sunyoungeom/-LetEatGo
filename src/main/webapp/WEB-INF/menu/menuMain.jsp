<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>LetEatGo</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
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
<link href="./Resources/css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>

	<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center">
			<form class="d-flex flex-row align-items-center col-8">
				<input class="form-control mr-2 rounded-pill" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success rounded-pill" type="submit">
					<i class="bi bi-search"></i>
					<!-- 돋보기 아이콘 -->
				</button>
			</form>
		</div>
	
	</main>

	<h2>
		<a href="/map">주변 음식점 찾기</a>
		<a href="/recent"> 최근 간 음식점 </a>
	</h2>




	<!-- Call to action section-->
	<!--   <section class="py-5 bg-gradient-primary-to-secondary text-white">
                <div class="container px-5 my-5">
                    <div class="text-center">
                        <h2 class="display-4 fw-bolder mb-4">Let's build something together</h2>
                        <a class="btn btn-outline-light btn-lg px-5 py-3 fs-6 fw-bolder" href="contact.html">Contact me</a>
                    </div>
                </div>
            </section>
        </main> -->
	<!-- Footer-->
	<footer class="bg-white py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0">Copyright &copy; LetEatGo 2024</div>
				</div>
				<div class="col-auto">
					<a class="small" href="#!">Privacy</a> <span class="mx-1">&middot;</span>
					<a class="small" href="#!">Terms</a> <span class="mx-1">&middot;</span>
					<a class="small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>