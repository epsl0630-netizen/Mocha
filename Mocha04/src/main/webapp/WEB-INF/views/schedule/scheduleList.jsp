<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/schedule.css"/>
<script src="${pageContext.request.contextPath}/resources/js/schedule.js"></script>
<%@ include file="./scheduleMenu.jsp" %>
      <!-- section start -->
      <td id="section">
        <table  class="container">
         
          <tr>
          <td>
            <div class="calendar-wrapper">
               <br>
          <h4 class="mb-3">일정목록</h4>
          <br>
             <div class="calendar-card">
              <div class="card shadow-sm mb-4" id="calendar-card">
                <div class="card-header d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center gap-2">
                    <button class="btn btn-outline-secondary btn-sm" id="btn-prev">&lt;</button>
                    <h5 class="m-0" id="cal-title">2025. 09</h5>
                    <button class="btn btn-outline-secondary btn-sm" id="btn-next">&gt;</button>
                  </div>
                  <div class="mb-3 d-flex gap-2">
                    <button id="btn-filter-all" class="btn btn-sm btn-primary">전체</button>
                    <button id="btn-filter-personal" class="btn btn-sm btn-outline-primary">내 일정</button>
                    <button id="btn-filter-team" class="btn btn-sm btn-outline-primary">팀 일정</button>
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
                  <tbody id="cal-body">
                  </tbody>
                </table>
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
            <div class="row g-2 mb-3">
              <div class="mb-3">
          <label class="form-label">제목</label>
          <input type="text" class="form-control" id="event-title" placeholder="예) 주간회의" required>
        </div>
        <div class="col">
            <label class="form-label">시작일</label>
            <input type="date" class="form-control" id="event-start-date" required>
        </div>
        <div class="col">
            <label class="form-label">종료일</label>
            <input type="date" class="form-control" id="event-end-date" required>
        </div>
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
        <div class="mb-3">
          <label class="form-label">구분</label>
          <div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="event-type" id="event-type-personal" value="personal" checked>
            <label class="form-check-label" for="event-type-personal">내 일정</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="event-type" id="event-type-team" value="team">
            <label class="form-check-label" for="event-type-team">팀 일정</label>
          </div>
         </div>
       </div>
      </div>
        <div class="mb-1">
          <label class="form-label">내용</label>
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
      </td>
      </tr>
      </table>
      </td>
    </tr>
    <!-- section end -->
<%@ include file="../include/footer.jsp" %>