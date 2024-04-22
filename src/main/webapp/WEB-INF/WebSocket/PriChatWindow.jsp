<%@page import="user.UserService"%>
<%@page import="user.User"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
 <title>일대일 채팅</title>
    <style>
        /* 채팅 컨테이너 스타일 */
        .chat-container {
            width: 300px;
            margin: 20px auto;
        }

        /* 채팅 메시지 스타일 */
        .chat-messages {
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
        }

        /* 채팅 입력창 스타일 */
        #messageInput {
            width: 200px;
            padding: 5px;
            margin-right: 5px;
        }

        /* 전송 버튼 스타일 */
        button {
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <label id="라벨">닉네임</label> :
	<input type="text" id="nickname" value="${ user.nickname }" readonly />
	<br>
	<label id="Opponentnickname">상대닉네임</label> :
	<%-- <span id="Opponentnickname">${  }</span> --%>
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" class="btn btn-dark" onclick="sendMessage();">전송</button>
		<button id="exitBtn" class="btn btn-dark" onclick="exitChatroom();">채팅방 나가기</button>
		<button id="endBtn" class="btn btn-dark" onclick="closePost()">조기마감</button>
	</div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const chatForm = document.getElementById("chatForm");
            const messageInput = document.getElementById("messageInput");
            const chatMessages = document.getElementById("chatMessages");

            // 폼 제출 이벤트 리스너
            chatForm.addEventListener("submit", function(event) {
                event.preventDefault(); // 폼 기본 동작 막기

                // 입력된 메시지 가져오기
                const message = messageInput.value;

                // 메시지를 채팅창에 추가
                appendMessage(message);

                // 입력창 비우기
                messageInput.value = "";
            });

            // 메시지 추가 함수
            function appendMessage(message) {
                const messageElement = document.createElement("div");
                messageElement.innerText = message;
                chatMessages.appendChild(messageElement);
            }
        });
    </script>
</body>
</html>