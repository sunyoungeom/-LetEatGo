<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>회원가입</title>
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
.readonly-input {
	background-color: #f2f2f2;
	weight: 400px;
	height: 20px;
}

.form-group .fa {
	pointer-events: none; /* 아이콘에서 포인터 이벤트(클릭 등) 비활성화 */
}

.message-success {
	color: green;
}

.message-error {
	color: red;
}

/* .form-group {
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
position


:

 

relative


;
padding


:

 

2px


;
}
*
/
</style>
</head>

<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<%@ include file="navigation.jsp"%>
		<!-- Navigation-->
		<section class="py-5">
			<div class="container px-5">
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
							<i class="bi bi-envelope"></i>
						</div>
						<h1 class="fw-bolder">회원가입</h1>
					</div>
					<div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
						<div class="row justify-content-center">
							<div class="col-6">
								<div class="">
									<!-- <div class="border rounded"> -->
									<form id="userForm" method="post">
										<h4>아이디 및 비밀번호</h4>
										<!-- 아이디 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="id" name="id" type="text" placeholder="아이디"
												data-sb-validations="required">
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
											<i class="fa fa-user position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<!-- 비밀번호 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="password" name="password" type="password"
												placeholder="비밀번호" data-sb-validations="required">
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
											<i class="fa-solid fa-lock position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<!-- 비밀번호 확인 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="passwordConfirm" name="passwordConfirm" type="password"
												placeholder="비밀번호 확인" data-sb-validations="required">
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
											<i class="fa-solid fa-lock position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<div class="mt-n1" id="idCheckDuplicateMessage"></div>
										<div class="mt-n1" id="passwordMatchMessage"></div>
										<br>
										<h4>필수사항</h4>
										<!-- 이름 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="name" name="name" type="text" placeholder="이름"
												data-sb-validations="required">
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
											<i class="fa fa-user position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<!-- 닉네임 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="nickname" name="nickname" type="text" placeholder="닉네임"
												data-sb-validations="required">
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
											<i class="fa-solid fa-comment-dots position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<!-- 주민번호 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="identifynumber" type="text"
												placeholder="주민번호 (예: 040101-3)"
												data-sb-validations="required"> <input type="hidden"
												id="formattedIdentifynumber" name="identifynumber">
											<div class="invalid-feedback"
												data-sb-feedback="identifynumber:required">주민번호는
												필수입니다.</div>
											<i class="fa-regular fa-id-card position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>

										<!-- 전화번호 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5" style="height: 50px;"
												id="phonenumber" name="phonenumber" type="text"
												placeholder="전화번호 (예: 010-1234-5678)"
												data-sb-validations="required">
											<div class="invalid-feedback"
												data-sb-feedback="phonenumber:required">전화번호는 필수입니다.</div>
											<i class="fa-solid fa-mobile-screen-button position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>

										<!-- 주소 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<input class="form-control ps-5 pe-5" style="height: 50px;"
												id="address" name="address" type="text" placeholder="주소"
												data-sb-validations="required" readonly>
											<button type="button"
												class="btn btn-default position-absolute"
												onclick="goPopup()"
												style="top: 50%; right: 10px; transform: translateY(-50%);">
												<i class="fa-solid fa-search"></i>
											</button>
											<i class="fa-solid fa-location-dot position-absolute"
												style="top: 50%; left: 15px; transform: translateY(-50%);"></i>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
										</div>

										<!-- 이메일 입력 -->
										<div
											style="position: relative; display: flex; align-items: center; height: 50px; padding: 2px;">
											<i class="fa-solid fa-envelope position-absolute"
												style="left: 15px; transform: translateY(-50%); top: 50%; z-index: 3;"></i>
											<input type="text" id="email" name="email" placeholder="이메일"
												class="form-control ps-5"
												style="height: 50px; padding-right: 90px; padding-left: 30px;"
												autocapitalize="off">
											<div id="emailDomain"
												style="position: absolute; right: 10px; background: white; color: gray; z-index: 2;">@gmail.com</div>
										</div>
										<div class="col" style="padding: 2px;">
											<div class="form-floating mb-3"
												style="height: 50px; margin-bottom: 0px">
												<select id="emailDomainSelect" class="form-select"
													onchange="updateEmailDomainDisplay()">
													<option value="@gmail.com" selected>Gmail.com</option>
													<option value="@naver.com">Naver.com</option>
													<option value="@daum.net">Daum.net</option>
													<option value="">직접 입력</option>
												</select> <label for="emailDomainSelect">도메인 선택</label>
											</div>
											<div id="verificationSection"
												style="display: flex; align-items: center; padding: 2px;"">
												<input class="form-control" type="text"
													id="verificationCodeInput"
													style="width: 82%; margin-right: 10px;" disabled>
												<button id="requestVerificationButton" type="button"
													class="btn btn-danger" onclick="sendVerification()">인증요청</button>
												<button id="confirmVerificationButton" type="button"
													value="확인" style="display: none;" class="btn btn-danger"
													onclick="checkVerificationCode()">인증확인</button>
											</div>
										</div>
										<div class="mt-n1" id="nicknameCheckDuplicateMessage"></div>
										<div class="mt-n1" id="phonenumberCheckDuplicateMessage"></div>
										<div class="mt-n1" id="emailCheckDuplicateMessage"></div>


										</br>
										<h4>선택사항</h4>

										<!-- 혈액형 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<select class="form-control"
												style="height: 50px; appearance: none; padding-left: 45px; background: #fff;"
												id="bloodtype" name="bloodtype">


												<option value="null"
													${user.bloodtype == '' ? 'selected' : ''}>혈액형
													[선택안함]</option>
												<option value="A" ${user.bloodtype == 'A' ? 'selected' : ''}>A형</option>
												<option value="B" ${user.bloodtype == 'B' ? 'selected' : ''}>B형</option>
												<option value="AB"
													${user.bloodtype == 'AB' ? 'selected' : ''}>AB형</option>
												<option value="O" ${user.bloodtype == 'O' ? 'selected' : ''}>O형</option>
											</select> <i class="fa-solid fa-droplet position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<!-- MBTI 입력 -->
										<div class="form-group position-relative"
											style="padding: 2px;">
											<select class="form-control"
												style="height: 50px; appearance: none; padding-left: 45px; background: #fff;"
												id="mbti" name="mbti">
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
											</select> <i class="fa-solid fa-child-reaching position-absolute"
												style="top: 50%; transform: translateY(-50%); left: 15px;"></i>
										</div>
										<!-- 사진 입력 -->
									<div style="display: none;">
										<div class="form-group position-relative"
											style="padding: 2px; display: none;">
											<input class="form-control ps-5"
												style="height: 50px; opacity: 0; width: 100%; cursor: pointer;"
												id="profilePhoto" name="profilePhotoPath" type="file"
												data-sb-validations="required" accept="image/*"
												onchange="updateLabel()"> <label for="profilePhoto"
												class="form-control"
												style="position: absolute; top: 0; left: 0; height: 100%; cursor: pointer; display: flex; align-items: center; padding-left: 50px;">
												<i class="fa-solid fa-camera"
												style="position: absolute; left: 15px;"></i> <span
												id="profilePhotoPathLabel">프로필 사진 추가</span>
											</label>
											<div class="invalid-feedback"
												style="position: absolute; top: 55px;">A profile photo
												is required.</div>
										
								</div>
									</form>
									<form id="uploadForm" enctype="multipart/form-data">
										사용자 ID, 실제 사용 시 해당 사용자의 ID로 설정해야 합니다.
										<input type="file" name="file" required>
										<button type="submit">파일 업로드</button>
									</div>

										<!-- '가입' 버튼 -->
										<button type="button" value="확인"
											style="height: 50px; padding: 2px;"
											class="btn btn-dark form-control" onclick="submitForm()">가입</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="/WEB-INF/layout/footer.jsp"%>








</body>

<script>



//입력 필드에 이벤트 리스너 추가
document.getElementById('id').addEventListener('input', debounce(function() {
    var idInput = document.getElementById('id');
    var idCheckMessage = document.getElementById('idCheckDuplicateMessage');
    var idRegex = /^[a-zA-Z0-9]{5,15}$/; // 영문자와 숫자만 허용, 5-15자 길이

    // 정규 표현식에 따른 유효성 검사
    if (!idRegex.test(idInput.value)) {
        idCheckMessage.textContent = '아이디는 5~15자의 영문자와 숫자만 사용 가능합니다.';
        idCheckMessage.style.color = 'red';
    } else {
        idCheckMessage.textContent = '';
        // 유효성 검사를 통과한 경우 서버에 중복 검사 요청
        checkDuplicate('id');
    }
}, 500));


document.getElementById('phonenumber').addEventListener('input', function(e) {
    var input = e.target;
    var formattedValue = input.value.replace(/[^\d]/g, ''); // 숫자만 추출
    if (formattedValue.length > 3) {
        formattedValue = formattedValue.substring(0, 3) + '-' + formattedValue.substring(3);
    }
    if (formattedValue.length > 8) {
        formattedValue = formattedValue.substring(0, 8) + '-' + formattedValue.substring(8);
    }
    input.value = formattedValue.substring(0, 13); // 올바른 전화번호 길이 (하이픈 포함 13자)
});


document.getElementById('identifynumber').addEventListener('input', function (e) {
    var value = e.target.value.replace(/[^\d]/g, '');  // 숫자만 추출
    var formatted = '';

    // 최대 입력 가능한 길이를 초과한 입력 방지
    value = value.substring(0, 7);

    // 입력받은 숫자를 형식에 맞게 변환
    for (var i = 0; i < value.length; i++) {
        if (i === 6) {
            formatted += '-';
        }
        formatted += value[i];
    }

    e.target.value = formatted;
    document.getElementById('identifynumber').value = value; // 숨겨진 필드에 하이픈 없는 값 저장
});


function updateLabel() {
    var input = document.getElementById('profilePhoto');
    var fileLabel = document.getElementById('profilePhotoPathLabel');
    var fileName = input.files.length > 0 ? input.files[0].name : '프로필 사진 추가';

    profilePhotoPathLabel.textContent = fileName; // 파일 이름을 레이블로 설정
}


//디바운싱 함수
function debounce(func, wait) {
    let timeout;

    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };

        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}
// 중복확인 함수
function checkDuplicate(field) {
    var inputElement = document.getElementById(field);
    var value = inputElement.value;
    var emailValue = document.getElementById('email').value;
    var emailDomainValue = document.getElementById('emailDomainSelect').value;
    var fullValue;

    // 이메일 필드인 경우 도메인과 합친다
    if (field === 'email') {
    	if (emailDomainValue === '') {
    		fullValue = emailValue
    	} else {
        fullValue = emailValue + emailDomainValue;
    	}
    } else {
        fullValue = value;
    }

    fetch('/join/begin?action=checkDuplicate&field=' + field + '&value=' + encodeURIComponent(fullValue), {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({[field]: fullValue})
    })
    .then(response => response.text())
    .then(data => {
        var duplicateMessage = document.getElementById(field + 'CheckDuplicateMessage');
        var sendVerificationButton = document.getElementById('sendVerification'); // 인증 버튼 DOM 요소 가져오기

        if (data === "duplicate") {
            duplicateMessage.textContent = "이미 사용 중인 " + field + "입니다.";
            duplicateMessage.classList.remove('message-success');
            duplicateMessage.classList.add('message-error');
            duplicateMessage.style.color = 'red'; // 중복인 경우 빨간색 표시
            inputElement.onblur = null; // 중복인 경우 포커스 잃어도 메시지 유지
            sendVerificationButton.disabled = true; // 중복인 경우 인증 버튼 비활성화
        } else {
            duplicateMessage.textContent = "사용 가능한 " + field + "입니다.";
            duplicateMessage.classList.remove('message-error');
            duplicateMessage.classList.add('message-success');
            duplicateMessage.style.color = 'green'; // 사용 가능한 경우 녹색으로 표시
            inputElement.onblur = function() {
                duplicateMessage.textContent = '';
                duplicateMessage.style.color = ''; // 색상 초기화
            };
            if (field === 'email') {
                sendVerificationButton.disabled = false; // 중복이 아닌 경우에만 인증 버튼 활성화
            }
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// 각 입력 필드에 대해 디바운스된 이벤트 핸들러 추가
/* document.getElementById('id').addEventListener('input', debounce(() => checkDuplicate('id'), 500));
 */document.getElementById('nickname').addEventListener('input', debounce(() => checkDuplicate('nickname'), 500));
