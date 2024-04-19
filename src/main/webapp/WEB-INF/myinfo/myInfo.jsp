<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>내프로필</title>
<!-- Favicon--
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
<style>
/* 모달 창 스타일 */
.modal {
	display: none; /* 초기에는 화면에 표시되지 않음 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%; /* 전체 화면 너비 사용 */
	height: 100%; /* 전체 화면 높이 사용 */
	overflow: auto; /* 내용이 넘칠 경우 스크롤바 생성 */
	background-color: rgba(0, 0, 0, 0.4); /* 배경은 반투명하게 설정 */
}

/* 모달 창 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 상하 마진을 15%로 설정하여 중앙에 위치 */
	padding: 20px;
	border: 1px solid #888;
	width: 100%; /* 내용의 너비를 화면의 50%로 설정 */
	max-width: 600px; /* 최대 너비를 500px로 제한 */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

/* 모달 내 버튼 스타일 */
.modal button {
	width: auto; /* 버튼의 너비를 자동으로 조정 */
	padding: 10px 20px; /* 버튼의 패딩을 10px 상하, 20px 좌우로 설정 */
	margin-top: 10px; /* 상단 여백을 10px로 설정 */
	background-color: #4CAF50; /* 배경색을 녹색으로 설정 */
	color: white; /* 글자색을 흰색으로 설정 */
	border: none; /* 테두리 없앰 */
	border-radius: 5px; /* 테두리 둥글게 처리 */
	cursor: pointer; /* 마우스 오버 시 커서를 손가락 모양으로 변경 */
	font-size: 16px; /* 글자 크기 설정 */
}
/* 모달 내 입력 필드 스타일 */
.modal input[type="text"], .modal input[type="email"], .modal input[type="password"]
	{
	width: 60%; /* 입력 필드 너비를 모달 내용 너비의 90%로 설정 */
	padding: 12px 20px; /* 패딩을 충분히 주어 입력이 편리하도록 함 */
	margin: 8px 0; /* 마진으로 상하 여백 제공 */
	display: inline-block; /* 블록 레벨 요소로 표시하되, inline 속성을 갖음 */
	border: 1px solid #ccc; /* 경계선 설정 */
	border-radius: 4px; /* 경계선을 둥글게 처리 */
	box-sizing: border-box; /* 박스 모델의 전체 너비를 width가 포함하도록 설정 */
}

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
</style>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<%@ include file="/WEB-INF/user/navigation.jsp"%>
		<section class="py-5">
			<div class="container px-5">
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="row align-items-center">
						<!-- 내정보 -->
						<div class="col-md-3 mb-3 mb-md-0" style="height: 500px;">
							<%@ include file="/WEB-INF/myinfo/MyInfoSidebar.jsp"%>
						</div>
						<!-- 테이블 -->
						<div class="col-md-9">
							<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
								<div class="row justify-content-center">
									<div class="col-10">
										<div class="border rounded">
											<table class="table" id="postTable"
												style="margin-bottom: 0px;">
												<tr>
													<th scope="col" style="width: 87%; padding: 0px;"></th>
													<th scope="col" style="width: 13%; padding: 0px;"></th>
												</tr>
												<tr>
													<th scope="row"
														style="padding-left: 1.5em; border-bottom: none;"><span
														class="name_text"
														style="font-size: 30px; margin-right: 10px">${ user.name }</span>

														<span class="age_text" id="age" name="age">만&nbsp;${ age }세</span>
														<button class="editButton btn btn-dark"
															style="margin-left: 30px;" data-field="password"
															onclick="openModal()">비밀번호 변경</button></th>
												</tr>
												<tr>
													<th scope="row"
														style="margin-left: 15px; display: flex; align-items: center;">
														<i class="fa-solid fa-envelope position-relative"
														style="padding-right: 15px;"></i> <span class="email_text">${ user.email }</span>
													</th>
													<th>
														<button class="editButton btn btn-dark" data-field="email"
															data-action="edit" style="display: none">수정</button>
													</th>
												</tr>
												<tr>
													<th scope="row"
														style="margin-left: 15px; display: flex; align-items: center;">
														<i class="fa-solid fa-comment-dots "
														style="padding-right: 15px;"></i> <span
														class="nickname_text">${ user.nickname }</span>
													</th>
													<th>
														<button class="editButton btn btn-dark"
															data-field="nickname" data-action="edit">수정</button>
													</th>
												</tr>
												<tr>
													<th scope="row"
														style="margin-left: 15px; display: flex; align-items: center;">
														<i
														class="fa-solid fa-mobile-screen-button position-relative"
														style="padding-right: 15px;"></i> <span
														class="phonenumber_text">${ user.phonenumber }</span>
													</th>
													<th>
														<button class="editButton btn btn-dark"
															data-field="phonenumber" data-action="edit">수정</button>
													</th>
												</tr>
												<tr>
													<th scope="row"
														style="margin-left: 15px; display: flex; align-items: center;">
														<i class="fa-solid fa-location-dot position-relative"
														style="padding-right: 15px;"></i> <span
														class="address_text">${ user.address }</span>
													</th>
													<th>

														<button class="editButton btn btn-dark"
															data-field="address" data-action="edit">수정</button>
													</th>
												</tr>
												<tr>
													<th scope="row"
														style="margin-left: 15px; display: flex; align-items: center;">

														<i class="fa-solid fa-droplet position-relative"
														style="padding-right: 15px;"></i> <select
														id="bloodTypeSelect" class="form-select">
															<option value="null"
																${user.bloodtype == '' ? 'selected' : ''}>혈액형
													[선택안함]</option>
															<option value="A"
																${user.bloodtype == 'A' ? 'selected' : ''}>A형</option>
															<option value="B"
																${user.bloodtype == 'B' ? 'selected' : ''}>B형</option>
															<option value="AB"
																${user.bloodtype == 'AB' ? 'selected' : ''}>AB형</option>
															<option value="O"
																${user.bloodtype == 'O' ? 'selected' : ''}>O형</option>
													</select>
													</th>
													<th>
														<button class="editSelectButton btn btn-dark"
															data-field="bloodtype" data-action="edit">수정</button>
													</th>
												</tr>
												<tr>
													<th scope="row"
														style="margin-left: 15px; display: flex; align-items: center;">
														<i class="fa-solid fa-child-reaching position-relative"
														style="padding-right: 15px;"></i> <select id="mbtiSelect"
														class="form-select"">
															<option value="null" ${user.mbti == '' ? 'selected' : ''}>MBTI
													[선택안함]</option>
															<option value="ISTJ"
																${user.mbti == 'ISTJ' ? 'selected' : ''}>ISTJ</option>
															<option value="ISFJ"
																${user.mbti == 'ISFJ' ? 'selected' : ''}>ISFJ</option>
															<option value="INFJ"
																${user.mbti == 'INFJ' ? 'selected' : ''}>INFJ</option>
															<option value="INTJ"
																${user.mbti == 'INTJ' ? 'selected' : ''}>INTJ</option>
															<option value="ISTP"
																${user.mbti == 'ISTP' ? 'selected' : ''}>ISTP</option>
															<option value="ISFP"
																${user.mbti == 'ISFP' ? 'selected' : ''}>ISFP</option>
															<option value="INFP"
																${user.mbti == 'INFP' ? 'selected' : ''}>INFP</option>
															<option value="INTP"
																${user.mbti == 'INTP' ? 'selected' : ''}>INTP</option>
															<option value="ESTP"
																${user.mbti == 'ESTP' ? 'selected' : ''}>ESTP</option>
															<option value="ESFP"
																${user.mbti == 'ESFP' ? 'selected' : ''}>ESFP</option>
															<option value="ENFP"
																${user.mbti == 'ENFP' ? 'selected' : ''}>ENFP</option>
															<option value="ENTP"
																${user.mbti == 'ENTP' ? 'selected' : ''}>ENTP</option>
															<option value="ESTJ"
																${user.mbti == 'ESTJ' ? 'selected' : ''}>ESTJ</option>
															<option value="ESFJ"
																${user.mbti == 'ESFJ' ? 'selected' : ''}>ESFJ</option>
															<option value="ENFJ"
																${user.mbti == 'ENFJ' ? 'selected' : ''}>ENFJ</option>
															<option value="ENTJ"
																${user.mbti == 'ENTJ' ? 'selected' : ''}>ENTJ</option>
													</select>
													</th>
													<th>
														<button class="editSelectButton btn btn-dark"
															data-field="mbti" data-action="edit">수정</button>
													</th>
												</tr>

												

											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/layout/footer.jsp"%>

	<!-- 수정 모달 -->
	<div id="editModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form id="editForm">
				<label for="editField"></label> <span id="editFieldDisplay"></span><br>
				<br> <label for="editValue"></label> <input type="text"
					id="editValue" name="editValue"><br> <br> <input
					type="submit" id="editSubmitButton" value="확인">
			</form>
		</div>
	</div>

	<!-- 이메일 인증 모달 -->
	<div id="emailVerificationModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('emailVerificationModal')">&times;</span>
			<h2>이메일 변경 인증</h2>
			<p>변경할 이메일을 입력하고 인증 코드를 요청하세요.</p>
			<form id="emailChangeForm">
				<label for="newEmail">새 이메일:</label> <input type="email"
					id="newEmail" name="newEmail" required>
				<button type="button" onclick="sendVerificationCode()">인증
					코드 보내기</button>
				<br> <br> <label for="emailVerificationInput">인증
					코드:</label> <input type="text" id="emailVerificationInput"
					name="emailVerificationInput" required>
				<button type="button" onclick="checkVerificationCode()">인증
					확인</button>
			</form>
		</div>
	</div>

	<!-- 모달 창 -->
	<div id="passwordModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('passwordModal')">&times;</span>
			<h2>비밀번호 변경</h2>
			<form id="passwordChangeForm">
				<input type="password" id="currentPassword" placeholder="현재 비밀번호"
					required><br> <input type="password" id="newPassword"
					placeholder="새 비밀번호" required> <br> <input
					type="password" id="newPasswordConfirm" placeholder="새 비밀번호 확인"
					required>
				<button type="button" onclick="changePassword()">변경하기</button>
				<div class="mt-n1" id="passwordMatchMessage"></div>
			</form>
		</div>
	</div>

	<script>
	//비밀번호와 비밀번호 확인을 비동기적으로 일치 여부를 확인하는 함수
	function checkPasswordMatch() {
	    var password = document.getElementById('newPassword').value;
	    var passwordConfirm = document.getElementById('newPasswordConfirm').value;
	    var passwordMatchMessage = document.getElementById('passwordMatchMessage');

	    if (password === passwordConfirm) {
	        passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
	        passwordMatchMessage.style.color = "green";
	        // 일치하는 경우 포커스를 잃으면 메시지 삭제
	        document.getElementById('newPasswordConfirm').onblur = function() {
	            passwordMatchMessage.textContent = ''; // 일치 시 메시지를 항상 삭제
	        };
	    } else {
	        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
	        passwordMatchMessage.style.color = "red";
	        // 일치하지 않는 경우 포커스를 잃어도 메시지 유지
	        document.getElementById('newPasswordConfirm').onblur = null;
	    }
	}
	// 이벤트 리스너를 추가합니다.
	document.getElementById('newPassword').addEventListener('input', checkPasswordMatch);
	document.getElementById('newPasswordConfirm').addEventListener('input', checkPasswordMatch);
	
	function openModal() {
		
	    document.getElementById('passwordModal').style.display = 'block';
	}

	
	function changePassword() {
	    var currentPassword = document.getElementById('currentPassword').value;
	    var newPassword = document.getElementById('newPassword').value;

	    // 현재 비밀번호와 새 비밀번호를 서버로 전송
	    fetch('/myInfo', {
	        method: 'PUT',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({
	        	'field': 'password',
	        	
	            'currentPassword': currentPassword,
	            'value': newPassword
	        })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.status === "success") {
	            alert('비밀번호가 변경되었습니다.');
	            closeModal('passwordModal');
	        } else {
	            alert('비밀번호 변경 실패: ' + data.message);
	        }
	    })
	    .catch(error => {
	        console.error('Error:', error);
	        alert('서버 오류가 발생했습니다. 오류: ' + error.message);
	    });
	}
	
	function openEmailVerificationModal(email) {
	    // 이메일 변경을 위한 모달 설정
	    var modal = document.getElementById('emailVerificationModal');
	    var newEmailInput = document.getElementById('newEmail');

	    // 새 이메일 입력 필드에 기존 이메일 주소를 플레이스홀더로 설정
	    newEmailInput.placeholder = email; // 기존 이메일을 플레이스홀더로 사용

	    // 모달 표시
	    modal.style.display = 'block';

	    // 입력 필드 초기화
	    document.getElementById('emailVerificationInput').value = '';  // 인증번호 입력값 초기화
	    newEmailInput.value = '';  // 새 이메일 입력값 초기화

	    // 새 이메일 입력란에 포커스
	    newEmailInput.focus();
	}

	function closeModal(modalId) {
	    var modal = document.getElementById(modalId);
	    modal.style.display = "none";
	}

	function sendVerificationCode() {
	    var email = document.getElementById('newEmail').value;
	    if(email) {
	        // 이메일 전송 로직 (서버에 요청을 보내는 등의 작업)
	        fetch('/join/begin?action=sendVerification&email=' + email, {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify({'email': email})
	        })
	        .then(response => response.json())  // 서버 응답을 JSON으로 파싱
	        .then(data => {
	            if (data.status === "duplicate") {
	                // 이메일이 중복되는 경우
	                alert('이미 사용 중인 이메일 주소입니다.');
	            } else if (data.status === "success") {
	                // 이메일 전송이 성공적으로 이루어진 경우
	                alert('인증 코드가 전송되었습니다. 메일을 확인해 주세요.');
	            } else {
	                // 이메일 전송 실패
	                alert('인증 코드 전송에 실패했습니다. 다시 시도해주세요.');
	            }
	        })
	        .catch(error => {
	            console.error('Request failed', error);
	            alert('서버에 요청을 보내는 데 문제가 발생했습니다.');
	        });
	    } else {
	        // 이메일 주소가 입력되지 않은 경우
	        alert('이메일 주소를 입력해 주세요.');
	    }
	}

	// 이메일 변경 양식 제출 방지 및 인증 코드 검증 로직
	document.getElementById('emailChangeForm').onsubmit = function(event) {
	    event.preventDefault();  // 폼 기본 제출 방지
	};

	// 인증번호 검증 함수
	function checkVerificationCode() {
	    var verificationCodeInput = document.getElementById('emailVerificationInput').value;
	    var newEmail = document.getElementById('newEmail').value; // 새 이메일 값 가져오기
	    var jsonData = {
	        verificationCode: verificationCodeInput
	    };

	    fetch('/join/begin?action=checkVerificationCode', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(jsonData)
	    })
	    .then(response => {
	        if (response.ok) {
	           alert("인증번호가 일치합니다.");
	            closeModal('emailVerificationModal');  // 모달 닫기

	            // 편집 모달에 입력값 설정 및 모달 오픈
            document.getElementById('editFieldDisplay').textContent = 'email';
            document.getElementById('editValue').value = newEmail;
            document.getElementById('editModal').style.display = 'block';
            document.getElementById('editForm').submit(); // 자동 폼 제출
	        } else {
	            // 오류 응답 처리
	            console.error('서버 오류:', response.statusText);
	            alert('인증번호가 일치하지 않습니다.');
	        }
	    })
	    .catch(error => {
	        // 네트워크 오류 처리
	        console.error('네트워크 오류:', error);
	        alert('네트워크 오류: ' + error.message);
	    });
	}

	document.querySelectorAll('.editSelectButton').forEach(function(button) {
        button.addEventListener('click', function() {
            var field = this.getAttribute('data-field');
            var newValue;

            // 혈액형 선택인 경우
            if (field === 'bloodtype') {
                newValue = document.getElementById('bloodTypeSelect').value;
            } 
            // MBTI 선택인 경우
            else if (field === 'mbti') {
                newValue = document.getElementById('mbtiSelect').value;
            }

            var data = {
                field: field,
                value: newValue
            };

            // JSON 형식으로 데이터 전달
            var jsonData = JSON.stringify(data);

            fetch('/myInfo?detail=profile', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: jsonData
            })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(function(data) {
                // 서버 응답에 따른 처리
                var modal = document.getElementById('editModal');
                modal.style.display = 'none';

                // 혈액형이나 MBTI가 변경되었음을 경고창으로 표시
                alert('수정되었습니다.');
            })
            .catch(function(error) {
                // 오류 처리
                console.error('There was a problem with the fetch operation:', error);
            });
        });
    });

	
	// 수정 버튼 클릭 시 모달 창 띄우기
