$('#listAll').click(function() {
	$('.All').css('display','block');
	$('.Prog').css('display','none');
	$('.Done').css('display','none');
	$('#confirm').css('display','none');
	$('.All').removeAttr('style');
})
$('#listProg').click(function() {
	$('.All').css('display','none');
	$('.Prog').css('display','block');
	$('.Done').css('display','none');
	$('#confirm').css('display','block');
	$('.Prog').removeAttr('style');
})
$('#listDone').click(function() {
	$('.All').css('display','none');
	$('.Prog').css('display','none');
	$('.Done').css('display','block');
	$('#confirm').css('display','none');
	$('.Done').removeAttr('style');
})

//프로필 수정 시 비밀번호 확인
function ConfirmPw(){
	var upPw = $('#upPw').val();
	$.ajax({
		url : '/dalhada/Checkpw?password='+upPw,
		type : 'post',
		success : function(data){
			if (data == 'true'){ 
				$('#updateInfo').css('display','block');
				$('#CkUpdate').css('display','none');	   
			}else{
				document.getElementById('pwError').style.color = "red";
				   document.getElementById('pwError').innerHTML = "암호가 일치하지 않습니다.";
			}
		},					
		error : function(){ console.log("실패"); }
	});
}


function changeFunc() {
    var selectBox = document.getElementById("selectBox");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var index = selectBox.options[selectBox.selectedIndex].index;
    location.href='http://70.12.113.183:8000/dalhada/mypage?group='+selectedValue;
    
   }
   
   function plusGroup(){
	   $("#plusGroup").append("<div style=\"margin: 0px;\"><input type=\"text\" class=\"groupModal\" name=\"CreGroup\" required>  <button type=\"button\" class=\"deleteGroup\">삭제</button></div>");
	   $('.deleteGroup').click(function(){
		   this.closest("div").remove();
	   });
   }
   
   function achieve(){
	   location.href='http://70.12.113.183:8000/dalhada/achieve';
   }
 

   
var modal = document.getElementById('id01'); 
var modal2 = document.getElementById('id02'); 
window.onclick = function(event) { 
    if (event.target == modal) { 
        modal.style.display = "none";
    }
    if (event.target == modal2) { 
        modal.style.display = "none"; 
    } 
    
} 

function modalOpen(){
    
    document.getElementById('id01').style.display='block';
}

function modalOpen2(){
    
    document.getElementById('id02').style.display='block';
}

function modalCancel(){
	document.getElementById('id01').style.display='none';
	document.getElementById('id02').style.display='none';
}

/* 그룹 삭제 */
$(document).ready(function(){
$('.delGroup').click(function(){
	var id = $(this).val();
	var add = this;
	$.ajax({
		url : '/dalhada/delGroup?id=' + id,
		type : 'post',
		success : function(data){
			if (data == "true"){ // 삭제 완료
					   $(add).closest("div").remove();
			}
		},					
		error : function(){ console.log("실패"); }
	});
});
})

$('.comp').click(function(){
	var comp_id=$(this).val();
	$.ajax({
		url : '/dalhada/comp?mid=' + comp_id,
		type : 'post',
		success : function(data){
			if (data == "true"){ // 삭제 완료
			}
		},					
		error : function(){ console.log("실패"); }
	});
});


//회원정보 수정시 프로필 이미지
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


/* 회원정보 수정시 비밀번호 체크 */
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