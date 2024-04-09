<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>내프로필</title>
    <!-- Favicon--
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Custom Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
            rel="stylesheet" />
    <!-- Bootstrap icons-->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
            rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="./Resources/css/styles.css" rel="stylesheet" />
    <style>
     /* 모달 창 스타일 */
    .modal {
        display: none; /* 초기에는 화면에 표시되지 않음 */
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 50%; /* 현재의 반으로 크기 조정 */
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4); /* 배경은 반투명하게 설정 */
    }

    /* 모달 창 내용 스타일 */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 90%; /* 내용의 너비는 유지하고 */
        max-width: 30%; /* 최대 너비도 조정 */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        animation-name: animatetop;
        animation-duration: 0.4s;
    }

        /* 모달 창 닫기 버튼 스타일 */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover, .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* 모달 창 등장 애니메이션 */
        @keyframes animatetop {
            from {top: -300px; opacity: 0}
            to {top: 0; opacity: 1}
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <%@ include file="/WEB-INF/user/navigation.jsp"%>
    <section class="py-5">
        <div class="container px-5">
            <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                <div class="row align-items-center">
                    <!-- 내정보 -->
                    <div class="col-md-3 mb-3 mb-md-0" style="height: 500px;">
                        <%@ include file="/WEB-INF/myinfo/MyInfoSidebar.jsp"%>
                    </div>
                    <!-- 테이블 -->
                    <div class="col-md-9">
                        <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
                            <div class="row justify-content-center">
                                <div class="col-10">
                                    <div class="border rounded">
                                        <table class="table" id="postTable" style="margin-bottom: 0px;">
                                            <tr>
                                                <th scope="col" style="width: 90%; padding: 0px;"></th>
                                                <th scope="col" style="width: 10%; padding: 0px;"></th>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding-left: 1.5em; border-bottom: none;">
                                                    <div class="name_text" style="font-size: 30px;">${ user.name }</div>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding-left: 1.5em;">
                                                    <i class="bi bi-person" style="padding-right: 0.5em;"></i>
                                                    <span class="nickname_text">${ user.nickname }</span>
                                                </th>
                                                <th>
                                                    <button class="editButton" data-field="nickname" data-action="edit">수정</button>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding-left: 1.5em;">
                                                    <i class="bi bi-phone" style="padding-right: 0.5em;"></i>
                                                    <span class="phonenumber_text">${ user.phonenumber }</span>
                                                    
                                                </th>
                                                 <th>
                                                    <button class="editButton" data-field="phonenumber" data-action="edit">수정</button>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th scope="row" style="padding-left: 1.5em;">
                                                    <i class="bi bi-envelope" style="padding-right: 0.5em;"></i>
                                                    <span class="email_text">${ user.email }</span>
                                                </th>
                                                 <th>
                                                    <button class="editButton" data-field="email" data-action="edit">수정</button>
                                                </th>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- 수정 모달 -->
<div id="editModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <form id="editForm">
            <label for="editField"></label>
            <span id="editFieldDisplay"></span><br><br>
            <label for="editValue"></label>
            <input type="text" id="editValue" name="editValue" required><br><br>
            <input type="submit" id="editSubmitButton" value="확인">
        </form>
    </div>
</div>

<script>
  
 // 수정 버튼 클릭 시 모달 창 띄우기
    document.querySelectorAll('.editButton').forEach(function(button) {
        button.addEventListener('click', function() {
            var field = this.getAttribute('data-field');
            var value = this.parentElement.previousElementSibling.querySelector('span').textContent.trim();
            document.getElementById('editFieldDisplay').textContent = field + ':';
            document.getElementById('editValue').value = value;

            var modal = document.getElementById('editModal');
            modal.style.display = 'block';
        });
    });


    // 모달 창 닫기
    document.querySelector('.close').addEventListener('click', function() {
        var modal = document.getElementById('editModal');
        modal.style.display = 'none';
    });

 // 모달 창 제출 시 처리
    document.getElementById('editForm').addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 동작 방지

        var field = document.getElementById('editFieldDisplay').textContent.replace(':', '').trim();
        var value = document.getElementById('editValue').value;

        var data = {
            field: field,
            value: value
        };

        // JSON 형식으로 데이터 전달
        var jsonData = JSON.stringify(data);

        fetch('/myInfo?detail=profile', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: jsonData
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(function(data) {
            // 서버 응답에 따른 처리
            alert(field + '가 ' + value + '로 수정되었습니다.');
            var modal = document.getElementById('editModal');
            modal.style.display = 'none';
        })
        .catch(function(error) {
            // 오류 처리
            console.error('There was a problem with the fetch operation:', error);
        });
    });
</script>
</body>
</html>
