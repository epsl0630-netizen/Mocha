$(document).ready(function() {
  $(".addmemberBtn").click(
    function() {

    }
  );
  $("#admin-pw-change-btn").click(
    function() {
      AdminPwChangeOn();
      AdminPwBtnNameChange();
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
  