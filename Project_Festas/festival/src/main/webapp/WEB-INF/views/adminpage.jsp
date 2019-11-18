<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>festa-관리자 페이지</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link href="resources/css/mdb.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" 
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" 
	crossorigin="anonymous">
	
<link href="resources/css/mdb.min.css" rel="stylesheet">
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	font-family:hanna;
}
#content{
	text-align:center;
}
html, body, header{
	height: 100%;
}
textarea{
	width:300px;
	height:150px;
}
content.table{ 
	width:70%; 
	border: 1px solid #dddddd; 
	height: 70%;
	margin:3px;
}
.my-custom-scrollbar {
position: relative;
overflow: auto;
height:70%;
}
#list_title:hover{ background-color:lightgray; }
#view{ margin-top:100px; }
#search{ margin:10px; }
</style>
</head>
<body>
  <!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark scrolling-navbar">
    <div class="container">

      <a class="navbar-brand" href="http://localhost:8000/festival/main" >
        <strong>Festas</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto">
          <li class="nav-item ">
            <a class="nav-link" href="http://localhost:8000/festival/main">Home
            </a>
          </li>
          
           <c:if test="${sessionScope.mid==null}">
          <li class="nav-item">
            <a class="nav-link" href="http://localhost:8000/festival/notice?pageNo=1">공지사항</a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="http://localhost:8000/festival/loginmain" >로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="http://localhost:8000/festival/memberForm">회원가입</a>
          </li>
        </c:if>
        
        <c:if test="${sessionScope.mid !=null}">
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8000/festival/notice?pageNo=1">공지사항</a>
          </li>
         <li class="nav-item">
	            <a class="nav-link" href="http://localhost:8000/festival/logout">로그아웃</a>
	          </li>
	       <!-- ㅠㅠ.. -->
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	      <li class="nav-item">
             <a class="nav-link" href="http://localhost:8000/festival/main" >${sessionScope.mid}님 안녕하세요!</a>
          </li>    
        </ul>
         </c:if>
      </div>
    </div>
  </nav>
<div id="view" class="container">
    <div class="row">
        <div class="col-sm-3">
        <fieldset>
        <legend>마이페이지</legend>
        	<table>
				<tr onclick="location.href='http://localhost:8000/festival/adminpage/notice?action=list'">
				<td>공지사항 관리</td>
				</tr>
				<tr onclick="location.href='http://localhost:8000/festival/adminpage/report'">
				<td>리뷰 신고함</td>
				</tr>
			</table>
			</fieldset>
        </div>
        <div class="col-sm-9" id="content">			
			<c:if test="${!empty insertbutton }">
				<button type="button" class="btn btn-dark" data-toggle="modal"
				    		data-target="#noticeModal">공지사항 작성</button>
				 <div id="search">
				    <form action="/festival/adminpage/notice" method="get">	
				    	<input type="hidden" name="action" value="search">
						<select name="searchType">
							<option value="title" >제목</option>
							<option value="ncontent">내용</option>
							<option value="writer">작성자</option>
						</select> <input name="key" id='key' type="text"> 
						<input type="submit" value="검색" class="btn btn-dark">
					</form>
					</div>
			</c:if>
			
			<c:when test="${!empty noticelist }">
					<div class="table-wrapper-scroll-y my-custom-scrollbar">
					<table class="table table-stripaed">
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
						<c:forEach var="vo" items="${noticelist }">
							<tr id="list_title">
								<td>${vo.nid }</td>
								<td onclick="location.href='http://localhost:8000/festival/adminpage/ncontent?nid=${vo.nid}'">${vo.title }</td>
								<td>${vo.writer }</td>
								<td>${vo.uploaddate }</td>
								<td>${vo.cnt }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				</c:when>
			
			
        	<c:choose>
				<c:when test="${!empty reportlist }">
				<form action="report/del">
					<input type="submit" name="action" value="선택된 신고 삭제" class="btn btn-dark">
					<input type="submit" name="action" value="선택된 리뷰 삭제" class="btn btn-dark">
					<input type="hidden" name="check" value="0">
					<table class="table table-stripaed" >
						<tr>
							<td><input type="checkbox" name="check_all"></td>
							<td>신고사유</td>
							<td>신고된 리뷰</td>
						</tr>
						<c:forEach var="vo" items="${reportlist}">
							<tr>
								<td><input type="checkbox" name="check" value="${vo.report_id} ${vo.review_id}">
								</td>
								<td>신고자 : ${vo.report_mid}<br> 사유 : <br>
									${vo.reason}
								</td>
								<td>아이디: ${vo.review_mid}<br> 축제이름: ${vo.name}<br>
									작성 날짜: ${vo.writedate}<br> 내용: ${vo.rcontent}<br>
								</td>
							</tr>
						</c:forEach>
					</table>
					</form>
				</c:when>

				<c:when test='${!empty content }'>
				<form action="/festival/adminpage/managenotice" method="post">
				<input type="hidden" name="nid" value='${content.nid }'>		
					<table class="table table-stripaed">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value='${content.title }'></td>
							<td></td><td></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${content.writer}</td>
							<td>번호</td>
							<td>${content.nid }</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${content.uploaddate}</td>
							<td>조회수</td>
							<td>${content.cnt }</td>
						</tr>
					</table>					
					<hr>
					<div>
					<textarea name="ncontent" style="width:70%;" >${content.ncontent }</textarea></div>
					<hr>
					<input type="submit" name="action" class="btn btn-dark" value="수정">
					<input type="submit" name="action" class="btn btn-dark" value="삭제">
					</form>		
					<div id="search">
					<form action="/festival/adminpage/notice" >
					<input type="hidden" name="action" value="back">
						<input type="submit" value="목록보기" class="btn btn-dark">
					</form>
					</div>
				</c:when>
				<c:when test='${!empty listmsg }'>
					<h3>${listmsg }</h3>
				</c:when>
			</c:choose>
        </div>
    </div>
</div>

<div class="modal fade" id="noticeModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">			
				<h4 class="modal-title">공지사항 작성</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>제목</td>
						<td><input class="form-control" id="title" type="text" required></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" id="ncontent" rows="10" required maxlength="200"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-sucess">작성</button>
				<button type="button" class="btn btn-defalut" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
	<script>
	$(document).ready(function(){
		$('input[name=check_all]').on('change', function(){
			  $('input[name=check]').prop('checked', this.checked);
		});
		
		$('#modalSubmit').click(function(){
			$.ajax({
				url: "createnotice",
				type:'post',
				data:{
					"writer":"관리자",
					"title": $("#title").val(),
					"ncontent": $("#ncontent").val()
				},
				sucess : function(){
					$('#noticeModal').modal('toggle');
				},
				complete : function(){
					location.reload();
				},
				error:function(){
					
				}
			});
		});
		
	});
	function displayDiv(type) {
			if (type == 1) {
				document.getElementById("write").style.display = "block";
			}else if(type==2)
				document.getElementById("write").style.display = "none";				
		}
	</script>

</body>
</html>