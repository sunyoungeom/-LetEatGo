<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시물 작성</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
    rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style>
#container {
    border: 2px solid black;
    margin: 2px;
    display: flex;
    flex-direction: column;
}

.input-container {
    margin: 2px;
    border: 1px solid black;
    padding: 1px;
    position: relative;
}

.content-container {
    position: relative;
}

#title {
    width: calc(100% - 10px);
    height: 70px;
    margin-bottom: 10px;
    resize: vertical;
}

#title-label {
    position: absolute;
    top: 5px;
    left: 5px;
}

#map {
    width: 100%;
    height: 500px;
    position: relative;
    overflow: hidden;
}

.map_wrap {
    width: 100%;
    height: 100%;
}

#menu_wrap {
    width: 30%;
    height: 45%;
}

.bg_white {
    background-color: white;
}

.option {
    margin-bottom: 10px;
}

#placesList {
    list-style-type: none;
    padding: 0;
}

#postForm {
    display: flex;
    flex-direction: column;
}

#submitButton {
    align-self: flex-end;
    margin-top: auto;
}
</style>
</head>
<body>
<%@ include file="../user/navigation.jsp"%>
<h1>같이 먹어요</h1>
<form id="postForm" action="/createPost" method="post">
    <div id="container">
        <div class="input-container">
            <input id="title" name="title" /> <label for="title"
                id="title-label">제목</label>
        </div>
        <div class="input-container">
            <p>언제 먹을까요?</p>
            <input type="date" id="expireDate" name="expireDate" />
        </div>
        <form id="mapForm">
            <button id="openPlaceMap" type="button">장소를 선택해주세요</button>
            <dialog id="mapDialog">
            <div class="map_wrap">
                <div id="map"></div>
                <div id="menu_wrap" class="bg_white">
                    <div class="option">
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" id="keyword" size="15" />
                            <button type="button" id="search">검색하기</button>
                        </form>
                    </div>
                    <hr />
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
            </div>
            </dialog>
            <br /> <br />
        </form>
        <div class="content-container">
            <textarea id="content" name="content" rows="10" cols="50">내용을 입력하세요</textarea>
        </div>
        <input type="hidden" id="placeMap" name="placeMap" />
        <div id="place"></div>
        <div id="tagResult"></div>
        <button id="openTagDialog" type="button">tag</button>
        <dialog id="dialogForm"></dialog>
    </div>
    <input id="submitButton" type="submit" value="등록" />
