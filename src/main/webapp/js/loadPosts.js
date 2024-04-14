function loadPosts(currentPage, fetchURI) {
    fetch(fetchURI, {
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
            tdresistdate.innerText = `${element.resistdate}`;
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
                window.location.href = `http://localhost:8080/post/detail?post_Id=${element.post_Id}`;
            });
            
            contenttr.appendChild(tdId);
            contenttr.appendChild(tdtitle);
            contenttr.appendChild(tdresistdate);
            contenttr.appendChild(tdview);
            tbody.appendChild(contenttr);
        });
        
        // 페이지네이션 표시
        displayPagination(data.totalPages, currentPage);
    });
}
