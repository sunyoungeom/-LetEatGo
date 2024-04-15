<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>searchMenu</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Custom Google font-->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./Resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<style>
    /* 스크롤바의 전체 스타일 */
    ::-webkit-scrollbar {
        width: 10px; /* 스크롤바의 너비 */
    }

    /* 스크롤바의 track (스크롤바의 배경) */
    ::-webkit-scrollbar-track {
        background: #f1f1f1; /* 스크롤바 배경색 */
    }

    /* 스크롤바의 thumb (스크롤바의 핸들) */
    ::-webkit-scrollbar-thumb {
        background: #888; /* 스크롤바 핸들 색 */
        border-radius: 5px; /* 스크롤바 핸들의 둥근 모서리 반경 */
    }

    /* 스크롤바가 hover 됐을 때 */
    ::-webkit-scrollbar-thumb:hover {
        background: #555; /* 스크롤바 핸들 hover 시 색상 */
    }
</style>
<body class="d-flex flex-column h-100 bg-light">
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
	</main>
	
	<br>
	
	<div style="margin: 0px 26%; height:650px; overflow: auto; background-color: white; border-radius: 15px; ">
		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span style="border: 1px solid black; width: 100%; height: 70%">
		    		이미지
		    	</span>
		    	
		    	
		    	<span style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>
		
		
		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span style="border: 1px solid black; width: 100%; height: 70%">
		    		이미지
		    	</span>
		    	
		    	
		    	<span style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>
		
		
		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span style="border: 1px solid black; width: 100%; height: 70%">
		    		이미지
		    	</span>
		    	
		    	
		    	<span style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>

		<div style="display: flex; justify-content: space-between; margin: 10px; height: 200px;">
		    <span style="display: flex;  flex-direction: column; width: 28%; height: 100%">
		    	<span style="border: 1px solid black; width: 100%; height: 70%">
		    		이미지
		    	</span>
		    	
		    	
		    	<span style="border: 1px solid black; width: 100%; height: 30%">
		    		상호명/위치
		    	</span>
		    </span>
		    
		    <span style="border: 1px solid black; width: 70%; height: 100%; border-radius: 15px;">
		    	검색결과 리뷰
		    </span>
		</div>
		
		
	</div>

	
	
	
	
	
	
	
	


	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>