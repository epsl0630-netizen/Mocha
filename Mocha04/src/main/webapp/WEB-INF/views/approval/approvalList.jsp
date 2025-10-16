<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<%@ include file="./approvalMenu.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval.css" />

      <!-- section start -->
      <td id="section">
     <div class="container">

    <!-- 결재 대진행중 문서 -->
    <br>
    <h4 class="mb-3">결재 문서함</h4>
    
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
      <a href="approvalList.html" class="btn btn-outline-dark">전체</a>
      <a href="approvalWaitList.html" class="btn btn-outline-dark">진행중</a>
      <a href="approvalOkList.html" class="btn btn-outline-dark">승인</a>
      <a href="approvalRejectList.html" class="btn btn-outline-dark">반려</a>
    </div>
    
    <hr>
    <div class="card shadow-sm mb-3">
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-hover mb-0">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">기안일</th>
                <th scope="col">마감일</th>
                <th scope="col">유형</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">결재상태</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>2025-09-17</td><td>2025-09-17</td>
                <td>연차신청</td>
                <td><a href="${pageContext.request.contextPath}/approval/approvalView" class="table-link"> 신청서 [재상신 1] </a></td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-success" >진행중</button></td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>2025-09-17</td>
                <td>2025-09-17</td>
                <td>예산신청</td>
                <td>예산신청</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-primary">승인</button></td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>2025-09-18</td>
                <td>2025-09-18</td>
                <td>연차신청</td>
                <td>연차신청서</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-danger">반려</button></td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>2025-09-18</td>
                <td>2025-09-18</td>
                <td>연차신청</td>
                <td>연차신청서</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-success">진행중</button></td>
              </tr><tr>
                <th scope="row">5</th>
                <td>2025-09-18</td>
                <td>2025-09-18</td>
                <td>연차신청</td>
                <td>연차신청서</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-success">진행중</button></td>
              </tr><tr>
                <th scope="row">6</th>
                <td>2025-09-18</td>
                <td>2025-09-18</td>
                <td>연차신청</td>
                <td>연차신청서</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-success">진행중</button></td>
              </tr><tr>
                <th scope="row">7</th>
                <td>2025-09-18</td>
                <td>2025-09-18</td>
                <td>연차신청</td>
                <td>연차신청서</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-success">진행중</button></td>
              </tr><tr>
                <th scope="row">8</th>
                <td>2025-09-18</td>
                <td>2025-09-18</td>
                <td>연차신청</td>
                <td>연차신청서</td>
                <td>홍길동</td>
                <td><button type="button" class="btn btn-outline-danger">반려</button></td>
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

            <!-- contents end-->
          </tr>
        </table>
      </td>
      <!-- section end -->
    </tr>
    <tr>
      <td colspan="3" id="footer">
        Copyright © Mocha company
      </td>
    </tr>
  </table>
</body>
</html>