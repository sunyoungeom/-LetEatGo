<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세 페이지</title>
</head>
<body>
    <h1>게시물 상세 페이지</h1>
    <div id="postDetail"></div>

    <%
        // 서버 측에서 postId 가져오기
        String postId = request.getParameter("postId");
        // postId가 null이 아니면 스크립트 실행
    %>
    <script>
        const postDetail = document.getElementById("postDetail");
        //const postId = "<%= postId %>"; // URL 파라미터에서 postId를 가져옵니다.
        //const apiURL = `http://localhost:8080/post_detail?postId=16`;
        
        // 서블릿 엔드포인트를 호출하여 JSON 데이터를 가져옵니다.
        fetch(`post_detail?postId=${element.post_Id}`)
            .then((resp) => resp.json())
            .then((data) => {
                // JSON 데이터를 사용하여 HTML을 동적으로 생성합니다.
                let p = document.createElement("p");
                let p2 = document.createElement("p");
                p.innerText = `ID: ${data.post_Id}`;
                p2.innerText = `내용: ${data.content}`;
                postDetail.appendChild(p);
                postDetail.appendChild(p2);
            });
    </script>
</body>
</html>
