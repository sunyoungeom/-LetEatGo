<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>

	<h1>게시물 작성</h1>

	<form action="createPost" method="post">
		<label for="content">내용:</label><br>
		<textarea id="content" name="content" rows="4" cols="50"></textarea>
		<br>
		<br> <input type="submit" value="등록">
	</form>

</body>
</html>

