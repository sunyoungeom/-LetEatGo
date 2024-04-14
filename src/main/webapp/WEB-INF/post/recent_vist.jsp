<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../user/navigation.jsp"%>
    <div id="recentPostList"></div>
</body>
		<main class="flex-shrink-0">
			<div class="container">
				<div class="row justify-content-center">
					<!-- 가운데 정렬을 위한 클래스 적용 -->
					<div class="col-10">
						<!-- 6칸 설정 -->
						<h3>최근간 음식점 10곳</h3>
						<table class="table table-hover table-bordered" id="postTable">
							<thead class="table-light">
								<tr>
									<th scope="col" style="text-align: center;">#</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody class="table-group-divider">
							</tr> -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
</body>
<Script>
		const postTable = document.getElementById("postTable");
		const tbody = postTable.querySelector("tbody");
          fetch("http://localhost:8080/recent", {
              method: 'POST'
          })
          .then((resp) => resp.json())
          .then((data) => {
              // 게시물 테이블의 내용을 초기화
              tbody.innerHTML = "";
              const maxTitleLength = 20; // 예시로 20자로 설정
              data.forEach((element) => {
                  let contenttr = document.createElement("tr");
                  let tdId = document.createElement("td");
                  let tdTitle = document.createElement("td");
                  let tdresistdate = document.createElement("td");
                  let tdview = document.createElement("td");
                  
                  tdId.innerText = `${element.post_Id}`;
                  tdTitle.innerText = element.title.length > maxTitleLength ? element.title.substring(0, maxTitleLength) + '...' : element.title;
                  tdresistdate.innerText = `${element.resistdate}`;
                  tdview.innerText = `${element.view}`;
                  
            	   // 각 셀에 스코프 및 스타일 지정
                  tdId.setAttribute("scope", "col"); // 제목 셀에는 'row' 스코프를 지정합니다.
                  tdId.style.width = "5%"; // 제목 셀의 너비를 설정합니다.
                  tdTitle.setAttribute("scope", "col");
                  tdTitle.style.width = "73%"; // 내용 셀의 너비를 설정합니다.
                  tdresistdate.setAttribute("scope", "col");
                  tdresistdate.style.width = "15%"; // 작성일 셀의 너비를 설정합니다.
                  tdview.setAttribute("scope", "col");
                  tdview.style.width = "7%"
                  
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
              });
              
          });
    </Script>
</html>