document.getElementById('phonenumber').addEventListener('input', debounce(() => checkDuplicate('phonenumber'), 500));

document.getElementById('email').addEventListener('input', debounce(() => checkDuplicate('email'), 500));
document.getElementById('emailDomain').addEventListener('input', debounce(() => checkDuplicate('email'), 500));

//비밀번호와 비밀번호 확인을 비동기적으로 일치 여부를 확인하는 함수
function checkPasswordMatch() {
    var password = document.getElementById('password').value;
    var passwordConfirm = document.getElementById('passwordConfirm').value;
    var passwordMatchMessage = document.getElementById('passwordMatchMessage');

    if (password === passwordConfirm) {
        passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
        passwordMatchMessage.style.color = "green";
        // 일치하는 경우 포커스를 잃으면 메시지 삭제
        document.getElementById('passwordConfirm').onblur = function() {
            passwordMatchMessage.textContent = ''; // 일치 시 메시지를 항상 삭제
        };
    } else {
        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
        passwordMatchMessage.style.color = "red";
        // 일치하지 않는 경우 포커스를 잃어도 메시지 유지
        document.getElementById('passwordConfirm').onblur = null;
    }
}

// 이벤트 리스너를 추가합니다.
document.getElementById('password').addEventListener('input', checkPasswordMatch);
document.getElementById('passwordConfirm').addEventListener('input', checkPasswordMatch);


