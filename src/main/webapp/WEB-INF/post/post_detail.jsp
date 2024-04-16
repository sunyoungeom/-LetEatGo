<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />


<style>
/* 게시물 상세 페이지 전체를 감싸는 컨테이너의 스타일 */
body {
	font-family: Arial, sans-serif; /* 글꼴 설정 */
	padding: 0px; /* 페이지의 내용과 가장자리 사이의 간격 설정 */
}

/* 게시물 상세 페이지의 제목 스타일 */
h1 {
	color: #333; /* 제목의 글자 색상 설정 */
	margin-bottom: 20px; /* 제목 아래 여백 설정 */
}

/* 게시물 상세 페이지의 리뷰 작성 폼 스타일 */
#reviewForm {
	border: 2px solid gray; /* 테두리 스타일 */
	border-radius: 10px; /* 라운드 테두리 */
	margin-bottom: 30px; /* 리뷰 작성 폼 아래 여백 설정 */
	padding: 5px;
}

/* 리뷰 작성 폼 안의 요소들의 스타일 */
#reviewForm label {
	font-weight: bold; /* 라벨 글자를 굵게 설정 */
	margin-bottom: 5px; /* 라벨 아래 여백 설정 */
}

#reviewForm input[type="number"], #reviewForm textarea {
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
	margin-left: 55px;
	width: 300px;
}

input[type="button"]:hover {
	background-color: #218838; /* 버튼 호버 시 배경색 변경 */
}
/* 별 모양을 만드는 CSS */
.star-rating {
	font-size: 0;
	display: flex;
	flex-direction: row-reverse; /* 별을 오른쪽에서 왼쪽으로 배치 */
	justify-content: flex-end
}

.star-rating input {
	display: none;
}

.star-rating label {
	font-size: 30px;
	cursor: pointer;
}

.star-rating label:before {
	content: '☆'; /* 선택되지 않은 별의 모양을 변경 */
	display: inline-block;
}

.star-rating input:checked ~ label:before {
	content: '★';
	color: gold; /* 채워진 별의 색상을 변경할 수 있습니다. */
}

body {
	font-family: Arial, sans-serif; /* 글꼴 설정 */
	padding: 0px; /* 페이지의 내용과 가장자리 사이의 간격 설정 */
}

/* 게시물 상세 페이지의 제목 스타일 */
h1 {
	color: #333; /* 제목의 글자 색상 설정 */
	margin-bottom: 20px; /* 제목 아래 여백 설정 */
}
/* 게시물 상세 페이지의 리뷰 작성 폼 스타일 */
#reviewContainer {
	display: flex; /* 플렉스 박스 사용 */
	margin-left: 50px;
	width: 90%;
}

#reviewForm {
	flex: 1; /* 동일한 크기를 가지도록 설정 */
	padding: 10px; /* 내부 여백 추가 */
	border: 2px solid #c8bfe7; /* 테두리 스타일 */
	border-radius: 10px; /* 라운드 테두리 */
	max-width: 50%;
	height: 350px;
	background-color: #c8bfe7;
}

/* 리뷰 목록 폼의 스타일 */
#reviewList {
	flex: 1; /* 동일한 크기를 가지도록 설정 */
	padding: 10px; /* 내부 여백 추가 */
	border: 2px solid pink; /* 테두리 스타일 */
	max-width: 50%;
	border-radius: 10px; /* 라운드 테두리 */
	overflow-y: auto; /* 세로 스크롤 바가 필요한 경우만 표시 */
	width: 50px;
	height: 350px;
	background-color: pink;
}

