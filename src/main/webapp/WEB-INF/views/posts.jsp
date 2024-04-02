<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
</head>
<body>
    <h1>게시물 목록</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>내용</th>
        </tr>
        <c:forEach items="${posts}" var="post">
            <tr>
                <td>${post.post_Id}</td>
                <td>${post.content}</td>
            </tr>
        </c:forEach>
    </table>
    
    <!-- 페이지네이션 -->
    <c:set var="totalPosts" value="${requestScope.posts.size()}" />
    <c:set var="pageSize" value="1" />
    <c:set var="totalPages" value="${totalPosts / pageSize + (totalPosts % pageSize == 0 ? 0 : 1)}" />

    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
        <c:url value="/post">
            <c:param name="action" value=""/>
            <c:param name="pageNumber" value="${pageNumber}"/>
        </c:url>
        <a href="<c:out value="${url}"/>">${pageNumber}</a>
    </c:forEach>
</body>
</html>
