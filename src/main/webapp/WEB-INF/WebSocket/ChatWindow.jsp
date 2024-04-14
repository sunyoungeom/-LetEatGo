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
<meta charset="UTF-8">
<title>채팅창 구현</title>
<script>
var webSocket = new WebSocket('<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer/${post_Id}/${user.nickname}');

var postId = "${ post_Id }"; // JSP 페이지로부터 전달받은 post_id 값
var chatWindow, chatMessage, nickname;

// 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
window.onload = function() {
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    nickname = document.getElementById("nickname").value;
}

//메시지 전송
function sendMessage() {
    var messageContent = chatMessage.value; // 메시지 내용
    if (!postId) {
        alert("게시물을 선택하세요.");
        return;
    }
    if (!messageContent) { // 메시지가 비어있는 경우 전송하지 않음
        return;
    }
    
    // 귓속말 여부 확인
    var isWhisper = messageContent.startsWith("/w") || messageContent.startsWith("/ㅈ") || messageContent.startsWith("/W");
    var receiverId = -1; // 수신자 ID
    if (isWhisper) {
        // 귓속말 대상 추출
        var whisperParts = messageContent.split(" ");
        receiverId = whisperParts[1]; // 귓속말 대상의 ID
    }

    // JSON 데이터 생성
    var jsonData = { 
        sender: nickname,
        content: messageContent,
        isWhisper: isWhisper, // 귓속말 여부
        receiverId: receiverId // 수신자 ID
    };

    // 서버로 JSON 데이터 전송
    webSocket.send(JSON.stringify(jsonData));

    // 메시지 입력창 내용 지우기
    chatMessage.value = "";
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

webSocket.onmessage = function(event) {
    var message = JSON.parse(event.data); // JSON 형식으로 메시지 파싱
    var sender = message.sender; // 메시지를 보낸 사용자
    var content = message.content; //

    // 귓속말 여부 확인
    var isWhisper = content.startsWith("/w") || content.startsWith("/ㅈ") || content.startsWith("/W");
    if (isWhisper) {
        var whisperParts = content.split(" ");
        var receiver = whisperParts[1]; // 귓속말 대상
        var whisperContent = whisperParts.slice(2).join(" "); // 귓속말 내용

        // 귓속말 표시
        if (receiver === nickname) {
            chatWindow.innerHTML += "<div class='whisper-received'>" + sender + " [귓속말]: " + whisperContent + " <span class='time'>" + getCurrentTime() + "</span></div>";
        } else if (sender === nickname) {
            chatWindow.innerHTML += "<div class='whisper-sent'>" + sender + " [귓속말] to " + receiver + ": " + whisperContent + " <span class='time'>" + getCurrentTime() + "</span></div>";
        }
    } else {
        // 일반 메시지 표시
        var messageHtml = "";
        if (sender === nickname) {
            // 보낸 사람의 채팅은 오른쪽에 표시
            messageHtml = "<div class='myMsg'><strong>" + sender + ": </strong>" + content + "<span class='time'>" + getCurrentTime() + "</span></div>";
        } else {
            // 받는 사람의 채팅은 왼쪽에 표시
            messageHtml = "<div class='otherMsg'><strong>" + sender + ": </strong>" + content + "<span class='time'>" + getCurrentTime() + "</span></div>";
        }
        chatWindow.innerHTML += messageHtml;
    }
    // 대화창 스크롤
    chatWindow.scrollTop = chatWindow.scrollHeight;
};

function disconnect() {
    // 웹소켓 연결 종료
    webSocket.close();
    window.close();
}


// 현재 시간을 가져오는 함수
function getCurrentTime() {
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    return (hours < 10 ? '0' : '') + hours + ':' + (minutes < 10 ? '0' : '') + minutes;
}

function exitChatroom() {
    // 게시물 번호와 사용자 아이디를 가져와서 DELETE 요청을 보냅니다.
    var postId = "${post_Id}";
    console.log(postId);
    
    // DELETE 요청을 보내는 fetch 함수를 사용합니다.
    fetch('/post/ChatWindow/' + postId, { // postId를 경로 파라미터로 포함하여 전송
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
        	// postId를 body에 포함하지 않음
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to exit chatroom');
        }
        window.close();
        window.location.href
    })
    .catch(error => {
        console.error('Error exiting chatroom:', error);
    });
}

function getUserIdFromCookie(cookieName) {
    const name = cookieName + "=";
    const decodedCookie = decodeURIComponent(document.cookie);
    const cookieArray = decodedCookie.split(';');
    for(let i = 0; i < cookieArray.length; i++) {
        let cookie = cookieArray[i];
        while (cookie.charAt(0) === ' ') {
            cookie = cookie.substring(1);
        }
        if (cookie.indexOf(name) === 0) {
            return cookie.substring(name.length, cookie.length);
        }
    }
    return "";
}

