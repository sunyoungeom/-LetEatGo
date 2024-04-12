<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LetEatGo</title>
<!-- 부트스트랩 CSS 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<!-- 부트스트랩 JS 링크 -->
<style>
/* 추가된 스타일 */
#chattingIcon {
	position: fixed;
	bottom: 20px;
	right: 20px;
	font-size: 2rem;
	background-color: #007bff;
	color: white;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	display: none;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	justify-content: center;
}

#chattingIcon:hover {
	background-color: #0056b3;
}

.chatListModal {
	position: fixed;
	bottom: 80px; /* 아이콘 위 */
	right: 20px;
	width: 300px;
	height: 400px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #ccc;
	display: none; /* 초기에는 숨김 */
}

/* 스크롤바를 나타내기 위한 스타일 */
.chatContent {
	overflow-y: scroll;
	height: 100%;
}
</style>
</head>
<body class="d-flex flex-column h-100 bg-light">
	<!-- 아이콘 추가 -->
	<div id="chatListModal" class="chatListModal">
		<div class="chatContent" id="chatListContent">
			<table>
				<tbody id="chatTableBody"></tbody>
			</table>
		</div>
	</div>
	<div id="chattingIcon" class="bi bi-chat-dots-fill" style="position: fixed; bottom: 20px; right: 20px; font-size: 2rem; cursor: pointer;"></div>

	<nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
		<div class="container px-5">
			<a class="navbar-brand" href="/index.jsp"> <span class="fw-bolder text-dark" style="font-size: 1.5rem;"> <img src="../Resources/main_icon.png" class="" style="width: 2rem;" alt="로고"> <span style="position: relative; top: 3px;">&nbsp;&nbsp;LetEatGo</span>
			</span>
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
					<%
					User user = (User) session.getAttribute("user");
					if (user != null) {
					%>
					<!-- 로그인 한 경우에만 표시되는 링크들 -->
					<li class="nav-item"><a class="nav-link me-3" href="/menu" style="font-size: 1.1rem;">음식메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/person" style="font-size: 1.1rem;">사람메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/post/list" style="font-size: 1.1rem;">후기</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/logout" style="font-size: 1.1rem;">로그아웃</a></li>
					<li class="nav-item"><a class="btn btn-dark btn-lg rounded-pill" href="/myInfo?detail=profile" style="font-size: 1.1rem;">내정보</a></li>
					<%
					} else {
					%>
					<!-- 로그인하지 않은 경우에만 표시되는 링크들 -->
					<li class="nav-item"><a class="nav-link me-3" href="/menu" style="font-size: 1.1rem;">음식메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/person" style="font-size: 1.1rem;">사람메뉴</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/post/list" style="font-size: 1.1rem;">후기</a></li>
					<li class="nav-item"><a class="nav-link me-3" href="/login" style="font-size: 1.1rem;">로그인</a></li>
					<li class="nav-item"><a class="btn btn-dark btn-lg rounded-pill" href="/join/begin" style="font-size: 1.1rem;">회원가입</a></li>
					<%
					}
					%>
					<!-- 여기에 설정 링크 추가 -->
					<!-- 설정 링크 추가 끝 -->
				</ul>
			</div>
		</div>
	</nav>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 채팅 아이콘 표시 여부 설정 -->
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    var chattingIcon = document.getElementById("chattingIcon");
	    var chatListModal = document.getElementById("chatListModal");
	    var chatTableBody = document.getElementById("chatTableBody");

	    // 채팅 아이콘 클릭 시 모달 토글
	    chattingIcon.addEventListener("click", function() {
	        if (chatListModal.style.display === "block") {
	            chatListModal.style.display = "none";
	        } else {
	            // 모달이 열릴 때 채팅 목록을 가져와서 표시
	            fetch('/chatList', {
	                method: 'POST'
	            })
	            .then((resp) => resp.json())
	            .then((data) => {
	                chatTableBody.innerHTML = ""; // 기존 목록 초기화
	                data.forEach((element) => {
	                    let contenttr = document.createElement("tr");
	                    let tdId = document.createElement("td");
	                    let tdContent = document.createElement("td");
	                    tdId.innerText = `채팅방 번호 : ${element.post_Id}`;
	                    tdContent.innerText = `제목 : ${element.title}`;
	                    
	                    // 마우스 이벤트 추가
	                    contenttr.addEventListener("mouseover", function() {
	                        contenttr.style.backgroundColor = "#f0f0f0"; // 마우스가 올라갔을 때 배경색 변경
	                    });

	                    contenttr.addEventListener("mouseout", function() {
	                        contenttr.style.backgroundColor = ""; // 마우스가 나갔을 때 배경색 초기화
	                    });
	                    
	                 // 열린 채팅 창의 참조를 저장하기 위한 변수
	                    var chatWindowReference = null;

	                    contenttr.addEventListener("click", function() {
	                        if (chatWindowReference && !chatWindowReference.closed) {
	                            // 이미 열린 채팅 창이 있는 경우 해당 창으로 포커스 이동
	                            chatWindowReference.focus();
	                        } else {
	                            var postId = element.post_Id; // 클릭된 contenttr에서 post_Id 가져오기
	                            var chatWindowUrl = "/post/ChatWindow?post_Id=" + postId; // post_Id를 포함한 URL 생성
	                            chatWindowReference = window.open(chatWindowUrl, "_blank" ,"width=400, height=550"); // 새 창으로 채팅창 열기
	                        }
	                    });


	                    contenttr.appendChild(tdId);
	                    contenttr.appendChild(tdContent);
	                    chatTableBody.appendChild(contenttr); // chatTableBody에 contenttr 추가
	                });
	            })
	            .catch((error) => {
	                console.error('Error fetching chat list:', error);
	            });

	            chatListModal.style.display = "block";
	        }
	    });

	    // 세션에 저장된 user 여부에 따라 채팅 아이콘 표시 여부 설정
	    var user = '<%= session.getAttribute("user") %>';
	    if (user !== null) {
	        chattingIcon.style.display = "block";
	    } else {
	        chattingIcon.style.display = "none";
	    }
	});
	</script>
</body>
</html>
