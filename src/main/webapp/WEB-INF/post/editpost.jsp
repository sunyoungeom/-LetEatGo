<%@page import="post.Post"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시물 수정</title>
</head>
<body>
<h1>게시물 수정</h1>
<form id="editPostForm" action="/updatePost" method="post">
    <div id="container">
        <%-- 기존 포스트의 데이터를 가져와서 폼에 채워 넣기 --%>
        <%
            // 기존 포스트의 데이터를 가져옵니다.
            Post post = (Post)request.getAttribute("post");
            if (post != null) {
        %>
                <input type="hidden" name="postId" value="<%= post.getPost_Id() %>">
                <label for="title">제목:</label><br />
                <input id="title" name="title" value="<%= post.getTitle() %>" /><br /><br />

                <p>언제 먹을까요?</p>
                <input type="date" id="expireDate" name="expireDate" value="<%= post.getExpireDate() %>" /><br /><br />

                <label for="content">내용:</label><br />
                <textarea id="content" name="content" rows="4" cols="50"><%= post.getContent() %></textarea>
                <br />
                <br />
                <input type="submit" value="수정" />

                <%-- 기존 포스트의 데이터를 수정하는 폼으로 보내는 버튼 --%>
                <button onclick="location.href='/editPost?postId=<%= post.getPost_Id() %>'">취소</button>
        <% } else { %>
            <p>포스트를 불러오는 데 실패했습니다.</p>
        <% } %>

        <div id="tagResult"></div>
        <button id="openTagDialog" type="button">tag</button><br />
        <dialog id="dialogForm"></dialog>
    </div>
</form>
</body>
</html>
