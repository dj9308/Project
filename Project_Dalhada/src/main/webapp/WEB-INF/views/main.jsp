<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>dalhada</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/peak.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->	
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	   crossorigin=""/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	<!-- Header -->
	<header class="header-v2">
		<!-- Header desktop -->
		<div class="container-menu-desktop trans-03">
			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop p-l-45">
					
					<!-- Logo desktop -->		
					<a href="main" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>
					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m h-full">
						<form id="searchForm" class="form-inline flex-c-m h-full p-r-24" action="searchbucket" method="get">
	    					<div class="bor17 of-hidden pos-relative">
								<input class="searchKeyDown stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" 
								name="searchKeyword" placeholder="Search" value="${ keyword }" autocomplete="off">
								<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
  						</form>
						<c:if test="${empty sessionScope.id}">
							<div class="flex-c-m h-full p-r-24">
								<a href="memberform">회원가입</a>
							</div>
							<div class="flex-c-m h-full p-r-24">
								<a href="loginmain">로그인</a>
							</div>	
						</c:if>
						<c:if test="${!empty sessionScope.id}">
							<div class="flex-c-m h-full p-r-24">
								<p class="js-show-modal-create hov-cl1">버킷 +</p>
							</div>
							<div class="flex-c-m h-full p-r-24">
								<a href="mypage">마이페이지</a>
							</div>
							<div class="flex-c-m h-full p-r-24">
								<a href="logout">로그아웃</a>
							</div>
						</c:if>
					</div>
				</nav>
			</div>	
		</div>
		<!-- Header desktop End -->

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="main"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>
		<!-- Header Mobile End -->

		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="main-menu-m">
				<li>
					<form id="searchForm" class="form-inline" action="searchbucket" method="get">
	    					<div class="bor17 of-hidden pos-relative">
								<input class="searchKeyDown stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" 
								name="searchKeyword" placeholder="Search" value="${ keyword }" autocomplete="off">
								<button type="submit" class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04" >
									<i class="zmdi zmdi-search"></i>
								</button>
							</div>
  					</form>
				</li>
				<c:if test="${empty sessionScope.id}">
					<li><a href="memberform">회원가입</a></li>
					<li><a href="loginmain">로그인</a></li>
				</c:if>
				<c:if test="${!empty sessionScope.id}">
					<li><a class="js-show-modal-create hov-cl1">버킷+</a></li>
					<li><a href="memberform">마이페이지</a>	</li>
					<li><a href="loginmain">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
		<!-- Menu Mobile End -->
	
	</header>
	<!-- Header End -->

	<!-- Bucket -->
	<c:forEach var="list" items="${lists}">
	<section class="sec-product bg0 p-tb-10">
		<div class="container">
			<div class="p-b-5">
				<h4 class="ltext-90 cl5 respon1">
					${list.title}
				</h4>
			</div>
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- - -->
					<div class="tab-pane fade show active" id="best-seller" role="tabpanel">
						<!-- Slide2 -->
						<div class="wrap-slick2">
							<div class="slick2">
							<c:forEach var="vo" items="${list.bucketList}">
								<div class="item-slick2 p-l-15 p-r-15">
									<!-- Block2 -->
									<div class="block2">
										<div class="block2-wrap">
											<a class="block2-img flex-c-m p-lr-15 trans-04">
												<img data-id="${vo.selectedbucket_id }"  class="js-show-modal-bucket " src="images/bucket/${vo.image_path }" alt="IMG-PRODUCT">
											</a>
										</div>
										<div class="block2-txt flex-w flex-t p-t-14">
											<div class="block2-txt-child1 flex-col-l ">
												<a data-id="${vo.selectedbucket_id }" class="js-show-modal-bucket stext-104 cl4 hov-cl1 trans-04 p-b-6">
													${vo.title }
												</a>
											</div>
											
											<div class="block2-txt-child2 flex-r p-t-3">
												<a data-id="${vo.selectedbucket_id }" class="heart heart${vo.selectedbucket_id } fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike ${vo.className } tooltip100" data-tooltip="Add to Like">
													<i class="zmdi zmdi-favorite"></i> 
												</a>
												<button class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="가져오기">
			                                    	<i data-id="${vo.bucket_id}" data-value="${vo.selectedbucket_id}" class="js-show-modal-get fa fa-plus-square"></i> 
			                                 	</button> 
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	</c:forEach>
	<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">

	</footer>

	
	<%@ include file="modal_detail.jsp" %>
	<%@ include file="modal_create.jsp" %>
	<%@ include file="modal_get.jsp" %>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--=================================================================================-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.10/js/perfect-scrollbar.jquery.js"></script>
<!--===============================================================================================-->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
   integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
   crossorigin=""></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>