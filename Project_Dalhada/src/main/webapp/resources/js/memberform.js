$(document).ready(function(){
	var re = /^[a-zA-Z0-9]{4,12}$/; 
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

	$("#userId").blur(function(){
		var id = $("#userId").val();
		if(re.test(id)){
			$.ajax({
				url : '/dalhada/validateForm?id=' + id,
				type : 'get',
				success : function(data){
					if (data == 1){ // id 중복됨
						$('#idError').text("이미 사용중인 아이디입니다. =ㅅ=").css("color", "red");
						$("#submit").attr("disabled", true);
					}else {
						if(id!=''){
						$('#idError').text("사용 가능한 아이디입니다. :) ").css("color", "blue");
						$("#submit").attr("disabled", false);
						}else{
							$("#idError").text('');
						}
					}
				},					
				error : function(){ console.log("실패"); }
			});
		}else{
			$('#idError').text("아이디가 형식에 맞지 않습니다.(영어, 숫자로 된 4-12글자)").css("color", "red");
			$("#submit").attr("disabled", true);
		}
	});
	$("#useremail").blur(function(){
		var id = $(this).val();
		if(!re2.test(id)){
			$('#emailError').text("이메일이 형식에 맞지 않습니다.").css("color", "red");
			$("#submit").attr("disabled", true);
		}else {
			$('#emailError').text("");
			$("#submit").attr("disabled", false);
		}
	})
	$("#pw").blur(function(){
		var pw = $(this).val();
		if(!re.test(pw)){
			$('#pwError').text("비밀번호가 형식에 맞지 않습니다.(영어, 숫자로 된 4-12글자)").css("color", "red");
			$("#submit").attr("disabled", true);
		}else {
			$("#submit").attr("disabled", false);
			$('#pwError').text("");
		}
	})
})
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
            $('#imagePreview').hide();
            $('#imagePreview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#imageUpload").change(function() {
    readURL(this);
});
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