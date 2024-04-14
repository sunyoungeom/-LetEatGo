<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사람 목록</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
    rel="stylesheet" />
<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
    rel="stylesheet">
<style>
    .circle-container {
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-top: 35px;
        margin-bottom: 35px;
    }

    .circle {
        width: 250px;
        height: 250px;
        background-color: #3498db;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        font-size: 24px;
    }

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

    .rectangle {
        display: inline-block;
        width: 170px;
        height: 170px;
        border: 2px solid gray;
        padding: 10px;
        border-radius: 10px;
        margin: 10px;
    }

    @media screen and (max-width: 768px) {
        .box {
            width: 100%;
        }
        .rectangle {
            width: 100%;
            margin: 10px 0;
        }
        .circle-container {
            margin-right: 20px;
            margin-left: 20px;
        }
    }
</style>
</head>
<body>
    <%@ include file="../user/navigation.jsp"%>
    <br>
    <div class="total" style="margin: 0 20%">
        <div class="container d-flex justify-content-between">
            <div class="box">
                <div class="rectangle"></div>
                <div class="rectangle"></div>
                <div class="rectangle"></div>
                <div class="rectangle"></div>
            </div>

            <div>
                <div class="border p-3 mb-2"
                    style="width: 600px; height: 100px; margin-right: auto; margin-top: 50px">
                    <a href="/person/personmap">주변사람 찾기</a>
                    </div>
                <br> <br>
                <div class="border p-3 mb-2"
                    style="width: 600px; height: 100px; margin-right: auto;">최근
                    같이 먹은 사람</div>
            </div>
        </div>

        <br>
        <div class="container" style="margin: 0 8%;">
            <div class="border p-3 mb-2" style="border-radius: 10px; width: 90%;">
                <div class="d-flex justify-content-between">
                    <div class="d-flex align-items-center">
                        <button class="btn btn-primary me-3">셔플</button>
                        <input class="form-check-input me-1" type="radio" name="option"
                            value="option1"> <label class="form-check-label me-3">혈액형</label>
                        <input class="form-check-input me-1" type="radio" name="option"
                            value="option2"> <label class="form-check-label me-3">MBTI</label>
                        <input class="form-check-input me-1" type="radio" name="option"
                            value="option3"> <label class="form-check-label">상관없음</label>

                    </div>
                    <select class="form-select" style="width: 10%;">
                        <option selected>거리순</option>
                        <option>Value 2</option>
                    </select>
                </div>
                <div class="circle-container">
                    <div>
                        <div class="circle">adfsdafsdsdfasdf</div>
                        <a href="/person/detail">페이지 이동 테스트</a>
                        <div>닉네임(만 00세)</div>
                        <div>별점 평균</div>
                        <div>태크,태크</div>
                    </div>
                    <div>
                        <div class="circle">adfsdafsdsdfasdf</div>
                        <div>닉네임(만 00세)</div>
                        <div>별점 평균</div>
                        <div>태크,태크</div>
                    </div>
                    <div>
                        <div class="circle">adfsdafsdsdfasdf</div>
                        <div>닉네임(만 00세)</div>
                        <div>별점 평균</div>
                        <div>태크,태크</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services,geometry">
         // fetchData 함수 정의
      function fetchData() {
        fetch("/person/personmap/searchperson")
          .then((response) => {
            if (!response.ok) {
              throw new Error("Network response was not ok");
            }
            return response.json();
          })
          .then((data) => {
            // 받아온 데이터에서 중심 좌표와 다른 주소들을 가져옴
            var userAddress = data.userAddress;
            var allUsers = data.allUsers;

            // 주소를 좌표로 변환하는 함수
            function addressToCoords(address) {
              return new Promise(function (resolve, reject) {
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(address, function (result, status) {
                  if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(
                      result[0].y,
                      result[0].x
                    );
                    resolve(coords);
                  } else {
                    reject("Geocoder failed due to: " + status);
                  }
                });
              });
            }

            // 두 지점 간의 거리를 계산하는 함수 (Haversine 공식)
            function calculateDistance(coord1, coord2) {
              var R = 6371; // 지구의 반지름 (단위: km)
              var lat1 = coord1.getLat();
              var lon1 = coord1.getLng();
              var lat2 = coord2.getLat();
              var lon2 = coord2.getLng();

              var dLat = ((lat2 - lat1) * Math.PI) / 180;
              var dLon = ((lon2 - lon1) * Math.PI) / 180;

              var a =
                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos((lat1 * Math.PI) / 180) *
                  Math.cos((lat2 * Math.PI) / 180) *
                  Math.sin(dLon / 2) *
                  Math.sin(dLon / 2);

              var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

              var distance = R * c;
              return distance.toFixed(1); // 소수점 1자리까지 반올림
            }

            // 만 나이 계산 함수
            function calculateAge(birthYear) {
              var currentYear = new Date().getFullYear();
              var age = currentYear - birthYear;
              return age;
            }

            // 성별 판별 함수
            function getGender(lastDigit) {
              return lastDigit % 2 === 1 ? "남자" : "여자";
            }


            // 중심 좌표와 다른 주소들 간의 거리를 계산하여 출력
            addressToCoords(userAddress)
              .then(function (centerCoords) {
                var personList = document
                  .getElementById("personList")
                  .getElementsByTagName("tbody")[0];
                var personTable = document.getElementById("personTable");
                var distanceSelect = document.getElementById("distanceSelect");
                var selectedDistance = parseInt(distanceSelect.value);
                personList.innerHTML = ""; // 이전 결과 삭제

                allUsers.forEach(function (user) {
                  addressToCoords(user.address)
                    .then(function (coords) {
                      var distance = calculateDistance(centerCoords, coords);
                      // 주민등록번호 앞 두 자리를 연도로 변환 (19를 제외)
                      var birthYear =
                        parseInt(user.identifynumber.substring(0, 2)) + 1900;
                      // 만 나이 계산
                      var age = calculateAge(birthYear);
                      // 주민등록번호의 마지막 숫자를 가져와 성별 판별
                      var gender = getGender(
                        parseInt(
                          user.identifynumber.charAt(
                            user.identifynumber.length - 1
                          )
                        )
                      );
                      // 나이가 세 자리수 이상일 경우 두 자리로 축소
                      if (age >= 100) {
                        age = parseInt(age.toString().slice(1));
                      }
                      // 선택된 거리보다 작은 경우에만 출력
                      if (distance <= selectedDistance) {
                        var row = personList.insertRow();
                        var cellNickname = row.insertCell(0);
                        var cellAge = row.insertCell(1);
                        var cellGender = row.insertCell(2);
                        var cellDistance = row.insertCell(3);
                        row.onclick = function () {
                          // 클릭 시 해당 링크로 이동
                          // 여기에 링크 주소 넣으면 됨
                        };
                        cellNickname.innerHTML = user.nickname;
                        cellAge.innerHTML = age + "세";
                        cellGender.innerHTML = gender;
                        cellDistance.innerHTML = distance + "km";

                        // 마커 표시 및 이벤트 리스너 추가
                        addressToCoords(user.address)
                          .then(function (coords) {
                            var distance = calculateDistance(centerCoords, coords);
                            if (distance <= selectedDistance) {
                              var marker = new kakao.maps.Marker({
                                position: coords,
                                map: map,
                              });

                              // 마커 이벤트 리스너 추가
                              addMarkerEventListeners(marker, user, age, gender, distance);
                            }
                          })
                          .catch(function (error) {
                            console.error(error);
                          });
                      }
                    })
                    .catch(function (error) {
                      console.error(error);
                    });
                });

                // 지도에 마커 표시
                var mapContainer = document.getElementById("map");
                var mapOptions = {
                  center: centerCoords,
                  level: 7,
                };
                var map = new kakao.maps.Map(mapContainer, mapOptions);
              })
              .catch(function (error) {
                console.error(error);
              });
          })
          .catch((error) => {
            console.error(
              "There was a problem with the fetch operation:",
              error
            );
          });
      }

      // fetchData 함수 호출
      fetchData();

      // 콤보박스 변경 이벤트 핸들러
      var distanceSelect = document.getElementById("distanceSelect");
      distanceSelect.addEventListener("change", function () {
        fetchData(); // 거리 옵션이 변경되면 다시 데이터 가져오기
      });

</script>
</body>
</html>
