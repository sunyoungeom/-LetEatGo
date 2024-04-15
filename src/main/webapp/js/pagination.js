// pagination.js

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
