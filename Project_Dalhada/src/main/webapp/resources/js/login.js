var referer='';
$(document).ready(function(){
	referer =  document.referrer;
	if(referer==''){
		referer=window.location.href;
	}
	$("#submit").click(function(){
		var id = $("#id").val();
		var pwd = $("#password").val();
		if(id==""){
			$("#loginError").text("아이디를 입력하세요.").css("color", "red");		
			return;
		}else if(pwd==""){
			$("#loginError").text("비밀번호를 입력하세요.").css("color", "red");		
			return;
		}
		$.ajax({
			url : '/dalhada/login?id='+id+'&password='+pwd,
			type : 'post',
			success : function(data){
				if(data == "false"){
						$("#loginError").text("아이디와 비밀번호가 일치하지 않습니다.");
				}else{
					if(referer.includes('logout')||referer.includes('memberform')||referer.includes('loginmain'))
						referer="http://70.12.113.183:8000/dalhada/main";
					location.href=referer;
				}
			}
		});
	});
});