function closePost() {
    const postId = "${post_Id}";
    const userId = getUserIdFromCookie("user_id"); // 쿠키에서 userId 추출
    console.log("User ID:", userId);
    console.log("Post ID:", postId);
    if (!userId) {
        alert("로그인이 필요합니다.");
        return;
    }
    fetch('/post/close/' + postId, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            postId: postId,
            userId: userId
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Failed to close post');
        }
        // 조기마감 성공 시 처리할 로직 추가
        return response.json(); // 서버로부터 응답 받기
    })
    .then(data => {
        // 서버에서 받은 데이터를 확인하여 작성자 여부를 판단
        if (data) {
            // 작성자인 경우 조기마감 성공 시 처리할 로직 추가
        	alert("조기마감 되었습니다.");
        } else {
            alert("작성자가 아닙니다.");
        }
    })
    .catch(error => {
        console.error('Error closing post:', error);
    });
}




</script>
<style>
/* 전체 채팅창 스타일 */
#chatWindow {
	border: 1px solid #ccc; /* 테두리 추가 */
	width: 380px;
	height: 310px;
	overflow-y: scroll; /* 세로 스크롤만 보이도록 설정 */
	padding: 5px;
}

/* 대화 입력창 스타일 */
#chatMessage {
    width: 300px;
    height: 60px;
    border: 4px solid #ccc; /* 테두리 설정 */
    margin-top: 5px;
    margin-left: 1px;
}

/* 전송 버튼 스타일 */
/* 전송 버튼 스타일 */
#sendBtn {
    width: 55px;
    height: 60px;
    background-color: #20b2aa; /* 배경색을 적당한 색상으로 지정 */
    color: white; /* 글자색을 흰색으로 지정 */
    border: none; /* 테두리 제거 */
    cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 나타냄 */
    border-radius: 5px; /* 모서리를 둥글게 만듦 */
    margin-top: 0px; /* 상단 여백 설정 */
    margin-left: 0px; /* 왼쪽 여백 설정 */
    display: inline-block; /* 인라인 블록 요소로 설정하여 다른 요소와 옆에 위치하게 함 */
}



/* 대화명 입력창 스타일 */
#nickname {
	width: 100px;
	height: 25px;
	border: 1px solid #ccc; /* 테두리 추가 */
}

/* 게시판 번호 스타일 */
#post_id {
	font-weight: bold; /* 굵은 글꼴 */
	color: blue; /* 파란색 */
}

/* 종료 버튼 스타일 */
#closeBtn {
	margin-bottom: 10px; /* 하단 여백 */
}

/* 채팅 메시지 스타일 */
.myMsg {
	text-align: right; /* 오른쪽 정렬 */
	margin-bottom: 5px; /* 하단 여백 */
}

.otherMsg {
	text-align: left; /* 왼쪽 정렬 */
	margin-bottom: 5px; /* 하단 여백 */
}

/* 귓속말 메시지 스타일 */
.whisper-received {
	color: green; /* 받은 귓속말은 초록색 */
}

.whisper-sent {
	color: blue; /* 보낸 귓속말은 파란색 */
}

/* 시간 스타일 */
.time {
	color: #888; /* 회색 */
	font-size: 12px; /* 작은 글꼴 */
}

#exitBtn {
	margin-top: 60px; /* 위쪽 여백 */
	float: right; /* 오른쪽 정렬 */
	clear: both; /* 다음 요소와 겹치지 않게 함 */
	display: block; /* 블록 요소로 설정하여 줄바꿈을 만듦 */
	background-color: #ff6347; /* 배경색을 적당한 색상으로 지정 */
	color: white; /* 글자색을 흰색으로 지정 */
	border: none; /* 테두리 제거 */
	padding: 10px 20px; /* 내부 여백 설정 */
	cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 나타냄 */
	border-radius: 5px; /* 모서리를 둥글게 만듦 */
}
/* 조기마감 버튼 스타일 */
#endBtn {
	margin-top: 60px; /* 상단 여백 */
	float: left; /* 왼쪽 정렬 */
	background-color: #ff6347; /* 배경색을 적당한 색상으로 지정 */
	color: white; /* 글자색을 흰색으로 지정 */
	border: none; /* 테두리 제거 */
	padding: 10px 20px; /* 내부 여백 설정 */
	cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 나타냄 */
	border-radius: 5px; /* 모서리를 둥글게 만듦 */
}
</style>
</head>
<body>
	<label id="라벨">닉네임</label> :
	<input type="text" id="nickname" value="${ user.nickname }" readonly />
	<br>
	<label id="게시판번호">게시판번호</label> :
	<span id="post_id">${ post_Id }</span>
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>
		<button id="exitBtn" onclick="exitChatroom();">채팅방 나가기</button>
		<button id="endBtn" onclick="closePost()">조기마감</button>
	</div>
</body>
</html>
