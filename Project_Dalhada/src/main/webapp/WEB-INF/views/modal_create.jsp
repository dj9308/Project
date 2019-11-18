<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<!-- Create Modal -->
	<div class="wrap-modal-bucket js-modal-create p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-create"></div>

		<div class="container">			
			<div class="bg0 p-t-20 p-b-20 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-create">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
				<div class="row p-all-10">
					<div class="col-md-6">
						<input type="text" id="create-title" class="form-control mb-4" placeholder="제목" maxlength="30">
			            <div class="image-field">
			              <div class="mb-4 txt-center"><!--image field-->
			                <img id="image" class="createimage " src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
			                  alt="example placeholder">
			              </div>
			              <div class="d-flex justify-content-center m-b-5"><!--upload button-->
			                  <input type="file" id="input_image" class="file-btn" onchange="readbucketURL(this);" accept=".png, .jpg, .jpeg">
			              </div>
			            </div>
			            <textarea id="create_content" class="md-textarea form-control p-t-10" rows="2" placeholder="내용"></textarea>		
						<div class="keep_login_container">
		                    <div class="stext-102 cl3 p-t-23">태그</div>
		                   	<div id="create-tag-dom" class="flex-w m-r--5"></div>
		               	</div>
				    </div>
				    <div class="col-md-6">
			            <div class="stext-102 cl3 p-t-40 mb-1">그룹</div>
				        <select id="create-groups-dom" class="browser-default custom-select"></select>
			           	<div class="stext-102 cl3 p-t-10">d-Day</div>
			            <input id="create-d-day" class="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			            <div class="stext-102 cl3 p-t-10">위치</div>
			            <input id="create-location" type="text" class="form-control wid-50pc m-b-10 dis-inline" placeholder="장소를 입력해보세요.">
			            <button id="create-location-select" class="button-modal-map cl0 bg10 dis-lnline">선택</button>
			            <div id="mapid_create" class="hei-300px wid-90pc"></div>
			            <div class="create-warntest cl14"></div>
						<div class="txt-center">
						<input type="hidden" id="latlng"/>
	       				<button id="create-submit" class="button-modal cl0 bg10">생성</button>
						<button class="js-hide-modal-create button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
						</div>
			        </div>
				</div>
			</div>
		</div>				
	</div>
	
	<script>
	    function readbucketURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#image').attr('src', e.target.result);
	            };
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	</script>