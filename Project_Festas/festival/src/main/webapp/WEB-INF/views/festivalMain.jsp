<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="resources/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="resources/css/style.min.css" rel="stylesheet">
  <style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family: 'Hanna', sans-serif;}

    html,
    body,
    header,
    .carousel {
      height: 100%;
      
    }

    @media (min-width: 800px) and (max-width: 850px) {
      .navbar:not(.top-nav-collapse) {
        background: #1C2331 !important;
      }
    }
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}


#aaa{
	font-size:xx-large;
    margin:3px auto;
    height:50px;
    position:relative;
    color:black;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;    
}
#wrapper{
    width:500px;
    margin:0px auto;
    height:350px;
    position:relative;
    color:#fff;
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;    
}

#slider-wrap{
    width:500px;
    height:350px;
    position:relative;
    overflow:hidden;
}

#slider-wrap ul#slider{
    width:100%;
    height:100%;
    
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:500px;
    height:350px;   
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-family: Neucha, Arial, sans serif;
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
  height: 100%;
}
.btns{
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer; 
    background:rgba(0,0,0,0.1);
    z-index:100;
    
   
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
    -o-transition: all 0.1s ease;
    -ms-transition: all 0.1s ease;
    transition: all 0.1s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3); 
}
#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 30px; 
    right:35px; 
    width:auto;
    position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}

#pagination-wrap{
    min-width:20px;
    margin-top:350px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
    opacity:1;
    box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}

h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 

#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
    transition: all 0.3s cubic-bezier(1,.01,.32,1); 
}


  </style>
  
  
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="resources/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="resources/css/landing-page.min.css" rel="stylesheet">
</head>

<body>

  <!-- Navbar -->
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
  <!-- Navbar -->

  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    <!--Slides-->
    <div class="carousel-inner" role="listbox">

      <!--First slide-->
      <div class="carousel-item active">
        <div class="view">

          <!--Video source-->
          <video class="video-intro" autoplay loop muted>
            <source src="https://mdbootstrap.com/img/video/city.mp4" type="video/mp4">
          </video>

          <!-- Mask & flexbox options-->
          <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

            <!-- Content -->
            <div class="text-center white-text mx-5 wow fadeIn">
              <h1 class="mb-4">
                <strong style="color: white;">Festas 축제 검색 사이트 </strong>
              </h1>


<!-- Masthead -->
    <div class="container">
      <div class="row">
        <form method="get" action="/festival/list">
            <div class="form-row">
              <div class="col-20 col-md-20 mb-55 mb-md-53">
                	<select name="city" class="form-control form-control-lg" >
						<option value="서울특별시">서울특별시</option>
					</select>
			</div>
            <div class="col-20 col-md-20 mb-55 mb-md-53">
              <select name="district" class="form-control form-control-lg" >
					<option value="">전체</option>
						<option value="강남구">강남구</option><option value="강동구">강동구</option>
						<option value="강북구">강북구</option><option value="강서구">강서구</option>
						<option value="관악구">관악구</option><option value="광진구">광진구</option>									
						<option value="구로구">구로구</option><option value="금천구">금천구</option>									
						<option value="노원구">노원구</option><option value="도봉구">도봉구</option>									
						<option value="동대문구">동대문구</option><option value="동작구">동작구</option>	
						<option value="마포구">마포구</option><option value="서대문구">서대문구</option>		
						<option value="서초구">서초구</option><option value="성동구">성동구</option>
						<option value="성북구">성북구</option><option value="송파구">송파구</option>
						<option value="양천구">양천구</option><option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option><option value="은평구">은평구</option>
						<option value="종로구">종로구</option><option value="중구">중구</option>
						<option value="중랑구">중랑구</option>		
				</select>
              </div>
              
           <div class="col-20 col-md-20 mb-20 mb-md-53">
             <select name="month" class="form-control form-control-lg">
						<option value="">전체</option>
						<option value="01">1월</option><option value="02">2월</option>
						<option value="03">3월</option><option value="04">4월</option>
						<option value="05">5월</option><option value="06">6월</option>
						<option value="07">7월</option><option value="08">8월</option>
						<option value="09">9월</option><option value="10">10월</option>
						<option value="11">11월</option><option value="12">12월</option>
				</select>
             </div>
           <div class="col-20 col-md-20 mb-20 mb-md-20">
             <select name="type" class="form-control form-control-lg">
						<option value="">전체</option>
						<option value="문화예술">문화예술</option><option value="주민화합">주민화합</option>
						<option value="전통역사">전통역사</option><option value="지역특산물">지역특산물</option>
						<option value="생태자연">생태자연</option><option value="기타">기타</option>
			</select>
             </div>
               <div class="col-20 col-md-20 mb-55 mb-md-20">
               <button type="submit" class="form-control form-control-lg"
               >검색하기</button>
             </div> 
           </div>
         
