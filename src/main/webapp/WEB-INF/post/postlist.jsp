<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
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

	<main class="flex-shrink-0">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 가운데 정렬을 위한 클래스 적용 -->
				<div class="col-10">
					<!-- 6칸 설정 -->
					<h3>Table 1</h3>
					<table class="table table-hover table-bordered" id="postTable">
						<thead class="table-light">
							<tr>
								<th scope="col" style="text-align: center;">#</th>
								<th scope="col">내용</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<!-- 데이터는 JavaScript로 채웁니다 -->
							<!-- <tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
							</tr> -->
						</tbody>
					</table>

					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" id="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</main>
</body>
<script>
const postTable = document.getElementById("postTable");
const pagination = document.getElementById("pagination");
let currentPage = 1; // 초기 페이지는 1로 설정
const itemsPerPage = 15; // 페이지당 아이템 수
const tbody = postTable.querySelector("tbody");

// 페이지를 로드할 때 초기 데이터를 가져오는 함수 호출
loadPosts(currentPage);

function loadPosts(page) {
    fetch(`http://localhost:8080/post/list?page=${page}&pagePer=${itemsPerPage}`, {
        method: 'POST'
    })
    .then((resp) => resp.json())
    .then((data) => {
        // 게시물 테이블의 내용을 초기화
        tbody.innerHTML = "";
        data.items.forEach((element) => {
            let contenttr = document.createElement("tr");
            let tdId = document.createElement("td");
            let tdContent = document.createElement("td");
            let tdresistdate = document.createElement("td");
            tdId.innerText = `${element.post_Id}`;
            tdContent.innerText = `${element.content}`;
            tdresistdate.innerText = `${element.resistdate}`;
            
      	   // 각 셀에 스코프 및 스타일 지정
            tdId.setAttribute("scope", "col"); // 제목 셀에는 'row' 스코프를 지정합니다.
            tdId.style.width = "5%"; // 제목 셀의 너비를 설정합니다.
            tdContent.setAttribute("scope", "col");
            tdContent.style.width = "80%"; // 내용 셀의 너비를 설정합니다.
            tdresistdate.setAttribute("scope", "col");
            tdresistdate.style.width = "15%"; // 작성일 셀의 너비를 설정합니다.
            
            tdId.style.textAlign = "center";
            
            // 클릭 이벤트 추가하여 상세 페이지로 이동
            contenttr.addEventListener("click", () => {
                window.location.href = `detail?post_Id=${element.post_Id}`;
            });
            
            contenttr.appendChild(tdId);
            contenttr.appendChild(tdContent);
            contenttr.appendChild(tdresistdate);
            tbody.appendChild(contenttr);
        });
        
        // 페이지네이션 표시
        displayPagination(data.totalPages, page);
    });
}

// 페이지네이션을 표시하는 함수
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
    let startPage = Math.max(1, currentPage - 2); // 현재 페이지 기준으로 최소 1페이지부터 시작
    let endPage = Math.min(totalPages, startPage + 4); // 최대 5페이지까지 표시
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
    firstPage.addEventListener("click", () => {
        loadPosts(1); // 첫 페이지의 데이터 로드
    });

    // 이전 페이지 버튼 클릭 이벤트 설정
    previous.addEventListener("click", () => {
        if (currentPage > 1) {
            loadPosts(currentPage - 1); // 이전 페이지의 데이터 로드
        }
    });

    // 다음 페이지 버튼 클릭 이벤트 설정
    next.addEventListener("click", () => {
        if (currentPage < totalPages) {
            loadPosts(currentPage + 1); // 다음 페이지의 데이터 로드
        }
    });
    
    // 마지막 페이지 버튼 클릭 이벤트 설정
    lastPage.addEventListener("click", () => {
        loadPosts(totalPages); // 마지막 페이지의 데이터 로드
    });
}


// 페이지네이션 아이템을 생성하는 함수
function createPaginationItem(label, innerHTML) {
    let listItem = document.createElement("li");
    listItem.classList.add("page-item");
    
    let link = document.createElement("a");
    link.classList.add("page-link");
    link.href = "#"; // 기본적으로 페이지 번호는 현재 페이지로 이동하는 주소를 가집니다.
    link.innerText = label;
    link.setAttribute("data-page", label); // 페이지 번호를 버튼에 데이터 속성으로 추가합니다.
    
    if (label === "Previous" || label === "Next" || label === "First" || label === "Last") {
        link.setAttribute("aria-label", label);
        link.innerHTML = innerHTML || label;
    } else {
        link.addEventListener("click", () => {
            if (label === "First" || label === "Last") {
                return; // "First"나 "Last" 버튼 클릭 시 페이지 요청을 보내지 않습니다.
            }
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
</html>
