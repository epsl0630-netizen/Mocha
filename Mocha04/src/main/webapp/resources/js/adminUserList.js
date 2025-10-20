$(document).ready(function() {
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
  	$("#adminHRD tr").click(
	  	function() {
	  		alert("작동");
	  		const userId = $(this).children().first();
	  		alert(userId.text());
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

function selectRow() {
	let table = $("#adminHRD");
		
}
/*
//userList 유저불러오기
function UserView() {
	$.ajax({
		url:'admin/AdminUserView',
		data:
	});
}
*/