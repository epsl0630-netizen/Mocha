<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<%@ include file="./boardMenu.jsp" %>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
<script src="${pageContext.request.contextPath}/resources/js/boardModify.js"></script>
<!-- section start -->
      <td id="section">
        <table  class="container gadget-container">
          <tr>
            <!-- contents start-->
            <td>
              <!-- 새 글 작성 화면: 처음엔 숨김 -->
              <div id="page-board-form">
                <div class="py-3">
                  <h4 class="mb-3">게시글 수정</h4>
                  <div class="border rounded-3  mt-3 me-4 p-3">
                  <form id="board-form" class="small" enctype="multipart/form-data">
                    <!-- 제목 -->
                    <div class="mb-3">
                      <label for="bf-title" class="form-label fw-semibold">제목</label>
                      <input type="text" id="bf-title" class="form-control" placeholder="게시물 제목을 입력하세요." required>
                    </div>

                    <!-- 구분 -->
                    <div class="mb-3">
                      <div class="form-label fw-semibold">구분</div>
                      <div class="d-flex align-items-center gap-3">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="bf-board" id="bf-free" value="free" checked>
                          <label class="form-check-label" for="bf-free">자유 게시판</label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="bf-board" id="bf-notice" value="notice">
                          <label class="form-check-label" for="bf-notice">전자 공지</label>
                        </div>
                      </div>
                    </div>

                    <!-- 내용 -->
                    <div class="mb-3">
                      <label for="bf-content" class="form-label fw-semibold">내용</label>
                      <textarea id="bf-content" class="form-control" rows="10" placeholder="내용을 입력하세요." required></textarea>
                    </div>

                    <!-- 첨부파일 -->
                    <div class="mb-4">
                      <div class="form-label fw-semibold">첨부 파일</div>
                      <input type="file" id="bf-file" class="form-control" multiple>
                      <div id="bf-file-list" class="mt-2">
                       </div>
                      <div id="bf-file-hint" class="form-text mt-1">선택된 파일이 없음</div>
                    </div>
                  </div>
                  <br>
                    <!-- 버튼 -->
                   <div class="justify-content-center text-center">
                      <a href="${pageContext.request.contextPath}/board" class="btn btn-outline-dark" >목록</a>
                      <a href="${pageContext.request.contextPath}/board" class="btn btn-outline-dark">취소</a>
                      <a href="${pageContext.request.contextPath}/board/boardView" class="btn btn-outline-dark">완료</a>
                  </div>
                  </form>
                </div>
              </div>
            </td>
            <!-- contents end-->
          </tr>
        </table>
      </td>
      <!-- section end -->
<%@ include file="../include/footer.jsp" %>