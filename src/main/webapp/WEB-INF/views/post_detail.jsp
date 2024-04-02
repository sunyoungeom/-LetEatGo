<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세 정보</title>
</head>
<body>
    <h1>게시물 상세 정보</h1>
	    <p><strong>제목:</strong> ${post.title}</p>
    	<p><strong>내용:</strong> ${post.content}</p>
    	<p><strong>작성자:</strong> ${post.writeUser_Id}</p>
</body>
</html>
