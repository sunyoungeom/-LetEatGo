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
<title>내게시물</title>
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
									<div class="col-12">
										<h3>내가쓴글</h3>
										<table class="table table-hover table-bordered" id="postTable">
											<thead class="table-light">
												<tr>
													<th scope="col" style="width: 70%;">제목</th>
													<th scope="col" style="width: 15%;">작성일</th>
													<th scope="col" style="width: 15%;"></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<tr>
													<th scope="row">하이하이여</th>
													<td>2024-04-06</td>
													<td>
														<button style="margin-right: 5px;">수정</button>
														<button>삭제</button>
													</td>
												</tr>
											</tbody>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
										<div id="pagination"></div>
									</div>
								</div>
							</div>
							
						<div class="col-md-12">
							<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
								<div class="row justify-content-center">
									<div class="col-12">
										<h3>내가쓴댓글</h3>
										<table class="table table-hover table-bordered" id="postTable">
											<thead class="table-light">
												<tr>
													<th scope="col" style="width: 70%;">제목</th>
													<th scope="col" style="width: 15%;">작성일</th>
													<th scope="col" style="width: 15%;"></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<tr>
													<th scope="row">하이하이여</th>
													<td>2024-04-06</td>
													<td>
														<button style="margin-right: 5px;">수정</button>
														<button>삭제</button>
													</td>
												</tr>
											</tbody>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
										<div id="pagination"></div>
									</div>
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
