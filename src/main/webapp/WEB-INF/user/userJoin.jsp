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
<style>
.readonly-input {
	background-color: #f2f2f2;
	weight: 400px;
	height: 20px;
}
</style>
</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">

		<%@ include file="navigation.jsp"%>




		<section class="py-5">
			<div class="container px-5">
				<!-- Contact form-->
				<div class="bg-light rounded-4 py-5 px-4 px-md-5">
					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
							<i class="bi bi-envelope"></i>
						</div>
						<h1 class="fw-bolder">회원가입</h1>
						<p class="lead fw-normal text-muted mb-0">*은 필수항목입니다.</p>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-7">



							<form id="userForm" method="post">

								<!-- Name input-->
								<div class="row">
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" id="id" name="id" type="text"
												placeholder="Enter your name..."
												data-sb-validations="required" /> <label for="name">아이디
												*</label>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
										</div>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-secondary btn-lg"
											style="height: 58px;" onclick="checkDuplicate('id')">중복확인</button>
									</div>
									<div class="mt-n1" id="idDuplicateMessage"></div>
									<br>
								</div>


								<!-- Name input-->
								<div class="row">
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" id="password" name="password"
												type="password" placeholder="Enter your name..."
												data-sb-validations="required" /> <label for="name">비밀번호</label>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
										</div>
									</div>
										
										<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" id="passwordConfirm"
												name="passwordConfirm" type="password"
												placeholder="Enter your name..."
												data-sb-validations="required" /> <label for="name">비밀번호
												확인</label>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">A name is required.</div>
										</div>
									</div>
									<div class="mt-n1" id="passwordMatchMessage"></div>
									<br>
								</div>

								<!-- <input type="hidden" name="action" value="register">  -->
								<!-- ID: <input type="text" id="id" name="id"> <input
									type="button" value="중복확인" onclick="checkDuplicate('id')"> -->
								<!-- 비밀번호: <input type="password" id="password" name="password"><br>
								비밀번호 확인: <input type="password" id="passwordConfirm"
									name="passwordConfirm"><br>
								비밀번호 확인 메시지
								<span id="passwordMatchMessage"></span>
								 -->


								<!-- 이메일 입력 -->
								<div class="row">
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" id="email" name="email"
												type="text" placeholder="이메일을 입력하세요..."
												data-sb-validations="required" /> <label for="name">이메일</label>
										</div>
									</div>
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" id="emailDomain"
												name="emailDomain" type="text" placeholder="이메일을 입력하세요..."
												data-sb-validations="required" /><label for="name">이메일 도메인</label>
										</div>
									</div>



								</div>
								<div class="row">

									<div class="col">
										<div class="form-floating mb-3">
											<select id="emailDomainSelect" class="form-select"
												onchange="setEmailDomain()">
												<option value="">직접 입력</option>
												<option value="gmail.com">Gmail.com</option>
												<option value="naver.com">Naver.com</option>
												<option value="daum.net">Daum.net</option>
											</select> <label for="emailDomainSelect">선택해주세요</label>
											<div class="invalid-feedback"
												data-sb-feedback="name:required">도메인을 선택해주세요.</div>
										</div>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-secondary btn-lg"
											style="height: 58px;" onclick="checkDuplicate('email')">중복확인</button>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-secondary btn-lg"
											style="height: 58px;" id="sendVerification" onclick="checkDuplicate('email')">인증번호 발송</button>
									</div>
									<div class="mt-n1" id="emailDuplicateMessage"></div>
									<br>
								</div>


								<!-- 	<!-- Name input-->
								<!-- 	<div class="row">
									<div class="col">
										<div class="form-floating mb-3">
											<input class="form-control" id="email" name="email"
												type="text" placeholder="Enter your name..."
												data-sb-validations="required" /> <label for="name">이메일</label>

										</div>
										<input class="form-control" id="emailDomain"
											name="emailDomain" type="text" placeholder="@gmail.com"
											data-sb-validations="required" /> <label for="name">비밀번호
											확인</label>
										<div class="invalid-feedback" data-sb-feedback="name:required">A
											name is required.</div>


										<select id="emailDomainSelect" onchange="setEmailDomain()">
											<option value="">직접 입력</option>
											<option value="gmail.com">Gmail.com</option>
											<option value="naver.com">Naver.com</option>
											<option value="daum.net">Daum.net</option>
										</select>
									</div>

									<div class="col-auto">
										<button type="button" class="btn btn-secondary btn-lg"
											style="height: 58px;" onclick="checkDuplicate('email')">중복확인</button>
									</div>
								</div> -->


								<!-- E-Mail: <input type="text" id="email" name="email">@ <input
									type="text" id="emailDomain"> <select
									id="emailDomainSelect" onchange="setEmailDomain()">
									<option value="">직접 입력</option>
									<option value="gmail.com">Gmail.com</option>
									<option value="naver.com">Naver.com</option>
									<option value="daum.net">Daum.net</option>
								</select> <input type="button" value="중복확인"
									onclick="checkDuplicate('email')"> -->
								<!-- <input type="button" id="sendVerification" value="인증번호 발송">
								<span id="emailDuplicateMessage"></span><br> -->
								
								
								 인증번호: <input
									type="text" id="verificationCodeInput"> <input
									type="button" id="confirmVerificationButton" value="확인"
									onclick="checkVerificationCode()"><br> 이름: <input
									type="text" id="name" name="name"><br> 닉네임: <input
									type="text" id="nickname" name="nickname"> <input
									type="button" value="중복확인" onclick="checkDuplicate('nickname')">
								<span id="nicknameDuplicateMessage"></span><br> 주민등록번호: <input
									type="text" id="identifynumber" name="identifynumber"><br>




								전화번호: <input type="text" id="phonenumber" name="phonenumber">
								<input type="button" value="중복확인"
									onclick="checkDuplicate('phonenumber')"> <span
									id="phonenumberDuplicateMessage"></span><br> 도로명주소: <input
									type="text" id="address" name="address" readonly> <input
									type="button" onclick="goPopup()" value="주소찾기"><br>

								<input type="hidden" id="join_date" name="join_date"> <input
									type="hidden" id="attendance" name="attendance"> MBTI:
								<select id="mbti" name="mbti">
									<option value="null">----</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ESTP">ESTP</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ESFP">ESFP</option>
									<option value="ENTJ">ENTJ</option>
									<option value="ENTP">ENTP</option>
									<option value="ENFJ">ENFJ</option>
									<option value="ENFP">ENFP</option>
									<option value="ISTJ">ISTJ</option>
									<option value="ISTP">ISTP</option>
									<option value="ISFJ">ISFJ</option>
									<option value="ISFP">ISFP</option>
									<option value="INTJ">INTJ</option>
									<option value="INTP">INTP</option>
									<option value="INFJ">INFJ</option>
									<option value="INFP">INFP</option>
								</select><br> 혈액형:
								<!-- <input type="text" id="bloodtype" name="bloodtype"><br> -->
								<select id="bloodtype" name="bloodtype">
									<option value="null">----</option>
									<option value="A">A형</option>
									<option value="B">B형</option>
									<option value="AB">AB형</option>
									<option value="O">O형</option>
								</select> <input type="button" value="가입" onclick="submitForm()">
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>





