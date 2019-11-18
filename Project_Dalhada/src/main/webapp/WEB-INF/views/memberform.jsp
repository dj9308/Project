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
		
		<!-- memberform css -->
		<link rel="stylesheet" type="text/css" href="css/memberform.css">
		
		<title>Admin</title>
		<!--===============================================================================================-->	
		<link rel="icon" type="image/png" href="images/icons/peak.ico"/>
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="main-login main-center">
				<h3>Dalhada 회원가입</h3>
					<form class="form-horizontal" method="post" enctype="multipart/form-data" action="/dalhada/memberform">
						<div class="avatar-upload">
						<div class="avatar-edit">
							<input type='file' id="imageUpload" name="image" accept=".png, .jpg, .jpeg"/>
							<label for="imageUpload"></label>
						</div>
						<div class="avatar-preview">
							<div id="imagePreview"
								style="background-image: url(http://i.pravatar.cc/500?img=7);">
							</div>
						</div>
					</div>
						<div class="form-group">
							<label for="id" class="cols-sm-2 control-label">Your ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" id="userId" class="form-control" name="id" required placeholder="ID, 영어, 숫자로 된 4-12글자" >
								</div>
							</div>
						</div>
						<div id="idError"></div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" id="useremail" name="email" required placeholder="Enter your Email"/>
								</div>
							</div>
						</div>
						<div id="emailError"></div>
						<div class="form-group">
						<label for="birth" class="cols-sm-2 control-label">Your Birth</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="date" class="form-control" name="birth" required/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" id="pw" class="form-control" name="password" required  placeholder="Password, 영어, 숫자로 된 4-12글자"/>
								</div>
							</div>
						</div>
						<div id="pwError"></div>
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" id="pwcheck" class="form-control" name="pwcheck" 
										onkeyup="checkPwd()" required  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
						<div id="checkPwd"></div>
						<div class="form-group ">
							<input onclick="registerSuccess" id="submit" type="submit" class="btn btn-primary btn-lg btn-block login-button">
						</div>
						<div class="login-register">
				            <a href="/dalhada/loginmain">Login</a>
				         </div>
					</form>
				</div>
			</div>
		</div>
<script src="js/memberform.js"></script>
	</body>
</html>