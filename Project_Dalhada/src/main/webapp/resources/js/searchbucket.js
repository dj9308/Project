function init() {
    gapi.client.setApiKey("API키");
    gapi.client.load("youtube", "v3", function() {
    	var keyword= $('input[name="searchKeyword"]').val(); // yt api is ready
		var action = $('input[name="action"]').val();
		searchSubmit(keyword, action,1);
    });
}

(function ($) {
	$('#searchForm').submit(function(e){
		e.preventDefault();
		var keyword= $('input[name="searchKeyword"]').val();
		var action = $('input[name="action"]').val();
		searchSubmit(keyword, action,1);
	});
})(jQuery);

var searchSubmit = function(keyword, action, curPage){
	keyword = (keyword == "all") ? "": keyword;
	var searchKeyword = (action == "noaction") ? keyword : null;
	var searchTag = (action == "noaction") ? null : keyword;
	
	$.ajax({
		url : 'searchbucketajax',
		type : 'GET',
		data : {"searchKeyword" : searchKeyword,
				"searchTag" : searchTag,
				"action" : action,
				"curPage" : curPage},
		success : function(data){
			//data item
			var searchBucketVO = data.searchBucketVO;
			var pagination = data.pagination;
			
			//searchSubmit function에 보낼 매개변수
			var searchKeyword = searchBucketVO.searchKeyword;
			var searchTag = searchBucketVO.searchTag;
			var action = searchBucketVO.action;
			var keyword = (searchTag != null) ? searchTag : searchKeyword;
			keyword = (keyword == "") ? "all" : keyword; //전체 검색시검색창에 빈 키워드를 입력함으로 임의로 all 문자열 대입
			
			var resultgrid = $('.bucket-result-grid');
			resultgrid.html('');
			var resultnaverblog = $('.result-naverBlog');
			resultnaverblog.html('');
			
			var first=''; var num=''; var next=''; var last=''; var ad=''; var code=''; var searchnull='';
			if(data.searchList != ""){
				//paging
				if(data.listCnt != null){ 
					first = (pagination.curPage != 1) ? '<a href="#" onclick=\'searchSubmit("'+keyword+'","'+action+'",1); return false;\' '
							+'class="flex-c-m how-pagination1 trans-04 m-all-7"> << </a>'
							+'<a href="#" onclick=\'searchSubmit("'+keyword+'","'+action+'",1); return false;\' '
							+'class="flex-c-m how-pagination1 trans-04 m-all-7"> < </a>' : '';
					
					for(var pageNum = pagination.startPage; pageNum <= pagination.endPage; pageNum++){
						num += (pageNum == pagination.curPage) ? '<a href="#" onclick=\'searchSubmit("'+keyword+'","'+action+'",'+pageNum+'); return false;\' '
								+'class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"> '+pageNum+' </a>'
								: '<a href="#" onclick=\'searchSubmit("'+keyword+'","'+action+'",'+pageNum+'); return false;\' '
								+'class="flex-c-m how-pagination1 trans-04 m-all-7">'+pageNum+'</a>' ;
					}
					
					next = (pagination.curPage != pagination.pageCnt && pagination.pageCnt > 0) ? '<a href="#" onclick=\'searchSubmit("'+keyword+'","'+action+'",'+pagination.nextPage+'); return false;\' ' 
							+'class="flex-c-m how-pagination1 trans-04 m-all-7"> > </a>' :  '';
					
					last = (pagination.curPage != pagination.pageCnt) ? '<a href="#" onclick=\'searchSubmit("'+keyword+'","'+action+'",'+pagination.pageCnt+'); return false;\' ' 
							+'class="flex-c-m how-pagination1 trans-04 m-all-7"> >> </a>' : '';
				}
				//searchlist
				$.each(data.searchList, function(index, item){
					ad = (item.isAd == 'p') ? '<i class="fas fa-ad cl3 float-r"></i>' : '';
					code += '<div class="item-slick2 p-l-15 p-r-15 p-t-10 p-b-10 isotope-item women"> '+
							'<div class="block3"> <div class="block3-wrap"><a class="block3-img flex-c-m trans-04"><img data-id="'+
							   item.selectedbucket_id+'" class="js-show-modal-bucket "'+ 
							'src="images/bucket/'+item.image_path+'" alt="IMG-PRODUCT"></a>'+ad+'</div> '
					+'<div class="p-t-14"><div class="block3-txt-child1 flex-col-l txt-left"> '
									+'<a data-id="'+item.selectedbucket_id+'" class="js-show-modal-bucket stext-104 cl4 hov-cl1 trans-04 p-b-6"> '
									+item.title+'</a></div><div class="txt-right"><a data-id="'
									+item.selectedbucket_id+'" class="heart heart'+item.selectedbucket_id+' fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike '
									+item.className+' tooltip100" data-tooltip="좋아요"> <i class="zmdi zmdi-favorite"></i></a> '
									+'<button class="fs-23 cl4 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="가져오기"> '
					                +'<i data-id="'+item.bucket_id+'" data-value="'+item.selectedbucket_id+'" class="js-show-modal-get fa fa-plus-square"></i> ' 
					                +'</button></div></div></div></div> ';
				});
				resultgrid.append('<div class="row isotope-grid ">'+code+'</div><div class="flex-c-m flex-w w-full p-t-10 m-lr--7">'+first+num+next+last+'</div>');
			}else{
				searchnull = (data.tag == "") ? '<h2 class="txt-center p-t-60">"'+data.keyword+'"에 대한 검색결과가 없습니다.</h2>' : 
					'<h2 class="txt-center p-t-60">"'+data.tag+'"태그와 관련된 검색결과가 없습니다.</h2>';
				resultgrid.append(searchnull);
			}
			//naverblog
			if(data.naverBlogList != ""){
				$.each(data.naverBlogList, function(index, item){
					resultnaverblog.append('<li class="bor18"><a href="'+item.link+'" target="_blank" '
							+'class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">'+item.title+'</a></li>');
				});
			}
			//video
		    var request = gapi.client.youtube.search.list({ // prepare the request
		         part: 'snippet',
		         type: 'video',
		         q: data.videoKeyword,
		         maxResults: 1,
		         order: 'relevance' //관련성
		    }); 
		   
		   request.execute(function(response) { // execute the request
			   var resultvideo = $('.result-video');
			   resultvideo.html('');
			   resultvideo.append('<div id="video" class="col-md p-lr-15 txt-center"><iframe width="500" height="295" src="//www.youtube.com/embed/'
					   +response.items[0].id.videoId+'?&autoplay=1" frameborder="0" allow="autoplay;"></iframe></div>'
					   +'<div class="col-md"><div id="v_content" class="p-l-15"><h4 class="p-t-10">'+response.items[0].snippet.title+'</h4>'
					   +'<h6 class="p-t-20 p-b-10">'+response.items[0].snippet.description+'</h6></div>'
					   +'<button class="button-modal cl0 bg10 " '
					   +'onclick="window.open(\'https://www.youtube.com/results?search_query='+data.videoKeyword+'\')">관련 동영상 더보기</button></div>');
		   });
		},
		error : function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	})
};

//새로고침 막기
function doNotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
document.onkeydown = doNotReload;