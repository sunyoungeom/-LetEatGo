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
.topcontaine {
	display: flex;
	justify-content: space-between;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
}

.button-container {
	width: 65%;
	height: 270px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-top: 20px;
	display: flex;
}

.box {
	display: inline-block;
	width: 50%;
	height: 100%;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
}

@media screen and (max-width: 768px) {
	.box {
		width: 100%;
	}
	.circle-container {
		margin-right: 20px;
		margin-left: 20px;
	}
}

.carousel-item .col-md-4 {
	padding: 0 10px; /* 좌우 패딩을 24px로 설정 */
}

.card {
	height: auto;
	background-color: #FFFFFF; /* 백그라운드 색상 */
	border: 1px solid #dee2e6; /* 테두리 */
}

.card-body {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 24px; /* 내부 패딩 */
	text-align: center;
}

.card-img-top {
	width: 100px;
	height: auto;
	margin-top: 11px;
	margin-bottom: 11px; /* 이미지 하단 마진 추가 */
}

.card-text {
	margin: 0; /* 텍스트 마진 제거 */
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/user/navigation.jsp"%>

	<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center">
			<form
				class="d-flex flex-row align-items-center col-8 position-relative">
				<input class="form-control rounded-pill pl-3 pr-5" type="search"
					placeholder="Search" aria-label="Search" id="search" name="query"
					style="padding-right: 40px;" /> <i
					class="bi bi-search position-absolute"
					style="right: 10px; top: 50%; transform: translateY(-50%);"></i>
			</form>
		</div>
		<br />

		<div class="container">
			<div class="d-flex justify-content-center">
				<div class="col-8">
					<h3>핫 피플</h3>

					<div id="menuCarousel" class="carousel slide"
						data-bs-ride="carousel" data-bs-interval="3000">
						<div class="carousel-inner">

							<!-- Carousel Item 1 -->
							<div class="carousel-item active">
								<div class="d-flex justify-content-center">
									<!-- 각 카드를 이곳에 배치 -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-1" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-1"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>

									<!-- 두 번째 카드 (중식) -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-2" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-2"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>

									<!-- 세 번째 카드 (양식) -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-3" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-3"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 추가 Carousel Items (필요한 경우) -->
							<!-- Carousel Item 1 -->
							<div class="carousel-item active">
								<div class="d-flex justify-content-center">
									<!-- 각 카드를 이곳에 배치 -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-4" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-4"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>

									<!-- 두 번째 카드 (중식) -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-5" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-5"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>

									<!-- 세 번째 카드 (양식) -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-6" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-6"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="carousel-item active">
								<div class="d-flex justify-content-center">
									<!-- 각 카드를 이곳에 배치 -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-7" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-7"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>

									<!-- 두 번째 카드 (중식) -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-8" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-8"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>

									<!-- 세 번째 카드 (양식) -->
									<div class="col-md-4">
										<div class="card overflow-hidden rounded-4 border-0 mb-3"
											id="card-9" style="height: auto; cursor: pointer;">
											<div class="card-body p-0 border rounded-4">
												<div class="d-flex flex-column align-items-center p-3">
													<img src="../Resources/image/profile.png" alt="음식 이미지"
														class="card-img-top"
														style="width: 100px; height: auto; margin-top: 11px;">
													<div class="card-body">
														<p class="card-text" id="card-text-9"></p>
													</div>
												</div>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col-lg-4">
								<a href="/person/personmap"
									style="text-decoration: none; color: #343a40;">
									<div class="border p-3 mb-2 rounded-4"
										style="height: 70px; background-color: #FFFFFF; display: flex; align-items: center; justify-content: center;">
										<h4 class="fw-bolder" style="margin-bottom: 0px;">주변 사람
											찾기</h4>
									</div>
								</a>
							</div>
							<div class="col-lg-4">
								<a href="/recent/person"
									style="text-decoration: none; color: #343a40;">
									<div class="border p-3 mb-2 rounded-4"
										style="height: 70px; background-color: #FFFFFF; display: flex; align-items: center; justify-content: center;">
										<h4 class="fw-bolder" style="margin-bottom: 0px;">최근 만난
											사람</h4>
									</div>
								</a>
							</div>
							<div class="col-lg-4">
								<form action="/post/createPost" method="get"
									style="text-decoration: none; color: #343a40;">
									<button type="submit" class="border p-3 mb-2 rounded-4"
										style="height: 70px; background-color: #FFFFFF; display: flex; align-items: center; justify-content: center; width: 100%; border: none;">
										<h4 class="fw-bolder" style="margin-bottom: 0px;">같이 먹어요</h4>
									</button>
								</form>
							</div>
						</div>

						<br />



						<div class="row">
							<div class="container">
								<hr>
								<br>
								<h3>최근 게시물</h3>
								<div class="border p-3 mb-2" style="border-radius: 10px;">
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-center">
											<button class="btn btn-primary me-3">셔플</button>
											<div class="form-check me-3">
												<!-- 여기에 me-3 클래스 추가 -->
												<input class="form-check-input" type="radio" name="option"
													id="option1" value="3"> <label
													class="form-check-label" for="option1"> 3Km 이내 </label>
											</div>
											<div class="form-check me-3">
												<!-- 여기에 me-3 클래스 추가 -->
												<input class="form-check-input" type="radio" name="option"
													id="option2" value="5"> <label
													class="form-check-label" for="option2"> 5Km 이내 </label>
											</div>
											<div class="form-check me-3">
												<!-- 여기에 me-3 클래스 추가 -->
												<input class="form-check-input" type="radio" name="option"
													id="option3" value="10"> <label
													class="form-check-label" for="option3"> 10Km 이내 </label>
											</div>
											<div class="form-check">
												<!-- 여기에 me-3 클래스 추가 -->
												<input class="form-check-input" type="radio" name="option"
													id="option4" value="1000000" checked> <label
													class="form-check-label" for="option4"> 상관없음 </label>
											</div>
										</div>

										<select class="form-select" style="width: 20%;">
											<option selected>상관없음</option>
											<option>혈액형</option>
											<option>MBTI</option>
										</select>
									</div>



									<div id="personList">
										<table id="personTable">
											<thead>
												<tr>
													<th>Nickname</th>
													<th>Age</th>
													<th>Gender</th>
													<th>Distance</th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>



								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>










	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services,geometry">
	</script>

	<script>
 // fetchData 함수 정의
     function fetchData() {
    	 var selectedDistance = parseInt(document.querySelector('input[name="option"]:checked').value);
    	 var selectBox = document.querySelector('.form-select'); // 콤보 박스 선택
    	 document.querySelector('.form-select').addEventListener('change', fetchData);
    	 var selectedValue = selectBox.value; // 선택된 값
    	 
    	 fetch("/person/personmap/searchperson")
          .then((response) => {
            if (!response.ok) {
              throw new Error("Network response was not ok");
            }
            return response.json();
          })
          .then((data) => {

            function filterUsersByNickname(searchValue) {
  Array.from(document.querySelectorAll("#personList tbody tr")).forEach((row) => {
    const nicknameCell = row.querySelector("td:first-child"); // 닉네임 셀 선택
    const nickname = nicknameCell.textContent.toLowerCase(); // 소문자로 변환한 닉네임 텍스트

    // 검색어가 닉네임에 포함되어 있으면 해당 행을 표시하고, 아니면 숨깁니다.
    if (nickname.includes(searchValue.toLowerCase())) {
      row.style.display = ""; // 보이기
    } else {
      row.style.display = "none"; // 숨기기
    }
  });
}

// 검색 이벤트 리스너 추가
document.querySelector('.form-control').addEventListener('input', () => {
  const searchValue = document.querySelector('.form-control').value.trim(); // 입력값 가져오기
  filterUsersByNickname(searchValue); // 검색어와 일치하는 사용자만 표시
});
            // 받아온 데이터에서 중심 좌표와 다른 주소들을 가져옴
            var userAddress = data.userAddress;
            var allUsers = data.allUsers;
            var bloodtype = data.user.bloodtype;
            var mbti = data.user.mbti;
            
            console.log(`User.bloodtype: ${bloodtype}`);
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
                var selectedDistance = parseInt(document.querySelector('input[name="option"]:checked').value);
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
                        if(user.bloodtype === bloodtype && selectedValue=="혈액형") {
                        	console.log("혈액형참");
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
                        } else if(user.mbti == mbti && selectedValue=="MBTI") {
                        	console.log("MBTI참");
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
                        	
                        } else if(selectedValue=="상관없음"){
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
                        	
                        }
                      }
                    })
                    .catch(function (error) {
                      console.error(error);
                    });
                });
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
   // 라디오 버튼 변경 이벤트 핸들러
      document.querySelectorAll('input[name="option"]').forEach((radio) => {
          radio.addEventListener('change', fetchData);
      });
