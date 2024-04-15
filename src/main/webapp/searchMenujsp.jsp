<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>searchMenu</title>
<!-- Favicon-->
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<style>
/* 스크롤바의 전체 스타일 */
::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

/* 스크롤바의 track (스크롤바의 배경) */
::-webkit-scrollbar-track {
	background: #f1f1f1; /* 스크롤바 배경색 */
}

/* 스크롤바의 thumb (스크롤바의 핸들) */
::-webkit-scrollbar-thumb {
	background: #888; /* 스크롤바 핸들 색 */
	border-radius: 5px; /* 스크롤바 핸들의 둥근 모서리 반경 */
}

/* 스크롤바가 hover 됐을 때 */
::-webkit-scrollbar-thumb:hover {
	background: #555; /* 스크롤바 핸들 hover 시 색상 */
}
</style>
</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>

	<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center">
			<form
				class="d-flex flex-row align-items-center col-8 position-relative">
				<input class="form-control rounded-pill pl-3 pr-5" type="search"
					placeholder="Search" aria-label="Search" id="search" name="query"
					style="padding-right: 40px" /> <i
					class="bi bi-search position-absolute"
					style="right: 10px; top: 50%; transform: translateY(-50%)"></i>
			</form>
		</div>
	</main>

	<br />

	<div
		style="margin: 0px 26%; height: 650px; overflow: auto; background-color: white; border-radius: 15px;">

		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script>
for (let i = 0; i < 4; i++) {
  document.write(`
    <div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
      <span style="display: flex; flex-direction: column; width: 28%; height: 100%;">
        <img src="" alt="Thumbnail" style="border: 1px solid black; width: 100%; height: 70%"> <!-- 이미지 태그 추가 -->
        <span data-index="${i}" style="border: 1px solid black; width: 100%; height: 30%">상호명/위치</span>
      </span>
      <span style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">관련 블로그</span>
    </div>
  `);
}

// window.onload 이벤트 안에서 데이터 가져와서 출력하는 코드
window.onload = function () {
  // 장소 검색 객체를 생성합니다
  var ps = new kakao.maps.services.Places();

  // 검색 결과를 요청합니다
  searchPlaces();

  // 키워드 검색을 요청하는 함수입니다
  function searchPlaces() {
    var keyword = "부산 전포동 중식";

    if (!keyword.replace(/^\s+|\s+$/g, "")) {
      alert("키워드를 입력해주세요!");
      return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB);
  }

  // 장소검색이 완료됐을 때 호출되는 콜백함수입니다
  function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
      // 정상적으로 검색이 완료됐으면 상호명과 주소값을 추출합니다
      extractPlacesInfo(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
      alert("검색 결과가 존재하지 않습니다.");
      return;
    } else if (status === kakao.maps.services.Status.ERROR) {
      alert("검색 결과 중 오류가 발생했습니다.");
      return;
    }
  }

  // 검색 결과에서 상호명과 주소값을 추출하는 함수입니다
  function extractPlacesInfo(places) {
    var results = [];
    for (var i = 0; i < 4; i++) {
      var place = places[i];
      results.push({
        name: place.place_name,
        address: place.address_name,
      });
    }

    // 받은 데이터를 HTML에 추가하는 부분
    results.forEach((result, index) => {
      // 각 결과의 상호명과 위치를 가져옵니다
      const name = result.name;
      const address = result.address;

      // 이미지, 제목, 내용을 가져와서 HTML에 추가합니다
	  const spanElements = document.querySelectorAll(
              'span[data-index="' + index + '"]'
            );

            // 가져온 span 요소에 데이터를 추가합니다
            spanElements[0].innerText = name +" " + address;

		
    });
	
  }
};
function submitForm() {
    // 이미 존재하는 상호명과 주소를 가져옵니다.
    var nameAndAddress = document.querySelectorAll('span[data-index]');

    // 검색어를 가져옵니다.
    var keyword = nameAndAddress[0].innerText;

    // GET 방식으로 데이터를 전송하기 위해 URL을 구성합니다.
    var url = '/menu/recommand?' + 'keyword=' + encodeURIComponent(keyword);

    // 페이지를 해당 URL로 리다이렉트합니다.
    window.location.href = url;
}

// 폼 제출 이벤트를 설정합니다.
document.getElementById('searchForm').addEventListener('submit', function(event) {
    event.preventDefault(); // 기본 동작 방지
    submitForm(); // 폼 제출 함수 호출
});

    </script>
</body>
</html>