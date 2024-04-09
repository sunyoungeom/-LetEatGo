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
	<%@ include file="WEB-INF/user/navigation.jsp"%>
	

	<main class="flex-shrink-0">
		<!-- Projects Section-->
		<section class="py-5">
			<div class="container px-5 mb-5">
				<div class="text-center mb-5">
					<h1 class="display-5 fw-bolder mb-0">
						<span class="text-gradient d-inline">아 혼자 먹기 싫다...</span>
					</h1>
				</div>
				<div class="row justify-content-center gx-5">
					<div class="col-lg-11 col-xl-9 col-xxl-8">
						<!-- Project Cards -->
						<div
							class="row row-cols-1 row-cols-md-3 g-4 justify-content-center">
							<!-- Project Card 1-->
							<div class="col">
								<div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
									<div class="card-body p-0">
										<!-- 주소추가 -->
										<a href="/menu" style="text-decoration: none; color: inherit;">
											<div class="d-flex flex-column align-items-center">
												<div class="p-5">
													<h2 class="fw-bolder">음식메뉴</h2>
												</div>
												<img class="img-fluid"
													src="https://dummyimage.com/300x300/343a40/6c757d"
													alt="Project 1" />
											</div>
										</a>
									</div>
								</div>
							</div>
							<!-- Project Card 2-->
							<div class="col">
								<div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
									<div class="card-body p-0">
										<!-- 주소추가 -->
										<a href="/person"
											style="text-decoration: none; color: inherit;">
											<div class="d-flex flex-column align-items-center">
												<div class="p-5">
													<h2 class="fw-bolder">사람찾기</h2>
												</div>
												<img class="img-fluid"
													src="https://dummyimage.com/300x300/343a40/6c757d"
													alt="Project 2" />
											</div>
										</a>
									</div>
								</div>
							</div>
							<!-- Project Card 3-->
							<div class="col">
								<div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
									<div class="card-body p-0">
										<!-- 주소추가 -->
										<a href="/post/list"
											style="text-decoration: none; color: inherit;">
											<div class="d-flex flex-column align-items-center">
												<div class="p-5">
													<h2 class="fw-bolder">후기모음</h2>
												</div>
												<img class="img-fluid"
													src="https://dummyimage.com/300x300/343a40/6c757d"
													alt="Project 3" />
											</div>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<c:if test="${not empty user}">
		<h3>${user.name}님환영합니다!</h3>
	</c:if>
	${ user }

	<hr>
	




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