</script>

	<script>
	
	fetch(`http://localhost:8080/person/totalpersoninfo`, {
	    method: 'PUT'
	})
	.then((resp) => resp.json())
	.then((data) => {
	    data.slice(0, 9).forEach((user, index) => {
	        const card = document.getElementById(`card-${index + 1}`);
	        const cardText = document.getElementById(`card-text-${index + 1}`);
	        
	        if (cardText) {
	            cardText.textContent = user.id; // 유저 아이디로 카드 텍스트 대체
	        }
	        
	        if (card) {
	            card.addEventListener('click', function() {
	                window.location.href = `/person/detail?userid=${user.user_id}`;
	            });
	        }
	    });
	})
	.catch(error => {
	    console.error('Error fetching data: ', error);
	});

/* 
// 순위 1위부터 10위
fetch(`http://localhost:8080/person/totalpersoninfo`, {
    method: 'PUT'
})
.then((resp) => resp.json())
.then((data) => {
    const rank = document.getElementById('rank');
    data.slice(0, 10).forEach((user) => { 
        console.log(user);
        const li = document.createElement('li'); // li 요소 생성
        const userId = user.id; // 유저 객체에서 아이디 가져오기
        li.textContent = userId; // 유저 아이디를 li 요소에 추가
        
        // 클릭 이벤트 추가
        li.addEventListener('click', function() {
            window.location.href = `/person/detail?userid=${user.user_id}`;
        });
        
        rank.appendChild(li); // ul에 li 요소 추가
    });
}); */
	

</script>
</body>
</html>
