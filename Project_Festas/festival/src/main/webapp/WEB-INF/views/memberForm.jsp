<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    <head> 
		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Admin</title>
	</head>
	<Style>
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{font-family: 'Hanna', sans-serif;}
	body, html{
     height: 100%;
 	background-image: url('http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
 	font-family: 'Oxygen', sans-serif;
}

.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Hanna', sans-serif; 
	font-weight: 400; 
	color: white;
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
	
	</Style>
	<body>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Festas 회원가입</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="/festival/memberForm">
						
						<div class="form-group">
							<label for="id" class="cols-sm-2 control-label">Your ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" id="userId" class="form-control" name="mid" required placeholder="Enter your ID"/ >
								</div>
							</div>
						</div>
						<div id="idError"></div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" required placeholder="Enter your Email"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">Your Phone</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type=tel id=phone name=phone class="form-control"
                      					   placeholder="00*-000*-0000" 
                       					   pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="Enter your PhoneNumber"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input input type="password" id="pw" class="form-control" name="pw" required  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input input type="password" id="pwcheck" class="form-control" name="pwcheck" 
										onkeyup="checkPwd()" required  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
						<div id="checkPwd"></div>
						<div class="form-group ">
							<input onclick="registerSuccess" id="submit" type="submit" class="btn btn-primary btn-lg btn-block login-button">
						</div>
						<div class="login-register">
				            <a href="http://70.12.113.165:8000/festival/loginmain">Login</a>
				         </div>
					</form>
				</div>
			</div>
		</div>
		<script>
function checkPwd(){
  var pw1 =	document.getElementById('pw').value
  var pw2 = document.getElementById('pwcheck').value
  if(pw1!=pw2){
   document.getElementById('checkPwd').style.color = "red";
   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
  }else{
   document.getElementById('checkPwd').style.color = "blue";
   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
   
  }
  
 }

function registerSuccess(){
	alert("회원가입 성공")
}
</script>
	
<script>
		$(document).ready(function(){
			$("#userId").blur(function(){
				var mid = $("#userId").val();
				$.ajax({
					url : '/festival/validateForm?mid=' + mid,
					type : 'get',
					success : function(data){
						if (data == 1){ // id 중복됨
							$('#idError').text("이미 사용중인 아이디입니다. =ㅅ=").css("color", "red");
							$("#submit").attr("disabled", true);
						}
						else {
							$('#idError').text("사용 가능한 아이디입니다. :) ").css("color", "blue");
							$("#submit").attr("disabled", false);					
						}
					},					
					error : function(){ console.log("실패"); }
				});
			});
		})
	</script>
	</body>
</html>