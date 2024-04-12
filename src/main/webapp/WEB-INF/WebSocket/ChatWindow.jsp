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

// 메시지 전송
function sendMessage() {
    var messageContent = chatMessage.value; // 메시지 내용
    if (!postId) {
        alert("게시물을 선택하세요.");
        return;
    }
    if (!messageContent) { // 메시지가 비어있는 경우 전송하지 않음
        return;
    }
    
 	var isWhisper = messageContent.startsWith("/w") || messageContent.startsWith("/ㅈ") || messageContent.startsWith("/W");
    
    // JSON 데이터 생성
    var jsonData = { 
        sender: nickname,
        content: messageContent
    };
    
    // 귓속말인 경우 추가 필드 설정
    if (isWhisper) {
        jsonData.isWhisper = true; // 귓속말 여부
        // 귓속말 대상 추출
        var whisperParts = messageContent.split(" ");
        jsonData.receiver = whisperParts[1]; // 귓속말 대상
    }

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


</script>
<style>
#chatWindow {
    border: none;
    width: 380px;
    height: 310px;
    overflow: scroll;
    padding: 5px;
}

#chatMessage {
    wid: 236px;
    height: 30px
}

#sendBtn {
    height: 30px;
    position: relative;
    top: 2px;
    right: -10px;
}

#closeBtn {
    margin-bottom: 30px;
    position: relative;
    top: 2px;
    left: -2px;
}

#nickname {
    width: 100px;
    height: 25px;
    border: 1px;
}

#post_id {
    width: 100px;
    height: 25px;
    border: 1px;
}

.myMsg {
    text-align: right;
}

#라벨 {
    background-color: red;
}

.whisper-received {
    color: green; /* 받은 귓속말의 색상 */
}

.whisper-sent {
    color: blue; /* 보낸 귓속말의 색상 */
}

.time {
    color: #888; /* 작은 회색 글씨 색상 */
    font-size: 12px; /* 작은 글씨 크기 */
}
#exitBtn {
    margin-top: 100px; /* 위쪽 여백 */
    float: right; /* 오른쪽 정렬 */
    clear: both; /* 다음 요소와 겹치지 않게 함 */
    display: block; /* 블록 요소로 설정하여 줄바꿈을 만듦 */
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
    </div>
</body>
</html>
