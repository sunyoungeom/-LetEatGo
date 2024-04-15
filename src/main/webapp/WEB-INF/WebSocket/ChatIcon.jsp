<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>채팅 아이콘</title>
</head>
<body>
	<div id="chatListModal" class="chatListModal">
		<div class="chatContent" id="chatListContent">
			<table>
				<tbody id="chatTableBody"></tbody>
			</table>
		</div>
	</div>
	<div id="chattingIcon" class="bi bi-chat-dots-fill"
		style="position: fixed; bottom: 20px; right: 20px; font-size: 2rem; cursor: pointer;"></div>
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
	    var user = '<%=session.getAttribute("user")%>';
	    if (user !== null) {
	        chattingIcon.style.display = "block";
	    } else {
	        chattingIcon.style.display = "none";
	    }
	});
	</script>
</body>

</html>