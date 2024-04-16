<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>회원 탈퇴</title>
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
<style>
/* 모달 창 스타일 */
.modal {
	display: none; /* 초기에는 화면에 표시되지 않음 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경은 반투명하게 설정 */
}

/* 모달 창 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	animation-name: animatetop;
	animation-duration: 0.4s;
}

/* 모달 창 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 모달 창 등장 애니메이션 */
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}
}
</style>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">

		<%@ include file="/WEB-INF/user/navigation.jsp"%>
		<!-- 모달 창 -->
<!-- 
		<section class="py-5">
			<div class="container px-5">
				Login form
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6"> -->
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
									<div class="col-8">

					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
							<i class="bi bi-person"></i>
						</div>
						<h1 class="fw-bolder">회원탈퇴</h1>
					</div>
							<form id="deleteForm">

								<!-- Name input-->
								<div class="row">
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control form-control-sm" id="id" name="id" type="text" 
												placeholder="Enter your name..."
												data-sb-validations="required" /> <label for="name">아이디</label>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
										</div>
									</div>
								</div>

								<!-- Password input-->
								<div class="form-floating mb-3">
									<input class="form-control form-control-sm" id="password" name="password" type="password" 
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
										id="deleteButton"
										style="font-size: 24px; padding: 20px; width: 100%;"
										type="submit">탈퇴</button>
								</div>
							</form>
							<!-- <hr class="divider mt-5"> -->
							
						</div>
					</div>
				</div>
				</div>
				</div>
				</div>
				
			</div>
		</section>

		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>정말로 탈퇴하시겠습니까?</p>
				<button id="confirmButton">확인</button>
			</div>
		</div>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->


		<script>
        // 모달 창 요소 가져오기
        var modal = document.getElementById("myModal");

        // 모달 닫기 버튼 가져오기
        var span = document.getElementsByClassName("close")[0];

        // 탈퇴 버튼 클릭 시 모달 창 띄우기
        document.getElementById('deleteForm').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 동작 방지
            modal.style.display = "block";
        });

        // 모달 닫기 버튼 클릭 시 모달 창 닫기
        span.onclick = function() {
            modal.style.display = "none";
        }

        // 모달 창 외부 클릭 시 모달 창 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // 확인 버튼 클릭 시 탈퇴 처리
        document.getElementById("confirmButton").onclick = function() {
            var id = document.getElementById('id').value;
            var password = document.getElementById('password').value;

            fetch('/leave', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ id: id, password: password })
            })
            .then(function(response) {
                if (response.ok) {
                    alert('회원 탈퇴가 완료되었습니다.');
                    window.location.href = '/index.jsp'; // 탈퇴 후 리다이렉트할 페이지
                } else {
                    response.text().then(function(errorMessage) {
                        alert(errorMessage);
                    });
                }
            })
            .catch(function(error) {
                alert('서버 오류가 발생했습니다: ' + error.message);
            });

            modal.style.display = "none"; // 모달 창 닫기
        }
    </script>
</body>
</html>
