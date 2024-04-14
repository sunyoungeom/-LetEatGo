<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사람 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
<link href="../Resources/css/styles.css" rel="stylesheet" />
<style>
.container {
	display: flex;
	justify-content: space-between;
	border: 2px solid gray;
	padding: 20px;
	border-radius: 10px;
	margin: 0px 5%;
}

.image-container {
	width: 30%;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 50px;
}

.image {
	width: 250px;
	height: 250px;
	background-color: red;
	border-radius: 50%;
}

.info-container {
	width: 60%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-top: 20px;
}

.info {
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin: 5px 0; /* 위아래 마진을 줄입니다. */
}

.review {
	border: 2px solid gray;
	padding: 10px;
	border-radius: 10px;
	margin-top: 20px;
}

.actions-container {
	display: flex;
	justify-content: space-around;
	margin-top: 20px;
}

.action {
	width: 30%;
	border: 2px solid gray;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

</style>
</head>
<body>
    <%@ include file="../user/navigation.jsp"%>
    <div>
	    <br>
	    <div class="container">
	        <div class="image-container">
	            <div class="image"></div>
	        </div>
	        <div class="info-container">
	            <div class="info" style="width:100%; height:50%">
	            </div>
	            <div class="info" style="width:100%; height:50%">
	            </div>
	        </div>
	    </div>
	    
	    <div style="border: 2px solid gray; margin: 20px 16%; padding: 10px; border-radius: 10px;">
	        <div style="border: 1px solid gray; padding: 1px;width: 120px;">
	            <button>진행중</button>
	            <button>완료</button>
	        </div>
	        <br>
	        <div style="border: 2px solid gray; border-radius: 10px; padding:3px">
	            <div>목록 1 테이블? 리스트? 선택 피료</div>
	            <div>목록 2</div>
	        </div>
	    </div>
	    
	    <h3 style="margin-left: 16%;">한줄 후기</h3>
	    
	    <div class="review" style="margin: 0px 16%; padding: 10px;">
	        사장님이 맛있고 음식이 친절해요
	    </div>
	    
	    <div class="actions-container" style="margin: 20px 16%;">
	        <div class="action" style="border-radius: 10px;">친구추가</div>
	        <div class="action" style="border-radius: 10px;">대화신청</div>
	        <div class="action" style="border-radius: 10px;">블랙리스트등록</div>
	    </div>
	</div>    
</body>
</html>
