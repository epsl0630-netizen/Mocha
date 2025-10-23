//$(document).ready(function() {
//	$("#login_btn").click(
//		function() {
//			Login();
//		}		
//	);
//});

function Login(path) {
	var loginstr = "";
  if($("#loginFrm #user_id").val() == "") {
    loginstr = "아이디를 입력하세요.";
    $("#loginFrm #user_id").focus();
    $("#loginFrm .loginstr").text(loginstr);
  }else
  if($("#loginFrm #user_pw").val() == "") {
    loginstr = "비밀번호를 입력하세요."
    $("#loginFrm #user_pw").focus();
    $("#loginFrm .loginstr").text(loginstr);
  } else {
      $.ajax({
      url : "home/loginOk",
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
         window.location.href = path;
        }else {
          loginstr="아이디 또는 비밀번호가 일치하지 않습니다.";
          $("#loginFrm .loginstr").text(loginstr);
        }
      },
      error: function() {
      	alert("오류가 발생했습니다.");
      }
    });
  }
  
   
}
