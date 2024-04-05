<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
<%@ include file="WEB-INF/user/navigation.jsp" %>

<!-- 	<h2>회원관리</h2>
 -->	<c:if test="${empty user}">
		<ul>
			<!-- <li><a href="/join/begin">회원가입(찐)</a></li>
			<li><a href="/login">로그인</a></li> -->
			
		</ul>
	</c:if>
	<c:if test="${not empty user}">
		<h3>${user.name}님 환영합니다!</h3>
		<ul>
			<li><a href="user?action=update">회원 정보 수정</a></li>
			<li><a href="user?action=delete">회원 탈퇴</a></li>
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/ChatingServer">ㅇㅇ</a></li>
		</ul>
	</c:if>
	${ user }

	<hr>
	<h2>
		<a href="/map">주변 음식점 찾기</a>
	</h2>
	<hr>
		<a href="/post/list">게시글 목록</a>


	<br>
</body>
</html>