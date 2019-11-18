<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="vo.MyPageVO, vo.MyPageReviewVO, vo.MyPageBasketVO, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Festas - 마이페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

  <style type="text/css">
  @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
  *{font-family: 'Hanna', sans-serif;
  font-size: large;}

.container1{
margin-top: 120px;
margin-left: 100px;
}

  </style>
    

</head>
<body>
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Navbar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="http://70.12.113.165:8000/festival/main">
        <strong>Festas</strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>


        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/main">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/notice?pageNo=1">Notice</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://70.12.113.165:8000/festival/logout">Logout</a>
          </li>
        </ul>
      </div>
  </nav>
  
<!-- 기본 메뉴 -->
<div id="class">

</div>
<div class="container1">
    <div class="row">
        <div class="col-md-3">
        		<fieldset>
			<legend>마이페이지</legend>
			<table>
				<tr>
					<td id="updateInfo">정보수정</td>
				</tr>
				
				<tr>
					<td id="showBasket">찜 목록</td>
				</tr>
				<tr>
					<td id="showReview">리뷰확인</td>
				</tr>
			</table>
		</fieldset>
        </div>
        <div class="col-md-offset-3 col-md-6">
        		<c:if test='${!empty info }'>
		<c:if test='${!empty pwmsg }'>
		
		<!-- 정보수정시 비밀번호 재확인(비밀번호 재확인 오류시) -->
<form action="/festival/MyPage" method="post" id="confirm1">
<a> 비밀번호 재확인</a><br>
<div>아이디 : ${info.mid}</div>
<input type="password" name="pw_1" id="pw_1">
<input type="submit" id="submit" value="확인">
<div id="alert" style="color: red;">${pwmsg}</div>
</form>
</c:if>
<c:if test='${!empty enterMsg }'>
<div id="up">
<fieldset><form action="/festival/MyPage" method="post">
<input type="hidden" name="action" value="updatepw">
			<legend>비밀번호 수정</legend>
			<table>
			<tr>
					<td>아이디</td>
					<td>${info.mid}</td>
				</tr>
				<tr>
					<td>기존 비밀번호 입력<br>새 비밀번호 입력<br>새 비밀번호 확인
					</td>
					<td><input type="password" id="oldpw" name="oldpw"><br>
					<input type="password" id="pw1" name="pw1"><br>
						<input type="password" id="pw2" name="pw2"></td>
				</tr>
			</table>
			<input type="submit" value="수정">
			</form>
		</fieldset>
		
		<fieldset><form action="/festival/MyPage" method="post">
		<input type="hidden" name="action" value="updatepm">
		<br><br>
		<table>
			<tr>
					<td>휴대전화</td>
					<td><input type="tel" id="phone" name="phone"
					value="${info.phone}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="eamil" name="email"
		value="${info.email}"></td>
				</tr>
			</table>
				<input type="submit" value="수정" class="btn btn-dark">
			</form>
			</table>
		</fieldset>
		</div>
		</c:if>
		
		<c:if test='${!empty msg }'>

	<script>
		alert("${msg}");
	</script>

		</c:if>

<!-- 처음 정보수정 누를시 뜨는 비밀번호 재확인 창 -->
		<form action="/festival/MyPage" style="display: none;" method="post" id="confirm">
<a> 비밀번호 재확인</a><br>
<div>아이디 : ${info.mid}</div>
<input type="password" name="pw_1" id="pw_1">
<input type="submit" id="submit" value="확인"  class="btn btn-dark">
</form>
</c:if>

		
				<!-- 찜 목록 -->
<section id="basket" style="display: none; ">
			<c:if test="${!empty basket}">

			<legend>찜 목록</legend>
			<c:forEach var="vo" items="${basket}">

			<table>
				<tr>
					<td width="30%"><img src="http://70.12.113.165:8000/festival/resources/images/${vo.fid}/1.jpg" width="150"
					 onclick="location.href='http://70.12.113.165:8000/festival/detail/?fid=${vo.fid}'"
					></td>
					<td width="40%"> 축제 이름 : ${vo.name}<br>
					축제 장소 : ${vo.place}<br>
					시작 날짜 : ${vo.opendate}<br>
					</td>
					<td width="30%"><button onclick="location.href='http://70.12.113.165:8000/festival/MyPage?action=basDelete&fid=${vo.fid}'" 
					style="width: 80; height: 80;"  class="btn btn-dark">삭제하기</button></td>
				</tr>
			</table>
						</c:forEach>
			</c:if>
			<c:if test="${empty basket}">
			<h2>찜목록이 없습니다.</h2>
			</c:if>

		</section>
		<!-- 리뷰확인 -->
		<section id="myReview" style="display: none;">
			<c:if test="${!empty list}">
							
	<form action="/festival/MyPage" method="get">
	<input type="hidden" name="action" value="revDelete">
		<table  style="width: 800px; text-align: center;">
			<tr>
				<td width="25%">축제명</td>
				<td width="50%">내용</td>
				<td width="15%">작성일</td>
				<td width="5%">평점</td>
				<td width="5%">삭제</td>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr>
				<td onclick="location.href='http://70.12.113.165:8000/festival/detail?fid=${vo.fid}'">${vo.name}</td>
				<td>${vo.rcontent}</td>
				<td>${vo.writedate}</td>
				<td>${vo.grade}</td>
				<td><input type="checkbox" name="check" value="${vo.review_id}"></td>
			</tr>
						</c:forEach>
			<tr>
			<td><input type="submit" value="삭제하기"  class="btn btn-dark"></td>
			</tr>
						
						</table>

		</form>
		</c:if>	
							<c:if test="${empty list}">
<h2>작성한 리뷰가 없습니다</h2>
			</c:if>
		</section>
        
        </div>
    </div>
</div>






 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">

$('#updateInfo').click(function() {
	$('#confirm').css('display','block');
	$('#myReview').css('display','none');
	$('#confirm1').css('display','none');
	$('#up').css('display','none');
	$('#basket').css('display','none');
})

$('#showReview').click(function() {
	$('#confirm').css('display','none');
	$('#confirm1').css('display','none');
	$('#myReview').css('display','block');
	$('#up').css('display','none');
	$('#basket').css('display','none');
})

$('#showBasket').click(function() {
	$('#confirm').css('display','none');
	$('#confirm1').css('display','none');
	$('#myReview').css('display','none');
	$('#up').css('display','none');
	$('#basket').css('display','block');
})

</script>
 <!-- JQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="resources/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="resources/js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
    new WOW().init();</script>
    </body>
</html>