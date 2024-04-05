<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
</head>
<body>
	<h2>웹소켓 채팅 - 게시물에 대화참여 누르면 채팅방 참여하게 만들어야 함</h2>
	<h3>채팅방 입장할때 유저의 닉네임 가지고 오기(O)</h3>
	<h4></h4>
	대화명 : ${ user.nickname } , 게시판 번호 : ${ post_Id }
	<br>
	<button onclick="chatWinOpen();">채팅 참여</button>
	<input type="hidden" id="nickname" value="${ user.nickname }">
	<script>
		function chatWinOpen() {
			var nickname = document.getElementById("nickname").value; // 사용자의 닉네임 가져오기
			const post_id = document.getElementById("post_id").value;
			window.open("/post/ChatWindow?nickname=" + nickname, "", "width=400, height=450");
		}
	</script>
</body>

</html>