#postDetail {
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin-left: 50px;
	margin-right: 50px;
	max-width: 90%;
}
</style>
</head>
<body>
	<%@ include file="../user/navigation.jsp"%>
	<div id="postDetail">
		<table style="border-collapse: collapse; width: 100%;">
			<tr>
				<th
					style="border: 1px solid #000; padding: 10px; text-align: center;">제목</th>
				<td id="title" colspan="3"
					style="border: 1px solid #000; padding: 10px;"></td>
			</tr>
			<tr>
				<th
					style="border: 1px solid #000; padding: 10px; width: 25%; text-align: center;">작성자</th>
				<td id="nickname"
					style="border: 1px solid #000; padding: 10px; width: 25%;"></td>
				<th
					style="border: 1px solid #000; padding: 10px; width: 25%; text-align: center;">작성일</th>
				<td id="resistdate"
					style="border: 1px solid #000; padding: 10px; width: 25%;"></td>
			</tr>
			<tr>
				<th
					style="border: 1px solid #000; padding: 10px; text-align: center;">태그</th>
				<td id="tags" colspan="3"
					style="border: 1px solid #000; padding: 10px;"></td>
			</tr>
			<tr>
				<th
					style="border: 1px solid #000; padding: 10px; text-align: center;">장소</th>
				<td id="place" colspan="3"
					style="border: 1px solid #000; padding: 10px;"></td>
			</tr>
			<tr>
				<th
					style="border: 1px solid #000; padding: 10px; text-align: center;">내용</th>
				<td id="content" colspan="3"
					style="border: 1px solid #000; padding: 10px; height: 200px;"></td>
			</tr>
		</table>
	</div>
	<div id="reviewContainer">
		<div id="reviewForm">
			<h2>리뷰 작성</h2>
			<form id="reviewFormSubmit">
				<table>
					<tr>
						<td>별점</td>
						<td>
							<div class="star-rating">
								<input type="radio" id="star5" name="rating" value="5"><label
									for="star5"></label> <input type="radio" id="star4"
									name="rating" value="4"><label for="star4"></label> <input
									type="radio" id="star3" name="rating" value="3"><label
									for="star3"></label> <input type="radio" id="star2"
									name="rating" value="2"><label for="star2"></label> <input
									type="radio" id="star1" name="rating" value="1"><label
									for="star1"></label>
							</div>
						</td>
					</tr>
					<tr>
						<td>리뷰 내용</td>
						<td><textarea class="form-control" id="review" name="review"
								rows="5" required></textarea></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-primary">리뷰 등록</button>
			</form>
		</div>


		<div id="reviewList">
			<h2>리뷰 목록</h2>
			<div id="reviews-container">
				<table class="table">
					<thead>
						<tr>
							<th>별점</th>
							<th>리뷰 내용</th>
							<!-- 다른 필요한 헤더 열 추가 -->
						</tr>
					</thead>
					<tbody>
						<!-- 여기에 리뷰 목록 표시하는 코드를 넣으세요 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br>

	<input type="hidden" id="post_Id"
		value="<%=request.getParameter("post_Id")%>">
	<input type="button" value="채팅방 참여" onclick="chatWinOpen()">
	<script>
	const postDetailWidth = document.getElementById("postDetail").offsetWidth;
    document.getElementById("reviewForm").style.width = `${postDetailWidth / 2}px`;
    document.getElementById("reviewList").style.width = `${postDetailWidth / 2}px`;
    const postDetail = document.getElementById("postDetail");
    const reviewForm = document.getElementById("reviewForm");
    const reviewFormSubmit = document.getElementById("reviewFormSubmit");
    const reviewList = document.getElementById("reviewList");
    
    const title = document.getElementById("title");
    const nickname = document.getElementById("nickname");
    const resistdate = document.getElementById("resistdate");
    const content = document.getElementById("content");
    const postId = document.getElementById("post_Id").value;
    const place = document.getElementById("place");
    const tag = document.getElementById("tags");
    function formattedDate(data) {
        // MySQL DATETIME 값을 Date 객체로 변환
        const timestamp = Number(data.post.resistdate);
        const date = new Date(timestamp);

        // 년, 월, 일 추출
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0"); // 월은 0부터 시작하므로 1을 더하고, 2자리로 맞춤
        const day = String(date.getDate()).padStart(2, "0"); // 일은 1일부터 시작하므로 2자리로 맞춤

        // 'YYYY-MM-DD' 형식으로 문자열 조합
        const formattedDate = `${year}-${month}-${day}`;

        return formattedDate;
      }
    fetch(`/post/detail?post_Id=${postId}`, {
        method: 'POST',
    })
    .then(response => response.json())
    .then(async (data) => {
    const userId = data.user.id;
    const posttitle = data.post.title
    const postresistdate =formattedDate(data)
    const postContent = data.post.content;
    const postPlace = data.post.place;
    const postTag = data.tags;
    const isCurrentUserId = await isCurrentUser(data.user.user_id);
    
    const postDTOList  = data.DTOList;
	const postId = data.post.post_Id;
    
	console.log(postDTOList,"DTO값");
	console.log(postId,"포스트아이디값");
	console.log(postTag,"태그");
	const isPostIdMatched = postDTOList.some(item => item.postId === postId);
	
	const isguestIdMatched = postDTOList.some(item => item.postId === userId);
	
    title.innerText = `${posttitle}`;
    nickname.innerText = `${userId}`;
    resistdate.innerText = `${postresistdate}`;
    content.innerText = `게시물 내용: ${postContent}`;
    place.innerText = `${postPlace}`;
    const filteredPostTag = {};
    for (const key in postTag) {
        if (key !== 'post_tag_id' && key !== 'post_Id') {
            filteredPostTag[key] = postTag[key];
        }
    }

// 새로운 객체의 속성을 문자열로 변환하여 tag에 할당
let formattedPostTag = '';
for (const key in filteredPostTag) {
    let value = filteredPostTag[key];
    if (value === null) {
        value = '상관없음';
    }
    if (key === 'budget') {
        formattedPostTag += `인당 금액: ${value}\n`;
    } else if (key === 'booze') {
        formattedPostTag += `음주 유무: ${value}\n`;
    } else if (key === 'age') {
        formattedPostTag += `나이: ${value}\n`;
    } else if (key === 'gender') {
        formattedPostTag += `성별: ${value}\n`;
    } else if (key === 'peopleLimit') {
        formattedPostTag += `인원수: ${value}\n`;
    } else {
        formattedPostTag += `${key}: ${value}\n`;
    }
}
tag.innerText = formattedPostTag;


	    if(isCurrentUserId) {
		 	// 게시물 수정 버튼 생성
		    let editButton = document.createElement("button");
		    editButton.innerText = "게시물 수정";
		    editButton.addEventListener("click", () => {
		    	window.location.href = `editpost?postId=${postId}`;
		    });
		    postDetail.appendChild(editButton);
		
		    // 게시물 삭제 버튼 생성
		    let deleteButton = document.createElement("button");
		    deleteButton.innerText = "게시물 삭제";
		    deleteButton.addEventListener("click", () => {
		        // 삭제 작업을 수행하는 함수 호출 또는 해당 작업을 수행하는 코드를 여기에 추가
		        fetch(`/post/deletePost?postId=${postId}`, {
		        	method: 'DELETE'
		        })
		        .then(response => {
	                if (response.ok) {
	                	postDetail.innerHTML = ""; // 게시물 상세 내용 영역을 비움
	                	 window.location.href = `mypostlist`;
	                } else {
	                    console.error('게시글 삭제 중 오류 발생:', response.status);
	                    alert('게시글 삭제 중 오류가 발생했습니다.');
	                }
	            })
		    });
		    postDetail.appendChild(deleteButton);
	    }
    
    
    
    // 리뷰 목록을 받아와서 처리하는 부분 추가
    const reviews = data.reviews;

    if (!isPostIdMatched || isguestIdMatched) {
        // 리뷰 작성 폼을 숨기거나 비활성화하는 코드 작성
        reviewForm.style.display = 'none'; // 리뷰 작성 폼을 숨김
    }
        
    for (const review of reviews) {
        const isCurrentUserReview = await isCurrentUser(review.writeUserId); // 프로미스를 기다림

        
        
        
        let reviewItem = document.createElement("div");
     // 별 평점 입력 필드 생성
        let starRating = document.createElement("div");
        starRating.classList.add("star-rating");
        for (let i = 5; i >= 1; i--) {
            let input = document.createElement("input");
            input.type = "radio";
            input.id = `star${i}-${review.reviewId}`; // 별의 id 값에 reviewId를 추가하여 고유성 보장
            input.name = `star${review.reviewId}`; // 같은 리뷰의 별들은 같은 이름을 가져야 함
            input.value = i;
            input.disabled = true; // 수정 불가능하도록 설정
            if (review.rating === i) {
                input.checked = true; // 기존 평점에 따라 체크 처리
            }
            let label = document.createElement("label");
            label.htmlFor = `star${i}-${review.reviewId}`; // input의 id와 연결
            starRating.appendChild(input);
            starRating.appendChild(label);
        }
        reviewItem.appendChild(starRating);

        // 개행 추가
        reviewItem.appendChild(document.createElement("br"));

        // 리뷰 내용 입력 필드 생성
        let reviewTextArea = document.createElement("textarea");
        reviewTextArea.value = review.review;
        reviewTextArea.disabled = true; // 수정 불가능하도록 설정
        reviewTextArea.rows = 2; // 텍스트 필드를 좀 더 길게 출력
        reviewTextArea.cols = 50; // 텍스트 필드를 가로로 더 길게 출력
        reviewItem.appendChild(reviewTextArea);
   		
		
        
        
        if (isCurrentUserReview) {
            let editButton = document.createElement("button");
            editButton.innerText = "수정";
            editButton.classList.add("edit-btn");
            editButton.dataset.reviewId = review.reviewId;
            editButton.addEventListener("click", () => {
                // 수정 기능 구현
                reviewTextArea.disabled = false; // 리뷰 내용 수정 가능하도록 설정
                reviewTextArea.focus(); // 리뷰 내용 입력 필드에 포커스 설정
                
                // 평점 수정 가능하도록 설정
                for (let input of starRating.querySelectorAll("input")) {
                    input.disabled = false;
                }
            });
            reviewItem.appendChild(editButton);

            let saveButton = document.createElement("button");
            saveButton.innerText = "저장";
            saveButton.classList.add("save-btn");
            saveButton.dataset.reviewId = review.reviewId;
            saveButton.addEventListener("click", () => {
                // 저장 기능 구현
                reviewTextArea.disabled = true; // 리뷰 내용 수정 불가능하도록 설정
                
                // 별 평점도 수정 불가능하도록 설정
                for (let input of starRating.querySelectorAll("input")) {
                    input.disabled = true;
                }
                
             // 수정된 리뷰 내용과 평점, 리뷰 ID를 가져옴
                const modifiedReview = reviewTextArea.value;
                const modifiedRating = starRating.querySelector("input:checked").value;
                const reviewId = saveButton.dataset.reviewId;

             // 서버에 수정된 리뷰 내용과 평점을 전송하는 코드
                fetch(`/post/updateReview/${reviewId}`, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                    	reviewId: reviewId,
                        review: modifiedReview,
                        rating: modifiedRating
                    })
                })
                .then(response => {
                    if (response.ok) {
                        console.log('리뷰가 성공적으로 수정되었습니다.');
                    } else {
                        console.error('리뷰 수정 중 오류 발생:', response.status);
                        alert('리뷰 수정 중 오류가 발생했습니다.');
                    }
                })
                .catch(error => {
                    console.error('리뷰 수정 중 오류 발생:', error);
                    alert('리뷰 수정 중 오류가 발생했습니다.');
                });
            });
            reviewItem.appendChild(saveButton);
        

            let deleteButton = document.createElement("button");
            deleteButton.innerText = "삭제";
            deleteButton.classList.add("delete-btn");
            deleteButton.dataset.reviewId = review.reviewId;
            deleteButton.addEventListener("click", (event) => {
                const reviewId = event.target.dataset.reviewId; // 클릭된 버튼의 데이터 속성인 data-reviewId 가져오기

                // 서버에 삭제 요청을 보내는 코드
                fetch(`/post/deleteReview/${reviewId}`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if (response.ok) {
                        console.log('리뷰가 성공적으로 삭제되었습니다.');
                        // 삭제된 리뷰 아이템을 화면에서도 제거
                        event.target.parentNode.remove(); // 삭제 버튼의 부모인 리뷰 아이템을 제거
                    } else {
                        console.error('리뷰 삭제 중 오류 발생:', response.status);
                        alert('리뷰 삭제 중 오류가 발생했습니다.');
                    }
                })
                .catch(error => {
                    console.error('리뷰 삭제 중 오류 발생:', error);
                    alert('리뷰 삭제 중 오류가 발생했습니다.');
                });
            });
            reviewItem.appendChild(deleteButton);
        }

        reviewList.appendChild(reviewItem);
    }
    
})
    .catch(error => {
        console.error('상세 게시물 내용을 불러오는 중 오류 발생:', error);
        alert('상세 게시물 내용을 불러오는 중 오류가 발생했습니다.');
    });

    // 현재 로그인한 사용자의 ID와 리뷰의 작성자 ID를 비교하여 일치 여부를 반환하는 함수
    async function isCurrentUser(UserId) {
        const currentUserID = await getUserId();
        return currentUserID === UserId;
    }

    
    
    reviewFormSubmit.addEventListener("submit", function(event) {
        event.preventDefault();
        
        const ratingInput = document.querySelector('input[name="rating"]:checked');
        const rating = ratingInput ? ratingInput.value : null;
        const review = document.getElementById("review").value;
        const postId = document.getElementById("post_Id").value;
        
        // 사용자 ID를 가져오는 함수 호출
        getUserId()
            .then(writeUserId => {
                console.log(writeUserId); // 사용자 ID 확인
                
                // 리뷰를 서버로 전송하는 코드 작성
                return fetch(`/post/addReview`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        rating: rating,
                        review: review,
                        postId: postId,
                        writeUserId: writeUserId
                    })
                });
            })
            .then(response => {
                if (response.ok) {
                   // 리뷰가 등록되었을 때의 처리
                    alert('리뷰가 등록되었습니다.');
                    location.reload(); // 페이지 새로고침
                } else {
                    alert('리뷰 등록 중 오류가 발생했습니다.');
                }
            })
            .catch(error => {
                console.error('리뷰 등록 중 오류 발생:', error);
                alert('리뷰 등록 중 오류가 발생했습니다.');
            });
    });

    
    
    // 사용자의 ID를 가져오는 함수
