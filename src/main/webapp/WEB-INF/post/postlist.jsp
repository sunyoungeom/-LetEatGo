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
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
							</tr>
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
const itemsPerPage = 10; // 페이지당 아이템 수
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
	pagination.innerHTML = ""; // 페이지네이션 초기화
 // 이전 페이지 버튼 추가
    let previous = document.createElement("li");
    previous.classList.add("page-item");

    let previousLink = document.createElement("a");
    previousLink.classList.add("page-link");
    previousLink.href = "#";
    previousLink.setAttribute("aria-label", "Previous");

    let previousspan = document.createElement("span");
    previousspan.setAttribute("aria-hidden", "true");
    previousspan.innerHTML = "&laquo;"; // 이전 아이콘

    previousLink.appendChild(previousspan);
    previous.appendChild(previousLink);
    pagination.appendChild(previous);
	
    let pagelist;
    let pageLink;
    for (let i = 1; i <= totalPages; i++) {
        pagelist = document.createElement("li");
        pagelist.classList.add("page-item");
        pageLink = document.createElement("a");
        pageLink.classList.add("page-link");
       	pageLink.href = "#"; // 클릭 이벤트를 처리하기 위한 임시 링크 설정
        pageLink.innerText = i;
       
        // 페이지 번호 클릭 이벤트 설정
    	pageLink.addEventListener("click", () => {
            loadPosts(i); // 해당 페이지의 데이터 로드
        	    
        });
       	
        pagelist.appendChild(pageLink);
	
        pagination.appendChild(pagelist);
    }
 // 다음 페이지 버튼 추가
    let next = document.createElement("li");
    next.classList.add("page-item");

    let nextLink = document.createElement("a");
    nextLink.classList.add("page-link");
    nextLink.href = "#";
    nextLink.setAttribute("aria-label", "Next");

    let nextSpan = document.createElement("span");
    nextSpan.setAttribute("aria-hidden", "true");
    nextSpan.innerHTML = "&raquo;"; // 다음 아이콘

    nextLink.appendChild(nextSpan);
    next.appendChild(nextLink);
    pagination.appendChild(next);
    
 
 // 이전 페이지 버튼 클릭 이벤트 설정
    previousLink.addEventListener("click", () => {
        if (currentPage > 1) {
            loadPosts(currentPage - 1); // 이전 페이지의 데이터 로드
        }
    });

    // 다음 페이지 버튼 클릭 이벤트 설정
    nextLink.addEventListener("click", () => {
        if (currentPage < totalPages) {
            loadPosts(currentPage + 1); // 다음 페이지의 데이터 로드
        }
    });


}
    </script>
</html>
