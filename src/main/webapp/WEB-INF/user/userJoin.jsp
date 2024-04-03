<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <h3>회원가입 폼</h3>

    <form id="userForm" method="post">
  		<input type="hidden" name="action" value="register">
   
        ID: <input type="text" name="id">
         <input type="button" value="중복확인" onclick="checkDuplicate('id')"><br> 
        비밀번호: <input type="password" name="password"><br> 
        E-Mail: <input type="text" name="email"><br> 
        이름: <input type="text" name="name"><br> 
        닉네임: <input type="text" name="nickname">
         <input type="button" value="중복확인" onclick="checkDuplicate('nickname')"><br> 
        주민등록번호: <input type="text" name="identifynumber"><br> 
        전화번호: <input type="text" name="phonenumber"><br> 
        주소: <input type="text" name="address"><br> 
		<input type="hidden" name="join_date" id="join_date">
    	<input type="hidden" name="attendance">
        MBTI: <input type="text" name="mbti"><br>
        혈액형: <input type="text" name="bloodtype"><br> 
        <input type="button" value="가입" onclick="submitForm()">
    </form>
  
</body>
<script>
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
</script>

    </html>
