<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--<%@ page isELIgnored="true"%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>
	<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center"></div>
		<br />
	<div class="container">
   <!-- 위에 한 칸 -->
    <div class="row">
        <div class="col-md-12">
            <!-- 프로젝트 카드 1 -->
            <div class="card overflow-hidden rounded-4 border-0 mb-5" style="height: auto;">
                <div class="card-body p-0">
                    <!-- 가로로 이미지 6개 나열 -->
                    <div class="d-flex flex-row justify-content-between">
                        <% for (int i = 1; i <= 5; i++) { %>
                                <div class="d-flex flex-column align-items-center p-3">
                                    <img id="img<%= i %>" src="https://via.placeholder.com/150" alt="음식 이미지" style="width: 150px; height: 150px; margin-top: 10px">
                                    <% if (i == 1) { %>
                                        <h2 id="place<%= i %>" class="fw-bolder" style="margin-top: 10px">음식</h2>
                                    <% } %>
                                </div>
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 아래에 두 칸 -->
    <div class="row">
        <!-- 첫 번째 칸 -->
    <div class="col-md-8" id="map">
    <!-- 프로젝트 카드 2 -->
    <div class="card overflow-hidden rounded-4 border-0 mb-5" style="height: auto;">
        <div class="card-body p-0">
                <div class="d-flex flex-column align-items-center p-3">
                    <h2 id="place2" class="fw-bolder" style="margin-top: 10px">음식</h2>
                </div>
            </a>
        </div>
    </div>
</div>
<!-- 두 번째 칸 -->
<div class="col-md-4">
    <!-- 프로젝트 카드 3 -->
    <div class="card overflow-hidden rounded-4 border-0 mb-5" style="height: auto;">
        <div class="card-body p-0">
                <div class="d-flex flex-column align-items-center p-3">
                    <h2 id="place3" class="fw-bolder" style="margin-top: 10px"></h2>
                    <p id="contents" class="mb-0"></p>
                </div>
            </a>
        </div>
    </div>
</div>

	</main>
<input id="keyword" style="display: none;"/>
</body>
<script>
//현재 URL 가져오기
	var queryString = window.location.search;
	var urlParams = new URLSearchParams(queryString);
	var index = urlParams.get('index');
	console.log(index); // 이제 index 값인 3을 얻을 수 있습니다.
	

	fetch("/recent", {
	    method: 'POST'
	})
	.then((resp) => resp.json())
	.then((data) => {
		
	    const blogList = data["blogList"];
		const postList = data["placeByIdList"];
	     
        const resultList = blogList[index];
        
     // 섬네일을 가져와서 첫 번째 카드에 하나씩 넣기 (5개만)
        for (let i = 0; i < Math.min(resultList.length, 5); i++) {
            const thumbnail = resultList[i].thumbnail;
            const cardId = `img${i + 1}`;
            const imgElement = document.getElementById(cardId);
            imgElement.src = thumbnail;
            if(i==0) {
            	document.getElementById("place3").textContent = resultList[i].title;
            	document.getElementById("contents").textContent = resultList[i].contents;
            }
        } 
        document.getElementById("place1").textContent = postList[index].place;
        document.getElementById("keyword").value = postList[index].place;
	});


</script>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services"
    ></script>
    <script>
      // 사용자 주소기반으로 첫지도 위치 특정
      const keywordinput = document.getElementById("keyword");
      const apiURL = "/map/keyword";

      fetch(apiURL)
        .then((response) => response.text())
        .then((data) => {
          keywordinput.value = data;
          searchPlaces();
        })
        .catch((error) => {
          console.error("주소를 가져오는 중 에러가 발생했습니다.", error);
        });

      // 마커를 담을 배열입니다
      var markers = [];

      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(35.1665205, 129.0821654), // 지도의 중심좌표
          level: 3, // 지도의 확대 레벨
        };

      // 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places();

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

      // 키워드로 장소를 검색합니다

      // 키워드 검색을 요청하는 함수입니다
      function searchPlaces() {
        var keyword = document.getElementById("keyword").value + "음식점";

        if (!keyword.replace(/^\s+|\s+$/g, "")) {
          alert("키워드를 입력해주세요!");
          return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch(keyword, placesSearchCB);
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
          // 정상적으로 검색이 완료됐으면
          // 검색 목록과 마커를 표출합니다
          displayPlaces(data);

          // 페이지 번호를 표출합니다
          displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
          alert("검색 결과가 존재하지 않습니다.");
          return;
        } else if (status === kakao.maps.services.Status.ERROR) {
          alert("검색 결과 중 오류가 발생했습니다.");
          return;
        }
      }

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {
        var listEl = document.getElementById("placesList"),
          menuEl = document.getElementById("menu_wrap"),
          fragment = document.createDocumentFragment(),
          bounds = new kakao.maps.LatLngBounds(),
          listStr = "";

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for (var i = 0; i < places.length; i++) {
          // 마커를 생성하고 지도에 표시합니다
          var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i]);
          console.log(places.road_address_name); // 검색 결과 항목 Element를 생성합니다

          // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
          // LatLngBounds 객체에 좌표를 추가합니다
          bounds.extend(placePosition);

          // 마커와 검색결과 항목에 mouseover 했을때
          // 해당 장소에 인포윈도우에 장소명을 표시합니다
          // mouseout 했을 때는 인포윈도우를 닫습니다
          function decodeHtmlCharCodes(str) {
            return str.replace(/(&#[\d<>]+;)/g, (match, capture) =>
              String.fromCharCode(capture.replace(/[^0-9]/g, ""))
            );
          }

          var geocoder = new kakao.maps.services.Geocoder();

          (function (marker, title) {
            kakao.maps.event.addListener(marker, "mouseover", function () {
              displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, "mouseout", function () {
              infowindow.close();
            });
            // 클릭 이벤트 리스너 설정

            kakao.maps.event.addListener(marker, "click", function () {
              document.querySelector('.form-select').selectedIndex = 0;
              const resultTitle = document.getElementById("searchResult");
              const ing = document.getElementById("ing");
              const end = document.getElementById("end");
              resultTitle.innerHTML = ""; // 기존 내용 비우기

              // searchResult를 가져와서 오른쪽 메뉴를 추가
              const searchResult = document.getElementById("searchResult");
              ing.innerHTML = "";
              end.innerHTML = "";
              const clickedMarker = this;
              // 클릭한 마커의 인덱스를 찾습니다.
              const markerIndex = markers.indexOf(clickedMarker);
              // 클릭한 마커의 주소값을 가져옵니다.
              const clickedPlace = places[markerIndex];

              // 클릭한 마커의 제목(title) 값을 가져옵니다.
              const keyword = title + clickedPlace.address_name;
              //document.title = title;
              // 검색 API를 호출하여 결과를 처리합니다.
              fetch(
                `/map/search?keyword=${encodeURIComponent(
                  keyword
                )}&title=${title}`
              )
                .then((resp) => resp.json()) // JSON 형식으로 변환
                .then((data) => {
                  document
                    .querySelector(".form-select")
                    .addEventListener("change", function () {
                      const selectedOption = this.value; // 선택된 옵션의 값

                      // 선택된 옵션에 따라 다른 동작 수행
                      if (selectedOption === "블로그 보기") {
                        resultTitle.innerHTML = "";
                        const newDiv = document.createElement("div");
                        newDiv.classList.add(
                          "text-center",
                          "mb-2",
                          "mt-1",
                          "fs-6"
                        );

                        newDiv.innerHTML = ` <h4 class="display-5 fw-bolder mb-0">
                                          연관 블로그
                                        </h4>
                                        `;

                        resultTitle.appendChild(newDiv);

                        let gridDiv = document.createElement("div");
                        gridDiv.classList.add("grid-container");
                        let gridItem = document.createElement("div");
                        gridItem.classList.add("grid-item"); // 그리드 아이템 클래스 추가

                        data.blog.forEach((element, index) => {
                          let img = document.createElement("img");
                          img.src = `${element.thumbnail}`;
                          img.alt = "Thumbnail";
                          img.style.marginBottom = "5px"; // 이미지 하단 마진 추가
                          // img.style.marginLeft = "2px"; // 이미지 좌측 마진 추가
                          img.style.marginRight = "5px"; // 이미지 우측 마진 추가

                          // 이미지를 resultTitle에 추가
                          resultTitle.appendChild(img);

                          // 현재 인덱스가 배열의 마지막 요소인지, 홀수 번째 요소인지 확인하여 <hr> 추가
                        });

                        // 나머지 요소들을 출력하는 두 번째 루프
                        data.blog.forEach((element, index) => {
                          // 이미지 이후의 요소들을 출력
                          let br = document.createElement("br");
                          let at = document.createElement("a");
                          let p2 = document.createElement("p");
                          at.href = `${element.blogurl}`;
                          at.style.fontSize = "1.8em";
                          at.style.fontWeight = "bold"; // 글자 굵기 설정
                          p2.style.fontSize = "1.4em";
                          at.innerText = decodeHtmlCharCodes(
                            `${element.title}`
                          );
                          p2.innerText =
                            decodeHtmlCharCodes(`${element.contents}`) + "...";

                          // 요소들을 resultTitle에 추가
                          resultTitle.appendChild(br);
                          resultTitle.appendChild(at);
                          resultTitle.appendChild(p2);

                          // 경계선 추가
                          if ((index + 1) % 1 === 0) {
                            let hr = document.createElement("hr");
                            hr.style.marginBottom = "10px"; // 경계선 하단 마진 추가
                            resultTitle.appendChild(hr);
                          }
                        });

                        // 결과 타이틀에 그리드 컨테이너 추가
                        resultTitle.appendChild(gridDiv);
                        // 결과 타이틀에 스크롤바 추가
                        resultTitle.style.overflowY = "scroll";
                        resultTitle.style.maxHeight = "100%"; // 스크롤바 최대

                        // 나머지 요소들이 들어있는 그리드 컨테이너를 결과 타이틀에 추가
                        resultTitle.appendChild(gridDiv);
                        // 블로그 보기에 대한 처리
                      } else if (selectedOption === "진행중인 모임 보기") {
                        // 진행중인 모임 보기에 대한 처리
                        resultTitle.innerHTML = "";
                        data.ing.forEach((element) => {
                          let p = document.createElement("p");
                          let p2 = document.createElement("p");
                          let tr = document.createElement("tr");
                          let hr = document.createElement("hr");
                          p.innerText = element.title;
                          p2.innerText = element.content;
                          p.style.fontSize = "1.8em";
                          p.style.fontWeight = "bold"; // 글자 굵기 설정
                          p2.style.fontSize = "1.4em";
                          tr.addEventListener("click", () => {
                            window.location.href = `/post/detail?post_Id=${element.post_Id}`;
                          });
                          tr.appendChild(p);
                          tr.appendChild(p2);

                          resultTitle.appendChild(tr); // a 태그를 ing에 추가
                          resultTitle.appendChild(hr);
                        });
                      } else if (selectedOption === "종료된 모임 보기") {
                        // 종료된 모임 보기에 대한 처리
                        resultTitle.innerHTML = "";
                        data.end.forEach((element) => {
                          let p = document.createElement("p");
                          let p2 = document.createElement("p");
                          let tr = document.createElement("tr");
                          let hr = document.createElement("hr");
                          p.innerText = element.title;
                          p2.innerText = element.content;
                          p.style.fontSize = "1.8em";
                          p.style.fontWeight = "bold"; // 글자 굵기 설정
                          p2.style.fontSize = "1.4em";
                          tr.addEventListener("click", () => {
                            window.location.href = `/post/detail?post_Id=${element.post_Id}`;
                          });
                          tr.appendChild(p);
                          tr.appendChild(p2);

                          resultTitle.appendChild(tr); // a 태그를 ing에 추가
                          resultTitle.appendChild(hr);
                        });
                      }
                    });

                  const createpost = document.getElementById("createpost");
                  createpost.innerHTML = "";
                  let a = document.createElement("a");
                  a.href = "/map/search/createpost";
                  a.innerText = title + "에서 모임 만들기";
                  a.style.fontSize = "1.5em"; // 크기 조정
                  createpost.appendChild(a);

                  const newDiv = document.createElement("div");
                  newDiv.classList.add("text-center", "mb-2", "mt-1", "fs-6");

                  newDiv.innerHTML = ` <h4 class="display-5 fw-bolder mb-0">
                                          연관 블로그
                                        </h4>
                                        `;

                  resultTitle.appendChild(newDiv);

                  let gridDiv = document.createElement("div");
                  gridDiv.classList.add("grid-container");
                  let gridItem = document.createElement("div");
                  gridItem.classList.add("grid-item"); // 그리드 아이템 클래스 추가

                  data.blog.forEach((element, index) => {
                    let img = document.createElement("img");
                    img.src = `${element.thumbnail}`;
                    img.alt = "Thumbnail";
                    img.style.marginBottom = "5px"; // 이미지 하단 마진 추가
                    // img.style.marginLeft = "2px"; // 이미지 좌측 마진 추가
                    img.style.marginRight = "5px"; // 이미지 우측 마진 추가

                    // 이미지를 resultTitle에 추가
                    resultTitle.appendChild(img);

                    // 현재 인덱스가 배열의 마지막 요소인지, 홀수 번째 요소인지 확인하여 <hr> 추가
                  });

                  // 나머지 요소들을 출력하는 두 번째 루프
                  data.blog.forEach((element, index) => {
                    // 이미지 이후의 요소들을 출력
                    let br = document.createElement("br");
                    let at = document.createElement("a");
                    let p2 = document.createElement("p");
                    at.href = `${element.blogurl}`;
                    at.style.fontSize = "1.8em";
                    at.style.fontWeight = "bold"; // 글자 굵기 설정
                    p2.style.fontSize = "1.4em";
                    at.innerText = decodeHtmlCharCodes(`${element.title}`);
                    p2.innerText =
                      decodeHtmlCharCodes(`${element.contents}`) + "...";

                    // 요소들을 resultTitle에 추가
                    resultTitle.appendChild(br);
                    resultTitle.appendChild(at);
                    resultTitle.appendChild(p2);

                    // 경계선 추가
                    if ((index + 1) % 1 === 0) {
                      let hr = document.createElement("hr");
                      hr.style.marginBottom = "10px"; // 경계선 하단 마진 추가
                      resultTitle.appendChild(hr);
                    }
                  });

                  // 결과 타이틀에 그리드 컨테이너 추가
                  resultTitle.appendChild(gridDiv);
                  // 결과 타이틀에 스크롤바 추가
                  resultTitle.style.overflowY = "scroll";
                  resultTitle.style.maxHeight = "100%"; // 스크롤바 최대

                  // 나머지 요소들이 들어있는 그리드 컨테이너를 결과 타이틀에 추가
                  resultTitle.appendChild(gridDiv);

                  // 클릭한 마커 아래에 링크를 추가합니다.
                })
                .catch((error) => {
                  console.error("검색 API 호출 중 오류 발생:", error);
                });
            });

            itemEl.onmouseover = function () {
              displayInfowindow(marker, title);
            };

            itemEl.onmouseout = function () {
              infowindow.close();
            };
          })(marker, places[i].place_name);

          fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
      }

      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, places) {
        var el = document.createElement("li"),
          itemStr =
            '<span class="markerbg marker_' +
            (index + 1) +
            '"></span>' +
            '<div class="info">' +
            "   <h5>" +
            places.place_name +
            "</h5>";

        if (places.road_address_name) {
          itemStr +=
            "    <span>" +
            places.road_address_name +
            "</span>" +
            '   <span class="jibun gray">' +
            places.address_name +
            "</span>";
        } else {
          itemStr += "    <span>" + places.address_name + "</span>";
        }

        itemStr += '  <span class="tel">' + places.phone + "</span>" + "</div>";

        el.innerHTML = itemStr;
        el.className = "item";

        return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx, title) {
        var imageSrc =
            "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
          imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
          imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
          },
          markerImage = new kakao.maps.MarkerImage(
            imageSrc,
            imageSize,
            imgOptions
          ),
          marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage,
          });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker); // 배열에 생성된 마커를 추가합니다

        return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
        var paginationEl = document.getElementById("pagination"),
          fragment = document.createDocumentFragment(),
          i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
          paginationEl.removeChild(paginationEl.lastChild);
        }

        for (i = 1; i <= pagination.last; i++) {
          var el = document.createElement("a");
          el.href = "#";
          el.innerHTML = i;

          if (i === pagination.current) {
            el.className = "on";
          } else {
            el.onclick = (function (i) {
              return function () {
                pagination.gotoPage(i);
              };
            })(i);
          }

          fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + "</div>";

        infowindow.setContent(content);
        infowindow.open(map, marker);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
          el.removeChild(el.lastChild);
        }
      }
    </script>

</html>