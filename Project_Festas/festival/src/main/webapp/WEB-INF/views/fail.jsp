<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인 화면</title>
</head>
<body>
<h2>로그인 실패</h2>
다시 입력하세요.
<%Object msg = request.getAttribute("mid"); %>
<%Object msg2 = request.getAttribute("pw"); %>

msg : ${msg}
msg2 :${msg2}
</body>
</html>