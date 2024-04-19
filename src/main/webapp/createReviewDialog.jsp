<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
/* 다이얼로그 스타일 */
.dialog-overlay {
	display: none; /* 초기에는 숨김 */
	position: fixed; /* 고정 위치 */
	z-index: 1; /* 다른 요소 위에 표시 */
	left: 0;
	top: 0;
	width: 100%; /* 전체 너비 */
	height: 100%; /* 전체 높이 */
	overflow: auto; /* 스크롤 가능 */
	background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
}

/* 다이얼로그 콘텐츠 스타일 */
.dialog-content {
	background-color: #fefefe;
	margin: 15% auto; /* 다이얼로그가 중앙에 위치하도록 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* 콘텐츠 너비 */
}

/* 다이얼로그 닫기 버튼 스타일 */
.dialog-close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.dialog-close:hover, .dialog-close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<body>
	<!-- 버튼 클릭 시 다이얼로그 열기 -->
	<button onclick="openDialog()">다이얼로그 열기</button>

	<!-- 다이얼로그 -->
	<div id="dialogOverlay" class="dialog-overlay">
		<!-- 다이얼로그 콘텐츠 -->
		<div class="dialog-content">
			<!-- 다이얼로그 닫기 버튼 -->
			<span class="dialog-close" onclick="closeDialog()">&times;</span>
			<!-- 다이얼로그 내용 -->
			<p>다이얼로그 창 내용입니다. 여기에 적절한 내용을 추가하세요.</p>
		</div>
	</div>


</body>
<script>
	// 다이얼로그 열기 함수
	function openDialog() {
		document.getElementById("dialogOverlay").style.display = "block";
	}

	// 다이얼로그 닫기 함수
	function closeDialog() {
		document.getElementById("dialogOverlay").style.display = "none";
	}

	// 다이얼로그 바깥을 클릭하면 닫기
	window.onclick = function(event) {
		var dialog = document.getElementById("dialogOverlay");
		if (event.target == dialog) {
			dialog.style.display = "none";
		}
	}
	
</script>
</html>
