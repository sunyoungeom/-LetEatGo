<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html lang="kor">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>LetEatGo</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      rel="stylesheet"
    />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="./Resources/css/styles.css" rel="stylesheet" />
    <style>
      .box {
        display: inline-block;
        width: 450px;
        height: 420px;
        border: 2px solid gray;
        padding: 10px;
        border-radius: 10px;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
      }
    </style>
  </head>
  <body class="d-flex flex-column h-100 bg-light">
    <%@ include file="/WEB-INF/user/navigation.jsp"%>

    <main class="flex-shrink-0">
      <div class="container mt-5 d-flex justify-content-center">
        <form class="d-flex flex-row align-items-center col-8">
          <input
            class="form-control mr-2 rounded-pill"
            type="search"
            placeholder="Search"
            aria-label="Search"
          />
          <button class="btn btn-outline-success rounded-pill" type="submit">
            <i class="bi bi-search"></i>
            <!-- 돋보기 아이콘 -->
          </button>
        </form>
      </div>
    </main>

    <br />

    <div>
      <div class="container d-flex justify-content-between">
        <div class="box"></div>

        <div>
          <div
            class="border p-3 mb-2"
            style="
              width: 600px;
              height: 100px;
              margin-right: auto;
              margin-top: 50px;
            "
          >
            <a href="/map">주변 음식점 찾기</a>
          </div>
          <br />
          <br />
          <div
            class="border p-3 mb-2"
            style="width: 600px; height: 100px; margin-right: auto"
          >
            <a href="/recent"> 최근 간 음식점 </a>
          </div>
        </div>
      </div>
    </div>

    <br />
    <div style="margin: 0 20%">
      <table class="table table-hover table-bordered" id="postTable">
        <thead class="table-light">
          <tr>
            <th scope="col" style="text-align: center">#</th>
            <th scope="col">제목</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
          </tr>
        </thead>
        <tbody class="table-group-divider">
          <!-- 데이터는 JavaScript로 채웁니다 -->
        </tbody>
      </table>
    </div>

    <!-- Call to action section-->
    <!--   <section class="py-5 bg-gradient-primary-to-secondary text-white">
                <div class="container px-5 my-5">
                    <div class="text-center">
                        <h2 class="display-4 fw-bolder mb-4">Let's build something together</h2>
                        <a class="btn btn-outline-light btn-lg px-5 py-3 fs-6 fw-bolder" href="contact.html">Contact me</a>
                    </div>
                </div>
            </section>
        </main> -->
    <!-- Footer-->
    <footer class="bg-white py-4 mt-auto">
      <div class="container px-5">
        <div
          class="row align-items-center justify-content-between flex-column flex-sm-row"
        >
          <div class="col-auto">
            <div class="small m-0">Copyright &copy; LetEatGo 2024</div>
          </div>
          <div class="col-auto">
            <a class="small" href="#!">Privacy</a>
            <span class="mx-1">&middot;</span>
            <a class="small" href="#!">Terms</a>
            <span class="mx-1">&middot;</span>
            <a class="small" href="#!">Contact</a>
          </div>
        </div>
      </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
  <script>
    const postTable = document.getElementById("postTable");
    const tbody = postTable.querySelector("tbody");
    fetch("http://localhost:8080/recent", {
      method: "POST",
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
          tdTitle.innerText =
            element.title.length > maxTitleLength
              ? element.title.substring(0, maxTitleLength) + "..."
              : element.title;
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
          tdview.style.width = "7%";

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

	  fetch("http://localhost:8080/menu/recommand")
    .then((resp) => resp.json())
    .then((data) => {
		
        // 첫 번째 .box 요소만 선택합니다.
        const box = document.querySelector(".box");
        // 데이터가 존재하고 첫 번째 .box 요소도 존재하는지 확인합니다.
        if (data.length > 0 && box) {
            const searchResult = data[4]; // 첫 번째 검색 결과만 사용합니다.
            const titleElement = document.createElement("h3");
            // 제목을 클릭했을 때 해당 블로그로 이동하도록 설정합니다.
            titleElement.addEventListener("click", () => {
                window.location.href = searchResult.blogurl;
            });
            titleElement.textContent = searchResult.title;
            const contentsElement = document.createElement("p");
            contentsElement.textContent = searchResult.contents +"...";
            const thumbnailElement = document.createElement("img");
            thumbnailElement.src = searchResult.thumbnail;
            let h2 =  document.createElement("h2")
			let br =  document.createElement("br")
			h2.innerText = "관리자 추천 맛집!"
            // 생성된 요소들을 box에 추가합니다.
			box.appendChild(h2);
			box.appendChild(br);
            box.appendChild(titleElement);
            box.appendChild(contentsElement);
            box.appendChild(thumbnailElement);
        }
    });
  </script>
</html>
