## 1. Introduction

디저트 카페의 평점, 리뷰를 찾아보거나 리뷰할 수 있는 웹 애플리케이션입니다.

<br><br>

## 2. Tech Stack

- Backend : Java 8, Spring Framework 5.3, MyBatis 3.5
- Build tool : Maven
- Template engine : JSP 2.3
- Frontend : JavaScript, HTML, CSS
- RDBMS : MariaDB 10.0
- Git branch strategy : GitLab Flow
  - 인원별로 역할 분담을 하여 각자 구현해야 할 기능이 구분되어 있기 때문에 기능별로 브랜치를 나누는 대신에 인원별로 브랜치를 나누었습니다. 브랜치를 합쳐야 할 경우에는 먼저 테스트할 브랜치로 머지하여 그 안에서 테스트 후 문제가 없다면 최종적으로 마스터 브랜치로 머지하는 식으로 진행하였습니다.
  - 애초에 필요하다고 생각했던 브랜치들이 있으므로 Github Flow는 고려 대상에서 제외했고 해당 프로젝트의 크기에 비해 Git Flow는 너무 방대하다고 판단하였습니다.
- Collaboration tool : Zoom, Notion, Google Workspace
- Web scraping : Python (in Visual Studio Code)
- Deployment : Tomcat 8.5 (on CentOS 7)

<br><br>

## 3. ERD

<img width="480" src="ERD.png">

<br><br>

## 4. Description

### 사용자

- 사용자는 관리자, 회원, 비회원으로 구분됩니다.
- 인증과 인가는 높은 보안성을 가진 세션 기반 인증 방식으로 Spring Security를 사용해 처리했습니다.
- 회원가입을 하려면 이메일 인증이 필요합니다. 회원가입 완료 시에는 가입한 이메일로 웰컴 메일이 발송됩니다.
- 비밀번호 찾기 시 이메일 인증 후 임시 비밀번호가 발급됩니다. 임시 비밀번호는 난수 예측을 방지하기 위해 SecureRandom으로 생성했습니다.
- 메일 발송은 Gmail SMTP Server를 통해 처리됩니다.

### 가게

- Python, 라이브러리들(Pandas, BeautifulSoup, Selenium, Requests)을 이용해 만든 웹 스크래퍼와 공공데이터포털의 오픈API를 활용해 얻은 가게 데이터들을 적절히 가공 후 store 테이블에 추가했습니다.
- 게시물 표시 개수 조정, 여러 옵션에 대한 검색, 페이징을 동시에 처리할 수 있도록 Mybatis 동적 쿼리를 활용했습니다.
- 가게 상세보기 시 가게의 평점과 리뷰를 포함해 가게 정보들을 볼 수 있으며 가게 위치는 Kakao Map API를 통해 표시됩니다. 5점 만점인 별점과 간단한 글로 리뷰를 할 수 있습니다. 평점을 조작하는 것을 막기 위해 한 회원이 한 가게의 리뷰를 한 번만 할 수 있도록 하였습니다.

### 메인 페이지

- 검색창을 통해 찾고싶은 가게를 검색할 수 있습니다.
- 지역별로 특정 지역에 해당하는 가게들을 모아서 볼 수 있습니다.
- 나와 내 주변 가게들의 위치가 Kakao Map API를 통해 표시됩니다.

### 일반 게시판

- 자유게시판, 공지사항이 있습니다.
- 게시글 작성의 편의성을 높이기 위해 Summernote를 활용했습니다.
- 게시물 표시 개수 조정, 여러 옵션에 대한 검색, 페이징을 동시에 처리할 수 있도록 Mybatis 동적 쿼리를 활용했습니다.

### 기타 사항

- 입력 데이터의 유효성 검사를 위해 Bean Validation과 정규 표현식을 활용하였고 필요한 경우 Custom Validator를 만들어 적용하였습니다.
- 예외 처리를 위해 @ExceptionHandler를 사용했습니다.
- Spring Security의 CSRF Filter를 이용해 위조된 페이지에서 받는 요청을 걸러내 실제 페이지에서 전송된 요청만을 처리합니다.
