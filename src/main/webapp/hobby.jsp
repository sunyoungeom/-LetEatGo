<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취미 태그</title>
</head>
<body>
<h2>취미</h2>
    <form action="" method="Post" id="hobbyTotal">
        <form id="hobbyCategory">
            <input type="checkbox" id="exercise" name="hobby" value="exercise">
            <label for="exercise">운동</label><br>
            <input type="checkbox" id="viewOTT" name="hobby" value="viewOTT">
            <label for="viewOTT">OTT감상</label><br>
            <input type="checkbox" id="boardGame" name="hobby" value="boardGame">
            <label for="boardGame">보드게임</label><br>
            <input type="checkbox" id="onlineGame" name="hobby" value="onlineGame">
            <label for="onlineGame">온라인게임</label><br>
            <input type="checkbox" id="listeningMusic" name="hobby" value="listeningMusic">
            <label for="listeningMusic">음악감상</label><br>
            <input type="checkbox" id="restaurantTour" name="hobby" value="restaurantTour">
            <label for="restaurantTour">맛집탐방</label><br>
            <input type="checkbox" id="photoshoot" name="hobby" value="photoshoot">
            <label for="photoshoot">사진촬영</label><br>
            <input type="checkbox" id="shopping" name="hobby" value="shopping">
            <label for="shopping">쇼핑</label><br>
            <input type="checkbox" id="itemTuning" name="hobby" value="itemTuning">
            <label for="itemTuning">물건 튜닝</label><br>
            <input type="checkbox" id="itemCollection" name="hobby" value="itemCollection">
            <label for="itemCollection">물건 수집</label><br>
            <input type="checkbox" id="volunteer" name="hobby" value="volunteer">
            <label for="volunteer">자원봉사</label><br>
            <input type="checkbox" id="trip" name="hobby" value="trip">
            <label for="trip">여행</label><br>
            <input type="checkbox" id="itemAssembly" name="hobby" value="itemAssembly">
            <label for="itemAssembly">물건 조립</label><br>
            <input type="checkbox" id="painting" name="hobby" value="painting">
            <label for="painting">그림그리기</label><br>
        </form>
    <input type="submit">
    </form>
</body>
<script>
	fetch("/hobby.jsp")
	.then((resp) => resp.text())
	.then((inner) => {
		document.body.innerHTML = inner;
	});
	function submitForm() {
		var form = document.getElementById("hobbyTotal");
		var formData = new FormData(form);
		var jsonObject = {};
		
		var foodCategory = document.getElemetById("hobbyCategory");
		
		formData.forEach
	}
</script>
</html>
