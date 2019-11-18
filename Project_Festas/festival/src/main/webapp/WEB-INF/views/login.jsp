<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url('https://fonts.googleapis.com/css?family=Numans');
*{font-family: 'Hanna', sans-serif;}
html,body{
background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Hanna', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
</style>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
			</div>
			<BR>
			<div class="card-body">
				<form id="loginForm" method="POST" action="/festival/login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" id="mid" name="mid" placeholder="아이디" required class="form-control" placeholder="ID">
						
					</div>
					<BR>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" id="pw" name="pw" placeholder="비밀번호" required class="form-control" placeholder="password">
					</div>
					<div class="form-group">
						<button id="submit" type="button" class="btn float-right login_btn">로그인</button>
					</div>
					<div id="loginError"></div>
				</form>
				
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="http://70.12.113.165:8000/festival/memberForm">Sign Up</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var referer='';
	$(document).ready(function(){
		$("#submit").click(function(){
			var id = $("#mid").val();
			var pwd = $("#pw").val();
			referer =  document.referrer;
			if(id==""){
				$("#loginError").text("아이디를 입력하세요.").css("color", "red");		
				return;
			}else if(pwd==""){
				$("#loginError").text("비밀번호를 입력하세요.").css("color", "red");		
				return;
			}
			$.ajax({
				url : '/festival/login?mid='+id+'&pw='+pwd,
				type : 'post',
				success : function(data){
					if(data == "false"){
							$("#loginError").text("아이디와 비밀번호가 일치하지 않습니다.").css("color", "red");	
					}else{
						alert("로그인 성공");
						if(referer.includes('logout')||referer.includes('memberForm'))
							referer="http://70.12.113.165:8000/festival/main";
						location.href=referer;
					}
				}
			});
		});
	});
</script>
</body>
</html>