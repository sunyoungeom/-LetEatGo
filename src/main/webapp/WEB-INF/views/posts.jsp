<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <c:forEach items="${posts.items}" var="postItem">
            <tr>
                <td>${postItem.post_Id}</td>
                <td>${postItem.content}</td>
            </tr>
        </c:forEach>
    </table>
    
    <%-- <!-- 페이지네이션 -->
    <c:if test="${ not empty posts.totalPages}">
        <div>
            <c:forEach begin="1" end="${posts.totalPages}" var="pageNumber">
                <c:url value="/post">
                    <c:param name="action" value="${pageNumber}" />
                    <c:param name="pageNumber" value="${pageNumber}" />
                </c:url>
                <a href="<c:out value="${url}" />">${pageNumber}</a>
            </c:forEach>
            
        </div>
    </c:if> --%>
</body>
</html>
