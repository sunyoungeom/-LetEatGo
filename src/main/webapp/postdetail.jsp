<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="user.User"%>
<%@ page import="java.util.List"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>LetEatGo</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./Resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<style>
.box {
	display: inline-block;
	width: 450px;
	height: 420px;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.th {
	text-align: center;
}

.card {
	transition: max-height 0.5s ease;
	overflow: hidden; /* 내용이 카드 밖으로 흘러넘치지 않도록 함 */
	cursor: pointer;
	max-height: 150px; /* 초기 최대 높이 설정 */
}

.expand-active {
	max-height: 500px; /* 확장될 때의 최대 높이 */
}
/* 모달 다이얼로그 스타일 */
.modal {
	display: none; /* 초기에는 숨김 */
	position: fixed; /* 고정 위치 */
	z-index: 1; /* 다른 요소 위에 표시 */
	left: 0;
	top: 0;
	width: 100%; /* 전체 너비 */
	height: 100%; /* 전체 높이 */
	overflow: auto; /* 스크롤 가능 */
	background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
}

/* 모달 콘텐츠 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 모달이 중앙에 위치하도록 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* 콘텐츠 너비 */
}

/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
/* 별 만들기 */
.star-rating {
	font-size: 24px;
	flex-direction: row-reverse;
}

.star-rating input[type="radio"] {
	display: none;
}

.star-rating label {
	float: right;
	cursor: pointer;
	color: #ccc;
}

.star-rating label:before {
	content: "\2605";
}

.star-rating input[type="radio"]:checked ~ label:before {
	color: #ffca08;
}
</style>
</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>
	<main class="flex-shrink-0">
		<div class="container">
			<div class="d-flex justify-content-center">
				<div class="col-8">
					<div class="container mt-5">
						<h2 class="mb-4">게시판 상세 정보</h2>

						<table class="table table-bordered">
							<tbody>
								<tr>
									<th scope="row" class="text-center" style="width: 10%;">제목</th>
									<td id="title"></td>
									<th scope="row" class="text-center" style="width: 10%;">조회수</th>
									<td class="text-center" style="width: 15%;">150</td>
								</tr>
								<tr>
									<th scope="row" class="text-center">작성자</th>
									<td id="nickname"></td>
									<th scope="row" class="text-center">작성일</th>
									<td id="resistdate" class="text-center"></td>
								</tr>
								<tr>
									<th scope="row" class="text-center" style="height: 150px;">내용</th>
									<td id="postContent" colspan="3"></td>
								</tr>
								<tr>
									<th scope="row" class="text-center">태그</th>
									<td colspan="3">게시글 관련 태그</td>
								</tr>
								<tr>
									<th scope="row" class="text-center">장소</th>
									<td id="place" colspan="3"></td>
								</tr>
							</tbody>
						</table>
						<!-- 버튼들 -->
						<div class="d-flex justify-content-between">
							<div>
								<button id="editButton" class="btn btn-primary" type="button">수정</button>
								<button id="deleteButton" class="btn btn-danger" type="button">삭제</button>
								<a href="#" class="btn btn-secondary">목록으로 돌아가기</a>
							</div>
							<div>
								<button class="btn btn-success" type="button"
									onclick="openModal()">리뷰작성</button>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</main>
	<div class="container">
		<div class="d-flex justify-content-center">
			<div class="col-8">
				<br>
				<hr>
				<br>
				<h2 class="mb-4">한줄평</h2>
				<div id="cardContainer">
					<!-- <div id="card" class="card">
						<div class="card-body">
							<h5 id="cardTitle" class="card-title"></h5>
							<p id="cardText" class="card-text"></p>
						</div>
					</div> -->
				</div>
			</div>

			<hr>
		</div>
	</div>
	<!-- Footer-->
	<footer class="bg-white py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0">Copyright &copy; LetEatGo 2024</div>
				</div>
				<div class="col-auto">
					<a class="small" href="#!">Privacy</a> <span class="mx-1">&middot;</span>
					<a class="small" href="#!">Terms</a> <span class="mx-1">&middot;</span>
					<a class="small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


	<!-- 모달 다이얼로그 -->
	<div id="myModal" class="modal">
		<!-- 모달 콘텐츠 -->
		<div class="modal-content"
			style="width: 300px; height: 500px; overflow: auto;">
			<!-- 모달 닫기 버튼 -->
			<span class="close" onclick="closeModal()">&times;</span>
			<!-- 모달 내용 -->
			<div id="reviewForm"></div>
		</div>
	</div>

	<input type="hidden" id="post_Id"
		value="<%=request.getParameter("post_Id")%>">
