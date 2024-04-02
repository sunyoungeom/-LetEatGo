<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 탈퇴</title>
</head>
<body>
    <h2>회원 탈퇴</h2>
    <form action="user?action=delete" method="post">
        <label for="userId">사용자 ID:</label>
        <input type="text" id="userId" name="userId" required><br><br>
        <input type="submit" value="탈퇴">
    </form>
</body>
</html>
