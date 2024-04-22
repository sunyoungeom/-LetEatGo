<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page isELIgnored="true"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>받은 친구추가</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <!-- Custom CSS for Table and Pagination -->
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
                <div class="col-md-3 mb-3 mb-md-0" style="height: 500px">
                  <%@ include file="/WEB-INF/myinfo/MyInfoSidebar.jsp"%>
                </div>
                <!-- 테이블 -->
                <div class="col-md-9">
                  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light">
                    <div class="row justify-content-center">
                      <div class="col-12">
                        <h3>받은 친구 추가</h3>
                        <table
                          class="table table-hover table-bordered"
                          id="recieveFriends"
                        >
                          <thead class="table-light">
                            <tr>
                              <th scope="col" style="width: 40%">닉네임</th>
                              <th scope="col" style="width: 20%">성별</th>
                              <th scope="col" style="width: 20%">나이</th>
                              <th scope="col" style="width: 20%">수락및거절</th>
                            </tr>
                          </thead>
                          <tbody class="table-group-divider">
                            <!-- 스크립트영역에서 채우기 -->
                          </tbody>
                        </table>
                        <nav aria-label="Page navigation example">
                          <ul
                            class="pagination justify-content-center"
                            id="pagination"
                          >
                            <!-- Pagination dynamically created by JavaScript -->
                          </ul>
                        </nav>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </body>
  <script>
    // 서버에서 데이터를 가져오는 함수
    function fetchData() {
      fetch("/recieveFriends")
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          data.forEach((user) => {
            const row = document.createElement("tr");
            const gender = getGender(user.identifynumber % 10); // 주민등록번호의 마지막 숫자로 성별 판별
            const age = calculateAge(user.identifynumber.substring(0, 2));
            const acceptButton = `<button onclick="acceptFriend(${user.user_id})">수락</button>`;
            const rejectButton = `<button onclick="rejectFriend(${user.user_id})">거절</button>`;
            row.innerHTML = `
                  <td>${user.nickname}</td>
                  <td>${gender}</td>
                  <td>${age}</td>
                  <td>${acceptButton} ${rejectButton}</td> <!-- 추가 정보 칼럼 -->
              `;
            document.querySelector("#recieveFriends tbody").appendChild(row);
          });
        })
        .catch((error) => console.error("Error fetching data:", error));
    }
    function getGender(lastDigit) {
      return lastDigit % 2 === 1 ? "남자" : "여자";
    }
    function calculateAge(birthYear) {
      var currentYear = new Date().getFullYear();
      var age = currentYear - parseInt("19" + birthYear); // 주민등록번호 앞의 두 자리로 출생년도 계산
      if (age >= 100) {
        age = parseInt(age.toString().slice(1)); // 나이가 100세 이상이면 뒤의 한 자리만 남기기
      }
      return age;
    }

    function acceptFriend(userId) {
      fetch(`/recieveFriends/accept?userId=${userId}`, { method: "POST" })
        .then((response) => {
          if (response.ok) {
           alert("수락 실패");
           window.location.reload();
        } else {
            alert("수락 성공");
            window.location.reload();
            // 여기에 수락 실패 시 동작하는 코드 추가
          }
        })
        .catch((error) => console.error("수락 요청 에러:", error));
    }

    // 거절 버튼 클릭 시 처리
    function rejectFriend(userId) {
      fetch(`/recieveFriends/reject?userId=${userId}`, { method: "POST" })
        .then((response) => {
          if (response.ok) {
            alert("거절 실패");
            window.location.reload();
          } else {
            alert("거절 성공");
            // 여기에 거절 실패 시 동작하는 코드 추가
            window.location.reload();
          }
        })
        .catch((error) => console.error("거절 요청 에러:", error));
    }
    // 페이지 로드 시 데이터 가져오기
    window.addEventListener("DOMContentLoaded", () => {
      fetchData();
    });
  </script>
</html>