//이메일 도메인 표시
function updateEmailDomainDisplay() {
    var emailDomainSelect = document.getElementById('emailDomainSelect');
    var emailDomainDisplay = document.getElementById('emailDomain');
    
    var selectedDomain = emailDomainSelect.value;
    
    if (selectedDomain) {
        emailDomainDisplay.textContent = selectedDomain; // 선택된 도메인으로 텍스트 업데이트
    } else {
        emailDomainDisplay.textContent = ''; // 도메인이 '직접 입력'으로 설정되면 아무것도 표시하지 않음
    }
}

document.getElementById('sendVerification').addEventListener('click', sendVerification);
 
 // 인증번호 일치 확인
function checkVerificationCode() {
    var verificationCodeInput = document.getElementById('verificationCodeInput').value;
    
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
 
 // 이메일 인증번호 발송
function sendVerification() {
    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('emailDomainSelect').value;
    var fullEmail = email + emailDomain;

    // fetch를 사용하여 서버에 요청 전송
 fetch('/join/begin?action=sendVerification&email=' + fullEmail, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({'email': fullEmail})
    })
    .then(response => {
        if (response.ok) {
            alert("인증번호가 " + fullEmail + "로 발송되었습니다.");
            document.getElementById('verificationCodeInput').disabled = false;
            document.getElementById('requestVerificationButton').style.display = 'none';
            document.getElementById('confirmVerificationButton').style.display = 'inline';
        
            
            
        } else {
            // 오류 응답 처리
            console.error('서버 오류:', response.statusText);
            alert('서버 오류: ' + response.statusText);
        }
    })
    .catch(error => {
        // 네트워크 오류 처리
        console.error('네트워크 오류:', error);
        alert('네트워크 오류: ' + error.message);
    });
}

