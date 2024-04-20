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
.table {
    background-color: white;
}
.place-badge {
	background-color: #6c757d;
}

.tag-badge {
	background-color: #FFA500;
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
					<h3>메뉴</h3>
					<div class="row row-cols-1 row-cols-md-3 g-4">

						<!-- 프로젝트 카드 1 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-3"
								style="height: auto;">

								<div class="card-body p-0 border rounded-4"
									style="margin-bottom: 0px;">
									<a href="/menu/han"
										style="text-decoration: none; color: inherit;">
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
									<a href="/menu/jung"
										style="text-decoration: none; color: inherit;">
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
									<a href="/menu/il"
										style="text-decoration: none; color: inherit;">
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
					<br />
					<div class="row">
						<div class="container">
							<hr>
							<br>
							<h3>최근 게시물</h3>
							<table class="table table-hover table-bordered" id="postTable">
								<thead>
									<tr>
										<th scope="col" class="vertical-align-center text-center">#</th>
										<th scope="col">제목</th>
										<th scope="col" class="vertical-align-center text-center">조회수</th>
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
					</div>
				</div>
			</div>
	</main>


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
    const itemsPerPage = 5; // 페이지당 아이템 수
    const search = document.getElementById("search");
    let scrollPosition = 0;
    
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
            let tdview = document.createElement("td");
            
            // 게시물 번호 스타일 적용
            tdId.style.verticalAlign = "middle";
            tdId.style.textAlign = "center";

            // 제목: 첫번째 줄, 내용 적용
            let tdTitleFirstLine = document.createElement("span");
            tdTitleFirstLine.innerText = `${element.place}`;
         	// 제목: 첫번째 줄, 스타일 적용
            tdTitleFirstLine.classList.add("badge", "place-badge");
            tdTitleFirstLine.style.fontSize = "16px";

         	// 제목: 두번째 줄, 내용 적용
            let tdTitleSecondLine = document.createElement("span");
            tdTitleSecondLine.innerText = element.title.length > maxTitleLength
                ? element.title.substring(0, maxTitleLength) + "..."
                : element.title;
            // 제목: 두번째 줄, 스타일 적용
            tdTitleSecondLine.style.fontWeight = "bold";
            tdTitleSecondLine.style.fontSize = "24px";
            tdTitleSecondLine.style.paddingTop = "3px";
            tdTitleSecondLine.style.paddingBottom = "3px";

         	// 제목: 세번째 줄, 내용 적용
            let tdTitleThirdLine = document.createElement("span");
            tdTitleThirdLine.innerText = "#태그";
         	// 제목: 세번째 줄, 스타일 적용
            tdTitleThirdLine.classList.add("badge", "tag-badge");

        	// 제목: 네번째 줄, 내용 적용            
            let tdTitleFourthLine = document.createElement("span");
            tdTitleFourthLine.innerText = " | " + formattedDate(element); // 여기서 formattedDate는 날짜를 형식화하는 함수입니다.
         	// 제목: 네번째 줄, 스타일 적용
            tdTitleFourthLine.style.color = "gray";
            
            
            // 게시물 조회수 스타일 적용
            tdview.style.verticalAlign = "middle";
            tdview.style.textAlign = "center";

            tdId.innerText = `${element.post_Id}`;

            tdTitle.appendChild(tdTitleFirstLine);
            tdTitle.appendChild(document.createElement("br"));
            tdTitle.appendChild(tdTitleSecondLine);
            tdTitle.appendChild(document.createElement("br"));
            tdTitle.appendChild(tdTitleThirdLine);
            tdTitle.appendChild(tdTitleFourthLine);
 
            tdview.innerText = `${element.view}`;

            // 각 셀에 스코프 및 스타일 지정
            tdId.setAttribute("scope", "col");
            tdId.style.width = "10%";
            tdTitle.setAttribute("scope", "col");
            tdview.setAttribute("scope", "col");
            tdview.style.width = "10%";

            // 클릭 이벤트 추가하여 상세 페이지로 이동
            tdTitle.addEventListener("click", () => {
              window.location.href = `/post/detail?post_Id=${element.post_Id}`;
            });

            contenttr.appendChild(tdId);
            contenttr.appendChild(tdTitle);
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
          scrollPosition = window.scrollY;
          window.scrollTo(0, scrollPosition); 
          currentPage = page; 
          displayPagination(data.totalPages, page); // 페이지네이션 표시
        });
    }
    

    function displayPagination(totalPages, currentPage) {
        let pagination = document.getElementById("pagination"); // 페이지네이션 요소
        pagination.innerHTML = ""; // 페이지네이션 초기화
        
        // 첫 페이지로 이동하는 버튼 추가
        let firstPage = createPaginationItem("First", "&lt;&lt;");
        pagination.appendChild(firstPage);
        
        // 이전 페이지 버튼 추가
        let previous = createPaginationItem("Previous", "&laquo;");
        pagination.appendChild(previous);
        
        // 페이지 번호 버튼 추가
        let startPage;
        let endPage;
        
        // 페이지 번호가 5개 이하인 경우
        if (totalPages <= 5) {
            startPage = 1;
            endPage = totalPages;
        } else { // 페이지 번호가 5개를 초과하는 경우
            if (currentPage <= 3) { // 현재 페이지가 3 이하인 경우
                startPage = 1;
                endPage = 5;
            } else if (currentPage >= totalPages - 2) { // 현재 페이지가 마지막에서 2페이지 이하인 경우
                startPage = totalPages - 4;
                endPage = totalPages;
            } else { // 현재 페이지가 중간인 경우
                startPage = currentPage - 2;
                endPage = currentPage + 2;
            }
        }
        
        for (let i = startPage; i <= endPage; i++) {
            let pagelist = createPaginationItem(i);
            pagination.appendChild(pagelist);
        }
        
        // 다음 페이지 버튼 추가
        let next = createPaginationItem("Next", "&raquo;");
        pagination.appendChild(next);
        
        // 마지막 페이지로 이동하는 버튼 추가
        let lastPage = createPaginationItem("Last", "&gt;&gt;");
        pagination.appendChild(lastPage);
        
        // 현재 페이지 버튼 활성화
        let activePageButton = pagination.querySelector(`[data-page="${currentPage}"]`);
        if (activePageButton) {
            activePageButton.classList.add("active");
        }

        // 첫 페이지 버튼 클릭 이벤트 설정
        firstPage.addEventListener("click", (event) => {
        loadPosts(1); // 첫 페이지의 데이터 로드
        });

        // 이전 페이지 버튼 클릭 이벤트 설정
        previous.addEventListener("click", (event) => {
      	if (currentPage === 1) {
   	        return; // 현재 페이지가 1페이지인 경우 함수 종료
   	    }
   	    loadPosts(currentPage - 1);
        });

        // 다음 페이지 버튼 클릭 이벤트 설정
        next.addEventListener("click", (event) => {
        if (currentPage === totalPages) {
       		return; // 현재 페이지가 1페이지인 경우 함수 종료
        }
        loadPosts(currentPage + 1); // 다음 페이지의 데이터 로드
        });

        // 마지막 페이지 버튼 클릭 이벤트 설정
        lastPage.addEventListener("click", (event) => {
        loadPosts(totalPages); // 마지막 페이지의 데이터 로드
        });
    }

    // 페이지네이션 아이템을 생성하는 함수
    function createPaginationItem(label, innerHTML) {
        let listItem = document.createElement("li");
        listItem.classList.add("page-item");
        
        let link = document.createElement("a");
        link.classList.add("page-link");
        link.innerText = label;
        link.setAttribute("data-page", label); // 페이지 번호를 버튼에 데이터 속성으로 추가합니다.
        
        if (label === "Previous" || label === "Next" || label === "First" || label === "Last") {
            link.setAttribute("aria-label", label);
            link.innerHTML = innerHTML || label;
            
        } else {
            link.addEventListener("click", (event) => {
    			event.preventDefault();
    			
                loadPosts(label); // 해당 페이지의 데이터 로드
                
                // 활성화된 버튼 표시
                let pageButtons = document.querySelectorAll(".page-link");
                pageButtons.forEach(button => {
                    button.classList.remove("active");
                });
                link.classList.add("active");
            });
        }
        
	 listItem.appendChild(link);
        
        return listItem;
    }
  </script>
<!-- 페이지 번호 -->
</html>
