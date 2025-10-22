const loginstr = "";
$(document).ready(function() {
	$("#login-btn").click(
		function() {
		alert("실행");
			Login();
		}		
	);
});
function Login() {
  if($("#loginFrm #user_id").val() == "") {
    loginstr = "아이디를 입력하세요."
    $("#loginFrm #user_id").focus();
    
  }else
  if($("#loginFrm #user_pw").val() == "") {
    loginstr = "비밀번호를 입력하세요."
    $("#loginFrm #user_id").focus();
  } else {
      $.ajax({
      url : "loginOk",
      type: "post", 
      data: {
        
        user_id : $("#loginFrm #user_id").val(),
        user_pw : $("#loginFrm #user_pw").val()
      },
      dataType: "html",
      success: function(res) {
        res = res.trim();
        if(res == "true") {
          //로그인 성공
          document.location = "/";
        }else {
          loginstr="아이디 또는 비밀번호가 일치하지 않습니다.";
          $("#loginFrm .loginstr").attr('class','loginFail');
        }
      }
    });
    return;
  }
  $("#loginFrm .loginstr").text(loginstr);
  return;
}