<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<h3>아이디 찾기 결과</h3>
	<%
	String result = (String) request.getAttribute("result");
	if (result != null) {
	%>
	$ { result }
	<%
	} else {
	%>

	<h3>${ user.id }</h3>

	<%
	}
	%>
</body>
</html>