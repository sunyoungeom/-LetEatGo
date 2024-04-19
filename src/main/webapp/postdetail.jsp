<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<td>게시글 제목</td>
									<th scope="row" class="text-center" style="width: 10%;">조회수</th>
									<td class="text-center" style="width: 15%;">150</td>
								</tr>
								<tr>
									<th scope="row" class="text-center">작성자</th>
									<td>홍길동</td>
									<th scope="row" class="text-center">작성일</th>
									<td class="text-center">2024-04-18</td>
								</tr>
								<tr>
									<th scope="row" class="text-center" style="height: 150px;">내용</th>
									<td colspan="3">게시글 내용이 상세하게 들어갑니다. 여기에는 게시글의 본문이 포함됩니다.</td>
								</tr>
								<tr>
									<th scope="row" class="text-center">태그</th>
									<td colspan="3">게시글 관련 태그</td>
								</tr>
								<tr>
									<th scope="row" class="text-center">장소</th>
									<td colspan="3">게시글 관련 장소</td>
								</tr>
							</tbody>
						</table>
						<!-- 버튼들 -->
						<div class="d-flex justify-content-between">
							<div>
								<button class="btn btn-primary" type="button">수정</button>
								<button class="btn btn-danger" type="button">삭제</button>
								<a href="#" class="btn btn-secondary">목록으로 돌아가기</a>
							</div>
							<div>
								<button class="btn btn-success" type="button">리뷰작성</button>
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
					<div id="card" class="card">
						<div class="card-body">
							<h5 id="cardTitle" class="card-title">한식</h5>
							<p id="cardText" class="card-text">한국의 전통 요리입니다.</p>
						</div>
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
</body>
<script>
const card = document.getElementById('card');
const cardTitle = document.getElementById('cardTitle');
const cardText = document.getElementById('cardText');

let isKorean = true; // 현재 카드가 한식인지 여부를 저장

card.addEventListener('click', function() {
    if (isKorean) {
        cardTitle.textContent = "일식"; // 카드 제목을 일식으로 변경
        cardText.textContent = "일본의 전통 요리입니다."; // 카드 텍스트를 일식 설명으로 변경
    } else {
        cardTitle.textContent = "한식"; // 카드 제목을 한식으로 변경
        cardText.textContent = "한국의 전통 요리입니다."; // 카드 텍스트를 한식 설명으로 변경
    }
    isKorean = !isKorean; // 토글 상태 변경
});
    </script>
<script>
    const postTable = document.getElementById("postTable");
    const tbody = postTable.querySelector("tbody");
    let currentPage = 1; // 초기 페이지는 1로 설정
    const itemsPerPage = 10; // 페이지당 아이템 수
    const search = document.getElementById("search");

    
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
    
    loadPosts(currentPage);
	//최근 게시물 가져오기
    function loadPosts(page) {
      fetch(`/recent?page=${page}&pagePer=${itemsPerPage}`, {
        method: "PUT",
      })
        .then((resp) => resp.json())
        .then((data) => {
          // 게시물 테이블의 내용을 초기화
          tbody.innerHTML = "";
          const maxTitleLength = 20; // 예시로 20자로 설정
          data.items.forEach((element) => {
            let contenttr = document.createElement("tr");
            let tdId = document.createElement("td");
            let tdTitle = document.createElement("td");
            let tdresistdate = document.createElement("td");
            let tdview = document.createElement("td");

            tdId.innerText = `${element.post_Id}`;
            tdTitle.innerText =
              element.title.length > maxTitleLength
                ? element.title.substring(0, maxTitleLength) + "..."
                : element.title;
            tdresistdate.innerText = formattedDate(element);
            tdview.innerText = `${element.view}`;

            // 각 셀에 스코프 및 스타일 지정
            tdId.setAttribute("scope", "col"); // 제목 셀에는 'row' 스코프를 지정합니다.
            tdId.style.width = "5%"; // 제목 셀의 너비를 설정합니다.
            tdTitle.setAttribute("scope", "col");
            tdTitle.style.width = "73%"; // 내용 셀의 너비를 설정합니다.
            tdresistdate.setAttribute("scope", "col");
            tdresistdate.style.width = "15%"; // 작성일 셀의 너비를 설정합니다.
            tdview.setAttribute("scope", "col");
            tdview.style.width = "7%";

            tdId.style.textAlign = "center";
            tdview.style.textAlign = "center";

            // 클릭 이벤트 추가하여 상세 페이지로 이동
            tdTitle.addEventListener("click", () => {
              window.location.href = `/post/detail?post_Id=${element.post_Id}`;
            });

            contenttr.appendChild(tdId);
            contenttr.appendChild(tdTitle);
            contenttr.appendChild(tdresistdate);
            contenttr.appendChild(tdview);
            tbody.appendChild(contenttr);
			
            
            function filterPostsByTitle(searchValue) {
              // 모든 행을 가져와서 각 행에 대해 검색어가 포함된 제목을 가지고 있는지 확인합니다.
              Array.from(tbody.children).forEach((row) => {
                const titleCell = row.querySelector("td:nth-child(2)"); // 제목이 있는 셀 선택
                const title = titleCell.textContent.toLowerCase(); // 소문자로 변환한 제목 텍스트

                // 검색어가 제목에 포함되어 있으면 해당 행을 표시하고, 아니면 숨깁니다.
                if (title.includes(searchValue.toLowerCase())) {
                  row.style.display = ""; // 보이기
                } else {
                  row.style.display = "none"; // 숨기기
                }
              });
            }

            // 검색 이벤트 리스너 추가
            search.addEventListener("input", () => {
              const searchValue = search.value.trim(); // 입력값 가져오기
              filterPostsByTitle(searchValue); // 검색어와 일치하는 게시물만 표시
            });
          });
          displayPagination(data.totalPages, page); // 페이지네이션 표시
        });
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
<!-- 페이지 번호 -->
<script src="/js/pagination.js"></script>
</html>
