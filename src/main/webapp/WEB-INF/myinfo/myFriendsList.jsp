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
                          <th scope="col" style="width: 20%">채팅하기</th>
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


</script>
</html>