</form>
</body>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services"></script>

	<script>
      const dialogForm = document.getElementById("dialogForm");
      const openTagDialogBtn = document.getElementById("openTagDialog");
      const tagResult = document.getElementById("tagResult");

      const openPlaceMap = document.getElementById("openPlaceMap");
      const mapDialog = document.getElementById("mapDialog");
      const mapForm = document.getElementById("mapForm");
      const placeMap = document.getElementById("placeMap");
      const place = document.getElementById("place");
      const submitButton = document.querySelector('input[type="submit"]');
      // 제출 버튼 클릭 이벤트를 추가합니다.
      submitButton.addEventListener("click", function (event) {
        // 필드의 값을 가져옵니다.
        const title = document.getElementById("title").value.trim();
        const expireDate = document.getElementById("expireDate").value.trim();
        const content = document.getElementById("content").value.trim();

        // 필드의 내용이 null인지 확인합니다.
        if (
          title === "" ||
          expireDate === "" ||
          content === "" ||
          placeMap === ""
        ) {
          // 필드의 내용이 null이면 등록 동작을 막습니다.
          event.preventDefault();
          alert("제목, 만료일 ,장소 및 내용을 입력하세요.");
        }
      });

      openPlaceMap.addEventListener("click", openMapDialog);

      function openMapDialog(e) {
        e.preventDefault;
        mapDialog.showModal();

        const keywordinput = document.getElementById("keyword");
        const apiURL = "http://localhost:8080/map/keyword";

        var markers = [];

        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 2, // 지도의 확대 레벨
          };

        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

        const search = document.getElementById("search");
        search.addEventListener("click", searchPlaces);

        mapDialog.addEventListener("keydown", function (e) {
          if (e.key === "Enter") {
            e.preventDefault();
            search.click(); // 검색하기 버튼 클릭 이벤트 발생
          }
        });
        // 키워드로 장소를 검색합니다

        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces(e) {
          var keyword = document.getElementById("keyword").value + "음식점";

          if (!keyword.replace(/^\s+|\s+$/g, "")) {
            alert("키워드를 입력해주세요!");
            return false;
          }

          // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
          ps.keywordSearch(keyword, placesSearchCB);
        }

        fetch(apiURL)
          .then((response) => response.text())
          .then((data) => {
            keywordinput.value = data;
            searchPlaces();
          })
          .catch((error) => {
            console.error("주소를 가져오는 중 에러가 발생했습니다.", error);
          });

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
              itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function (marker, title) {
              kakao.maps.event.addListener(marker, "mouseover", function () {
                displayInfowindow(marker, title);
              });

              kakao.maps.event.addListener(marker, "mouseout", function () {
                infowindow.close();
              });
              kakao.maps.event.addListener(marker, "click", function () {
                place.innerText = "";
                place.innerText = "선택한 음식점: " + title;
                document.getElementById("placeMap").value = title; // placeMap 파라미터에 값을 설정합니다
                mapDialog.close();
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

          itemStr +=
            '  <span class="tel">' + places.phone + "</span>" + "</div>";

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
          var content =
            '<div style="padding:5px;z-index:1;">' + title + "</div>";

          infowindow.setContent(content);
          infowindow.open(map, marker);
        }

        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {
          while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
          }
        }
      }

      openTagDialogBtn.addEventListener("click", openTagDialog);

      function openTagDialog(e) {
        fetch("http://localhost:8080/tagform.html")
          .then((resp) => resp.text())
          .then((inner) => {
            dialogForm.innerHTML = inner;
            dialogForm.showModal();

            const closeTagDialogBtn = document.getElementById("closeTagDialog");
            const confirmTagDialogBtn =
              document.getElementById("confirmTagDialog");

            closeTagDialogBtn.addEventListener("click", closeTagDialog);
            confirmTagDialogBtn.addEventListener("click", confirmTagDialog);

            dialogForm.addEventListener("keydown", function (e) {
              if (e.key === "Enter") {
                e.preventDefault();
              }
            });
          });
      }

      function closeTagDialog(e) {
        e.preventDefault();
        dialogForm.close();
      }

      function confirmTagDialog(e) {
        e.preventDefault();

        let budget = "";
        let booze = "";
        let age = "";
        let gender = "";
        let peopleLimit = "";

        // 인당 한도 금액 선택 여부 확인
        const limitChecked = document.querySelector(
          'input[name="budget"]:checked'
        );
        budget = limitChecked ? limitChecked.value : "선택안함";

        // 음주 유무 선택 여부 확인
        const drinkChecked = document.querySelector(
          'input[name="booze"]:checked'
        );
        booze = drinkChecked ? drinkChecked.value : "선택안함";

        // 나이 선택 여부 확인
        const ageChecked = document.querySelector('input[name="age"]:checked');
        age = ageChecked ? ageChecked.value : "선택안함";

        // 성별 선택 여부 확인
        const genderChecked = document.querySelector(
          'input[name="gender"]:checked'
        );
        gender = genderChecked ? genderChecked.value : "선택안함";

        // 인원수 선택 여부 확인
        const peopleLimitChecked = document.querySelector(
          'input[name="peopleLimit"]:checked'
        );
        peopleLimit = peopleLimitChecked
          ? peopleLimitChecked.value
          : "선택안함";

        // 결과를 tagResult 영역에 출력합니다.
        tagResult.innerHTML = `<p>인당 한도 금액: ${budget}</p>
                           <p>음주 유무: ${booze}</p>
                           <p>나이: ${age}</p>
                           <p>성별: ${gender}</p>
                           <p>인원수: ${peopleLimit}</p>`;
        dialogForm.close();
      }
    </script>
</body>
</html>
