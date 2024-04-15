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
        function formattedDate(element) {
        // MySQL DATETIME 값을 Date 객체로 변환
        const timestamp = Number(element.reviewDate);
        const date = new Date(timestamp);

        // 년, 월, 일 추출
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0"); // 월은 0부터 시작하므로 1을 더하고, 2자리로 맞춤
        const day = String(date.getDate()).padStart(2, "0"); // 일은 1일부터 시작하므로 2자리로 맞춤

        // 'YYYY-MM-DD' 형식으로 문자열 조합
        const formattedDate = `${year}-${month}-${day}`;

        return formattedDate;
      }
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