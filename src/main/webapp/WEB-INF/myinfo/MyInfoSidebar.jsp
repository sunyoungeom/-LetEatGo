<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title>
 -->
</head>
<body>
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light"
		style="width: 280px;">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
                                    <use xlink:href="#bootstrap"></use></svg>
			<span class="fs-4">내정보</span>
		</a>

		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="/myInfo?detail=profile" class="nav-link active" aria-current="page" onclick="changeContent('내프로필')"> 
			<svg class="bi me-2" width="16" height="16"><use xlink:href="#home"></use></svg>
					내프로필
			</a></li>
			<li><a href="/myInfo?detail=post" class="nav-link link-dark"
				onclick="changeContent('내게시물')"> <svg class="bi me-2" width="16"
						height="16">
                                        <use xlink:href="#speedometer2"></use></svg>
					내게시물
			</a></li>
			<li><a href="#" class="nav-link link-dark"> <svg
						class="bi me-2" width="16" height="16">
                                        <use xlink:href="#grid"></use></svg>
					친구관리
			</a></li>
			<li><a href="/leave" class="nav-link link-dark"> <svg
						class="bi me-2" width="16" height="16">
                                        <use xlink:href="#table"></use></svg>
					회원탈퇴
			</a></li>
			<li><a href="#" class="nav-link link-dark"> <svg
						class="bi me-2" width="16" height="16">
                                        <use xlink:href="#people-circle"></use></svg>
					Customers
			</a></li>
		</ul>
		<hr>

		<div class="dropdown">
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
		</div>
	</div>

</body>
</html>