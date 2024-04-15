<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 만난 사람</title>
</head>
<body>
	<%@ include file="../user/navigation.jsp"%>


    <div id="recentpersonList"></div>
		<main class="flex-shrink-0">
			<div class="container">
				<div class="row justify-content-center">
					<!-- 가운데 정렬을 위한 클래스 적용 -->
					<div class="col-10">
						<!-- 6칸 설정 -->
						<h3>마지막으로 만난 사람들</h3>
						<table class="table table-hover table-bordered" id="personTable">
							<thead class="table-light">
								<tr>
									<th scope="col" style="text-align: center;">#</th>
									<th scope="col">닉네임</th>
									<th scope="col">MBTI</th>
									<th scope="col">혈액형</th>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<!-- 자바 스크립트영역에서 추가 예정 -->							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>



<script>
	const postTable = document.getElementById("personTable");
	const tbody = personTable.querySelector("tbody");
	
	fetch("http://localhost:8080/recent/person", {
        method: 'POST'
   	})
    .then((resp) => resp.json())
    .then((data) => {
    	tbody.innerHTML = "";
    	data.forEach((element) => {
    	// 요소 생성
    	let contenttr = document.createElement("tr");
        let tdId = document.createElement("td");
        let tdTitle = document.createElement("td");
        let tdresistdate = document.createElement("td");
        let tdview = document.createElement("td");
    	// 내용 추가
        tdId.innerText = `${element.user_id}`;
        tdTitle.innerText = `${element.nickname}`;
        tdresistdate.innerText = `${element.mbti}`;
        tdview.innerText = `${element.bloodtype}`;
    	
        // 각 셀에 스코프 및 스타일 지정
        tdId.setAttribute("scope", "col"); // 제목 셀에는 'row' 스코프를 지정합니다.
        tdId.style.width = "5%"; // 제목 셀의 너비를 설정합니다.
        tdTitle.setAttribute("scope", "col");
        tdTitle.style.width = "73%"; // 내용 셀의 너비를 설정합니다.
        tdresistdate.setAttribute("scope", "col");
        tdresistdate.style.width = "15%"; // 작성일 셀의 너비를 설정합니다.
        tdview.setAttribute("scope", "col");
        tdview.style.width = "7%"
        
        // 가운데 정렬
        tdId.style.textAlign = "center";
        tdview.style.textAlign = "center";
        
        // 클릭 이벤트 추가하여 상세 페이지로 이동 수정 예정
        /* tdTitle.addEventListener("click", () => {
            window.location.href = `/post/detail?post_Id=${element.post_Id}`;
        }); */
        
        // 요소 tr담아서 tbody에 추가
        contenttr.appendChild(tdId);
        contenttr.appendChild(tdTitle);
        contenttr.appendChild(tdresistdate);
        contenttr.appendChild(tdview);
        tbody.appendChild(contenttr);
        
    	});
    	
    });
    
	
	
	
	
	
	
	
</script>

</html>