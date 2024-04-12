<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사람 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.circle-container {
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-top: 35px;
	margin-bottom: 35px;
}

.circle {
	width: 250px;
	height: 250px;
	background-color: #3498db;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
	font-size: 24px;
}

.box {
	display: inline-block;
	width: 450px;
	height: 420px;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.rectangle {
	display: inline-block;
	width: 170px;
	height: 170px;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin: 10px;
}

@media screen and (max-width: 768px) {
	.box {
		width: 100%;
	}
	.rectangle {
		width: 100%;
		margin: 10px 0;
	}
	.circle-container {
		margin-right: 20px;
		margin-left: 20px;
	}
}
</style>
</head>
<body>
	<%@ include file="../user/navigation.jsp"%>
	<br>

	<div class="container d-flex justify-content-between">
		<div class="box">
			<div class="rectangle"></div>
			<div class="rectangle"></div>
			<div class="rectangle"></div>
			<div class="rectangle"></div>
		</div>

		<div>
			<div class="border p-3 mb-2"
				style="width: 600px; height: 100px; margin-right: auto; margin-top: 50px">
				주변사람 찾기</div>
			<br> <br>
			<div class="border p-3 mb-2"
				style="width: 600px; height: 100px; margin-right: auto;">최근 같이
				먹은 사람</div>
		</div>
	</div>

	<br>
	<div class="container" style="margin-right: 6%;">
		<div class="border p-3 mb-2" style="border-radius: 10px; width: 85%;">
			<div class="d-flex justify-content-between">
				<div class="d-flex align-items-center">
					<button class="btn btn-primary me-3">셔플</button>
					<input class="form-check-input me-1" type="radio" name="option"
						value="option1"> <label class="form-check-label me-3">혈액형</label>
					<input class="form-check-input me-1" type="radio" name="option"
						value="option2"> <label class="form-check-label me-3">MBTI</label>
					<input class="form-check-input me-1" type="radio" name="option"
						value="option3"> <label class="form-check-label">상관없음</label>

				</div>
				<select class="form-select" style="width: 10%;">
					<option selected>Value 1</option>
					<option>Value 2</option>
				</select>
			</div>
			<div class="circle-container">
				<div>
					<div class="circle">adfsdafsdsdfasdf</div>
					<a href="/person/detail">페이지 이동 테스트</a>
					<div>닉네임(만 00세)</div>
					<div>별점 평균</div>
					<div>태크,태크</div>
				</div>
				<div>
					<div class="circle">adfsdafsdsdfasdf</div>
					<div>닉네임(만 00세)</div>
					<div>별점 평균</div>
					<div>태크,태크</div>
				</div>
				<div>
					<div class="circle">adfsdafsdsdfasdf</div>
					<div>닉네임(만 00세)</div>
					<div>별점 평균</div>
					<div>태크,태크</div>
				</div>
			</div>
		</div>
	</div>
<<<<<<< HEAD

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
=======
	<a href="/persontest">반경로직 테스트중</a>
>>>>>>> branch 'main' of https://github.com/dongso03/-Final_Project.git
</body>
</html>
