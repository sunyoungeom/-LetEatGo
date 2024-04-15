<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="d-flex flex-column h-100 bg-light">
	<%@ include file="/WEB-INF/user/navigation.jsp"%>

	<main class="flex-shrink-0">
		<div class="container mt-5 d-flex justify-content-center"></div>
		<br />
		<div class="container">
			<div class="d-flex justify-content-center">
				<div class="col-8">
					<h3>최근 간 곳</h3>
					<div class="row row-cols-1 row-cols-md-3 g-4">
						<!-- 프로젝트 카드 1 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-5"
								style="height: auto;">
								<div class="card-body p-0">
									<a id="link1" href="/menu" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img id="img1" src="https://via.placeholder.com/150" alt="음식 이미지"
												style="width: 150px; height: 150px; margin-top: 10px">
											<h2 id="place1" class="fw-bolder" style="margin-top: 10px">음식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>

						<!-- 프로젝트 카드 2 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-5"
								style="height: auto;">
								<div class="card-body p-0">
									<a id="link2" href="/menu" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img id="img2" src="https://via.placeholder.com/150" alt="음식 이미지"
												style="width: 150px; height: 150px; margin-top: 10px">
											<h2 id="place2" class="fw-bolder" style="margin-top: 10px">음식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>
						<!-- 프로젝트 카드 3 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-5"
								style="height: auto;">
								<div class="card-body p-0">
									<a id="link3" href="/menu" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img id="img3" src="https://via.placeholder.com/150" alt="음식 이미지"
												style="width: 150px; height: 150px; margin-top: 10px">
											<h2 id="place3" class="fw-bolder" style="margin-top: 10px">음식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row row-cols-1 row-cols-md-3 g-4">
						<!-- 프로젝트 카드 1 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-5"
								style="height: auto;">
								<div class="card-body p-0">
									<a id="link4" href="/menu" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img id="img4" src="https://via.placeholder.com/150" alt="음식 이미지"
												style="width: 150px; height: 150px; margin-top: 10px">
											<h2 id="place4" class="fw-bolder" style="margin-top: 10px">음식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>

						<!-- 프로젝트 카드 2 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-5"
								style="height: auto;">
								<div class="card-body p-0">
									<a id="link5" href="/menu" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img id="img5" src="https://via.placeholder.com/150" alt="음식 이미지"
												style="width: 150px; height: 150px; margin-top: 10px">
											<h2 id="place5" class="fw-bolder" style="margin-top: 10px">음식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>
						<!-- 프로젝트 카드 3 -->
						<div class="col-md-4">
							<div class="card overflow-hidden rounded-4 border-0 mb-5"
								style="height: auto;">
								<div class="card-body p-0">
									<a id="link6" href="/menu" style="text-decoration: none; color: inherit;">
										<div class="d-flex flex-column align-items-center p-3">
											<img id="img6" src="https://via.placeholder.com/150" alt="음식 이미지"
												style="width: 150px; height: 150px; margin-top: 10px">
											<h2 id="place6" class="fw-bolder" style="margin-top: 10px">음식</h2>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</main>

	<Script>
       
	function formattedDate(element) {
        // MySQL DATETIME 값을 Date 객체로 변환
        const timestamp = Number(element.reviewDate);
        const date = new Date(timestamp);

        // 년, 월, 일 추출
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0"); // 월은 0부터 시작하므로 1을 더하고, 2자리로 맞춤
        const day = String(date.getDate()).padStart(2, "0"); // 일은 1일부터 시작하므로 2자리로 맞춤

        // 'YYYY-MM-DD' 형식으로 문자열 조합
        const formattedDate = `${year}-${month}-${day}`;

        return formattedDate;
      }
        
        
	fetch("http://localhost:8080/recent", {
	    method: 'POST'
	})
	.then((resp) => resp.json())
	.then((data) => {
		
	    const blogList = data["blogList"];
		const postList = data["placeByIdList"];
	        
	    for (let i = 0; i < blogList.length; i++) {
	        const resultList = blogList[i];
	        const place = postList[i].place;
	       
	        // 각 검색 결과 리스트에 대한 처리
	        for (let j = 0; j < 1; j++) {
	            const searchResult = resultList[j];
	            switch(i) {
	                case 0:
	                	document.getElementById('img1').src = searchResult.thumbnail;
	                	document.getElementById('place1').innerText = place;
	                	document.getElementById('link1').href = "/recent/detail?index=0"; 
	                    break;
	                case 1:
	                	document.getElementById('img2').src = searchResult.thumbnail;
	                	document.getElementById('place2').innerText = place;
	                	document.getElementById('link2').href = "/recent/detail?index=1"; 
	                    break;
	                case 2:
	                	document.getElementById('img3').src = searchResult.thumbnail;
	                	document.getElementById('place3').innerText = place;
	                	document.getElementById('link3').href = "/recent/detail?index=2"; 
	                    break;
	                case 3:
	                	document.getElementById('img4').src = searchResult.thumbnail;
	                	document.getElementById('place4').innerText = place;
	                	document.getElementById('link4').href = "/recent/detail?index=3"; 
	                    break;
	                case 4:
	                	document.getElementById('img5').src = searchResult.thumbnail;
	                	document.getElementById('place5').innerText = place;
	                	document.getElementById('link5').href = "/recent/detail?index=4"; 
	                    break;
	                case 5:
	                	document.getElementById('img6').src = searchResult.thumbnail;
	                	document.getElementById('place6').innerText = place;
	                	document.getElementById('link6').href = "/recent/detail?index=5"; 
	                    break;
	                default:
	                    console.log("기타 타이틀입니다.");
	            }
	        }
	    }
	});

    </Script>
</html>