function getUserId() {
    // 서버로부터 사용자의 ID를 가져오는 비동기 함수 호출
    return fetch('/post/getUserId', {
        method: 'POST' 
    })
	  .then(response => response.json())
      .then((data) => {
        // 서버로부터 받아온 사용자 정보 중에서 ID를 반환
        return data.user_id; 
    })
} 


// 페이지가 로드될 때 실행되는 함수
document.addEventListener("DOMContentLoaded", function() {
    // 쿠키에서 닉네임 가져오기
    const nickname = getCookieValue("nickname");
    console.log(nickname);
});

// 쿠키에서 특정 이름의 값 가져오는 함수
function getCookieValue(name) {
    const cookies = document.cookie.split("; ");
    for (let cookie of cookies) {
        const [cookieName, cookieValue] = cookie.split("=");
        if (cookieName === name) {
            return cookieValue;
        }
    }
    return null;
}

let chatWindow = null;
var urlParams = new URLSearchParams(window.location.search);
var post_Id = urlParams.get('post_Id'); // URL 파라미터에서 post_Id를 가져옵니다.
console.log(post_Id);

function chatWinOpen() {
    const nickname = getCookieValue("nickname"); // 쿠키에서 닉네임 가져오기
    console.log(nickname)
    if (!chatWindow || chatWindow.closed) {
        const url = "ChatWindow?&post_Id=" + post_Id; // URL에 게시물 ID 추가
        chatWindow = window.open(url, "", "width=386, height=564"); // 채팅 창 열기
    } else {
        chatWindow.focus();
    }   
}
</script>
</body>
</html>
