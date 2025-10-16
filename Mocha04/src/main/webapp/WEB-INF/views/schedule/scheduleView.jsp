<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/schedule.css"/>
<script src="${pageContext.request.contextPath}/resources/js/schedule.js"></script>
      <!-- menu start -->
        <td id="menu">
        <div>
          
          <span class="menu-title">일정관리</span>
          
          <br>
          <ul>
            <a href="${pageContext.request.contextPath}/scheduleList" class="d-block link-light text-decoration-none py-1">
            내 일정
            </a>
            <a href="${pageContext.request.contextPath}/scheduleList" class="d-block link-light text-decoration-none py-1">
              팀 일정
            </a>  
          </ul>
        </div>
      </td>
        </div>
      </td>
      <!-- menu end -->
      <!-- section start -->
      <td id="section">
        <table  class="container">
          <tr>
            <td>
            <div class="board-view">
        <h4 class="mb-3">일정 보기</h4>
           <div class="card shadow-sm mb-3">
        <div class="card-body">

          <div class="kv">
            <div class="label">일정</div>
            <div class="value"><input class="form-control" value="여름휴가" readonly></div>
          </div>

          <div class="kv">
            <div class="label">작성자</div>
            <div class="value"><input class="form-control" value="홍길동" readonly></div>
          </div>

      <!-- 일시 -->
      <div class="kv">
      <div class="label">일시</div>
      <div class="value value-inline">
        <div class="input-group">
          <span class="input-group-text material-symbols-outlined">event</span>
          <input type="date" class="form-control input-date" id="startDate" required>
        </div>

        <input type="time" class="form-control input-time" id="startTime" value="09:00">
        <span>~</span>

        <div class="input-group">
          <span class="input-group-text material-symbols-outlined">event</span>
          <input type="date" class="form-control input-date" id="endDate" required>
        </div>

        <input type="time" class="form-control input-time" id="endTime" value="18:00">
      </div>
    </div>

        <!-- 구분 -->
       <div class="kv">
        <div class="label">구분</div>
        <div class="value value-inline">
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="scope" id="scopeMine" value="mine" checked>
            <label class="form-check-label" for="scopeMine">내 일정</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="scope" id="scopeTeam" value="team">
            <label class="form-check-label" for="scopeTeam">팀 일정</label>
          </div>
        </div>
      </div>

            <!-- 내용 -->
            <div class="kv">
            <div class="label">내용</div>
            <div class="value content-box">
              경영지원팀 주간 회의
            </div>
            </div>

          </div>
          </div>
           </div>
           </div>     

          <!-- 버튼 -->
        <div class="board-actions mb-4">
          <button class="btn btn-outline-dark">
            <a href="scheduleList.html" class="d-block text-decoration-none py-1">
            목록
          </a></button>
          <button class="btn btn-outline-primary">
            <a href="scheduleModify.html" class="d-block text-decoration-none py-1">
            수정
            </a></button>
          <button class="btn  btn-outline-danger ">
            <a href="scheduleList.html" class="d-block text-decoration-none py-1">
            확인  
            </a></button>
        </div>

          </div>
          </form>
        </div>
<!-- row -->
                </div>
            </div>

        </div>
    </div>
</div>  


            </td>
          </tr>
        </table>
      </td>
    <!-- section end -->
<%@ include file="../include/footer.jsp" %>