</body>

<script>
//비밀번호와 비밀번호 확인을 비동기적으로 일치 여부를 확인하는 함수
function checkPasswordMatch() {
    var password = document.getElementById('password').value;
    var passwordConfirm = document.getElementById('passwordConfirm').value;
    var passwordMatchMessage = document.getElementById('passwordMatchMessage');

    if (password === passwordConfirm) {
        // 비밀번호가 일치할 때
        passwordMatchMessage.textContent = "비밀번호가 일치합니다.";
        passwordMatchMessage.style.color = "green";
    } else {
        // 비밀번호가 일치하지 않을 때
        passwordMatchMessage.textContent = "비밀번호가 일치하지 않습니다.";
        passwordMatchMessage.style.color = "red";
    }
}

// 비밀번호 확인 필드의 값이 변경될 때마다 일치 여부를 확인
document.getElementById('passwordConfirm').addEventListener('input', checkPasswordMatch);


document.getElementById('sendVerification').addEventListener('click', sendVerification);
 
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
 
 
function sendVerification() {
    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('emailDomain').value;
    var fullEmail = email + '@' + emailDomain;

    // fetch를 사용하여 서버에 요청 전송
   fetch('/join/begin?action=sendVerification&email=' + encodeURIComponent(fullEmail), {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    })
    .then(response => {
        if (response.ok) {
            alert("인증번호가 " + fullEmail + "로 발송되었습니다.");
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


/* function sendVerification() {

    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('emailDomain').value;
    // 이메일을 서버로 전송하여 인증 번호를 발송하는 로직을 구현하세요.
    // 이 예제에서는 간단히 알림 창으로 메시지를 출력합니다.
    alert("인증 번호가 " + email + '@' + emailDomain + "로 발송되었습니다.");
} */
// var formData = {
// 		id: document.getElementById("id").value,
//         password: document.getElementById("password").value,
//         email: document.getElementById("email").value,
//         name: document.getElementById("name").value,
//         nickname: document.getElementById("nickname").value,
//         identifynumber: document.getElementById("identifynumber").value,
//         phonenumber: document.getElementById("phonenumber").value,
//         address: document.getElementById("address").value,
//         join_date: document.getElementById("join_date").value,
//         attendance: document.getElementById("attendance").value,
// }
function checkDuplicate(field) {
	var value = document.getElementById(field).value;
	var emailValue = document.getElementById('email').value;
    var emailDomainValue = document.getElementById('emailDomain').value;

	// 이메일 필드가 아닌 경우에는 그냥 value를 전송
    if (field !== 'email') {
        var data = {
            [field]: value
        };
    } else { // 이메일 필드인 경우 이메일과 도메인을 합쳐서 전송
    	value = emailValue + '@' + emailDomainValue;
        var data = {
            'email': value
            };
    }

    fetch('/join/begin?action=checkDuplicate&field=' + field + '&value=' + value, {
    	    method: 'POST',
    	    headers: {
    	        'Content-Type': 'application/json'
    	    },
    	    body: JSON.stringify(data)
    	})
    	.then(response => response.text()) // JSON 형식이 아닌 텍스트로 응답을 파싱
    	.then(data => {
            var duplicateMessage = document.getElementById(field + 'DuplicateMessage');
            var sendVerificationButton = document.getElementById('sendVerification');
            if (field === 'email') {
                if (data === "duplicate") {
                    duplicateMessage.textContent = "이미 사용 중인 " + field + "입니다.";
                    sendVerificationButton.disabled = true;
                    sendVerificationButton.style.display = 'none';
                } else {
                    duplicateMessage.textContent = "사용 가능한 " + field + "입니다.";
                    sendVerificationButton.disabled = false;
                    sendVerificationButton.style.display = 'inline';
                }
            } else {
                if (data === "duplicate") {
                    duplicateMessage.textContent = "이미 사용 중인 " + field + "입니다.";
                } else {
                    duplicateMessage.textContent = "사용 가능한 " + field + "입니다.";
                }
            }
    	})
    	.catch(error => {
    	    // 에러 처리 로직
    	});
}


/* function autoCompleteEmail(domain) {
    var emailInput = document.getElementById('email');
    var emailDomainSelect = document.getElementById('emailDomain');
    if (domain === '') {
        emailInput.value = '';
        emailInput.focus();
    } else {
        emailInput.value = domain;
    }
}
 */
function setEmailDomain() {
    var emailDomainSelect = document.getElementById('emailDomainSelect');
    var selectedDomain = emailDomainSelect.value;
    var emailInput = document.getElementById('emailDomain');
    if (selectedDomain === '') {
        emailInput.value = '';
        emailInput.focus();
    } else {
        emailInput.value = selectedDomain;
    }
}


function submitForm() {
    var form = document.getElementById("userForm");
    var formData = new FormData(form);
    var jsonObject = {};
    
    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('emailDomain').value;
    var fullEmail = email + '@' + emailDomain;

    formData.forEach(function(value, key) {
        jsonObject[key] = value;
    });
    
    jsonObject["email"] = fullEmail;
    jsonObject["attendance"] = 0;
    jsonObject["join_date"] = new Date().toISOString().slice(0,10);
    
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

