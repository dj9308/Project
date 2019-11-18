<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.10/css/perfect-scrollbar.css">
	
	<!-- Detail Modal -->
	<div class="wrap-modal-bucket js-modal-bucket p-t-60 p-b-20">
		<div class="overlay-modal js-hide-modal-bucket"></div>

		<div class="container">
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-bucket">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div id="left" class="col-md-6">
						<div class="p-l-25 p-r-30 p-lr-0-lg ">
							<div class="wrap-slick3 flex-sb flex-w">
								<h4 id="bucket_title"class="ltext-107 cl2 p-b-14 wid-80pc"></h4>
								<div id="get_member_id" class="stext-108 cl3 m-tb-3"></div>
								<div class="gallery-lb wid_full">
									<div class="pos-relative txt-center ">
										<img class="modal_image" id="detail_image" alt="IMG-PRODUCT">
										<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								<div id="by_member_id" class="stext-108 cl3"></div>
							</div>
							<div class="mtext-104 cl3 m-t-10 m-b-15 wid-95pc detail_content">
								<span id="bucket_content"></span>
							</div>
							<div class="flex-m p-r-10 m-r-11 cl3">
								<a class="modal_heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="Add to Like">
									<i class="zmdi zmdi-favorite"></i>
								</a>
								<p id="likecnt" class="cl6 stext-107" style="width: 40px"></p>
								<button class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="가져오기">
			                    	<i class="js-show-modal-get modal_get_btn fa fa-plus-square"></i> 
			                    </button> 					
							</div>
						</div>			
					</div>
					
					<div id="right" class="col-md-6">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<div class="stext-102 cl3 p-t-40">태그</div>
							<div id="detail_tags" class="flex-w p-t-4 m-r--5"></div>
			                <div class="stext-102 cl3 p-t-15">위치</div>
			                <div id="detail_address" class="mtext-110 cl3 p-t-10 p-b-10"></div>
						    <div id="mapid_detail" class="hei-350px wid-90pc"></div>
						</div>
							<!--  -->
						<div class="flex-w flex-m p-t-40 respon7 ">
							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
							</a>
							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>
							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">						
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