</body>
<script>


	const cardContainer = document.getElementById("cardContainer");

	function change (guest, reviewList) {
	const card = document.createElement("div");
	card.id = "card";
	card.className = "card";
	const cardBody = document.createElement("div");
	cardBody.className = "card-body";
	const cardTitle = document.createElement("h5");
	cardTitle.id = "cardTitle";
	cardTitle.className = "card-title";
	const cardText = document.createElement("p");
	cardText.id = "cardText";
	cardText.className = "card-text";
	
	cardBody.appendChild(cardTitle);
	cardBody.appendChild(cardText);
	card.appendChild(cardBody);
	cardContainer.appendChild(card);
	
    cardTitle.textContent = guest.id; // 
    
	let isKorean = true; // 현재 카드가 한식인지 여부를 저장
	console.log(reviewList);
	card.addEventListener('click', function() {
	    if (isKorean) {
	        cardTitle.textContent = guest.id; // 카드 제목을 일식으로 변경
	        cardText.textContent = "일본의 전통 요리입니다."; // 카드 텍스트를 일식 설명으로 변경
	    } else {
	    	cardTitle.textContent = guest.id;
	    	
    	    //cardText.textContent
	    	createStarRating(guest.nickname,"cardText", reviewList[0].review);
	    }
	    isKorean = !isKorean; // 토글 상태 변경
	});
}
</script>



