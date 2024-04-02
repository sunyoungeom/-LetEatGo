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

    <form id="userForm">
   
        ID: <input type="text" name="id"><br> 
		비밀번호: <input type="password" name="password"><br> 
		E-Mail: <input type="text" name="email"><br> 
		이름: <input type="text" name="name"><br> 
		닉네임: <input type="text" name="nickname"><br> 
		주민등록번호: <input type="text" name="identifynumber"><br> 
		전화번호: <input type="text" name="phonenumber"><br> 
		도로명주소: <input type="text" name="address"> <input type="button" onclick="goAddressHome()" value="주소찾기"><br> 
		Join Date: <input type="date" name="join_date"><br> 
		Attendance: <input type="number" name="attendance"><br> 
		MBTI: <input type="text" name="mbti"><br>
		혈액형: <input type="text" name="bloodtype"><br> 
		<input type="button" value="가입" onclick="submitForm()">

    </form>

</body>
<script>
function submitForm() {
    var form = document.getElementById("userForm");
    var formData = new FormData(form);
    var jsonObject = {};

    formData.forEach(function(value, key) {
        jsonObject[key] = value;
    });
 // 입력 폼의 유효성 검사
    for (var key in jsonObject) {
        if (!jsonObject[key]) {
            alert("모든 항목을 입력해주세요");
            return; // 입력 폼이 하나라도 비어있으면 함수 종료
        }
    }

    var json = JSON.stringify(jsonObject);

    fetch('user?action=register', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json;charset=UTF-8'
        },
        body: json
    })
    .catch(function(error) {
        console.error('Error:', error);
        alert('오류: ' + error.message);
    })

    .then(function(data) {
        if (data.error) {
            alert(data.error);
        } else {
            alert('회원가입이 완료되었습니다.');
        }
    })
    .then(function(response) {
        if (!response.ok) {
            throw new Error('서버 오류 발생');
        }
        return response.json();
    });
}

function goAddressHome() {
	window.location.href = "Address/addressHome.jsp";
}
</script>
</html>
