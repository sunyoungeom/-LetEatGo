<!--# 프로젝트명
 LetEatGo

## 프로젝트 제작 과정 및 핵심

현대 사회에 필수적인 ‘식사’와 ‘인간 관계’에 초점을 맞춰 프로젝트를 개발합니다. 새로운 인연을 만들고 밥메이트를 찾을 수 있는 서비스에 중점을 둡니다.

### 프로그램 주요 기능
![1](https://github.com/dongso03/-Final_Project/assets/154950237/412608bd-d0d1-4b55-a5af-57712d24993a)

1. **주변 음식점 찾기 및 모임 만들기**
2. **주변 사람 찾기 및 친구 추가**

### 담당 업무

1. **외부 Open API 활용**
    ![3](https://github.com/dongso03/-Final_Project/assets/154950237/693bea23-c113-4a72-a8f5-012dbbc2f6ba)
   - Kakao Map, Kakao 블로그 검색 API 사용
     1. 주변 음식점 찾기 기능
     2. 주변 친구 찾기 기능 (사용자 간 거리 출력)
    




2. **유저들의 정보 목록 및 친구 추가 기능 (CRUD)**
   ![4](https://github.com/dongso03/-Final_Project/assets/154950237/951dea3f-14a7-4a29-9ac1-353c9a67cefb)

    - MVC 패턴 적용
     1. Servlet Class 작성하여 Servlet에서는 제어 로직 처리만을 수행할 수 있는 환경 제공
     2. 게시판 작성폼 및 게시판 출력 등 View 구현
     3. 유저 간 친구 추가 및 친구 목록 등 서비스 로직 구현 / 테이블 관계 정의


### 이슈 사항

1. 지도 검색결과에서 음식점 외 다른 정보를 제외하고자, 검색 키워드를 가공
  구현 : prefix(사용자 주소) + 사용자가 입력한 키워드 + surfix(음식점 키워드) 로 검색
  발생한 이슈 : 값이 상세해 질수록 검색 정보량이 적어짐
  해결방법 : 일정량의 정보를 찾지 못한 경우 prefix와 surfix의 값을 동적으로 넓은 지역으로 확대 조절, 음식점 키워드를 변경하는 로직 추가

2. Package 네이밍 규칙, Servlet 구현시 url 패턴등 조원들과 통일이 되지 않아 코드 작성시 혼란 발생
 해결 방법: Package 네이밍은 Flat Case로 작성, 변수명은 Camel Case로 작성, url 패턴은 페이지 서비스 내용의 이름으로 알아보기 쉽게 작성

3. 프로젝트 시작 전 CRUD 작업에 필요한 코드를 작성할 때, 코드가 길어지고 시간소모가 심해질 것을 고려하여 라이브러리 선택
 해결 방법: MyBatis와 JPA를 비교하고 MyBatis를 선택. JPA가 MyBatis 보다 생산성을 더 높일수 있지만 MyBatis 또한 경량화된 라이브러리이기에 생산성을 높일 수 있다고 판단, 추가로 성능적 문제와 매핑 작업을 직접하여 세밀한 조정이 가능한 점을 고려하여 선택

4. 프로젝트 제작 중 상용구, Boilerplate 코드가 다수 발생함
  해결방법: CORS 설정, Json body 파싱/직렬화 동작, status code별 에러 처리 메소드 등을 util package 구성해서 보관
  느낀점 : AOP(관점 지향적 프로그래밍)의 필요성을 느낌

5. DB연결 설정 할 때 DBCP 라이브러리의 BasicDataSource 사용
  이유 : BasicDataSource 는 connection pool을 구현하고 있고 이를 통해 DB 연결 객체를 효율적으로 재사용하기에 용이함

6. 지도와 연계하여 비동기(fetch) 방식으로 카카오 블로그 검색 API 사용
 발생한 이슈 : 검색API의 문서 수 파라미터 입력값을 기본값으로 사용하여, 필요 이상의 정보가 검색되며, 성능 하락
 해결방법 : API Document를 읽으며 정보량 제한을 위한 설정 파라미터를 탐색하였고, 입력값을 설정하여 페이지 구성에 필요한 만큼만을 검색할 수 있었음
 교훈 : 외부 API의 사용 시, 예제와 함께 문서를 필독하여 요청 시 필수/옵션 파라미터의 구성과 응답 필드 구성 등을 살펴볼 필요를 느낌

7. kakao Map API 내 주소 값 좌표 변환 함수를 사용하여 사용자 간 거리 출력
 발생한 이슈 : 거리 값을 텍스트 형태로만 서비스 제공하여, 편의성 하락
 해결방법 : 지도형태로 주변 사용자들의 위치를 마커로 나타내고, 거리 값으로 정렬된 목록제공 등으로 편의성 향상
-->
># 개요
- 웹에서 사용자의 선호도를 기반으로 하여 다른 사용자와 매칭 및 실시간 채팅이 가능한 프로그램


# 목적
- 1인 가구의 증가 및 잦은 주거 이동으로 인해 동네 친구가 없어 혼자 식사를 하는 경우가 늘어남.
- 단순히 밥을 같이 먹는 것이 아니라 개인의 취향과 선호도를 고려하여 보다 잘 맞는 밥 친구를 찾고자 함


# 학습 목표 및 달성
1. 3계층 구조와 MVC 패턴에 대한 이해
2. Javascript에서 fetch를 사용한 비동기 요청
3. HTTP/FTP/SMTP 프로토콜에 대한 이해
4. CSR/SSR에 대한 이해 및 활용
5. Cookie/Session에 대한 이해 및 활용
6. MyBatis 동작 원리 이해 및 활용


# 주요 사항/기능
### 1. 사용자의 취향과 선호도를 고려하여 추천 사용자와 매칭
  - 매칭시 100점 만점을 기준으로 개인점수(45점), 선호점수(45점), 출석점수(10점)으로 설정
  
    ① 개인 점수(45점)
     - 모임이 끝난후 해당 모임 참가자들은 서로에 대한 별점과 한줄평 기재 가능
     - 다른 사용자들의 평가 시스템을 도입하여 서비스의 타당성 강화
  
    ② 선호 점수(45점)
     - '음식점 찾기' 사용 시 좋아하는 음식 일치 점수를 부여
     - '친구 찾기' 사용 시 취미 일치 점수를 부여
     - 목적에 따라 가중치를 부여하여 총 45점
   
    ③ 출석 점수(10점)
     - 실제 서비스에서 활동하는 사용자들끼리 매칭을 유도하여 서비스 신뢰성 향상
### 2. Kakao Map API 사용해서 근처 음식점 및 회원가입시 입력한 주소 기반의 다른 사용자 위치 확인 가능
### 3. 게시글을 통해 해당 모임 참여자들과 실시간 채팅 가능


# 담당 업무
### 1. 회원가입/탈퇴 기능 구현
  - 회원가입시 입력 확인의 번거로움 해결
    ① 문제: 아이디, 닉네임, 전화번호, 이메일을 각각 입력 완료 후, ‘중복확인’ 버튼을 눌러 중복 검사를 해야하는 번거로움 존재
    
    ② 해결: 사용자 입력시 중복확인 및 유효성 검사 함수가 실행 되게 하여, 텍스트 형태의 결과를 즉각적으로 확인 가능. 이때 과도한 이벤트 처리를 방지하고 시스템 성능 개선을 위해 디바운싱 함수를 사용
    
    ③ 추가 개선 사안: 디바운싱 함수 실행 중 사용자는 프로그램이 멈췄다고 인지할 가능성 존재. 실행 중을 인지할 수 있는 이미지 추가 고려
### 2. 이메일 인증 기능 구현
    ① 문제: 실 사용자가 아닌 가짜 계정 가입으로 인한 서비스 품질 하락 우려
   
    ② 해결: 사용자 확인과 이메일 주소가 실존함을 확인하기 위해 JavaMail API 사용. Gmail이 지원하는 SMTP 프로토콜로 인증번호 전송. 인증번호 일치시 회원가입 가능
   
    ③ 추가 개선 사안: 사용자 확인을 위한 수단으로 소셜 로그인 추가 고려
### 3. 마이페이지 정보 수정 기능 구현
  - ‘수정’ 성공시 해당 DOM요소의 텍스트 내용을 수정 사항으로 변경

### 4. 사용자의 선호도를 기준으로한 게시글과의 매칭 로직 작성

    ① 문제: 초기 설계시 사용자의 선호 항목을 구분자를 사용한 문자열 값으로 하나의 컬럼에 저장. 비정규화된 데이터베이스 설계로 데이터의 중복성 증가, 데이터 검색시 어려움 존재.
   
    ② 해결: 유저 카테고리, 게시판 카테고리, 카테고리 테이블을 만들어 다대다 관계 형성하여 정규화 시도. 보다 유연하게 확장가능하며 중복을 최소화한 DB 구축. 
### 5. 사용자의 요구사항을 고려한 GUI 구상 및 구현

   ① 문제: 네비게이션 바, 푸터, 사이드 바와 같은 공통된 요소를 모든 페이지에 포함시켜 각 페이지의 코드에 중복 발생.
   
   ② 해결: 공통된 요소를 별도의 모듈로 구현하여, include 가능한 JSP 파일로 구성.
   
   ③ 결과: 코드의 재사용성 상승, 유지 보수성 향상 및 코드 가독성 향상
   
- 빠른 개발을 위해 css framework인 BootStrap를 사용한 화면 구현


# 이슈 사항 및 해결
### 1. Git을 통한 협업 중 코드 병합에서 잦은 실수 발생
   
   ① 원인: 브랜치로 작업후 메인에 병합할 때 기존 코드를 덮어써서 수정 사항 소실
   
   ② 해결: 팀원간 논의를 거쳐, 기능 구현 후에는 메신저를 활용해 병합 요청을 관련 작업자에게 전송하는 방식을 도입함.
   
   ③ 이해가 어려운 불필요한 커밋 이력을 생성하지 않도록, 개인 작업 시 stash를 사용하여 작업 코드를 따로 관리. 작업량이 많은 경우 새로운 임시 브랜치를 생성하여 관리하기로 협의
   
### 2. 초기 코드 팀원간 리뷰 후, 리팩토링 수행

   ① util 패키지 생성 및 모듈화로 중복된 코드를 감소. 개발의 편의성 상승. 코드의 통일성 증가
   
   ② CORS 헤더 설정 필터, encoding 필터 적용. 코드 유지보수성 상승 및 개발 생산성을 향상

### 3. 서비스 기획 단계에서 초기에 설정한 방향성을 잃어, 프로젝트 진행에 어려움을 겪음.
   
   ① 해결: 서비스 로직을 기준으로 다시 업무 배정 후, 지속적으로 진행 상황을 파악. 계속해서 로직 구현 시 우선순위에 따라 업무 배정.

### 4. 기능 동작 확인을 위해 View와 연계하여 테스트 진행. 테스트시 많은 시간 소요.
   
   ① 해결: 테스트툴인 Postman을 사용하여 간편하게 각종 HTTP 요청 생성 및 수정으로 원하는 결과 확인 가능