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
<title>내프로필</title>
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
					<div class="row align-items-center">
						<!-- 내정보 -->
						<div class="col-md-3 mb-3 mb-md-0" style="height: 500px;">
							<%@ include file="/WEB-INF/myinfo/MyInfoSidebar.jsp"%>
						</div>
						<!-- 테이블 -->
						<div class="col-md-9">
							<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
								<div class="row justify-content-center">
									<div class="col-10">
										<div class="border rounded">
											<table class="table" id="postTable"
												style="margin-bottom: 0px;">
												<tr>
													<th scope="col" style="width: 90%; padding: 0px;"></th>
													<th scope="col" style="width: 10%; padding: 0px;"></th>
												</tr>
												<tr>
													<th scope="row" style="padding-left: 1.5em; border-bottom: none;">
														<div class="name_text" style="font-size: 30px;">${ user.name }</div>
													</th>
												</tr>
												<tr>
												<th scope="row" style="padding-left: 1.5em;">
														<i class="bi bi-person" style="padding-right: 0.5em;"></i>${ user.nickname }</th>
													<td>
														<button>수정</button>
													</td>
												</tr>
												<tr>
													<th scope="row" style="padding-left: 1.5em;"><i
														class="bi bi-phone" style="padding-right: 0.5em;"></i>${ user.phonenumber }</th>
													<td>
														<button>수정</button>
													</td>
												</tr>
												<tr>
													<th scope="row" style="padding-left: 1.5em;"><i
														class="bi bi-envelope" style="padding-right: 0.5em;"></i>${ user.email }</th>
													<td>
														<button>수정</button>
													</td>
												</tr>
											</table>

										</div>
									</div>
								</div>

							</div>





						</div>
					</div>
		</section>
		<!-- Bootstrap core JS-->
		<!-- <script src="js/scripts.js"></script><! -->
	</main>
</body>
</html>
