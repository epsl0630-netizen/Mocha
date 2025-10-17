<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<%@ include file="./boardMenu.jsp" %>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />

      <!-- section start -->
      <td id="section">
        <table  class="container gadget-container">
          <tr>
            <!-- contents start-->
            <td>
              <!-- 게시판 글 보기 -->
               <table class="table mb-4">
                <tbody>
                  <tr><th scope="row">작성자</th><td>홍길동</td></tr>
                  <tr><th scope="row">부서</th><td>경영지원팀</td></tr>
                  <tr><th scope="row">직급</th><td>사원</td></tr>
                </tbody>
              </table>

        <!-- 2) 결재 입력 -->
        <table class="table mb-4">
          <tbody>
            <tr>
              <th scope="row">게시글종류</th>
             <td>
              <div class="row ">
                  <div class="col-md-10 d-flex flex-wrap align-items-center">
                      <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="board-type" id="doc-general" value="General">
                          <label class="form-check-label" for="doc-general">공지사항</label>
                      </div>
                      <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="board-type" id="doc-receipt" value="Receipt" checked>
                          <label class="form-check-label" for="doc-receipt">자유게시판</label>
                      </div>
                  </div>
              </div>
             </td>
            </tr> 

            <tr>
              <th scope="row">제목</th>
              <td><input class="form-control" value="안녕하세요!!!!!!!!!!" readonly></td>
            </tr>

            <tr>
              <th scope="row">내용</th>
              <td><textarea class="form-control" rows="4" readonly>내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.내용입니다.</textarea></td>
            </tr>

            <tr>
            <th scope="row">첨부파일</th>
            <td>
                <input type="file" id="bf-file" class="form-control" multiple>

                <div id="bf-file-list" class="mt-2">
                    </div>

                <div id="bf-file-hint" class="form-text mt-1">파일을 여러 개 선택할 수 있습니다.</div>
            </td>
            </tr>
          </tbody>
        </table>

                <!-- 버튼 -->
                <div class="justify-content-center text-center">
                      <a href="${pageContext.request.contextPath}/board/boardList" class="btn btn-outline-dark" >목록</a>
                      <a href="${pageContext.request.contextPath}/board/boardModify" class="btn btn-outline-dark">수정</a>
                      <a href="${pageContext.request.contextPath}/board" class="btn btn-outline-dark">완료</a>
                  </div>

                <!-- 댓글 -->
                <div class="comment-area">
                  <h6 class="mb-3 border-bottom pb-2" id="comment-count">댓글 0개</h6>

                  <div class="comment-list mb-4" id="comment-list">
                      <!-- 댓글 아이템들이 여기에 동적으로 삽입됩니다. -->
                  </div>
                  
                  <h6 class="mb-3">댓글 작성</h6>
                  <form class="d-flex gap-2" id="comment-form">
                      <input type="text" class="form-control form-control-lg" id="comment-input" placeholder="댓글을 입력하세요" required>
                      <button type="submit" class="btn btn-outline-dark flex-shrink-0">작성</button>
                  </form>
              </div>

              <!-- /게시판 글 보기 -->
            </td>
            <!-- contents end-->
          </tr>
        </table>
      </td>
      <!-- section end -->
<%@ include file="../include/footer.jsp" %>