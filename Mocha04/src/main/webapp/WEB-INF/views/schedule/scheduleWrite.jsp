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
          <a href="scheduleWrite.html" class="btn btn-outline-light">일정등록</a>
          <br><br>
          <ul>
            <li><a href="scheduleList.html" class="d-block link-light text-decoration-none py-1">
            일정목록
            </a></li>
          </ul>
           <br><br>
          <span class="menu-title">관리자 일정관리</span>
          <br>
            <ul>
              <li><a href="addminScheduleList.html"  class="d-block link-light text-decoration-none py-1">전체일정관리</a></li>
            </ul>
          <br> 
        </div>
      </td>
      <!-- menu end -->
      <!-- section start -->
      <td id="section">
        <table  class="container">
          <br>
          <tr>
            <td>
            <div class="board-view">
        <h4 class="mb-3">일정 작성</h4>
           <div class="card shadow-sm mb-3">
        <div class="card-body">

          <div class="kv">
            <div class="label">제목</div>
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
          <input type="date" class="form-control input-date" id="startDate" required>
        </div>

        <input type="time" class="form-control input-time" id="startTime" value="09:00">
        <span>~</span>

        <div class="input-group">
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
        <div class="board-actions mb-4 d-flex justify-content-center">
          <a href="scheduleList.html" class="btn btn-outline-dark me-2">목록 </a>
          <a href="scheduleList.html" class="btn btn-outline-dark me-2">취소</a>
          <a href="scheduleList.html" class="btn btn-outline-dark">완료</a>
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