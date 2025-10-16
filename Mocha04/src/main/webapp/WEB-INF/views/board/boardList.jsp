<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<%@ include file="./boardMenu.jsp" %>	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />

      <!-- section start -->
      <td id="section">
        <table  class="container">
          <tr>
            <td>
            <br>
    <h4 class="mb-3">게시판</h4>
    
    <div class="search-wrap">
      <select class="form-select form-select-sm" style="width:120px;">
        <option selected>제목</option>
        <option>작성자</option>
        <option>유형</option>
        <option>기안일</option>
      </select>

      <div class="input-group input-group-sm" style="width:360px;">
        <input type="search" class="form-control" placeholder="검색어">
        <button class="btn btn-outline-secondary" type="button" title="검색">
          <span class="material-symbols-outlined" style="font-size:18px;vertical-align:middle;">search</span>
        </button>
      </div>
    </div>
    <div>
      <a href="boardList.html" class="btn btn-outline-dark">전체</a>
      <a href="boardList.html" class="btn btn-outline-dark">공지</a>
      <a href="boardList.html" class="btn btn-outline-dark">자유</a>
    </div>
    
    <hr>
    <div class="card shadow-sm mb-3">
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-hover mb-0">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td><a href="${pageContext.request.contextPath}/board/boardView" class="table-link">안녕하세요~~!!!</a></td>
                <td>홍길동</td>
                <td>2025.10.20</td>
                <td>22</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td><a href="${pageContext.request.contextPath}/board/boardView" class="table-link">안녕하세요~~!!!</a></td>
                <td>홍길동</td>
                <td>2025.10.20</td>
                <td>22</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td><a href="${pageContext.request.contextPath}/board/boardView" class="table-link">안녕하세요~~!!!</a></td>
                <td>홍길동</td>
                <td>2025.10.20</td>
                <td>22</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
          
    <div class="report-controls">
          <nav aria-label="pagination">
            <ul class="pagination pagination-sm my-1">
              <li class="page-item disabled"><span class="page-link">‹</span></li>
              <li class="page-item active"><span class="page-link">1</span></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#">…</a></li>
              <li class="page-item"><a class="page-link" href="#">10</a></li>
              <li class="page-item"><a class="page-link" href="#">›</a></li>
            </ul>
          </nav>
  </div>
</td>
 
                            
            </td>
          </tr>
        </table>
      </td>
      <!-- section end -->
<%@ include file="../include/footer.jsp" %>