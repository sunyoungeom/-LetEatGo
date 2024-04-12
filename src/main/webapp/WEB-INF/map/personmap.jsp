<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Person List</title>
</head>
<body>
    <div>
        <label for="distanceSelect">Distance:</label>
        <select id="distanceSelect">
            <option value="3">3km 이내</option>
            <option value="5">5km 이내</option>
            <option value="10">10km 이내</option>
        </select>
    </div>
    <div id="map" style="width: 800px; height: 400px;"></div>
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


    <script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b&libraries=services,geometry"
    ></script>
    <script>
        // 서버에서 데이터를 받아와서 처리하는 함수
        function fetchData(centerCoords) {
            fetch('/person/personmap/searchperson')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // 받아온 데이터에서 중심 좌표와 다른 주소들을 가져옴
                var allUsers = data.allUsers;

                // 주소를 좌표로 변환하는 함수
                function addressToCoords(address) {
                    return new Promise(function(resolve, reject) {
                        var geocoder = new kakao.maps.services.Geocoder();
                        geocoder.addressSearch(address, function(result, status) {
                            if (status === kakao.maps.services.Status.OK) {
                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                resolve(coords);
                            } else {
                                reject('Geocoder failed due to: ' + status);
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
                    
                    var dLat = (lat2 - lat1) * Math.PI / 180;
                    var dLon = (lon2 - lon1) * Math.PI / 180;
                    
                    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
                            Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
                            Math.sin(dLon/2) * Math.sin(dLon/2);
                    
                    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
                    
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
                    return lastDigit % 2 === 1 ? '남자' : '여자';
                }

                // 중심 좌표와 다른 주소들 간의 거리를 계산하여 출력
                Promise.all(allUsers.map(user => addressToCoords(user.address)))
                .then(coordsList => {
                    var personList = document.getElementById('personList').getElementsByTagName('tbody')[0];
                    var distanceSelect = document.getElementById('distanceSelect');
                    var selectedDistance = parseInt(distanceSelect.value);
                    personList.innerHTML = ''; // 이전 결과 삭제

                    allUsers.forEach(function(user, index) {
                        var coords = coordsList[index];
                        var distance = calculateDistance(centerCoords, coords);
                        // 주민등록번호 앞 두 자리를 연도로 변환 (19를 제외)
                        var birthYear = parseInt(user.identifynumber.substring(0, 2)) + 1900;
                        // 만 나이 계산
                        var age = calculateAge(birthYear);
                        // 주민등록번호의 마지막 숫자를 가져와 성별 판별
                        var gender = getGender(parseInt(user.identifynumber.charAt(user.identifynumber.length - 1)));
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
                            row.onclick = function() {
                                // 클릭 시 해당 링크로 이동
                                // 여기에 링크 주소 넣으면 됨
                            };
                            cellNickname.innerHTML = user.nickname;
                            cellAge.innerHTML = age + '세';
                            cellGender.innerHTML = gender;
                            cellDistance.innerHTML = distance + 'km';
                        }
                    });

                    // 지도에 마커 표시
                    var mapContainer = document.getElementById('map');
                    var mapOptions = {
                        center: centerCoords,
                        level: 7
                    };
                    var map = new kakao.maps.Map(mapContainer, mapOptions);

                    allUsers.forEach(function(user, index) {
                        var coords = coordsList[index];
                        var distance = calculateDistance(centerCoords, coords);
                        if (distance <= selectedDistance) {
                            var marker = new kakao.maps.Marker({
                                position: coords,
                                map: map
                            });
                        }
                    });
                })
                .catch(function(error) {
                    console.error(error);
                });
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
        }

        // fetchData 함수 호출
        var map;
        var distanceSelect = document.getElementById('distanceSelect');
        distanceSelect.addEventListener('change', function() {
            fetchData(map.getCenter()); // 거리 옵션이 변경되면 다시 데이터 가져오기
        });

        function initMap() {
            // 초기 지도 생성
            map = new kakao.maps.Map(document.getElementById('map'), {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 7
            });

            // 드래그가 끝날 때마다 fetchData 호출
            kakao.maps.event.addListener(map, 'dragend', function() {
                fetchData(map.getCenter());
            });

            // 초기에 한 번 fetchData 호출
            fetchData(map.getCenter());
        }

        // 지도 초기화 함수 호출
        initMap();
    </script>
</body>
</html>