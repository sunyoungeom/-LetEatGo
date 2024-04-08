<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
</head>
<style>
    /* 게시물 상세 페이지 전체를 감싸는 컨테이너의 스타일 */
    body {
        font-family: Arial, sans-serif; /* 글꼴 설정 */
        padding: 20px; /* 페이지의 내용과 가장자리 사이의 간격 설정 */
    }

    /* 게시물 상세 페이지의 제목 스타일 */
    h1 {
        color: #333; /* 제목의 글자 색상 설정 */
        margin-bottom: 20px; /* 제목 아래 여백 설정 */
    }

    /* 게시물 상세 페이지의 리뷰 작성 폼 스타일 */
    #reviewForm {
        margin-bottom: 30px; /* 리뷰 작성 폼 아래 여백 설정 */
    }

    /* 리뷰 작성 폼 안의 요소들의 스타일 */
    #reviewForm label {
        font-weight: bold; /* 라벨 글자를 굵게 설정 */
        margin-bottom: 5px; /* 라벨 아래 여백 설정 */
    }

    #reviewForm input[type="number"],
    #reviewForm textarea {
        width: 100%; /* 입력 필드의 너비를 100%로 설정하여 폼을 채우도록 함 */
        padding: 10px; /* 입력 필드의 안쪽 여백 설정 */
        margin-bottom: 10px; /* 입력 필드 아래 여백 설정 */
        border: 1px solid #ccc; /* 입력 필드 테두리 스타일 설정 */
        border-radius: 5px; /* 입력 필드 테두리를 둥글게 설정 */
    }

    #reviewForm button {
        padding: 10px 20px; /* 버튼 안쪽 여백 설정 */
        background-color: #007bff; /* 버튼 배경색 설정 */
        color: #fff; /* 버튼 글자 색상 설정 */
        border: none; /* 버튼 테두리 없앰 */
        border-radius: 5px; /* 버튼 테두리를 둥글게 설정 */
        cursor: pointer; /* 마우스 커서를 손가락 형태로 변경하여 클릭 가능한 상태로 표시 */
    }

    #reviewForm button:hover {
        background-color: #0056b3; /* 버튼 호버 시 배경색 변경 */
    }

    /* 채팅방 참여 버튼의 스타일 */
    input[type="button"] {
        padding: 10px 20px; /* 버튼 안쪽 여백 설정 */
        background-color: #28a745; /* 버튼 배경색 설정 */
        color: #fff; /* 버튼 글자 색상 설정 */
        border: none; /* 버튼 테두리 없앰 */
        border-radius: 5px; /* 버튼 테두리를 둥글게 설정 */
        cursor: pointer; /* 마우스 커서를 손가락 형태로 변경하여 클릭 가능한 상태로 표시 */
    }

    input[type="button"]:hover {
        background-color: #218838; /* 버튼 호버 시 배경색 변경 */
    }
</style>
<body>
    <h1>게시물 상세 페이지</h1>
    <div id="postDetail"></div>
    <div id="reviewForm">
        <h2>리뷰 작성</h2>
        <form id="reviewFormSubmit">
            <div class="mb-3">
                <label for="rating" class="form-label">평점</label>
                <input type="number" class="form-control" id="rating" name="rating" min="1" max="5" required>
            </div>
            <div class="mb-3">
                <label for="review" class="form-label">리뷰 내용</label>
                <textarea class="form-control" id="review" name="review" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">리뷰 등록</button>
        </form>
    </div>
    <input type="hidden" id="postId" value="<%= request.getParameter("post_Id") %>">
    <input type="button" value="채팅방 참여" onclick="chatWinOpen()">
</body>
    <script>
        const postDetail = document.getElementById("postDetail");
        const reviewForm = document.getElementById("reviewForm");
        const reviewFormSubmit = document.getElementById("reviewFormSubmit");
        const postId = document.getElementById("postId").value;
        const apiURL = `http://localhost:8080/post/detail?post_Id=${postId}`;
        
        reviewFormSubmit.addEventListener("submit", function(event) {
            event.preventDefault();
            
            const rating = document.getElementById("rating").value;
            const review = document.getElementById("review").value;
            
            // 리뷰를 서버로 전송하는 코드 작성
            // 예를 들어, fetch를 사용하여 서버로 데이터를 전송
            
            // fetch 예시
            fetch('http://localhost:8080/post/addReview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    rating: rating,
                    review: review,
                    postId: postId
                })
            })
            .then(response => response.json())
            .then(data => {
                // 리뷰가 성공적으로 추가되면 성공 메시지를 표시하거나 페이지를 새로고침합니다.
                alert('리뷰가 등록되었습니다.');
                location.reload(); // 페이지 새로고침
            })
            .catch(error => {
                console.error('리뷰 등록 중 오류 발생:', error);
                alert('리뷰 등록 중 오류가 발생했습니다.');
            });
        });    
    let chatWindow = null;
    
    function chatWinOpen() {
        if (!chatWindow || chatWindow.closed) {
            const url = "ChatWindow?post_Id=" + postId; // URL에 게시물 ID 추가
            chatWindow = window.open(url, "", "width=400, height=450"); // 채팅 창 열기
        } else {
            chatWindow.focus();
        }	
    }

        
        
        fetch(apiURL,{
            method: 'POST' })
            .then((resp)=> resp.json())
            .then((data) => {
            	// 첫 번째 객체의 'user' 필드에서 'id' 값 가져오기
            	const userId = data[1].id;
				
            	// 두 번째 객체의 'post' 필드에서 'content' 값 가져오기
            	const postContent = data[0].content;
				
            	// HTML에 가져온 값을 추가하기
            	let userIdParagraph = document.createElement("p");
            	userIdParagraph.innerText = `사용자 ID: ${userId}`;
            	postDetail.appendChild(userIdParagraph);

            	let postContentParagraph = document.createElement("p");
            	postContentParagraph.innerText = `게시물 내용: ${postContent}`;
            	postDetail.appendChild(postContentParagraph);
            	 
            });
    </script>
</html>
