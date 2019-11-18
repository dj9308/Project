<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container">

      <!-- Brand -->
      <a class="navbar-brand" href="/festival/main">
        <strong>Festas</strong>
      </a>

      <!-- Collapse -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Links -->
      <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/festival/main">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/festival/notice?pageNo=1">공지사항</a>
          </li>
          <c:if test="${sessionScope.mid == null}">
	           <li class="nav-item">
	            <a class="nav-link" href="/festival/loginmain" >로그인</a>
	          </li>
	           <li class="nav-item">
            	<a class="nav-link" href="/festival/memberForm">회원가입</a>
          		</li>
           </c:if>	
          <c:if test="${sessionScope.mid !=null}">
	          <li class="nav-item">
	            <a class="nav-link" href="/festival/logout">로그아웃</a>
	          </li>
          </c:if>		
        </ul>
        <!-- ㅠㅠ.. -->
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
       
       <!-- Right -->
		<c:if test="${sessionScope.mid != null}">
			<c:if test="${sessionScope.mid =='admin'}">
				<ul class="navbar-nav mr-auto">	
					 <li class="nav-item active">
			            <a class="nav-link" href="/festival/main" >${sessionScope.mid}님 안녕하세요!</a>
			          </li>
				
					 <li class="nav-item">
			            <a class="nav-link" href="/festival/adminpage" >관리자 페이지</a>
			          </li>
			    </ul>
		</c:if>
		<c:if test="${sessionScope.mid !='admin'}">
		
			<ul class="navbar-nav mr-auto">	
				<li class="nav-item active">
		            <a class="nav-link" href="/festival/main">${sessionScope.mid}님 안녕하세요!</a>
		          </li>
		          <li class="nav-item">
			            <a class="nav-link" href="/festival/MyPage">마이페이지</a>
			      </li>
	        </ul>
		<ul class="navbar-nav nav-flex-icons">
          <li class="nav-item">
            <a href="https://github.com/mdbootstrap/bootstrap-material-design" class="nav-link border border-light rounded"
              target="_blank">
              <i class="fab fa-github mr-2"></i>Festas가즈아
            </a>
          </li>
        </ul>	
		</c:if>		
</c:if>


<output></output>            
        <c:if test="${sessionScope.mid == null}">
        <ul class="navbar-nav nav-flex-icons">
          <li class="nav-item">
            <a href="https://github.com/mdbootstrap/bootstrap-material-design" class="nav-link border border-light rounded"
              target="_blank">
              <i class="fab fa-github mr-2"></i>Festas가즈아
            </a>
          </li>
        </ul>
</c:if>
      </div>

    </div>
  </nav>
</body>
</html>