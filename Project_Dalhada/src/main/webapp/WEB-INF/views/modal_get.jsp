<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- get Modal -->
	<div class="wrap-modal-bucket js-modal-get p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-get"></div>

		<div class="container">			
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-get">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
					<div class="row p-all-10">
						<div class="col-md-6">
							<input type="text" id="get_title" class="form-control mb-4" maxlength="30">
				            <div class="gallery-lb">
								<div class="pos-relative txt-center">
									<img class="modal_image" id="get_image" alt="IMG-PRODUCT">
									<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
										<i class="fa fa-expand"></i>
									</a>
								</div>
							</div>
				            <textarea id="get_content" class="md-textarea form-control p-t-5 m-t-10" rows="2"></textarea>		
							<div class="keep_login_container">
		                    	<div class="stext-102 cl3 p-t-23">태그</div>
		                    	<div id="get-tag-dom" class="flex-w m-r--5"></div>
		                	</div>
					    </div>
					    <div class="col-md-6">
			                <div class="stext-102 cl3 p-t-40 mb-1">그룹</div>
					        <select id="get-groups-dom" class="browser-default custom-select mb-3"></select>
			            	<div class="stext-102 cl3 p-t-10">d-Day</div>
			                <input id="get-d-day" class="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			                <div class="stext-102 cl3 p-t-23">위치</div>
			                <input id="get-location" type="text" class="form-control wid-50pc m-b-10 dis-inline" placeholder="장소를 입력해보세요.">
			            	<button id="get-location-select" class="button-modal-map cl0 bg10 dis-lnline">선택</button>
			            	<div id="mapid_get" class="hei-300px wid-90pc"></div>
			                <div id="get-warntest" class="cl14"></div>
							<div class="txt-center">
								<input type="hidden" id="get_bucket_id"/>
	       						<button id="get-submit" class="button-modal cl0 bg10">가져오기</button>
							    <button class="js-hide-modal-get button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
						    </div>
			            </div>
					</div>
			</div>
		</div>				
	</div>