<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table id="wrap">
	<tr>
	  <!-- header -->
	  <td colspan="3" id="header">
	    <a href="../home/index.html" class="m-logo"></a>
	    <!-- headerlist start -->
	    <div id="header-list">
	      <!-- alarm start -->
	      <div id="notification-dropdown" class="dropdown me-3"> 
	        <a href="#" class="text-decoration-none text-dark position-relative dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside" role="button">
	          <i class="bi bi-bell-fill fs-5"></i> 
	          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
	            3
	          <span class="visually-hidden">unread notifications</span>
	          </span>
	        </a>
	        <div class="dropdown-menu dropdown-menu-end p-0 shadow border" 
	            style="width: 350px; max-height: 80vh; overflow-y: auto;">
	            <div class="d-flex justify-content-between align-items-center p-3 border-bottom">
	                <h6 class="mb-0 fw-bold">알림</h6>
	                <a href="#" class="text-dark"><i class="bi bi-gear fs-5"></i></a>
	            </div>
	            <div class="p-3">
	              <h6 class="text-secondary fw-semibold mb-3">오늘 받은 알림</h6>
	              <div class="notification-item border-bottom mb-2 pb-2">
	                <div class="d-flex justify-content-between small">
	                  <span class="fw-bold">전자결재 </span>
	                  <div class="d-flex align-items-center">
	                <small class="text-muted me-2">4시간 전</small>
	                <a href="#" class="text-dark opacity-50" style="font-size: 0.8rem; line-height: 1;">
	                  <i class="bi bi-x-lg"></i>
	                </a>
	                  </div>
	                </div> 
	              </div>
	              <p class="mb-1 small text-truncate">전자결재 반려 1건이 발생했습니다. 확인바랍니다.</p>
	              <div class="notification-item border-bottom mb-2 pb-2">
	                <div class="d-flex justify-content-between small">
	                  <span class="fw-bold">게시판</span>
	                    <div class="d-flex align-items-center">
	                      <small class="text-muted me-2">어제 오후 06:00</small>
	                      <a href="#" class="text-dark opacity-50" style="font-size: 0.8rem; line-height: 1;">
	                        <i class="bi bi-x-lg"></i>
	                      </a>
	                    </div>
	                </div>
	                <p class="mb-1 small text-truncate text-secondary">내 게시글에 댓글이 달렸습니다.</p>
	                <a 
	                  href="#additionalNotifications" 
	                  class="small text-decoration-none d-block mt-2" 
	                  data-bs-toggle="collapse" 
	                  aria-expanded="false"
	                  aria-controls="additionalNotifications"
	                >
	                  +20 알림 더보기
	                </a>
	                <div class="collapse mt-2" id="additionalNotifications">
	                  <div style="max-height: 200px; overflow-y: auto; padding-right: 15px;">
	                    <!-- 추가구간 start-->
	                    <div class="notification-item-sub border-bottom pb-1 mb-1">
	                      <div class="d-flex justify-content-between small">
	                        <span class="text-secondary">새로운 댓글 알림 (1)</span>
	                        <div class="d-flex align-items-center">
	                          <small class="text-muted me-2">05:59</small>
	                          <a href="#" class="text-dark opacity-50" style="font-size: 0.8rem; line-height: 1;">
	                            <i class="bi bi-x"></i>
	                          </a>
	                        </div>
	                      </div>
	                      <p class="mb-0 small text-truncate">새 댓글 내용...</p>
	                    </div>
	                    <!-- 추가구간 end-->
	                    <!-- 추가구간 start-->
	                    <div class="notification-item-sub border-bottom pb-1 mb-1">
	                      <div class="d-flex justify-content-between small">
	                        <span class="text-secondary">새로운 댓글 알림 (1)</span>
	                        <div class="d-flex align-items-center">
	                          <small class="text-muted me-2">05:59</small>
	                          <a href="#" class="text-dark opacity-50" style="font-size: 0.8rem; line-height: 1;">
	                            <i class="bi bi-x"></i>
	                          </a>
	                        </div>
	                      </div>
	                      <p class="mb-0 small text-truncate">새 댓글 내용...</p>
	                    </div>
	                    <!-- 추가구간 end-->
	                    <!-- 추가구간 start-->
	                    <div class="notification-item-sub border-bottom pb-1 mb-1">
	                      <div class="d-flex justify-content-between small">
	                        <span class="text-secondary">새로운 댓글 알림 (1)</span>
	                        <div class="d-flex align-items-center">
	                          <small class="text-muted me-2">05:59</small>
	                          <a href="#" class="text-dark opacity-50" style="font-size: 0.8rem; line-height: 1;">
	                            <i class="bi bi-x"></i>
	                          </a>
	                        </div>
	                      </div>
	                      <p class="mb-0 small text-truncate">새 댓글 내용...</p>
	                    </div>
	                    <!-- 추가구간 end-->
	                  </div>
	                </div>
	              </div>   
	            </div>
	        </div>
	      </div>
	      <!-- alarm end-->
	      <button class="profile-nav-open-btn profile-circle">
	        <div class="profile-circle">
	          <img class="profile-img-sm">
	        </div>
	      </button>
	    </div>
	    <div class="profile-nav">
	      <button type="button" class="btn-close profile-nav-close-btn"></button>
	      <div class="profile-nav-body">
	        <div class="profile-circle">
	          <img class="profile-img-md">
	        </div>
	        <span class="p-3 fs-5">홍길동 / 부장</span>
	        <span>경영</span>
	        <span>hong@email.com</span>
	        <div class="profile-nav-btn">
	          <!-- Button trigger modal -->
	          <button type="button" class="btn btn-sub profile-info-close-btn" data-bs-toggle="modal" data-bs-target="#myinfo-modal">
	            <div class="btn-icon">
	              <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#000000"><path d="M400-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM80-160v-112q0-33 17-62t47-44q51-26 115-44t141-18h14q6 0 12 2-8 18-13.5 37.5T404-360h-4q-71 0-127.5 18T180-306q-9 5-14.5 14t-5.5 20v32h252q6 21 16 41.5t22 38.5H80Zm560 40-12-60q-12-5-22.5-10.5T584-204l-58 18-40-68 46-40q-2-14-2-26t2-26l-46-40 40-68 58 18q11-8 21.5-13.5T628-460l12-60h80l12 60q12 5 22.5 11t21.5 15l58-20 40 70-46 40q2 12 2 25t-2 25l46 40-40 68-58-18q-11 8-21.5 13.5T732-180l-12 60h-80Zm40-120q33 0 56.5-23.5T760-320q0-33-23.5-56.5T680-400q-33 0-56.5 23.5T600-320q0 33 23.5 56.5T680-240ZM400-560q33 0 56.5-23.5T480-640q0-33-23.5-56.5T400-720q-33 0-56.5 23.5T320-640q0 33 23.5 56.5T400-560Zm0-80Zm12 400Z"/></svg>
	            </div>
	            <span>설정</span>
	          </button>
	          <button class="btn btn-sub" onclick="location.href='../home/login.html'">
	            <div class="btn-icon">
	              <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#000000"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg>
	            </div>
	              로그아웃
	          </button>
	        </div>
	      </div>
	    </div>
	    <!-- headerlist end --> 
	  </td>
	  <!-- header end-->
</tr>