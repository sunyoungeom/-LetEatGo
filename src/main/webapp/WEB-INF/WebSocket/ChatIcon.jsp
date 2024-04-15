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

/* 글씨의 위아래 간격 조정 */
.chatContent td {
	font-size: 14px; /* 기존에는 16px이었던 것을 원하는 크기로 변경 */
	line-height: 1.5; /* 1.5의 배수로 설정하여 위아래 간격을 조절할 수 있습니다. */
	padding: 5px 10px; /* 셀 내부 여백 설정 */
}

/* 채팅방 입장 버튼 스타일 */
.joinChatButton {
	background-color: #343a40;
	color: white;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 60px;
	height: 60px;
}


.joinChatButton:hover {
	background-color: #0056b3;
	
}

/* 버튼을 우측에 정렬 */
.buttonCell {
	text-align: right;
}

/* 가로줄 스타일 수정 */
#customHr {
	border: none;
	height: 1px;
	background-color: black;
	margin: 2px;
}
</style>
<meta charset="UTF-8">
<title>채팅 아이콘</title>
<script>
        function displayChatModal() {
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
                            let tdButton = document.createElement("td");
                            let joinButton = document.createElement("button"); // 채팅방 입장 버튼 생성

                            // 변수를 사용하여 채팅방 번호를 생성합니다.
                            tdId.innerText = element.post_Id; // 게시물 번호
                            tdContent.innerText = element.title;

                            // 채팅방 입장 버튼 설정
                            joinButton.innerText = "입장";
                            joinButton.className = "joinChatButton"; // 스타일 클래스 추가
                            joinButton.addEventListener("click", function() {
                                // 채팅방 입장 버튼을 클릭했을 때의 동작 구현
                                var postId = element.post_Id; // 클릭된 contenttr에서 post_Id 가져오기
                                var chatWindowUrl = "/post/ChatWindow?post_Id=" + postId; // post_Id를 포함한 URL 생성
                                window.open(chatWindowUrl, "_blank" ,"width=386, height=564"); // 새 창으로 채팅창 열기
                            });

                            tdButton.appendChild(joinButton); // 버튼을 td에 추가

                            // 마우스 이벤트 추가
                            contenttr.addEventListener("mouseover", function() {
                                contenttr.style.backgroundColor = "#f0f0f0"; // 마우스가 올라갔을 때 배경색 변경
                            });

                            contenttr.addEventListener("mouseout", function() {
                                contenttr.style.backgroundColor = ""; // 마우스가 나갔을 때 배경색 초기화
                            });
                            
                            tdContent.addEventListener("click", () => {
                            	var postId = element.post_Id;
                            	var postdetailURL = "/post/detail?post_Id=" + postId;
                            	window.location.href = (postdetailURL);
                            });

                            contenttr.appendChild(tdId);
                            contenttr.appendChild(tdContent);
                            contenttr.appendChild(tdButton); // 버튼이 있는 td를 contenttr에 추가
                            chatTableBody.appendChild(contenttr); // chatTableBody에 contenttr 추가

                            // 가로줄 추가
                            var horizontalLine = document.createElement("hr");
                            horizontalLine.id = "customHr"; // 원하는 아이디 값 설정
                            chatTableBody.appendChild(horizontalLine);
                        });
                    })
                    .catch((error) => {
                        console.error('Error fetching chat list:', error);
                    });

                    chatListModal.style.display = "block";
                }
            });

            // 세션에 저장된 user 여부에 따라 채팅 아이콘 표시 여부 설정
            var user = "<c:out value='${session.getAttribute("user")}' />";
            if (user !== null) {
                chattingIcon.style.display = "block";
            } else {
                chattingIcon.style.display = "none";
            }
        }

        // DOMContentLoaded 이벤트가 발생하면 displayChatModal 함수 실행
        document.addEventListener("DOMContentLoaded", displayChatModal);
    </script>
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
</body>
</html>
