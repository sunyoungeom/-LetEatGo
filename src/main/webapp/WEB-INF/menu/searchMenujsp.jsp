<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
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
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>
	
		<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center">
			<form
				class="d-flex flex-row align-items-center col-8 position-relative">
				
			</form>
		</div>
	</main>
	
	<br>
	
	<div style="margin: 0px 26%; height:650px; overflow: auto; background-color: white; border-radius: 15px; ">
		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span  style="border: 1px solid black; width: 53%; height: 70%">
		    		<img id="i1" >
		    	</span>
		    	
		    	
		    	<span id="n1" style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span id="t1" style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>
		
		
		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span style="border: 1px solid black; width: 53%; height: 70%">
		    		<img id="i2">
		    	</span>
		    	
		    	
		    	<span id="n2" style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span id="t2" style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>
		
		
		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span  style="border: 1px solid black; width: 53%; height: 70%">
		    		<img id="i3">
		    	</span>
		    	
		    	
		    	<span id="n3" style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span id="t3" style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>

		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span  style="border: 1px solid black; width: 53%; height: 70%">
		    		<img id="i4">
		    	</span>
		    	
		    	
		    	<span id="n4" style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span id="t4" style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>
		
		
	</div>

	<%
    // ELIgnored로 인해 EL 사용 불가능하므로, 스크립트릿으로 속성을 가져옵니다
    String category = (String) request.getAttribute("category");
    String userAddress = (String) request.getAttribute("userAddress");
%>
	
  

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services"
    ></script>
    <script>
       
    console.log("<%= category %>");
    console.log("<%= userAddress %>");
    var category = "<%= category %>";
    var userAddress = "<%= userAddress %>";
      //window.onload 이벤트를 활용하여 코드 실행
      window.onload = function () {
        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();

        // 검색 결과를 요청합니다
        searchPlaces();

        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() {
          var keyword = userAddress + category;

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
          // 추출된 정보를 활용합니다 (예: 배열 'results'에 상호명과 주소값이 저장됨)
          console.log(results);

          // 받은 데이터를 HTML에 추가하는 부분
          results.forEach((result, index) => {
    // 각 결과의 상호명과 위치를 가져옵니다
    const name = result.name;
    const address = result.address;

    // 각 span 요소를 가져옵니다
    const nameSpan = document.getElementById(`n${index + 1}`);
	const thumbnailImg = document.getElementById(`i${index + 1}`);
    const titleSpan = document.getElementById(`t${index + 1}`);

    // 결과가 있을 경우에만 값을 넣어줍니다
    if (nameSpan) {
      nameSpan.textContent = `${name}/${address}`;
    } else {
      console.error(`Span element n${index + 1} not found`);
    }
	fetch(`/menu/recommand?keyword=${encodeURIComponent(name)}`)
        .then((resp) => resp.json()) // JSON 형식으로 변환
        .then((data) => {
			const firstItem = data[0];

            // 받아온 데이터에서 섬네일, 제목, 내용 가져오기
            const thumbnailUrl = firstItem.thumbnail.split('\n');
            const titles = firstItem.title.split('\n');
const contents = firstItem.contents.split('\n');
			
            //const titleSpan = document.getElementById(`t${index + 1}`);

// 결과가 있을 경우에만 값을 넣어줍니다
if (titleSpan) {
    // name 값을 한 글자씩 쪼개어 배열로 만듭니다
    const nameCharacters = name.split('');
    
    // titles 배열을 순회하며 name의 각 글자가 title에 포함되는지 확인합니다
    const matchingIndex = titles.findIndex(title => {
        // name의 각 글자가 title에 포함되는지 확인하는 카운터 변수를 선언합니다
        let counter = 0;
        for (let i = 0; i < nameCharacters.length; i++) {
            const character = nameCharacters[i];
            if (title.includes(character)) {
                counter++;
            }
        }
        // name의 각 글자가 title에 3글자 이상 포함되는지 확인하고, 포함되면 true를 반환합니다
        return counter >= 3;
    });
    
    // 해당 인덱스가 존재하면 해당 인덱스에 맞는 title과 content 값을 가져옵니다
    if (matchingIndex !== -1) {
        const titleValue = titles[matchingIndex];
        const contentValue = contents[matchingIndex] +"...";
        
        // t1부터 t4까지의 요소에 값을 넣어줍니다
        titleSpan.innerHTML = `<strong style="font-weight: bold;font-size: larger">${titleValue}</strong>:<br><br> <span>${contentValue}</span>`;
        
        // 섬네일 이미지를 가져와서 img 태그에 추가합니다
        const thumbnailImg = document.getElementById(`i${index + 1}`);
        if (thumbnailImg) {
            thumbnailImg.src = thumbnailUrl[matchingIndex];
        } else {
            console.error(`Img element i${index + 1} not found`);
        }
    } else {
        console.error(`Name '${name}' not found in titles array`);
    }
} else {
    console.error(`Span element t${index + 1} not found`);
}
            
        });
  });
			

		
         
        }
      };
    </script>
  </body>
</html>