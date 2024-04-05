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
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
						style="width: 280px;">
						<a href="/"
							class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
							<svg class="bi me-2" width="40" height="32">
								<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">Sidebar</span>
						</a>

						<hr>
						<ul class="nav nav-pills flex-column mb-auto">
							<li class="nav-item"><a href="#" class="nav-link active"
								aria-current="page"> <svg class="bi me-2" width="16"
										height="16">
										<use xlink:href="#home"></use></svg> Home
							</a></li>
							<li><a href="#" class="nav-link link-dark"> <svg
										class="bi me-2" width="16" height="16">
										<use xlink:href="#speedometer2"></use></svg> Dashboard
							</a></li>
							<li><a href="#" class="nav-link link-dark"> <svg
										class="bi me-2" width="16" height="16">
										<use xlink:href="#table"></use></svg> Orders
							</a></li>
							<li><a href="#" class="nav-link link-dark"> <svg
										class="bi me-2" width="16" height="16">
										<use xlink:href="#grid"></use></svg> Products
							</a></li>
							<li><a href="#" class="nav-link link-dark"> <svg
										class="bi me-2" width="16" height="16">
										<use xlink:href="#people-circle"></use></svg> Customers
							</a></li>
						</ul>
						<hr>

						<div class="dropdown">
							<a href="#"
								class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
								id="dropdownUser2" data-bs-toggle="dropdown"
								aria-expanded="false"> <img src="https://github.com/mdo.png"
								alt="" width="32" height="32" class="rounded-circle me-2">
								<strong>mdo</strong>
							</a>
							<ul class="dropdown-menu text-small shadow"
								aria-labelledby="dropdownUser2">
								<li><a class="dropdown-item" href="#">New project...</a></li>
								<li><a class="dropdown-item" href="#">Settings</a></li>
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Sign out</a></li>
							</ul>
						</div>
						${user }
					</div>

					<!-- <!-- 	
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