document.querySelectorAll('.editButton').forEach(function(button) {
    button.addEventListener('click', function() {
    	
        var field = this.getAttribute('data-field');
        var spanElement = this.parentElement.previousElementSibling.querySelector('span');
        var oldValue = spanElement.textContent.trim();
        var editValueInput = document.getElementById('editValue');

        // 이전 입력 값을 비워줌
        editValueInput.value = '';

        if (field === 'phonenumber') {
            // 전화번호 수정을 위한 입력 처리 설정
            editValueInput.addEventListener('input', formatPhoneNumber);
        } else if (field === 'address') {
            // 주소 검색 버튼 클릭
            goPopup();  // 주소 검색 팝업 함수 호출
            return;  // 팝업을 띄우고 여기서 함수 종료
        } else if (field === 'email') {
            // 이메일 필드의 경우 이메일 인증 로직 수행
            openEmailVerificationModal(oldValue);
            return;  // 이메일 모달을 띄우고 여기서 함수 종료
        }
        // 기존 값은 placeholder로 설정
        editValueInput.setAttribute('placeholder', oldValue);
        document.getElementById('editFieldDisplay').textContent = field + ':';
        var modal = document.getElementById('editModal');
        modal.style.display = 'block';
        
        // 모달이 열릴 때 input 요소에 포커스 주기
        editValueInput.focus();
    });
});

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/Address/addressAPI.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
   
}

