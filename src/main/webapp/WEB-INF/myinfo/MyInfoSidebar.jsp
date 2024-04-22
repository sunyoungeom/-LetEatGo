<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS 파일 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
		style="width: 280px;">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap"></use>
            </svg> <span class="fs-4">내정보</span>
		</a>

		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="/myInfo?detail=profile"
				class="nav-link link-dark" aria-current="page"
				> <svg class="bi me-2" width="16"
						height="16">
                    <use xlink:href="#home"></use>
                </svg> 내프로필
			</a></li>
			<li class="nav-item"><a class="nav-link link-dark"
				data-bs-toggle="collapse" href="#collapseMenu" role="button"
				aria-expanded="false" aria-controls="collapseMenu"> <svg
						class="bi me-2" width="16" height="16">
                        <use xlink:href="#speedometer2"></use>
                    </svg> 내게시물
			</a>
				<div class="collapse" id="collapseMenu">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="/myInfo?detail=post"><svg class="bi me-2" width="32"
									height="16">
                        <use xlink:href="#speedometer2"></use>
                    </svg>내가쓴글</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/myInfo?detail=comment"><svg class="bi me-2" width="32"
									height="16">
                        <use xlink:href="#speedometer2"></use>
                    </svg>내가쓴댓글</a></li>
					</ul>
				</div></li>
	
			<li class="nav-item"><a href="/leave" class="nav-link link-dark">
					<svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#table"></use>
                    </svg> 회원탈퇴
			</a></li>
		

		<li class="nav-item"><a class="nav-link link-dark"
			data-bs-toggle="collapse" href="#collapseMenu2" role="button"
			aria-expanded="false" aria-controls="collapseMenu2"> <svg
					class="bi me-2" width="16" height="16">
					<use xlink:href="#speedometer2"></use>
				</svg> 나의 친구
		</a>
			<div class="collapse" id="collapseMenu2">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link"
						href="/myinfo/friendsList"><svg class="bi me-2" width="32"
								height="16">
					<use xlink:href="#speedometer2"></use>
				</svg>친구 목록</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/myinfo/recieve"><svg class="bi me-2" width="32"
								height="16">
					<use xlink:href="#speedometer2"></use>
				</svg>받은 친구 신청</a></li>
				</ul>
			</div></li>
		</ul>
		<hr>
		

		<!-- <div class="dropdown">
			<a href="#"
				class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle"
				id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="https://github.com/mdo.png" alt="" width="32" height="32"
				class="rounded-circle me-2"> <strong>mdo</strong>
			</a>
			<ul class="dropdown-menu text-small shadow"
				aria-labelledby="dropdownUser2">
				<li><a class="dropdown-item" href="#">New project...</a></li>
				<li><a class="dropdown-item" href="#">Settings</a></li>
				<li><a class="dropdown-item" href="#">Profile</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="#">Sign out</a></li>
			</ul>
		</div> -->
	</div>

	<!-- 부트스트랩 JS 파일 -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
