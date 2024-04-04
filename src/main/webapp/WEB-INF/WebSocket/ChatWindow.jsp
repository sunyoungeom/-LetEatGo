<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창 구현</title>
<script>
	var webSocket = new WebSocket("<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer?nickname=${ param.nickname }");
	
	var chatWindow, chatMessage, nickname;
	
	// 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
	window.onload = function() {
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		nickname = document.getElementById('nickname').value;
	}

	// 메시지 전송
	function sendMessage() {
	    var messageContent = chatMessage.value; // 메시지 내용
	    // 귓속말을 보내는 경우
	    if (messageContent.startsWith('/w') || messageContent.startsWith('/ㅈ') || messageContent.startsWith('/W')) {
	        var whisperMessage = messageContent.split(" "); // 입력된 메시지를 공백을 기준으로 분리
	        var receiver = whisperMessage[1]; // 귓속말을 받을 대상
	        var whisperContent = whisperMessage.slice(2).join(" "); // 귓속말 내용
	        // 대화창에 표시
	        chatWindow.innerHTML += "<div class='whisper-sent'>나 [귓속말 -> " + receiver + "]: " + whisperContent + "</div>";
	        // 서버로 메시지 전송
	        webSocket.send(chatId + ':' + "/w " + receiver + ' ' + whisperContent + ':' + receiver); // 귓속말 대상을 메시지에 포함
	    } else { // 귓속말을 보내지 않는 경우
	        var senderName = "나"; // 보내는 사람 이름
	        var messageHtml = "<div class='myMsg'><strong>" + senderName + ": </strong>" + messageContent + "</div>"; // 보내는 사람과 메시지 내용을 포함한 HTML 생성
	        // 대화창에 표시
	        chatWindow.innerHTML += messageHtml;
	        // 서버로 메시지 전송
	        webSocket.send(chatId + ':' + messageContent);
	    }
	    // 메시지 입력창 내용 지우기
	    chatMessage.value = "";
	    // 대화창 스크롤
	    chatWindow.scrollTop = chatWindow.scrollHeight;
	}

	// 서버와의 연결 종료
	function disconnect() {
		webSocket.close();
	}

	// 엔터 키 입력 처리
	function enterKey() {
		if (window.event.keyCode == 13) { // 13은 'Enter' 키의 코드값
			sendMessage();
		}
	}

	// 웹소켓 서버에 연결됐을 때 실행
	webSocket.onopen = function(event) {
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
	};

	// 웹소켓이 닫혔을 때(서버와의 연결이 끊켰을 때) 실행
	webSocket.onclose = function(event) {
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
	};

	webSocket.onerror = function(event) {
		alert(event.data);
		chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
	};

	// 메시지를 받았을 때 실행
	// 웹 소켓으로부터 메시지를 받았을 때 호출되는 함수
	webSocket.onmessage = function(event) {
	    var message = event.data; // 이벤트에서 메시지 추출
	    var messageParts = message.split(':'); // 메시지를 콜론(:)을 기준으로 분리
	    var sender = messageParts[0]; // 메시지를 보낸 사용자
	    var content = messageParts[1]; // 메시지 내용
	
	    // 귓속말 여부 확인
	    var isWhisper = content.startsWith("/w") || content.startsWith("/ㅈ") || content.startsWith("/W");
	    if (isWhisper) {
	        var whisperParts = content.split(" ");
	        var receiver = whisperParts[1]; // 귓속말 대상
	        var whisperContent = whisperParts.slice(2).join(" "); // 귓속말 내용
	
	        // 귓속말 표시
	        if (receiver === chatId) {
	            chatWindow.innerHTML += "<div class='whisper-received'>" + sender + " [귓속말]: " + whisperContent + "</div>";
	        }
	    } else {
	        // 일반 메시지 표시
	        chatWindow.innerHTML += "<div class='otherMsg'><strong>" + sender + ": </strong>" + content + "</div>";
	    }
	    // 대화창 스크롤
	    chatWindow.scrollTop = chatWindow.scrollHeight;
	};


</script>
<style>
#chatWindow{border:none;
			width:380px;
			height:310px;
			overflow:scroll;
			padding:5px;}
#chatMessage{wid:236px;
			 height:30px}
#sendBtn {
    height: 30px; 
    position: relative; 
    top: 2px; 
    right: -10px;}
#closeBtn{margin-bottom: 30px; 
		  position: relative;  
		  top: 2px; 
		  left: -2px;}
#chatId{width: 160px; 
		height: 25px; 
		border: 1px;
		solid #AAAAAA;
		background-color: #EEEEEE;}
.myMsg{text-align:right;}
#라벨 {
	background-color: red;
}
.whisper-received {
    color: green; /* 받은 귓속말의 색상 */
}
.whisper-sent {
    color: blue; /* 보낸 귓속말의 색상 */
}
</style>
</head>
<body>
	<label id="라벨">닉네임</label> : <input type="text" id="chatId" value="${ param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
</body>
</html>