<input type="hidden" name="action" value="search">
<input type="hidden" name="pageNo" value="1">
</form>
        </div>
      </div>
    </div>

            </div>
            <!-- Content -->

          </div>
          <!-- Mask & flexbox options-->

        </div>
      </div>
      <!--/First slide-->
	  </div>
    	<!--/.Slides-->

    <!--Controls-->
 <!--    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a> -->
    <!--/.Controls-->

  </div>
  <!--/.Carousel Wrapper-->

  <!--Main layout-->
  <main>

<div class="container">
  <div class="row">
		 <div class="col-md-6" style="text-align: center;">
			<p id="aaa"> 8월 이달의 축제 List</p>
		 </div>
	     <div class="col-md-6" style="text-align: center;">
	     	<p id="aaa"> 관리자 추천 축제</p>
	     </div>
	  <div class="col-md-6">
				<!-- 1 -->
				<div id="wrapper">
					<div id="slider-wrap" >
						<ul id="slider">
						<c:forEach var="vo" items="${img}">
							<li>
							 <img 
								src="http://localhost:8000/festival/resources/images/${vo}/1.jpg"
								onclick="location.href= 'http://localhost:8000/festival/detail?fid=${vo}';">
							</li>
						</c:forEach> 
						</ul>
						
						<!--controls-->
				
						<div class="btns" id="previous">
							<i class="fa fa-arrow-left"></i>
						</div>
						<div class="btns" id="next">
							<i class="fa fa-arrow-right"></i>
						</div>
						<div id="counter"></div>
						<div id="pagination-wrap">
							<ul>
							</ul>
					   </div>
						<!--controls end-->
											
					</div><!-- slider-wrap -->
				</div><!-- 1 end-->
		</div><!--col-md-6 end -->
	<!-- 2 -->		
	<div class="col-md-6">
				<div id="wrapper">
					<div id="slider-wrap" >
						<ul id="slider2">
							<c:forEach var="vo2" items="${img2 }">
							<li>
							<img 
								src="http://localhost:8000/festival/resources/images/${vo2}/1.jpg"
								onclick="location.href= 'http://localhost:8000/festival/detail?fid=${vo2}';">
							</li>
						</c:forEach> 
						</ul>
						
						
					</div><!-- slider-wrap -->
				</div><!-- wrapper end -->
			</div><!--col-md-6 end -->
		</div><!-- row -->
</div><!-- container -->
</main>
  <!--Main layout-->

  <!--Footer-->
<jsp:include page="footer.jsp"></jsp:include>
  <!--/.Footer-->

  <!-- SCRIPTS -->
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
    // Animations initialization
    new WOW().init();

  </script>
</body>

<script>
var pos = 0;
//number of slides
var totalSlides = 5;
//get the slide width
var sliderWidth = $('#slider-wrap').width();


$(document).ready(function(){
  /*****************
   BUILD THE SLIDER
  *****************/
  //set width to be 'x' times the number of slides
  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);

/////////////////////////////////////////
  //next slide    
  $('#next').click(function(){
      slideRight();
  });  
  //previous slide
  $('#previous').click(function(){
      slideLeft();
  });
  
///////////////////////////////////////////// 
  //next slide    
  $('#next2').click(function(){
      slideRight2();
  });
//previous slide
  $('#previous2').click(function(){
      slideLeft2();
  });
  
  
  
  /*************************
   //*> OPTIONAL SETTINGS
  ************************/
  //automatic slider
  var autoSlider = setInterval(slideRight, 3000);
  
  //for each slide 
  $.each($('#slider-wrap ul li'), function() { 

     //create a pagination
     var li = document.createElement('li');
     $('#pagination-wrap ul').append(li);    
  });
  
  //counter
  countSlides();
  
  //pagination
  pagination();
  
  //hide/show controls/btns when hover
  //pause automatic slide when hover
  $('#slider-wrap').hover(
    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
  );
  
  

});//DOCUMENT READY
  


/***********
SLIDE LEFT
************/
function slideLeft(){
  pos--;
  if(pos==-1){ pos = totalSlides-1; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
  
  //*> optional
  countSlides();
  pagination();
}

function slideLeft2(){
	  pos--;
	  if(pos==-1){ pos = totalSlides-1; }
	  $('#slider-wrap ul#slider2').css('left', -(sliderWidth*pos));    
	  
	  //*> optional
	  countSlides2();
	  pagination2();
	}

/************
SLIDE RIGHT
*************/
function slideRight(){
  pos++;
  if(pos==totalSlides){ pos = 0; }
  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
  
  //*> optional 
  countSlides();
  pagination();
}
function slideRight2(){
	  pos++;
	  if(pos==totalSlides){ pos = 0; }
	  $('#slider-wrap ul#slider2').css('left', -(sliderWidth*pos)); 
	  
	  //*> optional 
	  countSlides2();
	  pagination2();
	}


  
/************************
//*> OPTIONAL SETTINGS
************************/
function countSlides(){
  $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
  $('#pagination-wrap ul li').removeClass('active');
  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}
function countSlides2(){
	  $('#counter2').html(pos+1 + ' / ' + totalSlides);
	}

	function pagination2(){
	  $('#pagination-wrap ul li').removeClass('active');
	  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}

</script>
</html>
