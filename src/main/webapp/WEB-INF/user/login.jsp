<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>로그인</title>
<!-- Favicon--
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
<!-- <body> -->
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/user/navigation.jsp"%>

		

		<section class="py-5">
			<div class="container px-5">
				<!-- Login form-->
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
							<i class="bi bi-person"></i>
						</div>
						<h1 class="fw-bolder">LetEatGo</h1>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6">
							<form action="login" method="post">
								<!-- Name input-->
								<div class="row">
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" name="username" type="text"
												placeholder="Enter your name..."
												data-sb-validations="required" /> <label for="name">아이디</label>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
										</div>
									</div>
								</div>

								<!-- Password input-->
								<div class="form-floating mb-3">
									<input class="form-control" name="password" type="password"
										placeholder="name@example.com"
										data-sb-validations="required,email" /> <label for="email">비밀번호</label>
									<div class="invalid-feedback" data-sb-feedback="email:required">An
										email is required.</div>
									<div class="invalid-feedback" data-sb-feedback="email:email">Email
										is not valid.</div>
								</div>
								<!-- Submit Button-->
								<div class="d-grid mt-5">
									<button class="btn btn-dark btn-lg rounded-pill"
										style="font-size: 24px; padding: 20px; width: 100%;"
										type="submit">로그인</button>
								</div>
							</form>
							<!-- <hr class="divider mt-5"> -->
							<div class="d-grid mt-4">
								<a href="javascript:kakaoLogin()"> <img
									src="./Resources/kakao_login_large_wide.png"
									class="rounded-pill" style="width: 100%;" alt="카카오로 로그인하기">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<!-- <script src="js/scripts.js"></script><! -->
</body>
</html>
