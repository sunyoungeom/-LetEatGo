<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사람 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../Resources/css/styles.css" rel="stylesheet" />
    <style>
        /* 페이지네이션의 색상을 회색으로 변경 */
        .page-link {
            color: #6c757d; /* 페이지 번호의 색상 */
            border-color: #dee2e6; /* 페이지 번호의 테두리 색상 */
        }

        .page-link:hover {
            color: black; /* 페이지 번호의 호버 색상 */
            text-decoration: none; /* 링크에 밑줄 제거 */
            background-color: #e9ecef; /* 페이지 번호의 호버 배경색 */
            border-color: #dee2e6; /* 페이지 번호의 테두리 색상 */
        }

        .page-item.active .page-link {
            z-index: 1;
            color: black; /* 활성 페이지 번호의 색상 */
            background-color: #6c757d; /* 활성 페이지 번호의 배경색 */
            border-color: black; /* 활성 페이지 번호의 테두리 색상 */
        }

        .page-item.disabled .page-link {
            color: #6c757d; /* 비활성 페이지 번호의 색상 */
            pointer-events: none; /* 비활성 페이지 번호 클릭 방지 */
            background-color: #f8f9fa; /* 비활성 페이지 번호의 배경색 */
            border-color: #dee2e6; /* 비활성 페이지 번호의 테두리 색상 */
        }
    </style>
</head>
<body>
    <%@ include file="../user/navigation.jsp"%>
    <a href="/person/personmap">주변 사람 찾기</a>
</body>


</html>