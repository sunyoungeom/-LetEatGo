<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
/* 모달 창 스타일 */
.modal {
	display: none; /* 초기에는 화면에 표시되지 않음 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4); /* 배경은 반투명하게 설정 */
}

/* 모달 창 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	animation-name: animatetop;
	animation-duration: 0.4s;
}

/* 모달 창 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 모달 창 등장 애니메이션 */
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}
}
</style>
</head>
<body>
	<h2>회원 탈퇴</h2>
	<form id="deleteForm">
		<label for="userId">사용자 ID:</label> <input type="text" id="userId"
			name="userId" required><br>
		<br> <label for="password">비밀번호:</label> <input type="password"
			id="password" name="password" required><br>
		<br> <input type="submit" id="deleteButton" value="탈퇴">
	</form>

	<!-- 모달 창 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>정말로 탈퇴하시겠습니까?</p>
			<button id="confirmButton">확인</button>
		</div>
	</div>

	<script>
        // 모달 창 요소 가져오기
        var modal = document.getElementById("myModal");

        // 모달 닫기 버튼 가져오기
        var span = document.getElementsByClassName("close")[0];

        // 탈퇴 버튼 클릭 시 모달 창 띄우기
        document.getElementById('deleteForm').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 동작 방지
            modal.style.display = "block";
        });

        // 모달 닫기 버튼 클릭 시 모달 창 닫기
        span.onclick = function() {
            modal.style.display = "none";
        }

        // 모달 창 외부 클릭 시 모달 창 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // 확인 버튼 클릭 시 탈퇴 처리
        document.getElementById("confirmButton").onclick = function() {
            var password = document.getElementById('password').value;

            fetch('/leave', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ password: password })
            })
            .then(function(response) {
                if (response.ok) {
                    alert('회원 탈퇴가 완료되었습니다.');
                    window.location.href = '/index.jsp'; // 탈퇴 후 리다이렉트할 페이지
                } else {
                    response.text().then(function(errorMessage) {
                        alert(errorMessage);
                    });
                }
            })
            .catch(function(error) {
                alert('서버 오류가 발생했습니다: ' + error.message);
            });

            modal.style.display = "none"; // 모달 창 닫기
        }
    </script>
</body>
</html>