function submitForm() {
    var form = document.getElementById("userForm");
    var formData = new FormData(form);
    var profilePhotoPath = document.getElementById('profilePhotoPathLabel').textContent;
    var jsonObject = {};

    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('emailDomainSelect').value || '';
    var fullEmail = email + emailDomain;
    console.log("Email Domain: ", emailDomain); 
    uploadFile();
    formData.forEach(function(value, key) {
        jsonObject[key] = value;
    });
    
    jsonObject["email"] = fullEmail;
    jsonObject["attendance"] = 0;
    jsonObject["join_date"] = new Date().toISOString().slice(0,10);
    jsonObject["profilePhotoPath"] = profilePhotoPath;
    
    var json = JSON.stringify(jsonObject);

    fetch('/join/begin', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8'
        },
        body: json
    })
    .then(response => {
        if (response.ok) {
            alert("회원가입이 완료되었습니다.");
            uploadFile(); 
           /*  window.location.href = '/userJoinResult.jsp'; */
            window.location.href = '/join/end';
        } else {
        	 response.json().then(data => {
                 // 오류 메시지를 받아서 출력
                 var errorMessage = "";
                 for (var key in data) {
                     errorMessage += data[key] + "\n";
                 }
                 alert(errorMessage);
            }).catch(error => {
                console.error('Error:', error);
                alert('오류: ' + error.message);
            });
        }
    })
    }
    
 function uploadFile() {
    var form = document.getElementById('uploadForm');
    var formData = new FormData(form);

    fetch('/upload', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        console.log('File upload successful:', data);
    })
    .catch(error => console.error('File upload error:', error));
}
 
/*  document.getElementById('uploadForm').addEventListener('submit', function(event) {
     event.preventDefault(); // 폼의 기본 제출 막기
     var formData = new FormData(this);

     fetch('/upload', {
         method: 'POST',
         body: formData
     })
     .then(response => response.text()) // 응답을 텍스트로 받음
     .then(data => {
         console.log('Success:', data);
         alert(data); // 성공 메시지 표시
     })
     .catch(error => console.error('Error:', error));
 }); */
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/Address/addressAPI.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
   
}
function jusoCallBack(address){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    document.getElementById("address").value = address;
	window.close();
}

window.onload = function() {
    // 인증번호 발송 버튼을 비활성화
    var sendVerificationButton = document.getElementById('sendVerification');
    sendVerificationButton.disabled = true;
}

</script>
</html>

