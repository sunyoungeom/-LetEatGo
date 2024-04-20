<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별점 평가</title>
<style>
.star-rating {
	font-size: 24px;
}

.star-rating input[type="radio"] {
	display: none;
}

.star-rating label {
	float: right;
	cursor: pointer;
	color: #ccc;
}

.star-rating label:before {
	content: "\2605";
}

.star-rating input[type="radio"]:checked ~ label:before {
	color: #ffca08;
}
</style>
</head>

<body>
	<div style="display: flex;">
		<div id="starRating" class="star-rating">
			<!-- 별 평점 입력 필드 -->
			<%-- 5개의 별을 표시하고 각각의 별에 라디오 버튼을 연결 --%>
			<%
				for (int i = 5; i >= 1; i--) {
			%>
			<input type="radio"
				name="rating <%=String.valueOf(request.getAttribute("starId"))%>"
				value="<%=i%>"
				id="star<%=i + String.valueOf(request.getAttribute("starId"))%>"
				value="<%=i%>"> <label
				for="star<%=i + String.valueOf(request.getAttribute("starId"))%>"></label>
			<%
				}
			%>
		</div>
	</div>
	
	<div id="reviewForm">
		<!-- 텍스트 영역과 버튼 -->
		<textarea id="reviewText" rows="5" cols="20"></textarea>
		<button id="saveButton">저장</button>
		
	</div>
</body>

<script>
    // 리뷰 텍스트 입력
    const reviewText = document.getElementById("reviewText");
    // 저장 버튼
    let saveButtonId = '<%= request.getAttribute("saveButton") %>';
    console.log(saveButtonId);
    let saveButton = document.getElementById(saveButtonId);
    console.log(saveButton);

    // 별 평점 입력 필드 생성
    const starRating = document.getElementById("starRating");
    // 클릭 이벤트 핸들러 추가
    const inputs = document.querySelectorAll('.star-rating input[type="radio"]');

    inputs.forEach(input => {
        input.addEventListener("click", function() {
            // 선택한 별점 출력
            console.log("별점:", this.value);
        });
    });
    
    
    
    // 저장 기능 구현
	    saveButton.addEventListener("click", () => {
	        // 별 평점도 수정 불가능하도록 설정
	        inputs.forEach(input => {
	            input.disabled = true;
	        });
	        
	        // 텍스트 내용과 별점을 JSON 형식으로 변환하여 서블릿으로 전송
	        const reviewTextValue = reviewText.value;
	        const starValue = document.querySelector('.star-rating input[type="radio"]:checked').value;
	
	        const data = {
	            reviewText: reviewTextValue,
	            starValue: starValue
	        };
	
	        fetch("/user/userReview", {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify(data)
	        });
	    });
</script>
</html>
