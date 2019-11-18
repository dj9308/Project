<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Festas 로그인 성공화면</h2>
<c:if test="${sessionScope.mid != null}">
<h2>${sessionScope.mid}님 안녕하세요!</h2>
<a href="/festival/logout">로그아웃</a> 
<a href="/festival/main">검색 메인 화면</a>
<a href="/festival/mypage">마이 페이지</a>
</c:if>
<c:if test="${sessionScope.mid == null}">
	<a href="/festival/loginmain">로그인</a>
	<a href="/festival/memberForm">회원가입</a>
</c:if>


</body>
</html>