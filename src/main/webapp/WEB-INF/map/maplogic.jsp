<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page isELIgnored="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>마커와 중심 거리 계산하기</title>
    <style>
        /* 스타일은 여기에 */
    </style>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>
<em>지도를 마우스로 클릭하면 마커가 생성됩니다.</em>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff83319934d86e1c35670fdc76824c2b"></script>
<script>
    // 특정 주소에 대한 중심 좌표를 설정합니다
    var centerPosition = new kakao.maps.LatLng(37.566826, 126.9786567);

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
            center: centerPosition, // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var markers = []; // 생성된 마커를 담을 배열입니다

    // 지도를 클릭하면 마커를 생성합니다
    kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
        // 클릭한 위치에 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: mouseEvent.latLng,
            map: map
        });

        // 생성된 마커를 배열에 추가합니다
        markers.push(marker);

        // 중심 좌표와 마커 간의 직선 거리를 계산합니다
        var distance = kakao.maps.geometry.distance(centerPosition, mouseEvent.latLng);

        // 마커 클릭 이벤트를 등록하여 정보창에 거리를 표시합니다
        kakao.maps.event.addListener(marker, 'click', function () {
            var content = '<div style="padding:5px;font-size:12px;">중심 좌표와 마커 간의 거리: <strong>' + distance.toFixed(2) + 'm</strong></div>';

            // 마커 위에 정보창을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: content
            });
            infowindow.open(map, marker);
        });
    });
</script>
</body>
</html>