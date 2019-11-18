<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festa-공지사항</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" 
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" 
	crossorigin="anonymous">
<link href="resources/css/landing-page.min.css" rel="stylesheet">

<link href="resources/css/mdb.min.css" rel="stylesheet">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	font-family:hanna;
	text-align:center;
}
#view{
	margin-top:100px;
}
html, body, header {
	height: 100%;
}
#container{
	width: 70%;
}
#search{
	margin:10px;
}
#list_title:hover{ background-color:lightgray; }
</style>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark scrolling-navbar">
    <div class="container">

      <a class="navbar-brand" href="http://70.12.113.165:8000/festival/main" >
        <strong>Festas</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto">
          <li class="nav-item ">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/main">Home</a>
          </li>
          
           <c:if test="${sessionScope.mid==null}">
          <li class="nav-item active">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/notice?pageNo=1">공지사항</a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/loginmain" >로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/memberForm">회원가입</a>
          </li>
        </c:if>
        
        <c:if test="${sessionScope.mid !=null}">
        <li class="nav-item">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/notice?pageNo=1">공지사항</a>
          </li>
         <li class="nav-item">
	            <a class="nav-link" href="http://70.12.113.165:8000/festival/logout">로그아웃</a>
	          </li>
	       <!-- ㅠㅠ.. -->
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	      <li class="nav-item">
             <a class="nav-link" href="http://70.12.113.165:8000/festival/main" >${sessionScope.mid}님 안녕하세요!</a>
          </li>    
        </ul>
         </c:if>
      </div>
    </div>
  </nav>
  <div id="view">
  <c:if test='${!empty flag }'>
  <div id="search">
<form action="notice" method="get">
	<input type="hidden" name="pageNo" value="1">
	<select id="searchType" name="searchType">
		<option value="title">제목</option>
		<option value="ncontent">내용</option>
		<option value="writer">작성자</option>
	</select>
	<input name="key" id='key' type="text">
	<input type="submit" value="검색" class="btn btn-dark">
</form>
</div>
</c:if>
<c:choose>
<c:when test='${!empty resultlist }'>
<div class="container">
	<table class="table table-stripaed" style="border: 1px solid #dddddd; height: 70%">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="vo" items="${resultlist.list }">
			<tr id="list_title">
				<td>${vo.nid }</td>
				<td onclick="location.href='http://70.12.113.165:8000/festival/notice/ncontent?nid=${vo.nid}'">${vo.title }</td>
				<td>${vo.writer }</td>
				<td>${vo.uploaddate }</td>
				<td>${vo.cnt }</td>
			</tr>
		</c:forEach>
	</table>
	<table class="table" style="border: 1px solid #dddddd">
		<c:if test="${resultlist.hasVs()}">
			<tr>
				<td>
					<c:if test="${resultlist.startPage > 5}">
						<a href="http://70.12.113.165:8000/festival/notice?pageNo=${resultlist.startPage - 5}&action=">[이전]</a>
					</c:if> <c:forEach var="pNo" begin="${resultlist.startPage}" end="${resultlist.endPage}">
						<a href="http://70.12.113.165:8000/festival/notice?pageNo=${pNo}&action=">[${pNo}]</a>
					</c:forEach> <c:if test="${resultlist.endPage < resultlist.totalPages}">
						<a href="http://70.12.113.165:8000/festival/notice?pageNo=${resultlist.startPage + 5}&action=">[다음]</a>
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
	</div>
</c:when>
<c:when test='${!empty listmsg }'>
		<h3>${listmsg }</h3>
</c:when>

<c:when test='${!empty content }'>
<div  class="container">
	<table class="table" style="border: 1px solid #dddddd">
	<tr>
		<tr><td>제목</td>
		<td>${content.title }</td>
		</tr>
		<tr><td>작성자</td><td>${content.writer}</td><td>번호</td><td>${content.nid }</td></tr>
		<tr><td>작성일</td><td>${content.uploaddate}</td><td>조회수</td><td>${content.cnt }</td></tr>
	</table>
	<hr>
	<div>
		${content.ncontent }
	</div>
	<hr>
	<input type="button" value="목록보기" class="btn btn-dark" onclick="history.back(-1); ">
	</div>
</c:when>
</c:choose>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>