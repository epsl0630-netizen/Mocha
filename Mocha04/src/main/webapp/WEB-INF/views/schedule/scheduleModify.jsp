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
            <div class="board-view">
        <h4 class="mb-3">일정 작성</h4>
           <div class="card shadow-sm mb-3">
        <div class="card-body">

          <div class="kv">
            <div class="label">일정</div>
            <div class="value"><input class="form-control" value=""></div>
          </div>

          <div class="kv">
            <div class="label">작성자</div>
            <div class="value"><input class="form-control" value="" ></div>
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
              <textarea class="form-control" id="memo" rows="10" placeholder="내용을 입력하세요."></textarea>
            </div>
          </div>
           </div>
           </div>     

          <!-- 버튼 -->
         <div class="board-actions mb-4">
          <button class="btn btn-outline-dark">
            <a href="${pageContext.request.contextPath}/schedule/scheduleList" class="d-block text-decoration-none py-1">
            목록
          </a></button>
          <button class="btn btn-outline-primary">
            <a href="${pageContext.request.contextPath}/schedule/scheduleList" class="d-block text-decoration-none py-1">
            취소
            </a></button>
          <button class="btn  btn-outline-danger ">
            <a href="${pageContext.request.contextPath}/schedule/scheduleView" class="d-block text-decoration-none py-1">
            수정 
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