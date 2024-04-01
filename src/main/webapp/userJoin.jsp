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

	${error}

	<form action="/userJoin.do" method="POST">
		ID: <input type="text" name="id"><br> 
		비밀번호: <input type="password" name="password"><br> 
		이름: <input type="text" name="name"><br> 
		닉네임: <input type="text" name="nickname"><br> 
		E-Mail: <input type="text" name="email"><br> 
		MBTI: <input type="text" name="mbti"><br>
		혈액형: <input type="text" name="bloodtype"><br> 
		주민등록번호: <input type="text" name="identifynumber"><br> 
		전화번호: <input type="text" name="phoneNumber"><br> 
		<input type="submit" value="가입">
	</form>

</body>
</html>
