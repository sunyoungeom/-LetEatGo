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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<style>
.text-gradient2 {
	background: -webkit-linear-gradient(315deg, #000000 0%, #c4c4c4 50%, #ffffff 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
</style>

</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="WEB-INF/user/navigation.jsp"%>


	<main class="flex-shrink-0">
		<!-- Projects Section-->
		<section class="py-5">
			<div class="container px-5 mb-5">
				<div class="text-center mb-5">
					<h1 class="display-5 fw-bolder mb-0">
						<span class="text-gradient2 inline">아 혼자 먹기 싫다...</span>
					</h1>
				</div>
				<div class="row justify-content-center gx-5">
					<div class="col-lg-11 col-xl-9 col-xxl-8">
						<!-- Project Cards -->
						<div
							class="row row-cols-1 row-cols-md-3 g-4 justify-content-center">
							<!-- Project Card 1-->
							<div class="col">
								<div class="card overflow-hidden shadow rounded-4 border-0 mb-5"
									style="display: flex; flex-direction: column; justify-content: center; height: 100%;">

									<div class="card-body p-0">
										<!-- 주소추가 -->
										<a href="/menu" style="text-decoration: none; color: inherit;">
											<div class="d-flex flex-column align-items-center">
												<div class="p-5">
													<h2 class="fw-bolder">음식메뉴</h2>
												</div>
												<i class="fa-solid fa-utensils"
													style="font-size: 120px; color: #343a40; margin-bottom: 20px;"></i>
											</div>
										</a>
									</div>
								</div>
							</div>
							<!-- Project Card 2-->
							<div class="col">
								<div class="card overflow-hidden shadow rounded-4 border-0 mb-5"
									style="display: flex; flex-direction: column; justify-content: center; height: 100%;">
									<div class="card-body p-0">
										<!-- 주소추가 -->
										<a href="/person"
											style="text-decoration: none; color: inherit;">
											<div class="d-flex flex-column align-items-center">
												<div class="p-5">
													<h2 class="fw-bolder">사람찾기</h2>
												</div>
												<i class="fa-solid fa-user-group"
													style="font-size: 120px; color: #343a40; margin-bottom: 20px;"></i>

											</div>
										</a>
									</div>
								</div>
							</div>
							<!-- Project Card 3-->
							<div class="col">
								<div class="card overflow-hidden shadow rounded-4 border-0 mb-5"
									style="display: flex; flex-direction: column; justify-content: center; height: 100%;">
									<div class="card-body p-0">
										<!-- 주소추가 -->
										<a href="/post/list"
											style="text-decoration: none; color: inherit;">
											<div class="d-flex flex-column align-items-center">
												<div class="p-5">
													<h2 class="fw-bolder">후기모음</h2>
												</div>
												<i class="fa-solid fa-clipboard-list"
													style="font-size: 120px; color: #343a40; margin-bottom: 20px;"></i>
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
	<div id="test"><a href="/user/userReview">test</a> </div>
	</main>

	<%@ include file="/WEB-INF/layout/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- <!-- 	 -->
	<script src="js/scripts.js"></script>
</body>
</html>