function jusoCallBack(address){
    // 팝업 페이지에서 주소 입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    var addressTextElement = document.querySelector('.address_text');
    if (addressTextElement) {
        addressTextElement.textContent = address; // 비입력 요소일 경우 textContent 사용
        // JSON 형식으로 데이터 전달
        var jsonData = JSON.stringify({address: address});
	    
        var data = {
    	        field: 'address',
    	        value: address
    	    };
        var jsonData = JSON.stringify(data);
        
        fetch('/myInfo?detail=profile', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: jsonData
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(function(data) {
        	alert('수정되었습니다.');
            window.opener = self;
            window.close();
        })
        .catch(function(error) {
            console.error('There was a problem with the fetch operation:', error);
        });
    }
}

// 전화번호 형식 유지 함수
function formatPhoneNumber(e) {
    var value = e.target.value.replace(/[^\d]/g, '');
    var formatted = '';

    value = value.substring(0, 11);

    for (var i = 0; i < value.length; i++) {
        if (i === 3 || i === 7) {
            formatted += '-';
        }
        formatted += value[i];
    }

    e.target.value = formatted;
}


	// 모달 창 닫기
	document.querySelector('.close').addEventListener('click', function() {
	    var modal = document.getElementById('editModal');
	    modal.style.display = 'none';
	});

	// 모달 창 닫기
	window.addEventListener('click', function(event) {
	    var modal = document.getElementById('editModal');
	    if (event.target == modal) {
	        modal.style.display = 'none';
	    }
	});

	// 모달 창 제출 시 처리
	document.getElementById('editForm').addEventListener('submit', function(event) {
	    event.preventDefault(); // 기본 폼 제출 동작 방지

	    var field = document.getElementById('editFieldDisplay').textContent.replace(':', '').trim();
	    var value = document.getElementById('editValue').value;
	    
	    // value가 null 또는 빈 문자열인 경우 기존 값으로 설정
	    if (!value || value.trim() === '') {
	        var oldValue = document.getElementById('editValue').getAttribute('placeholder');
	        value = oldValue;
	    }

	    var data = {
	        field: field,
	        value: value
	    };

	    // JSON 형식으로 데이터 전달
	    var jsonData = JSON.stringify(data);

	    fetch('/myInfo?detail=profile', {
	        method: 'PUT',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        body: jsonData
	    })
	    .then(function(response) {
	        if (!response.ok) {
	            throw new Error('Network response was not ok');
	        }
	        return response.json();
	    })
	   .then(data => {
    if (data.message === "duplicate") {
        alert('이미 사용중입니다.');
    } else {
        var modal = document.getElementById('editModal');
        modal.style.display = 'none';
        alert('수정되었습니다.');

        // 수정된 값을 페이지에 반영
        var textElement = document.querySelector('.' + field + '_text');
        if (textElement) {
            textElement.textContent = value;
        }

        // 입력 필드의 placeholder 값을 현재 값으로 변경
        document.getElementById('editValue').setAttribute('placeholder', value);
    }
})
	    
	    .catch(function(error) {
	        // 오류 처리
	        console.error('There was a problem with the fetch operation:', error);
	    });
	});

</script>
</body>
</html>
