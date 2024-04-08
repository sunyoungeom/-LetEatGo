<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>내게시물</title>
<!-- Favicon--
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
</head>
<!-- <body> -->
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/user/navigation.jsp"%>
		<section class="py-5">
			<div class="container px-5">
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="row align-items-center">
						<!-- 내정보 -->
						<div class="col-md-3 mb-3 mb-md-0" style="height: 500px;">
							<%@ include file="/WEB-INF/myinfo/MyInfoSidebar.jsp"%>
						</div>
						<!-- 테이블 -->
						<div class="col-md-9">
							<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
								<div class="row justify-content-center">
									<div class="col-12">
										<h3>내가쓴글</h3>
										<table class="table table-hover table-bordered" id="postTable">
											<thead class="table-light">
												<tr>
													<th scope="col" style="width: 70%;">제목</th>
													<th scope="col" style="width: 15%;">작성일</th>
													<th scope="col" style="width: 15%;"></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<tr>
													<th scope="row">하이하이여</th>
													<td>2024-04-06</td>
													<td>
														<button style="margin-right: 5px;">수정</button>
														<button>삭제</button>
													</td>
												</tr>
											</tbody>
										</table>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
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
										<div id="pagination"></div>
									</div>
								</div>
							</div>

							<!-- <div class="col-md-12">
							<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
								<div class="row justify-content-center">
									<div class="col-12">
									 	<h3>내가쓴댓글</h3>
										<table class="table table-hover table-bordered" id="postTable">
											<thead class="table-light">
												<tr>
													<th scope="col" style="width: 70%;">제목</th>
													<th scope="col" style="width: 15%;">작성일</th>
													<th scope="col" style="width: 15%;"></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<tr>
													<th scope="row">하이하이여</th>
													<td>2024-04-06</td>
													<td>
														<button style="margin-right: 5px;">수정</button>
														<button>삭제</button>
													</td>
												</tr>
											</tbody>
										</table> 
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
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
										<div id="pagination"></div>
									</div>
								</div>
							</div>
						</div>
						 -->

						</div>






					</div>
				</div>
		</section>
		<!-- Bootstrap core JS-->
		<!-- <script src="js/scripts.js"></script><! -->




	</main>
</body>
<script type="text/javascript">
const postTable = document.getElementById("postTable");
const pagination = document.getElementById("pagination");
let currentPage = 1; // 초기 페이지는 1로 설정
const itemsPerPage = 10; // 페이지당 아이템 수
const tbody = postTable.querySelector("tbody");

// 페이지를 로드할 때 초기 데이터를 가져오는 함수 호출
loadPosts(currentPage);

function loadPosts(page) {
    fetch(`http://localhost:8080/post/mypage?page=${page}&pagePer=${itemsPerPage}`)
    .then((resp) => resp.json())
    .then((data) => {
        // 게시물 테이블의 내용을 초기화
        postTable.innerHTML = "";
        
        // 새로운 데이터로 게시물 테이블 채우기
       data.items.forEach((element) => {
    let contenttr = document.createElement("tr");
    let tdId = document.createElement("td");
    let tdContent = document.createElement("td");
    let tdresistdate = document.createElement("td");
    let tdButtons = document.createElement("td"); // 수정 및 삭제 버튼을 담을 셀

    tdId.innerText = `${element.post_Id}`;
    tdContent.innerText = `${element.content}`;
    tdresistdate.innerText = `${element.resistdate}`;
    
   // 각 셀에 스코프 및 스타일 지정
    tdId.setAttribute("scope", "col"); // 제목 셀에는 'row' 스코프를 지정합니다.
    tdId.style.width = "5%"; // 제목 셀의 너비를 설정합니다.
    tdContent.setAttribute("scope", "col");
    tdContent.style.width = "70%"; // 내용 셀의 너비를 설정합니다.
    tdresistdate.setAttribute("scope", "col");
    tdresistdate.style.width = "15%"; // 작성일 셀의 너비를 설정합니다.
    tdButtons.setAttribute("scope", "col");
    tdButtons.style.width = "10%"; // 버튼 셀의 너비를 설정합니다.

    
    tdId.style.textAlign = "center";
    // 수정 버튼
    let editButton = document.createElement("button");
    editButton.innerText = "수정";
    editButton.style.marginRight = "5px";
    editButton.addEventListener("click", () => {
    	console.log(element.post_Id);
        // 수정 기능 구현
    	  fetch(`http://localhost:8080/post`, {
    	        method: 'PUT'
    	        , body: `postId=${element.post_Id}`
    	    })
    	    .then(response => {
    	        // 요청이 성공한 경우
    	        if (response.ok) {
    	            console.log("게시물이 성공적으로 수정되었습니다.");
    	            // 성공 메시지를 사용자에게 표시하거나 다른 동작을 수행할 수 있습니다.
    	        } else {
    	            console.error('수정에 실패했습니다.');
    	            // 실패 메시지를 사용자에게 표시하거나 다른 동작을 수행할 수 있습니다.
    	        }
    	    })
    	    .catch(error => {
    	        console.error('요청 중 오류가 발생했습니다.', error);
    	        // 오류 메시지를 사용자에게 표시하거나 다른 동작을 수행할 수 있습니다.
    	    });
    	});

    // 삭제 버튼
    let deleteButton = document.createElement("button");
    deleteButton.innerText = "삭제";
    deleteButton.addEventListener("click", () => {
        // 삭제 기능 구현
        fetch(`http://localhost:8080/post?postId=${element.post_Id}`, {
            method: 'DELETE'
        })
        .then((response) => {
            if (response.ok) {
                console.log("삭제완료");
                // 성공적으로 삭제되었을 때 화면에서 해당 게시물 제거
                contenttr.remove();
            } else {
                console.error("삭제 실패:", response.status);
            }
        });

    });

    // 수정 및 삭제 버튼을 셀에 추가
    tdButtons.appendChild(editButton);
    tdButtons.appendChild(deleteButton);

    // 셀을 행에 추가
    contenttr.appendChild(tdId);
    contenttr.appendChild(tdContent);
    contenttr.appendChild(tdresistdate);
    contenttr.appendChild(tdButtons);

    // 행을 테이블에 추가
    postTable.appendChild(contenttr);
});
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
