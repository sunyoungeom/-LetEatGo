<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>웹소켓 채팅</title>
	</head>

	<body>
		<script>
			function chatWinOpen() {
				var id = document.getElementById("chatId");
				if (id.value == user.getNickName()) {
					id.focus();
					return;
				}
				window.open("ChatWindow.jsp?chatId=" + id.value, "",
					"width=400, height= 400");
				id.value = "";
			}
		</script>
		<h2>웹소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
		대화명 : <input type="text" id="chatId" />
		<button onclick="chatWinOpen();">채팅 참여</button>
	</body>

	</html>