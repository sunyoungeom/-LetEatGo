<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="recentPostList"></div>
</body>
    <Script>
        fetch("http://localhost:8080/recent")
        .then((resp) => resp.json()) // JSON 형식으로 변환
                .then((data) => {
                    const recentPostList  = document.getElementById("recentPostList");
                    recentPostList.innerHTML = "";
                    let h2 = document.createElement("h2");
                    h2.innerText = "최근간 음식점 10곳"
                    let a  =document.createElement("a");
                    a.href = "";
                    a.innerText = data.placeByIdList;
                    recentPostList.appendChild(a);

                })
    </Script>
</html>