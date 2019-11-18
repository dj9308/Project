
(function ($) {
    "use strict";

    /*[ Load page ]
    ===========================================================*/
    $(".animsition").animsition({
        inClass: 'fade-in',
        outClass: 'fade-out',
        inDuration: 1500,
        outDuration: 800,
        linkElement: '.animsition-link',
        loading: true,
        loadingParentElement: 'html',
        loadingClass: 'animsition-loading-1',
        loadingInner: '<div class="loader05"></div>',
        timeout: false,
        timeoutCountdown: 5000,
        onLoadEvent: true,
        browser: [ 'animation-duration', '-webkit-animation-duration'],
        overlay : false,
        overlayClass : 'animsition-overlay-slide',
        overlayParentElement : 'html',
        transition: function(url){ window.location.href = url; }
    });
    
    /*[ Back to top ]
    ===========================================================*/
    var windowH = $(window).height()/2;

    $(window).on('scroll',function(){
        if ($(this).scrollTop() > windowH) {
            $("#myBtn").css('display','flex');
        } else {
            $("#myBtn").css('display','none');
        }
    });

    $('#myBtn').on("click", function(){
        $('html, body').animate({scrollTop: 0}, 300);
    });


    /*==================================================================
    [ Fixed Header ]*/
    var headerDesktop = $('.container-menu-desktop');
    var wrapMenu = $('.wrap-menu-desktop');

    if($('.top-bar').length > 0) {
        var posWrapHeader = $('.top-bar').height();
    }
    else {
        var posWrapHeader = 0;
    }
    

    if($(window).scrollTop() > posWrapHeader) {
        $(headerDesktop).addClass('fix-menu-desktop');
        $(wrapMenu).css('top',0); 
    }  
    else {
        $(headerDesktop).removeClass('fix-menu-desktop');
        $(wrapMenu).css('top',posWrapHeader - $(this).scrollTop()); 
    }

    $(window).on('scroll',function(){
        if($(this).scrollTop() > posWrapHeader) {
            $(headerDesktop).addClass('fix-menu-desktop');
            $(wrapMenu).css('top',0); 
        }  
        else {
            $(headerDesktop).removeClass('fix-menu-desktop');
            $(wrapMenu).css('top',posWrapHeader - $(this).scrollTop()); 
        } 
    });


    /*==================================================================
    [ Menu mobile ]*/
    $('.btn-show-menu-mobile').on('click', function(){
        $(this).toggleClass('is-active');
        $('.menu-mobile').slideToggle();
    });

    var arrowMainMenu = $('.arrow-main-menu-m');

    for(var i=0; i<arrowMainMenu.length; i++){
        $(arrowMainMenu[i]).on('click', function(){
            $(this).parent().find('.sub-menu-m').slideToggle();
            $(this).toggleClass('turn-arrow-main-menu-m');
        })
    }

    $(window).resize(function(){
        if($(window).width() >= 992){
            if($('.menu-mobile').css('display') == 'block') {
                $('.menu-mobile').css('display','none');
                $('.btn-show-menu-mobile').toggleClass('is-active');
            }

            $('.sub-menu-m').each(function(){
                if($(this).css('display') == 'block') { 
                    $(this).css('display','none');
                    $(arrowMainMenu).removeClass('turn-arrow-main-menu-m');
                }
            });
                
        }
    });     

    /*==================================================================
    [ Isotope ]*/
    var $topeContainer = $('.isotope-grid');
    var $filter = $('.filter-tope-group');

    // filter items on button click
    $filter.each(function () {
        $filter.on('click', 'button', function () {
            var filterValue = $(this).attr('data-filter');
            $topeContainer.isotope({filter: filterValue});
        });
        
    });

    // init Isotope
    $(window).on('load', function () {
        var $grid = $topeContainer.each(function () {
            $(this).isotope({
                itemSelector: '.isotope-item',
                layoutMode: 'fitRows',
                percentPosition: true,
                animationEngine : 'best-available',
                masonry: {
                    columnWidth: '.isotope-item'
                }
            });
        });
    });

    var isotopeButton = $('.filter-tope-group button');

    $(isotopeButton).each(function(){
        $(this).on('click', function(){
            for(var i=0; i<isotopeButton.length; i++) {
                $(isotopeButton[i]).removeClass('how-active1');
            }

            $(this).addClass('how-active1');
        });
    });

    /*==================================================================
    [ +/- heart ]*/
    $('body').each(function(){
		$('body').on('click','.heart',function(e){
			e.preventDefault();
			var action;
			var id = $(this).attr("data-id");
			if($(this).hasClass('js-addedlike')){
				$('.heart'+id).each(function(){$(this).removeClass('js-addedlike')});
				action = "delete";
			}else{
				$('.heart'+id).each(function(){$(this).addClass('js-addedlike')});
				action = "insert";
			}
			$.ajax({
				url: "bucket/like",
                type: "POST",
                data: {
                    selectedbucket_id : $(this).attr('data-id'),
                    action : action
                },
                success: function (data) {
                	if(data==-1)
                		window.location.href = "loginmain";
                }
			})
		});
	}); 
    
    /*==================================================================
    [ Show detail modal ]*/
    var map_detail;
   $('body').on('click','.js-show-modal-bucket',function(e){
        e.preventDefault();
        $.ajax({
			url: "bucket/modaldetail",
            type: "POST",
            data: {"selectedbucket_id": $(this).attr('data-id')},
            success: function (data) {
            	$('#bucket_title').html(data.title);
            	$('#get_member_id').html("<a>"+data.get_member_id+"</a>"+"'s");
            	$('#by_member_id').html("by. "+"<a>"+data.by_member_id+"</a>");
            	$('#detail_image').attr("src", "images/bucket/"+data.bucketImage_path);
            	$('#modal_image_expand').attr("href", "images/bucket/"+data.bucketImage_path);
            	$('#bucket_content').text(data.content);
            	$('.detail_content').perfectScrollbar({theme: 'mytheme'});
            	$('#detail_address').html(data.address);
            	var tags = data.tags;
            	var tagdom = $('#detail_tags');
            	tagdom.html("");
            	for(var i=0; i<tags.length; i++)
            		tagdom.append('<button type="button" class="modal-tag modal-tag-detail flex-c-m stext-107 size-301 p-lr-15 trans-04 m-r-5 m-b-5">#'+tags[i]+'</button>');
            	$('#detail_address').html(data.address);
            	map_detail = L.map('mapid_detail').setView([data.lat, data.lng], 5);
        		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        			maxZoom: 18,
        			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
        			id: 'mapbox.streets'
        		}).addTo(map_detail);
        		if(data.address)
        			L.marker([data.lat, data.lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_detail);
                		
        		$('.modal_get_btn').attr("data-id", data.bucket_id).attr("data-value", data.selectedbucket_id);
            	$('.modal_heart').attr("data-id", data.selectedbucket_id).addClass(data.className).on('click', function(){
    				var action;
    				var cnt = $('#likecnt').text();
    				if($(this).hasClass('js-addedlike')){
    					$(this).removeClass('js-addedlike');
    					action = "delete";
    				}else{
    					$(this).addClass('js-addedlike');
    					action = "insert";
    				}
    				$.ajax({
    					url: "bucket/like",
    	                type: "POST",
    	                data: {
    	                    selectedbucket_id : $(this).attr('data-id'),
    	                    action : action
    	                },
    	                success: function (data) {
    	                	$('#likecnt').text(data);
    	                	if(data==-1)
    	                		window.location.href = "loginmain";
    	                }
    				})
    			});;
            	$('#likecnt').text(data.like_cnt);
            }
		})
        
        $('.js-modal-bucket').addClass('show-modal-bucket');
    });
   $('body').on('click','.js-hide-modal-bucket',function(e){
    	map_detail.remove();
        $('.js-modal-bucket').removeClass('show-modal-bucket');
        if($('.modal_heart').hasClass('js-addedlike')){
        	$('.modal_heart').removeClass('js-addedlike');
        	$('.heart'+$('.modal_heart').attr('data-id')).each(function(){$(this).addClass('js-addedlike')});
        }else{
        	$('.heart'+$('.modal_heart').attr('data-id')).each(function(){$(this).removeClass('js-addedlike')});
        }
        $('.modal_heart').off();
    }); 
    
    /*==================================================================
    [ Show create modal ]*/
	var map_create;
    $('body').on('click','.js-show-modal-create',function(e){ 	
    	e.preventDefault();
	    $.ajax({
	    	url: "bucket/getgrouptag",
	        type: "POST",
	        success: function (data) {
	         	var groups = data[0];
	           	var tags = data[1];
	           	var groupdom = $("#create-groups-dom");
	           	for(var i = 0; i < groups.length; i++ ){
	           		groupdom.append("<option value='"+groups[i].id+"'>"+groups[i].name+"</option>");
	           	}
	           	var tagdom = $("#create-tag-dom");
	           	for(var i=0; i<tags.length; i++)
	           		tagdom.append('<button type="button" value="'+tags[i].id+'" class="create-modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tags[i].name+'</button>');	            	
	           	tag_click($('.create-modal-tag'));
	           	$("#create-d-day").flatpickr({
        		    dateFormat: "Y.m.d"
        		});
	           	if(map_create) map_create.remove();
	           	map_create = L.map('mapid_create').setView([37.566, 126.978], 5);
	    		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
	    			maxZoom: 18,
	    			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
	    				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
	    				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
	    			id: 'mapbox.streets'
	    		}).addTo(map_create);
	    		var popup = L.popup().setLatLng([37.566, 126.978]).setContent("장소를 입력하고 선택을 눌러보세요.").openOn(map_create);
	    		$('#latlng').attr('data-lat', 37.566).attr('data-lng', 126.978);
	    		var marker, popup;
	    		$('#create-location-select').on('click', function(){
	    			var address = $('#create-location').val();
	    			if(address){
	    				$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=API키&address="+encodeURIComponent(address), function(data) {
	    					if(data.status=='OK'){
		    					map_create.remove();
		    					if(popup) popup.remove();
		    					if(marker) marker.remove();  
		    					let lat = data.results[0].geometry.location.lat;
		    					let lng = data.results[0].geometry.location.lng;
		    					map_create = L.map('mapid_create').setView([lat, lng], 7);
		    					L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		    		    			maxZoom: 18,
		    		    			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
		    		    				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
		    		    				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
		    		    			id: 'mapbox.streets'
		    		    		}).addTo(map_create);
		    					
		    					L.marker([lat, lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_create);
		    					$('#latlng').attr('data-lat', lat).attr('data-lng', lng);
		    					$('#create-location').val(data.results[0].formatted_address);
		    				}else{
		    					popup = L.popup().setLatLng([37.566, 126.978]).setContent("잘못된 장소가 입력되었습니다.").openOn(map_create);
		    				}
	    				})
	    			}
	    		})	  
	           },
	           error : function(){
	           	console.log("error");
		       }
	    })
			
		$('.js-modal-create').addClass('show-modal-create');
    });
    /*[click create cancel button]*/
    $('body').on('click','.js-hide-modal-create',function(e){
    	clear_createForm();
    	map_create.remove();
    	$('.js-modal-create').removeClass('show-modal-create');
    }); 
    /*[click create submit button]*/
    $('body').on('click','#create-submit',function(e){
    	var title = $("#create-title").val();
    	var file = $('#input_image')[0].files[0];
    	var content =  $("#create_content").val();	 
		var list = [];
    	$("#create-tag-dom .modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	if(file == undefined)
    		msg += "사진 ";
    	if(title=='')
    		msg += "제목 ";
    	if(content == "")
    		msg += "내용 ";
    	if(msg.length!=0)
    		msg += "이 비어있습니다."
    	if(list.length==0)
    		msg +="태그를 지정해주세요.\n"
    	
    	if(msg.length!=0)
    		$(".create-warntest").text(msg);
    	else{
    		var latlng = $("#latlng");
    		var formData = new FormData();
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("taglist", list);
        	formData.append("file", file);
        	formData.append("group_id", parseInt($("#create-groups-dom").val()));
        	formData.append("d_day", $("#create-d-day").val());
        	formData.append("address", $("#create-location").val());
        	formData.append("lat", parseFloat(latlng.attr('data-lat')));
			formData.append("lng", parseFloat(latlng.attr('data-lng')));
        	$.ajax({
				url: "createbucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData,
				sucess : function(){
					$('.js-modal-create').removeClass('show-modal-create');
				},
				complete : function(){
					clear_createForm();
					map_create.remove();
					$('.js-modal-create').removeClass('show-modal-create');
					window.location.reload(true);
				}
			});
    	}
	});
   
    /*==================================================================
    [ Show edit modal ]*/
	var map_edit;
   $('body').on('click','.js-show-modal-edit',function(e){ 	
    	e.preventDefault();
    	var id = $(this).attr('data-id');
	        $.ajax({
				url: "bucket/geteditinfo",
	            type: "POST",
	            data: {"selectedbucket_id": id, 
	            		"action": "edit"},
	            success: function (data) {
	            	var group_list = data.group_list;
	            	var tag_list = data.tag_list;
	            	var my_tags = data.my_tags;
	            	
	            	$("#edit_bucket_id").val(id);
	            	$("#edit_title").val(data.title);
	            	$("#edit_image").attr("src", "images/bucket/"+data.image_path);
	            	$("#edit_content").val(data.content);
	            	var groupdom = $("#edit-groups-dom");
	            	for(var i = 0; i < group_list.length; i++ )
	            		groupdom.append("<option value='"+group_list[i].id+"'>"+group_list[i].name+"</option>");
	            	$('#edit-groups-dom').find('option[value='+data.group_id+']').attr('selected', 'selected');
	            	
	            	var tagdom = $("#edit-tag-dom");
	            	for(var i=0; i<tag_list.length; i++)
	            		tagdom.append('<button type="button" value="'+tag_list[i].id+'" class="edit-modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tag_list[i].name+'</button>');	            	
	            	tag_click($('.edit-modal-tag'));
	            	var my_tags = data.my_tags;
	            	for(var i = 0; i<my_tags.length; i++)
	            		$('#edit-tag-dom').find('button[value='+my_tags[i]+']').removeClass('bor7').addClass('modal-tag-click').removeClass('cl6');
	            	$('#edit-d-day').flatpickr({
	        		    dateFormat: "Y.m.d",
	        		    defaultDate: [data.d_day]
	        		});
	            	$('#edit-location').val(data.address);
	            	$('#edit_bucket_id').attr('data-lat', data.lat).attr('data-lng', data.lng);
	            	if(map_edit) map_edit.remove();
	            	map_edit = L.map('mapid_edit').setView([data.lat, data.lng], 5);
	        		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
	        			maxZoom: 18,
	        			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
	        				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
	        				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
	        			id: 'mapbox.streets'
	        		}).addTo(map_edit);
	        		if(data.address)
	        			L.marker([data.lat, data.lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_edit);
	        		
	        		var marker, popup;
		    		$('#edit-location-select').on('click', function(){
		    			var address = $('#edit-location').val();
		    			if(address){
		    				$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=API키&address="+encodeURIComponent(address), function(data) {
		    					if(data.status=='OK'){
			    					map_edit.remove();
			    					if(popup) popup.remove();
			    					if(marker) marker.remove();
			    					let lat = data.results[0].geometry.location.lat;
			    					let lng = data.results[0].geometry.location.lng;
			    					map_edit = L.map('mapid_edit').setView([lat, lng], 7);
			    					L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
			    		    			maxZoom: 18,
			    		    			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
			    		    				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			    		    				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
			    		    			id: 'mapbox.streets'
			    		    		}).addTo(map_edit);
			    					
			    					L.marker([lat, lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_edit);
			    					$('#edit_bucket_id').attr('data-lat', lat).attr('data-lng', lng);
			    				}else{
			    					popup = L.popup().setLatLng([37.566, 126.978]).setContent("잘못된 장소가 입력되었습니다.").openOn(map_edit);
			    				}
		    				})
		    			}
		    		})	
	            },
	            error : function(){
	            	console.log("error");
		        }
			})
			
			$('.js-modal-edit').addClass('show-modal-edit');
    });
    /*[click edit cancel button]*/
   $('body').on('click','.js-hide-modal-edit',function(e){
    	clear_form('#edit');
    	$('.js-modal-edit').removeClass('show-modal-edit');
    }); 
    /*[click edit submit button]*/
    $('body').on('click','#edit-submit',function(e){
    	var title = $("#edit_title").val();
    	var content =  $("#edit_content").val();
		var list = [];
    	$("#edit-tag-dom .modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	
    	if(title=='')
    		msg += "제목 ";
    	if(content == "")
    		msg += "내용 ";
    	if(msg.length!=0)
    		msg += "이 비어있습니다."
    	if(list.length==0)
    		msg +="태그를 지정해주세요.\n"
    			
    	if(msg.length!=0)
    		$("#edit-warntest").text(msg);
    	else{
    		var hidden = $("#edit_bucket_id");
    		var formData = new FormData();
    		formData.append("selectedbucket_id", hidden.val());
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("taglist", list);
        	formData.append("group_id", parseInt($("#edit-groups-dom").val()));
        	formData.append("d_day", $("#edit-d-day").val());
        	formData.append("address", $("#edit-location").val());
			formData.append("lat", parseFloat(hidden.attr('data-lat')));
			formData.append("lng", parseFloat(hidden.attr('data-lng')));
			$.ajax({
				url: "updatebucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData,
				complete : function(){
					$('.js-modal-edit').removeClass('show-modal-edit');
					clear_form('#edit');
					window.location.reload(true);
				}
			});
    	}
	});
    /*==================================================================
    [ Show get modal ]*/
    var map_get;
    $('body').on('click','.js-show-modal-get',function(e){ 	
    	e.preventDefault();
    	var id = $(this).attr("data-id");
	        $.ajax({// 제목 이미지path 내용 태그(전부/버킷's) 그룹(전부/버킷's) 날짜 위도 경도
				url: "bucket/geteditinfo",
	            type: "POST",
	            data: {"selectedbucket_id": $(this).attr('data-value'), 
            		"action": "get"},
	            success: function (data) {
	            	if(data != ''){
		            	var group_list = data.group_list;
		            	var tag_list = data.tag_list;
		            	var my_tags = data.my_tags;
		            	
		            	$("#get_bucket_id").val(id);
		            	$("#get_title").val(data.title);
		            	$("#get_image").attr("src", "images/bucket/"+data.image_path);
		            	$("#get_content").val(data.content);
		            	var groupdom = $("#get-groups-dom");
		            	for(var i = 0; i < group_list.length; i++ )
		            		groupdom.append("<option value='"+group_list[i].id+"'>"+group_list[i].name+"</option>");
		            	$('#get-groups-dom').find('option[value='+data.group_id+']').attr('selected', 'selected');
		            	
		            	var tagdom = $("#get-tag-dom");
		            	for(var i=0; i<tag_list.length; i++)
		            		tagdom.append('<button type="button" value="'+tag_list[i].id+'" class="get-modal-tag flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">#'+tag_list[i].name+'</button>');	            	
		            	tag_click($('.get-modal-tag'));
		            	var my_tags = data.my_tags;
		            	for(var i = 0; i<my_tags.length; i++)
		            		$('#get-tag-dom').find('button[value='+my_tags[i]+']').removeClass('bor7').addClass('modal-tag-click').removeClass('cl6');
		            	$('#get-d-day').flatpickr({
		        		    dateFormat: "Y.m.d",
		        		    defaultDate: [data.d_day]
		        		});
		            	$('#get-location').val(data.address);
		            	$('#get_bucket_id').attr('data-lat', data.lat).attr('data-lng', data.lng);
		            	if(map_get) map_get.remove();
		            	map_get = L.map('mapid_get').setView([data.lat, data.lng], 5);
		        		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		        			maxZoom: 18,
		        			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
		        				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
		        				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
		        			id: 'mapbox.streets'
		        		}).addTo(map_get);
		        		if(data.address)
		        			L.marker([data.lat, data.lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_get);
		        		
		        		var marker, popup;
			    		$('#get-location-select').on('click', function(){
			    			var address = $('#get-location').val();
			    			if(address){
			    				$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?key=API키&address="+encodeURIComponent(address), function(data) {
			    					if(data.status=='OK'){
			    						map_get.remove();
				    					if(popup) popup.remove();
				    					if(marker) marker.remove();  
				    					let lat = data.results[0].geometry.location.lat;
				    					let lng = data.results[0].geometry.location.lng;
				    					map_get = L.map('mapid_get').setView([lat, lng], 7);
				    					L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				    		    			maxZoom: 18,
				    		    			attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
				    		    				'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				    		    				'Imagery <a href="https://www.mapbox.com/">Mapbox</a>',
				    		    			id: 'mapbox.streets'
				    		    		}).addTo(map_get);
				    					
				    					L.marker([lat, lng], {icon: L.icon({iconUrl: 'images/flag.svg', iconSize: [35,35]})}).addTo(map_get);
				    					$('#get_bucket_id').attr('data-lat', lat).attr('data-lng', lng);
				    				}else{
				    					popup = L.popup().setLatLng([37.566, 126.978]).setContent("잘못된 장소가 입력되었습니다.").openOn(map_get);
				    				}
			    				})
			    			}
			    		})
			    		$('.js-modal-get').addClass('show-modal-get');
	            	}else{
	            		window.location.href = "loginmain";
	            	}
	            },
	            error : function(){
	            	window.location.href = "loginmain";
		        }
			})
			
    });
    /*[click get cancel button]*/
    $('body').on('click','.js-hide-modal-get',function(e){
    	clear_form('#get');
    	$('.js-modal-get').removeClass('show-modal-get');
    }); 
    /*[click get submit button]*/
    $('body').on('click','#get-submit',function(e){
    	var title = $("#get_title").val();
    	var content =  $("#get_content").val();
		var list = [];
    	$("#get-tag-dom .modal-tag-click").each(function(i){list.push($(this).val());})
    	
    	var msg = '';
    	if(title=='')
    		msg += "제목 ";
    	if(content == "")
    		msg += "내용 ";
    	if(msg.length!=0)
    		msg += "이 비어있습니다."
    	if(list.length==0)
    		msg +="태그를 지정해주세요.\n"
    			
    	if(msg.length!=0)
    		$("#get-warntest").text(msg);
    	else{
    		var hidden = $("#get_bucket_id");
    		var formData = new FormData();
    		formData.append("bucket_id", parseInt(hidden.val()));
        	formData.append("title", title);
        	formData.append("content", content);
        	formData.append("taglist", list);
        	formData.append("group_id", parseInt($("#get-groups-dom").val()));
        	formData.append("d_day", $("#get-d-day").val());
        	formData.append("address", $("#get-location").val());
        	formData.append("lat", parseFloat(hidden.attr('data-lat')));
			formData.append("lng", parseFloat(hidden.attr('data-lng')));
			$.ajax({
				url: "insertgetbucket",
				type:"post",
				processData: false,
                contentType: false,
				data: formData,
				complete : function(){
					$('.js-modal-get').removeClass('show-modal-get');
					clear_form('#get');
					window.location.reload(true);
				}
			});
    	}
	});
})(jQuery);
var clear_createForm = function(){
	$('input').val('');
	$('#create-content').val('');
	$('.createimage').attr("src", "https://mdbootstrap.com/img/Photos/Others/placeholder.jpg");
	if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1)) {
	 	$("#input_image").replaceWith($("#input_image").clone(true));
	} else {
	   	$("#input_image").val("");
	}
	$('#create-groups-dom').html('');
	$('#create-tag-dom').html('');
	$('#create-d-day').val('');
	$(".create-warntest").text("");
}
var clear_form = function(flag){
	$(flag+'-groups-dom').html('');
	$(flag+'-tag-dom').html('');
	$(flag+'-d-day').val('');
	$(flag+'-tag-dom').html('');
	$(flag+'-location').val('');
	$(flag+"-warntest").text('');
}
var tag_click = function(tags){
	tags.each(function(){
		$(this).on('click',function(){
			if($(this).hasClass('modal-tag-click')){
				$(this).addClass('bor7');
        		$(this).removeClass('modal-tag-click');
        		$(this).addClass('cl6');
			}else{
				$(this).removeClass('cl6');
        		$(this).removeClass('bor7');
        		$(this).addClass('modal-tag-click');
			}
		});
	})
}
