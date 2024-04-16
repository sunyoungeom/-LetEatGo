<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
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
	<br>
	<main class="flex-shrink-0">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 가운데 정렬을 위한 클래스 적용 -->
				<div class="col-10">
					<!-- 6칸 설정 -->
					<h3>후기</h3>
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
							<form action="/post/createPost">
					    	</form>
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

loadPosts(currentPage);
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
function loadPosts(page) {
    fetch(`/post/list?page=${page}&pagePer=${itemsPerPage}`, {
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

</script>
<!-- 페이지 번호 -->
<script src="/js/pagination.js"></script>
</html>
