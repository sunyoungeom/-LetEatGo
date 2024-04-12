<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사람 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style>
/* 페이지네이션의 색상을 회색으로 변경 */
.page-link {
	color: #6c757d; /* 페이지 번호의 색상 */
	border-color: #dee2e6; /* 페이지 번호의 테두리 색상 */
}

.page-link:hover {
	color: black; /* 페이지 번호의 호버 색상 */
	text-decoration: none; /* 링크에 밑줄 제거 */
	background-color: #e9ecef; /* 페이지 번호의 호버 배경색 */
	border-color: #dee2e6; /* 페이지 번호의 테두리 색상 */
}

.page-item.active .page-link {
	z-index: 1;
	color: black; /* 활성 페이지 번호의 색상 */
	background-color: #6c757d; /* 활성 페이지 번호의 배경색 */
	border-color: black; /* 활성 페이지 번호의 테두리 색상 */
}

.page-item.disabled .page-link {
	color: #6c757d; /* 비활성 페이지 번호의 색상 */
	pointer-events: none; /* 비활성 페이지 번호 클릭 방지 */
	background-color: #f8f9fa; /* 비활성 페이지 번호의 배경색 */
	border-color: #dee2e6; /* 비활성 페이지 번호의 테두리 색상 */
}
.circle-container {
         display: flex; /* Flexbox를 사용하여 요소들을 나란히 정렬합니다. */
         justify-content: space-around; /* 요소들을 가운데 정렬하고 사이에 공간을 동일하게 배분합니다. */
         align-items: center; /* 요소들을 세로로 가운데 정렬합니다. */
         margin-right: 100px;
         margin-left: 100px;
         margin-top: 35px;
         margin-bottom: 35px;
     }
     
 .circle {
     width: 250px; /* 원의 지름을 나타내는 값 */
     height: 250px; /* 원의 지름을 나타내는 값 */
     background-color: #3498db; /* 원의 배경색 */
     border-radius: 50%; /* 원 모양 */
     display: flex;
     justify-content: center;
     align-items: center;
     color: white; /* 텍스트 색상 */
     font-size: 24px; /* 텍스트 크기 */
 }
       
.box {
	display: inline-block;
	width: 450px;
	height: 420px;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin-left:300px;
	text-align: center; /* 사각형들을 가운데 정렬합니다. */
}
.rectangle {
	display: inline-block;
	width: 170px;
	height: 170px;
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin:10px;
}
</style>
</head>
<body>
	<%@ include file="../user/navigation.jsp"%>
	<br>
	
<div style="display: flex; justify-content: space-between;">
    <span class="box">
        <span class="rectangle"> 
        </span>
        <span class="rectangle">
        </span>
        <span class="rectangle">
        </span>
        <span class="rectangle">
        </span>
    </span>
   
	<div >
	    <span style=" display: flex; border: 2px solid gray; padding: 10px; border-radius: 10px; width:600px; height:100px; margin-right: 350px;
	    	margin-top:50px">
	        주변사람 찾기
	    </span>
	    <br>
	    <br>
	    <span style="display: flex; border: 2px solid gray; padding: 10px; border-radius: 10px; width:600px; height:100px; margin-right: 350px;">
	        최근 같이 먹은 사람
	    </span>
	</div>
</div>
	
	<br>
	<div style="border: 2px solid gray; padding: 10px; border-radius: 10px; margin-right:300px; margin-left:300px; margin-bottom: 20px;">
		<div style="display: flex; justify-content: space-between;">
			<button>셔플</button>
			<div style="display: flex; align-items: center;">
				<input type="radio" name="option" value="option1"
					style="margin: 5px 10px;"> 혈액형 <input type="radio"
					name="option" value="option2" style="margin: 5px 10px;">
				mbti <input type="radio" name="option" value="option3"
					style="margin: 5px 10px;"> 상관없음
				<!-- 라디오 버튼 추가 -->

				<select style="margin: 5px 10px;">
					<option value="value1">Value 1</option>
					<option value="value2">Value 2</option>
					<!-- 드롭다운 박스 옵션 추가 -->
				</select>
			</div>
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
	<a href="/persontest">반경로직 테스트중</a>
</body>
</html>