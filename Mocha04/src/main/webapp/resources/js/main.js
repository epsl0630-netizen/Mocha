$(document).ready(function() {
    // 프로필 창 열기 버튼
    $(".profile-nav-open-btn").click(
        function() {
            $(".profile-nav").show();
        }
    );
    // 프로필 창 닫기 버튼
    $(".profile-nav-close-btn").click(
        function() {
            $(".profile-nav").hide();
        }
    );
    //myinfo 닫기 버튼
    $(".profile-info-close-btn").click(
        function() {
            MyinfoChangeOff();
        }
    );
    // myinfo 수정 버튼
    $("#myinfo-change-btn").click(
        function() {
            MyinfoChangeOn();
        }
    );
    // pw 수정 버튼
    $(".pw-change-btn").click(
        function() {
            PwChangeOn();
        }
    );
});


function MyinfoChangeOn() {
    $(".myinfo-change-on").show();
    $(".myinfo-change-off").hide();
}
function MyinfoChangeOff() {
    $(".myinfo-change-on").hide();
    $(".myinfo-change-off").show();
    PwChangeOff(); //pw변경버튼도 꺼진다.
}
function PwChangeOn() {
    $(".pw-change").show();
}
function PwChangeOff() {
    $(".pw-change").hide();
}

