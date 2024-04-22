<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시물 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style>
/* 페이지네이션의 색상을 회색으로 변경 */
.page-link {
	color: #6c757d; /* 페이지 번호의 색상 */
	border-color: #dee2e6; /* 페이지 번호의 테두리 색상 */
}

.page-link:hover {
	color: black; /* 페이지 번호의 호버 색상 */
	text-decoration: none; /* 링크에 밑줄 제거 */
	background-color: #e9ecef; /* 페이지 번호의 호버 배경색 */
	border-color: #dee2e6; /* 페이지 번호의 테두리 색상 */
}

.page-item.active .page-link {
	z-index: 1;
	color: black; /* 활성 페이지 번호의 색상 */
	background-color: #6c757d; /* 활성 페이지 번호의 배경색 */
	border-color: black; /* 활성 페이지 번호의 테두리 색상 */
}

.page-item.disabled .page-link {
	color: #6c757d; /* 비활성 페이지 번호의 색상 */
	pointer-events: none; /* 비활성 페이지 번호 클릭 방지 */
	background-color: #f8f9fa; /* 비활성 페이지 번호의 배경색 */
	border-color: #dee2e6; /* 비활성 페이지 번호의 테두리 색상 */
}
</style>
</head>
<body>
	<%@ include file="../user/navigation.jsp"%>
	<br>
	<main class="flex-shrink-0">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 가운데 정렬을 위한 클래스 적용 -->
				<div class="col-10">
					<!-- 6칸 설정 -->
					<div class="radio-container"
						style="display: flex; justify-content: space-between;">
						<h3>전체 게시글</h3>
						<div>
							<!-- 첫 번째 라디오 버튼 -->
							<input type="radio" id="radio1" name="radiogroup"
								value="/post/activatedpost" checked> <label for="radio1">진행중인
								글</label>

							<!-- 두 번째 라디오 버튼 -->
							<input type="radio" id="radio2" name="radiogroup"
								value="/post/closedpost"> <label for="radio2">종료된
								글</label>
						</div>
					</div>
					<table class="table table-hover table-bordered" id="postTable">
						<thead class="table-light">
							<tr>
								<th scope="col" style="text-align: center;"></th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<!-- 데이터는 JavaScript로 채웁니다 -->
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" id="pagination">
						</ul>
						<!-- &nbsp;&nbsp;&nbsp; -->
						<form action="/post/createPost"></form>
					</nav>
				</div>
			</div>
		</div>
	</main>
</body>
<script>
    const postTable = document.getElementById("postTable");
    const tbody = postTable.querySelector("tbody");
    let currentPage = 1; // 초기 페이지는 1로 설정
    const itemsPerPage = 5; // 페이지당 아이템 수
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
    let selectedValue = document.querySelector('input[name="radiogroup"]:checked').value;
    loadPosts(currentPage, selectedValue);
   
	document.querySelectorAll('input[name="radiogroup"]').forEach((radio) => {
       radio.addEventListener('change', () => {
           const selectedValue = document.querySelector('input[name="radiogroup"]:checked').value;
           loadPosts(currentPage, selectedValue); // 첫 페이지의 데이터 로드
       });
    });

    
    function loadPosts(page, url) {
        fetch(`${url}?page=${page}&pagePer=${itemsPerPage}`, {
            method: 'POST'
        })
        .then((resp) => resp.json())
        .then((data) => {
            // 게시물 테이블의 내용을 초기화
            tbody.innerHTML = "";
            const maxTitleLength = 20; // 예시로 20자로 설정
            
            data.items.forEach((element) => {
                let contenttr = document.createElement("tr");
                let tdId = document.createElement("td");
                let tdtitle = document.createElement("td");
                let tdresistdate = document.createElement("td");
                let tdview = document.createElement("td");
                
                tdId.innerText = `${element.post_Id}`;
                tdtitle.innerText = element.title.length > maxTitleLength ? element.title.substring(0, maxTitleLength) + '...' : element.title;
                tdresistdate.innerText = formattedDate(element);
                tdview.innerText = `${element.view}`;
                
                // 각 셀에 스코프 및 스타일 지정
                tdId.setAttribute("scope", "col"); // 제목 셀에는 'row' 스코프를 지정합니다.
                tdId.style.width = "5%"; // 제목 셀의 너비를 설정합니다.
                tdtitle.setAttribute("scope", "col");
                tdtitle.style.width = "73%"; // 내용 셀의 너비를 설정합니다.
                tdresistdate.setAttribute("scope", "col");
                tdresistdate.style.width = "15%"; // 작성일 셀의 너비를 설정합니다.
                tdview.setAttribute("scope", "col");
                tdview.style.width = "7%"
                
                tdId.style.textAlign = "center";
                tdview.style.textAlign = "center";
                
                // 클릭 이벤트 추가하여 상세 페이지로 이동
                tdtitle.addEventListener("click", () => {
                    window.location.href = `/post/detail?post_Id=${element.post_Id}`;
                });
                
                contenttr.appendChild(tdId);
                contenttr.appendChild(tdtitle);
                contenttr.appendChild(tdresistdate);
                contenttr.appendChild(tdview);
                tbody.appendChild(contenttr);
            });
            
            // 페이지네이션 표시
            displayPagination(data.totalPages, page);
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
                const selectedValue = document.querySelector('input[name="radiogroup"]:checked').value;
                loadPosts(label, selectedValue); // 선택된 URL과 함께 loadPosts 함수 호출
                    
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
</html>
