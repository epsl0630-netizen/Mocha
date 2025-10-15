window.onload = function() {
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

}