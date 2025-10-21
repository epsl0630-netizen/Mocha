let joinCheckFlag = false;
$(document).ready(function() {
	//load 후 유저정보 가져오기
	const params = new URLSearchParams(window.location.search);
	const param_user_id = params.get("user_id");
	AdminLoadUserInfo(param_user_id);
	
	//유저추가버튼
	  $(".addmemberBtn").click(
	    function() {
	
	    }
	  );
	//관리자화면 비밀번호변경버튼  
	$("#admin-pw-change-btn").click(
	    function() {
	      AdminPwChangeOn();
	      AdminPwBtnNameChange();
	    }
	 );
  	//관리자 유저 선택
  	$("#adminHRD #subTR").click(
	  	function() {
	  		//기존에 있던 다른 행에 있는 class를 지우고 현재 행에 추가 
	  		$("#adminHRD #subTR.selected").removeClass("selected");
	  		$(this).addClass("selected");
	  		
	  		const userId = $(this).children().first().text().trim();
	  		
	  		AdminUserView(userId);
	  	}
	);
	
	
  
});

function AdminPwChangeOn() {
    $(".admin-pw-change").show();
}

function AdminPwChangeOff() {
    $(".admin-pw-change").hide();
}

function AdminPwBtnNameChange() {
	if($("#admin-pw-change-btn").text() == "비밀번호 변경") {
    	AdminPwChangeOn();
    	$("#admin-pw-change-btn").text("비밀번호 변경 취소");
	}else {
	AdminPwChangeOff();
    $("#admin-pw-change-btn").text("비밀번호 변경");
    $(".admin-pw-change").find("input").val("");
	}
}
//아이디 중복체크
function IdDuplicateCheck() {
	$(".idCheck-phrase").text("중복되는 사원번호 입니다.");
}

//유저 처음 불러오기
function AdminLoadUserInfo (param_user_id) {
	if(param_user_id != "" && param_user_id != null) {
		return AdminUserView(param_user_id);
		alert(param_user_id);
	}
	
	//<tr id="subTR" class="selected">
 	html = $("#subTR.selected").html();
 	if(typeof html == "undefined")
 	{
 		//목록에 사용자가 하나도 없음.
 		return;
 	}else
 	{
 		//로딩 후 첫 사용자를 선택함. 
 		userId = $("#subTR.selected").children().first().html().trim();
 		return AdminUserView(userId);
 	}
	
}
//userList 유저불러오기
function AdminUserView(user_id) {
	$.ajax({
		url:'adminUserView',
		data: {
			user_id : user_id
		},
		dataType : "json",
		type: "post",
		success: function(data) {
			$("#userInfoFrm #name").val(data.name);
			$("#userInfoFrm #email").val(data.email);
			$("#userInfoFrm #user_id").text(data.user_id);
			$("#userInfoFrm #hiden_user_id").val(data.user_id);
			$("#userInfoFrm #user_phone").text(data.user_id);
			$("#userInfoFrm #mobile").val(data.mobile);
			$("#userInfoFrm #user_birth").val(data.user_birth);
			$("#userInfoFrm #user_addr").val(data.user_addr);
			$("#userInfoFrm #authority").val(data.authority+"");
			
			$("#userInfoFrm #user_gender").val(data.user_gender);
			$("#userInfoFrm #dept_id").val(data.dept_id);
			$("#userInfoFrm #user_rank").val(data.user_rank);
			$("#userInfoFrm #created_at").text(data.created_at);
			
			if(data.mobile != "" && data.mobile != null) {
				const back = data.mobile.slice(-4);
				$("mobile1").val(data.mobile.substr(0,3));
				$("mobile2").val(data.mobile.substr(3, data.mobile.length - back.length - 3));
				$("mobile3").val(back);
			}
		},
		error: function(a,b,c) {
			alert("실패");
			//console.log(a,b,c);
		}
	});
}
//회원가입 check
function JoinCheck(frmId) {
	
	joinCheckFlag = false;	//초기화
	
	if(!JoinInputCheck(frmId)) {
	}else
	if(!PwCheck(frmId)) {
	}else{
		joinCheckFlag = true;
	}

	return joinCheckFlag;
}

//user 비밀번호 확인
function PwCheck(frmId) {
	//비밀번호 일치여부 확인
	if($("#" + frmId + " #user_pw").val() == $("#" + frmId + " #user_pw_ck").val()) {
		return true;
	}
	alert("비밀번호가 일치하지 않습니다.");
	$("#user_pw").focus();
	
	return false;
	
}
//Input확인
function JoinInputCheck(frmId) {
	const inputList = $("#" + frmId).serializeArray();
	for(var i in inputList) {
		var v = inputList[i].value.trim();
		var n = inputList[i].name;
		
		if(v == null || v == "") {
			alert("모든 입력칸은 필수입니다.");
			$("input[name=" + n + "]").focus();
			return false;
		}
	}
	return true;
}
