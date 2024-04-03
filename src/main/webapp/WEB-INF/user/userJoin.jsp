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
        weight : 400px;
        height : 20px;
    }
    
</style>
</head>
<body>
    <h3>회원가입 폼</h3>
    <form id="userForm" method="post">
  		<input type="hidden" name="action" value="register">
        ID: <input type="text" id="id" name="id">
        <input type="button" value="중복확인" onclick="checkDuplicate('id')"><br>
		비밀번호: <input type="password" id="password" name="password"><br> 
		E-Mail: <input type="text" id="email" name="email"><br> 
		이름: <input type="text" id="name" name="name"><br> 
		닉네임: <input type="text" id="nickname" name="nickname">
		<input type="button" value="중복확인" onclick="checkDuplicate('nickname')"><br> 
		주민등록번호: <input type="text" id="identifynumber" name="identifynumber"><br> 
		전화번호: <input type="text" id="phonenumber" name="phonenumber"><br> 
		도로명주소: <input type="text" id="address" name="address" readonly> <input type="button" onclick="goPopup()" value="주소찾기"><br> 
		<input type="hidden" id="join_date" name="join_date"> 
		<input type="hidden" id="attendance" name="attendance"> 
		MBTI: <input type="text" id="mbti" name="mbti"><br>
		혈액형: <input type="text" id="bloodtype" name="bloodtype"><br> 
		<input type="button" value="가입" onclick="submitForm()">
	</form>
</body>
<script>
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
    var value = document.getElementsByName(field)[0].value;
    fetch('user?action=checkDuplicate&field=' + field + '&value=' + value)
    .then(response => response.json())
    .then(data => {
        alert(field + " 중복 확인 결과: " + data.result);
    })
    .catch(error => {
        console.error('Error:', error);
        alert('오류: 중복 확인 요청에 실패했습니다.');
    });
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

    fetch('user?action=register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8'
        },
        body: json
    })
   .then(response => {
    if (response.ok) {
        alert("회원가입이 완료되었습니다.");
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

</script>
</html>

