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
</style>
</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>

	<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center">
			<form
				class="d-flex flex-row align-items-center col-8 position-relative">
				<input class="form-control rounded-pill pl-3 pr-5" type="search"
					placeholder="Search" aria-label="Search" id="search" name="query"
					style="padding-right: 40px;" /> <i
					class="bi bi-search position-absolute"
					style="right: 10px; top: 50%; transform: translateY(-50%);"></i>
			</form>
		</div>
		<br />

		<div class="container">
			<div class="d-flex justify-content-center">
				<div class="col-8">
					<div class="row row-cols-1 row-cols-md-3 g-4"
						style="margin-top: 0px;">

						<!-- 프로젝트 카드 1 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-3"
								style="height: auto;">

								<div class="card-body p-0 border rounded-4"
									style="margin-bottom: 0px;">
									<a href="/menu/han" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img src="../Resources/image/bibimbap.png" alt="음식 이미지"
												style="width: 100px; height: auto; margin-top: 11px;">
											<h2 class="fw-bolder" style="margin-top: 10px">한식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>

						<!-- 프로젝트 카드 2 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-3"
								style="height: auto;">

								<div class="card-body p-0 border rounded-4">
									<a href="/menu/jung" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img src="../Resources/image/jajangmyeon.png" alt="음식 이미지"
												style="width: 100px; height: auto; margin-top: 14px;">
											<h2 class="fw-bolder" style="margin-top: 10px">중식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>

						<!-- 프로젝트 카드 3 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-3"
								style="height: auto;">

								<div class="card-body p-0 border rounded-4">
									<a href="/menu/il" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img src="../Resources/image/spaghetti.png" alt="음식 이미지"
												style="width: 100px; height: auto;">
											<h2 class="fw-bolder" style="margin-top: 10px">양식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-4">
							<a href="/map" style="text-decoration: none; color: #343a40;">
								<div class="border p-3 mb-2 rounded-4"
									style="height: 70px; background-color: #FFFFFF; display: flex; align-items: center; justify-content: center;">
									<h4 class="fw-bolder" style="margin-bottom: 0px;">주변 음식점
										찾기</h4>
								</div>
							</a>
						</div>
						<div class="col-lg-4">
							<a href="/recent" style="text-decoration: none; color: #343a40;">
								<div class="border p-3 mb-2 rounded-4"
									style="height: 70px; background-color: #FFFFFF; display: flex; align-items: center; justify-content: center;">
									<h4 class="fw-bolder" style="margin-bottom: 0px;">최근 간 음식점</h4>
								</div>
							</a>
						</div>
						<div class="col-lg-4">
							<form action="/post/createPost" method="get"
								style="text-decoration: none; color: #343a40;">
								<button type="submit" class="border p-3 mb-2 rounded-4"
									style="height: 70px; background-color: #FFFFFF; display: flex; align-items: center; justify-content: center; width: 100%; border: none;">
									<h4 class="fw-bolder" style="margin-bottom: 0px;">같이 먹어요</h4>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<br />
	<div style="margin: 0 20%">
		<hr>
		<br>
		<h3>최근 게시물</h3>
		<table class="table table-hover table-bordered" id="postTable">
			<thead class="table-light">
				<tr>
					<th scope="col" style="text-align: center">#</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<!-- 데이터는 JavaScript로 채웁니다 -->
			</tbody>
		</table>
	</div>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center" id="pagination">
		</ul>
	</nav>

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
      fetch(`http://localhost:8080/recent?page=${page}&pagePer=${itemsPerPage}`, {
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

    fetch("http://localhost:8080/menu/recommand")
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
