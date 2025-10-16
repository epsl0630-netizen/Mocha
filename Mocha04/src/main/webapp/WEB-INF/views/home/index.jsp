<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css"/>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
      <!-- section start -->
      <td id="section">
        <table class="gadget-container">
          <tr>
            <td class="gadget-td">
              <div class="gadget">
                <div class="gadget-profile">
                  <div class="profile-rsquare">
                    <img class="profile-img-md">
                  </div>
                  <span class="gadget-title">홍길동 / 부장</span>
                  <span class="profile-depart">경영</span>
                  <span class="today-plan">오늘의 일정</span>
                  <span class="today-plan-cnt">0</span>
                  <table class="profile-job">
                    <tr>
                      <td>결재할 문서</td>
                      <td> 0 </td>
                    </tr>
                    <tr>
                      <td>결재 수신 문서</td>
                      <td> 0 </td>
                    </tr>
                  </table>
                </div>
              </div>
            </td>
            <td class="gadget-calendar-td">
              <div class="gadget">
                <span  class="gadget-title">캘린더</span>
                <a href=${pageContext.request.contextPath}/schedule" class="gadget-detail-btn  gadget--detail-btn-schedule">더 보기 
                  <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="15px"><path d="M647-440H160v-80h487L423-744l57-56 320 320-320 320-57-56 224-224Z"/>
                  </svg>
                </a>
                <!-- calendar start -->
                <div class="calendar-wrapper">
                  <div class="calendar-card">
                      <div class="card shadow-sm mb-4" id="calendar-card">
                          <div class="card-header d-flex align-items-center justify-content-between">
                              <div class="d-flex align-items-center gap-2">
                                  <button class="btn btn-outline-secondary btn-sm" id="btn-prev">&lt;</button>
                                  <h5 class="m-0" id="cal-title">2025. 09</h5>
                                  <button class="btn btn-outline-secondary btn-sm" id="btn-next">&gt;</button>
                              </div>
                              <div class="d-flex gap-2">
                                  <button class="btn btn-outline-primary btn-sm" id="btn-today">오늘</button>
                                  <button class="btn btn-primary btn-sm" id="btn-new">새 일정</button>
                              </div>
                          </div>
                          <div class="card-body">
                              <div class="table-responsive">
                                  <table class="table table-bordered align-middle text-center m-0" id="calendar">
                                      <thead class="table-light">
                                          <tr>
                                              <th class="text-danger">일</th>
                                              <th>월</th>
                                              <th>화</th>
                                              <th>수</th>
                                              <th>목</th>
                                              <th>금</th>
                                              <th class="text-primary">토</th>
                                          </tr>
                                      </thead>
                                      <tbody id="cal-body"><!-- JS로 날짜 채움 --></tbody>
                                  </table>
                              </div>
                          </div>
                      </div>

                      <!-- 선택한 날짜의 일정 리스트 -->
                      <div class="card shadow-sm">
                          <div class="card-header">
                              <strong id="event-list-title">선택한 날짜의 일정</strong>
                          </div>
                          <div class="card-body" id="event-list">
                              <div class="text-muted small">날짜를 선택하면 일정이 표시됩니다.</div>
                          </div>
                      </div>

                      <!-- 일정 입력 모달 -->
                      <div class="modal fade" id="eventModal" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog">
                              <form class="modal-content" id="event-form">
                                  <div class="modal-header">
                                      <h5 class="modal-title">일정 추가/수정</h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                                  </div>
                                  <div class="modal-body">
                                      <div class="mb-3">
                                          <label class="form-label">날짜</label>
                                          <input type="date" class="form-control" id="event-date" required>
                                      </div>
                                      <div class="mb-3">
                                          <label class="form-label">제목</label>
                                          <input type="text" class="form-control" id="event-title" placeholder="예) 주간회의" required>
                                      </div>
                                      <div class="row g-2 mb-3">
                                          <div class="col">
                                              <label class="form-label">시작</label>
                                              <input type="time" class="form-control" id="event-start">
                                          </div>
                                          <div class="col">
                                              <label class="form-label">종료</label>
                                              <input type="time" class="form-control" id="event-end">
                                          </div>
                                      </div>
                                      <div class="mb-1">
                                          <label class="form-label">메모</label>
                                          <textarea class="form-control" id="event-memo" rows="3" placeholder="메모(선택)"></textarea>
                                        </div>
                                        <input type="hidden" id="event-id">
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-danger me-auto d-none" id="btn-delete">삭제</button>
                                      <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                                      <button type="submit" class="btn btn-primary">저장</button>
                                  </div>
                                </form>
                              </div>
                              
                            </div>
                  </div>
                </div>
                <!-- calendar end -->
              </div>
            </td>
            <td rowspan="2" class="gadget-td gadget-side">
              <div class="gadget gadget-buttons">
                <span class="gadget-title">퀵 메뉴</span>
                <div class="quick-btn-container">
                  <a href="../approval/approvalWrite.html" class="quick-btn">
                    <div class="quick-icon">
                      <i class="bi bi-clipboard-plus"></i>
                    </div>
                    <span>기안 작성</span>
                  </a>
                  <a href="../board/boardWrite.html" class="quick-btn">
                    <div class="quick-icon">
                      <i class="bi bi-pencil-square"></i>
                    </div>
                    <span>게시글 쓰기</span>
                  </a>
                  <a  href="../schedule/scheduleWrite.html" class="quick-btn">
                    <div class="quick-icon">
                      <i class="bi bi-calendar-plus"></i>
                    </div>
                    <span>일정 등록</span>
                  </a>
                  <a href="../report/reportWrite.html" class="quick-btn">
                    <div class="quick-icon">
                      <i class="bi bi-file-earmark-plus"></i>
                    </div>
                    <span>문서 작성</span>
                  </a>
                </div>
              </div>
              <div class="gadget gadget-alarm">
                  <span  class="gadget-title">최근 알림</span>
                  <div class="alarm-container">
                    <!-- 알림 내용 start-->
                    <div class="alarm">
                      <div class="alarm-icon">
                        <i class="bi bi-file-earmark-text"></i>
                      </div>
                      <div class="alarm-contents">
                        <span>2025-09-18(목)</span>
                        <span class="alarm-note">작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.</span>
                      </div>
                    </div>
                    <!-- 알림 내용 end -->
                    <!-- 알림 내용 start-->
                    <div class="alarm">
                      <div class="alarm-icon">
                        <i class="bi bi-chat-square-dots"></i></i>
                      </div>
                      <div class="alarm-contents">
                        <span>2025-09-18(목)</span>
                        <span class="alarm-note">내 게시글에 댓글이 달렸습니다.</span>
                      </div>
                    </div>
                    <!-- 알림 내용 end -->
                    <!-- 알림 내용 start-->
                    <div class="alarm">
                      <div class="alarm-icon">
                        <i class="bi bi-file-earmark-text"></i>
                      </div>
                      <div class="alarm-contents">
                        <span>2025-09-18(목)</span>
                        <span class="alarm-note">작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.</span>
                      </div>
                    </div>
                    <!-- 알림 내용 end -->
                    <!-- 알림 내용 start-->
                    <div class="alarm">
                      <div class="alarm-icon">
                        <i class="bi bi-file-earmark-text"></i>
                      </div>
                      <div class="alarm-contents">
                        <span>2025-09-18(목)</span>
                        <span class="alarm-note">작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.작성하신 품의서 1건이 완료되었습니다.</span>
                      </div>
                    </div>
                    <!-- 알림 내용 end -->
                  </div>
               </div>
              </div>
              <div class="gadget gadget-noti">
                <span  class="gadget-title">공지사항</span>
                <a href="${pageContext.request.contextPath}/board" class="gadget-detail-btn">더 보기 
                  <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="15px"><path d="M647-440H160v-80h487L423-744l57-56 320 320-320 320-57-56 224-224Z"/>
                  </svg>
                </a>
                <div class="noti-container">
                  <!-- 공지 내용 start-->
                  <a href="${pageContext.request.contextPath}/board/boardView">
                    <div class="noti">
                      <div class="noti-icon">
                        <i class="bi bi-exclamation-diamond"></i>
                      </div>
                      <div class="noti-contents">
                        <span>2025-09-18(목)</span>
                        <span class="noti-title">공지사항 게시판 이용안내 </span>
                      </div>
                    </div>
                  </a>
                  <!-- 공지 내용 end -->
                  <!-- 공지 내용 start-->
                  <a href="${pageContext.request.contextPath}/board/boardView">
                    <div class="noti">
                      <div class="noti-icon">
                        <i class="bi bi-exclamation-diamond"></i>
                      </div>
                      <div class="noti-contents">
                        <span>2025-09-18(목)</span>
                        <span class="noti-title">법인 카드 사용안내 </span>
                      </div>
                    </div>
                  </a>
                  <!-- 공지 내용 end -->
                  <!-- 공지 내용 start-->
                  <a href="${pageContext.request.contextPath}/board/boardView">
                    <div class="noti">
                      <div class="noti-icon">
                        <i class="bi bi-exclamation-diamond"></i>
                      </div>
                      <div class="noti-contents">
                        <span>2025-09-18(목)</span>
                        <span class="noti-title">팀원 업무 배정 </span>
                      </div>
                    </div>
                  </a>
                  <!-- 공지 내용 end -->
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="gadget-td">
              <div class="gadget g-long">
                <span  class="gadget-title">결재 대기 문서</span>
                <a href="${pageContext.request.contextPath}/approval/approvalList" class="gadget-detail-btn">더 보기 
                  <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="15px"><path d="M647-440H160v-80h487L423-744l57-56 320 320-320 320-57-56 224-224Z"/>
                  </svg>
                </a>
                <div class="approval-container">
                  <div class="approval shadow-sm">
                    <span class="fs-5 fw-bold text-truncate approval-title">문서 제목입니다.</span>
                    <span class="approval-kind">기안</span>
                    <span class="approval-note">문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                      문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                    </span>
                  </div>
                  <div class="approval shadow-sm">
                    <span class="fs-5 fw-bold text-truncate approval-title">문서 제목입니다.</span>
                    <span class="approval-kind">결재</span>
                    <span class="approval-note">문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                      문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                    </span>
                  </div>
                  <div class="approval shadow-sm">
                    <span class="fs-5 fw-bold text-truncate approval-title">문서 제목입니다.</span>
                    <span class="approval-kind">결재</span>
                    <span class="approval-note">문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                      문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                    </span>
                  </div>
                  <div class="approval shadow-sm">
                    <span class="fs-5 fw-bold text-truncate approval-title">문서 제목입니다.</span>
                    <span class="approval-kind">결재</span>
                    <span class="approval-note">문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                      문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.문서내용입니다.
                    </span>
                  </div>
                </div>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
      <!-- section end -->
<%@ include file="../include/footer.jsp" %>