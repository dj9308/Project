<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.detailVO, vo.detailReviewVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
	integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
	crossorigin=""></script>
<title>Festas</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="resources/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="resources/css/style.min.css" rel="stylesheet">
  <!-- modal -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" 
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" 
	crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/hanna.css);

*{font-family: 'Hanna', sans-serif;
font-size: medium;
}
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 10px;
	height: 20px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 10px;
	height: 20px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -10px 0;
}

.container1{
margin-top: 120px;
margin-left: 20px;
}

.row>div{
margin-top: 50px;
}
table td{
font-size: 20px;
}
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
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		
	      <li class="nav-item">
             <a class="nav-link" href="http://70.12.113.165:8000/festival/main" >${sessionScope.mid}님 안녕하세요!</a>
          </li>
          <li class="nav-item">
			            <a class="nav-link" href="http://70.12.113.165:8000/festival/MyPage">마이페이지</a>
			      </li>    
        </ul>
         </c:if>
      </div>
    </div>
  </nav>


	<div class="container1">
				<c:if test="${!empty festival}">
							<h1>${festival.name}</h1><br>
							<button onclick="location.href='http://70.12.113.165:8000/festival/list?city=&district=&month=&type=&action=search&pageNo=1'" style="margin-left: 20px;" class="btn btn-dark">뒤로가기</button>
		<div class="row">
		
				<div style="width: 70%;">
					<table style="width: 70%">
						<c:if test="${!empty img}">
							<c:forEach var="vo" items="${img}">
								<tr>
									<img src="http://70.12.113.165:8000/festival/resources/images/${vo.fid}/${vo.image_name}.jpg"
										width="25%" height="200">
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
				<div style="margin-top: 110px;" class="info col-md-7">
				
				<fieldset>
			<legend>축제 정보</legend>
			<table style="width: 100%;" id="hi">
				<tr>
					<td width=10%>
					장소 : </td>
					<td>
					 ${festival.place} 
					 </td>
					</tr>
					<tr>
					 <td>축제 종류</td>
					 <td>${festival.type} </td>
					</tr>
					<tr>
					 <td>개최일</td>
					 <td>${festival.opendate} </td>
					</tr>
					<tr>
					 <td>폐회일</td>
					 <td>${festival.closedate} </td>
					</tr>
					<tr>
					 <td>주최</td>
					 <td>${festival.hostinfo} </td>
					</tr>
					<tr>
					 <td>축제 내용</td>
					 <td>${festival.fcontent} </td>
					</tr>
			</table>
		</fieldset>
	</c:if>
				</div>
				<div class="map col-md-5">
					<c:if test="${!empty map}">
		<br>
		<div id="mapid" style="width: 500px; height: 400px; border: 0, auto;"></div>

		<script type="text/javascript"
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
		<script>
var mymap;	//
	$(document).ready(function(){

	if(mymap)
		mymap.remove();

	mymap = L.map('mapid').setView([${map.lat}, ${map.lng}], 14);

	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
		id: 'mapbox.streets'
	}).addTo(mymap);
	L.marker([${map.lat}, ${map.lng}]).addTo(mymap)
		.bindPopup("${map.name}").openPopup();   
	
});
</script>
	</c:if>
				</div>
				<div class="reviewForm col-md-7">
				
	<br>
	<h2>평점 및 리뷰</h2>
	<br>

	<c:if test="${!empty exist}">
		<c:if test="${!empty festival}">
			<button
				onclick="location.href='http://70.12.113.165:8000/festival/detail?action=insert&fid=${festival.fid}'" class="btn btn-dark">찜목록에
				넣기</button>
			<br><br>

평점 :<div class="starRev">
				<span class="starR1 on" id="1">1</span> <span class="starR2 on"
					id="2">2</span> <span class="starR1 on" id="3">3</span> <span
					class="starR2 on" id="4">4</span> <span class="starR1 on" id="5">5</span>
				<span class="starR2 on" id="6">6</span> <span class="starR1 on"
					id="7">7</span> <span class="starR2 on" id="8">8</span> <span
					class="starR1 on" id="9">9</span> <span class="starR2 on" id="10">10</span>
			</div>
			<br><br>
			<form action="/festival/detail" method="post">
				<input type="hidden" name="action" value="insReview"> <input
					type="hidden" name="fid" value="${festival.fid}"> <input
					id="grade" type="hidden" name="grade" value="10">
				<textarea rows="10" cols="35" name="rcontent"
					placeholder="리뷰를 작성해주세요"></textarea><br>
				<input type="submit" value="리뷰 작성하기" class="btn btn-dark">
			</form>
		</c:if>
	</c:if>
	<c:if test="${empty exist}">
		<h2>리뷰를 작성하려면 로그인이 필요합니다.</h2>
		<button
			onclick="location.href='http://70.12.113.165:8000/festival/loginmain'" class="btn btn-dark">로그인하기</button>
	</c:if>
				</div>
				<div class="reportForm col-md-5">

				</div>
		</div>
		<div class="row">
		<div class="review col-md-7">
		<c:if test="${!empty review}">
		<c:forEach var="vo" items="${review}">
			<div>${vo.mid}</div>
			<div>${vo.writedate}</div>
			<div class="starRev1">
				<span class="starR1" id="1">1</span> <span class="starR2"
					id="2">2</span> <span class="starR1" id="3">3</span> <span
					class="starR2" id="4">4</span> <span class="starR1" id="5">5</span>
				<span class="starR2" id="6">6</span> <span class="starR1"
					id="7">7</span> <span class="starR2" id="8">8</span> <span
					class="starR1" id="9">9</span> <span class="starR2" id="10">10</span>
			</div>
			<div class="chgrade">  ${vo.grade}</div><br>
			<div>${vo.rcontent}</div><br>
			<div>
			<c:if test="${!empty exist}">
						<button class="btn btn-dark hello" data-target="#report" value="${vo.review_id}" data-toggle="modal" >신고하기</button><br/>
  
					</c:if>
			</div>
			<br>
			<br>
			<br>
		</c:forEach>											
<div class="modal fade" id="report" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
      <!-- header title -->
        <h4 class="modal-title">신고하기</h4>
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
      </div>
      <!-- body -->
      <div class="modal-body">
			<textarea id="reason" rows="10" cols="35" placeholder="신고 내용을 입력해주세요."></textarea>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
      <input type="submit" value="신고하기"  class="btn btn-sucess" id="modalSubmit"> 
			<button type="button" class="btn btn-defalut" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>	
  </div>
  
	</c:if>
			</div>
		</div>
	</div>
	
	<c:if test="${!empty msg}">
		<script>
		alert("${msg}");
	</script>
	</c:if>
<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript">
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $('#grade').attr('value',$(this).attr('id'));
	});
	
$( document ).ready(function() {
for(var i=0;i<$('.chgrade').length;i++){
	var num = $('.chgrade:eq('+i+')').text()-1;
	  $('.starRev1:eq('+i+')>span:eq('+num+')').addClass('on').prevAll('span').addClass('on');
}	

});


$(document).ready(function(){
	
	$('#modalSubmit').click(function(e){
		
		$.ajax({
			url: "detail/report",
			type:'post',
			data:{
				"review_id":$('.hello').val(),
				"mid": '${sessionScope.mid}',
				"reason": $("#reason").val()
			},
			sucess : function(){
				$('#report').modal('toggle');
			},
			complete : function(){
				location.reload();
			},
			error:function(){
				
			}
		});
		return false;
	});
	
});

</script>

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
</html>