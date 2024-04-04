<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.readonly-input {
	background-color: #f2f2f2;
	weight: 400px;
	height: 20px;
}
</style>
</head>
<body>
	<h3>회원가입 폼</h3>
	<form id="userForm" method="post">
		<!-- <input type="hidden" name="action" value="register">  -->
		ID: <input type="text" id="id" name="id"> 
		<input type="button" value="중복확인" onclick="checkDuplicate('id')">
		<span id="idDuplicateMessage"></span><br>
		
		비밀번호: <input type="password" id="password" name="password"><br>
		비밀번호 확인: <input type="password" id="passwordConfirm" name="passwordConfirm"><br> 
		
		E-Mail: <input type="text" id="email" name="email">@ 
		<input type="text" id="emailDomain">
		<select id="emailDomainSelect" onchange="setEmailDomain()">
			<option value="">직접 입력</option>
			<option value="gmail.com">Gmail.com</option>
			<option value="naver.com">Naver.com</option>
			<option value="daum.net">Daum.net</option>
		</select> 
		<input type="button" value="중복확인" onclick="checkDuplicate('email')">
		<input type="button" id="sendVerification" value="인증번호 발송">
		<span id="emailDuplicateMessage"></span><br>
		인증번호: <input type="text" id="verificationCodeInput">
		<input type="button" id="confirmVerificationButton" value="확인"><br> 
		
		이름: <input type="text" id="name" name="name"><br>
		
		닉네임: <input type="text" id="nickname" name="nickname"> 
		<input type="button" value="중복확인" onclick="checkDuplicate('nickname')">
		<span id="nicknameDuplicateMessage"></span><br> 
		
		주민등록번호: <input type="text" id="identifynumber" name="identifynumber"><br> 
		
		전화번호: <input type="text" id="phonenumber" name="phonenumber"> 
		<input type="button" value="중복확인" onclick="checkDuplicate('phonenumber')">
		<span id="phonenumberDuplicateMessage"></span><br> 
		
		도로명주소: <input type="text" id="address" name="address" readonly> 
		<input type="button" onclick="goPopup()" value="주소찾기"><br> 
			
		<input type="hidden" id="join_date"	name="join_date"> 
			
		<input type="hidden" id="attendance" name="attendance"> 
			
		MBTI:
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
		</select><br>
		
		혈액형: <!-- <input type="text" id="bloodtype" name="bloodtype"><br> --> 
		<select id="bloodtype" name="bloodtype">
			<option value="null">----</option>
			<option value="A">A형</option>
			<option value="B">B형</option>
			<option value="AB">AB형</option>
			<option value="O">O형</option>
		</select>
			
		<input type="button" value="가입" onclick="submitForm()">
	</form>
</body>

<script>
document.getElementById('sendVerification').addEventListener('click', sendVerification);


function sendVerification() {

    var email = document.getElementById('email').value;
    var emailDomain = document.getElementById('emailDomain').value;
    // 이메일을 서버로 전송하여 인증 번호를 발송하는 로직을 구현하세요.
    // 이 예제에서는 간단히 알림 창으로 메시지를 출력합니다.
    alert("인증 번호가 " + email + '@' + emailDomain + "로 발송되었습니다.");
}
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

    formData.forEach(function(value, key) {
        jsonObject[key] = value;
    });
    
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