<script>
	const postId = document.getElementById("post_Id").value; //파라미터 값
	
	// 모달 다이얼로그 열기 함수
	function openModal() {
	    document.getElementById("myModal").style.display = "block";
	    
	}
	
	// 모달 다이얼로그 닫기 함수
	function closeModal() {
	    document.getElementById("myModal").style.display = "none";
	}
	    

	// 서블릿 호출하고 값 받아오기
    fetch(`/post/detail?post_Id=${postId}`, {
        method: 'POST',
    })
    .then(response => response.json())
    .then(async (data) => {
    	const postresistdate = formattedDate(data.post) // date 변환
    	const resistdate = document.getElementById("resistdate")
    	resistdate.textContent = postresistdate;
		const title = document.getElementById("title")
    	title.textContent  = data.post.title
    	const postContent = document.getElementById("postContent")
    	postContent.textContent = data.post.content;
    	const nickname = document.getElementById("nickname")
    	nickname.textContent = data.user.nickname;
    	const place = document.getElementById("place")
    	place.textContent = data.post.place;
    	const guestList = data.attendUserList;
    	const attendGuestReviewList = data.attendGuestReviewList;
    	
        for (let i = 0; i < guestList.length; i++) {
            const guest = guestList[i];
            const reviewList = attendGuestReviewList[i];
            
            createStarRating(guest.nickname, "reviewForm", null);
            change(guest, reviewList);
        }
    	
    });
	
   	//TODO: 수정버튼 리스너  수정페이지도  수정해야함 
   	const editButton = document.getElementById("editButton")
   	editButton.addEventListener("click", () => {
		window.location.href = `editpost?postId=${postId}`;
    });
  		
   	//TODO:삭제버튼 리스너
	const deleteButton = document.getElementById("deleteButton")
   	deleteButton.addEventListener("click", () => {
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
  	
    	
    function formattedDate(element) {
        // MySQL DATETIME 값을 Date 객체로 변환
        const timestamp = Number(element.resistdate);
        const date = new Date(timestamp);

        // 년, 월, 일 추출
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0"); // 월은 0부터 시작하므로 1을 더하고, 2자리로 맞춤
        const day = String(date.getDate()).padStart(2, "0"); // 일은 1일부터 시작하므로 2자리로 맞춤

        // 'YYYY-MM-DD' 형식으로 문자열 조합
        const formattedDate = `${year}-${month}-${day}`;

        return formattedDate;
      }
    
    // 검색어와 일치하는 게시물만 표시하는 함수


    // 검색 이벤트 리스너 추가

    fetch("/menu/recommand")
      .then((resp) => resp.json())
      .then((data) => {
        // 첫 번째 .box 요소만 선택합니다.
        const box = document.querySelector(".box");
        // 데이터가 존재하고 첫 번째 .box 요소도 존재하는지 확인합니다.
        if (data.length > 0 && box) {
          const searchResult = data[4]; // 첫 번째 검색 결과만 사용합니다.
          const titleElement = document.createElement("h3");
          // 제목을 클릭했을 때 해당 블로그로 이동하도록 설정합니다.
          titleElement.addEventListener("click", () => {
            window.location.href = searchResult.blogurl;
          });
          titleElement.textContent = searchResult.title;
          const contentsElement = document.createElement("p");
          contentsElement.textContent = searchResult.contents + "...";
          const thumbnailElement = document.createElement("img");
          thumbnailElement.src = searchResult.thumbnail;
          let h2 = document.createElement("h2");
          let br = document.createElement("br");
          h2.innerText = "관리자 추천 맛집!";
          // 생성된 요소들을 box에 추가합니다.
          box.appendChild(h2);
          box.appendChild(br);
          box.appendChild(titleElement);
          box.appendChild(contentsElement);
          box.appendChild(thumbnailElement);
        }
      });
</script>
<script>
//별 평점 입력 필드 생성 함수
function createStarRating(nickname, elementId, review) {
	const reviewForm = document.getElementById(elementId);
	let reviewItem = document.createElement("div");
	reviewItem.style.display = "flex";
	
	// 사용자 닉네임
	let userNickname = document.createElement("span");
	userNickname.textContent = nickname;
	
	let saveButton = document.createElement("button");
	saveButton.textContent = "저장";
	saveButton.addEventListener("click", onSaveButtonClick); // 저장 버튼 클릭 이벤트 리스너 등록
    
	// 별 평점 입력 필드 추가
    let starRating = document.createElement("div");
    starRating.classList.add("star-rating");
    for (let i = 5; i >= 1; i--) {
        const radioInput = document.createElement("input");
        radioInput.type = "radio";
        radioInput.name = `rating_${nickname}`;
        radioInput.value = i;
        if (review != null && review.rating === i) {
            radioInput.checked = true; // 기존 평점에 따라 체크 처리
        }
        radioInput.id = `star${i}_${nickname}`;

        let label = document.createElement("label");
        label.htmlFor = `star${i}_${nickname}`;

        // 라벨과 라디오 버튼을 별 평점 입력 필드에 추가
        starRating.appendChild(radioInput);
        starRating.appendChild(label);
    }
    reviewItem.appendChild(userNickname);
    reviewItem.appendChild(starRating);
    
 	let reviewTextItem = document.createElement("div");
    let reviewText = document.createElement("textarea");
    reviewText.setAttribute("id", "reviewText"); 
    reviewText.setAttribute("rows", "5"); 
    reviewText.setAttribute("cols", "20"); 
    reviewTextItem.appendChild(reviewText);
    reviewTextItem.appendChild(saveButton);
    
    reviewForm.appendChild(reviewItem);
    reviewForm.appendChild(reviewTextItem);
    
    
}

// 저장 버튼 클릭 이벤트 핸들러 함수
function onSaveButtonClick() {
	console.log("실행유무");
    const reviewText = document.getElementById("reviewText").value; // 리뷰 텍스트 값 가져오기
    const starValue = document.querySelector('.star-rating input[type="radio"]:checked').value; // 선택된 별 평점 가져오기
    
    const data = {
        reviewText: reviewText,
        starValue: starValue
    };
	console.log(data);
    // 예시: fetch를 사용하여 서버로 데이터 전송
    fetch("/saveReview", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (response.ok) {
            // 성공적으로 저장되었을 때 수행할 작업 추가
            console.log("리뷰가 성공적으로 저장되었습니다.");
        } else {
            console.error("리뷰 저장 중 오류가 발생했습니다.");
        }
    })
    .catch(error => {
        console.error("네트워크 오류:", error);
    });
}

 </script>
<!-- 페이지 번호 -->
<script src="/js/pagination.js"></script>
</html>