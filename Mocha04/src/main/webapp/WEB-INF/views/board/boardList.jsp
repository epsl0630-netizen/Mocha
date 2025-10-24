<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/config.jsp"%>
<%@ include file="./boardMenu.jsp"%>

<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />

<!-- section start -->
<td id="section">
	<table class="container">
		<tr>
			<td><br />
				<h4 class="mb-3">게시판</h4> <!-- 검색 -->
				<form method="get"
					action="${pageContext.request.contextPath}/board/boardList"
					class="search-wrap"
					style="display: flex; gap: 8px; align-items: center;">
					<select name="type" class="form-select form-select-sm"
						style="width: 120px;">
						<!-- 서버에서 지원하는 옵션만 남김: title / note / kind -->
						<option value="title" ${type=='title' ? 'selected' : ''}>제목</option>
						<option value="note" ${type=='note'  ? 'selected' : ''}>내용</option>
						<option value="kind" ${type=='kind'  ? 'selected' : ''}>유형</option>
					</select>

					<div class="input-group input-group-sm" style="width: 360px;">
						<input type="search" name="keyword" value="${keyword}"
							class="form-control" placeholder="검색어" />
						<button class="btn btn-outline-secondary" type="submit" title="검색">
							<span class="material-symbols-outlined"
								style="font-size: 18px; vertical-align: middle;">search</span>
						</button>
					</div>
				</form> <!-- 유형 필터 -->
				<div class="my-2" style="display: flex; gap: 6px;">
					<a
						href="${pageContext.request.contextPath}/board/boardList?page=1&size=${size}"
						class="btn btn-outline-dark btn-sm ${empty kind ? 'active' : ''}">전체</a>
					<a
						href="${pageContext.request.contextPath}/board/boardList?kind=0&page=1&size=${size}&type=${type}&keyword=${keyword}"
						class="btn btn-outline-dark btn-sm ${kind == 0 ? 'active' : ''}">공지</a>
					<a
						href="${pageContext.request.contextPath}/board/boardList?kind=1&page=1&size=${size}&type=${type}&keyword=${keyword}"
						class="btn btn-outline-dark btn-sm ${kind == 1 ? 'active' : ''}">자유</a>
				</div>

				<hr /> <!-- 목록 -->
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
									<!-- ★ 여기: items="${items}" 로 수정 -->
									<c:forEach var="b" items="${items}">
										<tr>
											<th scope="row">${b.board_no}</th>
											<td><a
												href="${pageContext.request.contextPath}/board/boardView?board_no=${b.board_no}"
												class="table-link"> <c:out value="${b.board_title}" />
											</a></td>
											<td><c:out value="${b.user_id}" /></td>
											<td><c:choose>
													<c:when test="${not empty b.created_at}">
														<fmt:formatDate value="${b.created_at}"
															pattern="yyyy-MM-dd HH:mm" />
													</c:when>
													<c:otherwise>-</c:otherwise>
												</c:choose></td>
											<td style="text-align: center;">
												<form
													action="${pageContext.request.contextPath}/board/boarDdelete"
													method="post" style="display: inline;">
													<input type="hidden" name="board_no" value="${b.board_no}" />
													<button type="submit" class="btn btn-sm btn-outline-danger"
														onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
												</form>
											</td>
										</tr>
									</c:forEach>


									<c:if test="${empty items}">
										<tr>
											<td colspan="5" class="text-center">데이터가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div> <!-- 페이지네이션 --> <c:if test="${totalPages > 0}">
					<nav aria-label="pagination">
						<ul class="pagination pagination-sm my-1">
							<!-- 이전 -->
							<li class="page-item ${page == 1 ? 'disabled' : ''}"><a
								class="page-link"
								href="${cpath}/board/boardList?page=${page-1}&size=${size}&type=${type}&keyword=${keyword}">‹</a>
							</li>

							<!-- 페이지 번호 -->
							<c:forEach var="p" begin="1" end="${totalPages}">
								<li class="page-item ${p == page ? 'active' : ''}"><a
									class="page-link"
									href="${cpath}/board/boardList?page=${p}&size=${size}&type=${type}&keyword=${keyword}">${p}</a>
								</li>
							</c:forEach>

							<!-- 다음 -->
							<li class="page-item ${page == totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${cpath}/board/boardList?page=${page+1}&size=${size}&type=${type}&keyword=${keyword}">›</a>
							</li>
						</ul>
					</nav>
				</c:if></td>
		</tr>
	</table>
</td>
<!-- section end -->

<script>
	/* $(document).ready(function() {
	 // 1. 페이지 로드 시 기존 댓글을 로드합니다.
	 loadComments();

	 // 2. 댓글 작성 폼 제출 이벤트 핸들러
	 // 폼 ID를 'commentForm'으로 설정했습니다.
	 $("#commentForm").on("submit", function(event) {
	 event.preventDefault(); // 기본 폼 제출 방지

	 const boardNo = $("#boardNo").val();
	 const commentContent = $("#comment-input").val().trim();
	
	 if (commentContent === "") {
	 alert("댓글 내용을 입력해주세요.");
	 return;
	 }

	 // 실제 서버 API 주소로 변경해야 합니다. (예: /api/comment/add)
	 const commentUrl = "${cpath}/api/comment/add"; 
	
	 // AJAX를 사용하여 댓글을 서버로 전송합니다.
	 $.ajax({
	 url: commentUrl,
	 type: "POST",
	 contentType: "application/json",
	 // 서버에 보낼 데이터 (user_id는 세션에서 가져와야 함. 여기서는 예시 값)
	 data: JSON.stringify({
	 board_no: boardNo,
	 user_id: "${sessionScope.loggedUser.user_id}", // 실제 세션 변수명 사용
	 content: commentContent
	 }),
	 success: function(response) {
	 // 성공적으로 댓글이 등록되면
	 alert("댓글이 등록되었습니다.");
	 $("#comment-input").val(""); // 입력창 초기화
	 loadComments(); // 댓글 목록을 새로고침
	 },
	 error: function(xhr, status, error) {
	 // 에러 처리
	 console.error("댓글 등록 실패:", error);
	 alert("댓글 등록에 실패했습니다. (로그인 상태 확인)");
	 }
	 });
	 });
	 }); */

	/**
	 * 게시글에 달린 댓글 목록을 AJAX로 가져와서 표시하는 함수
	 */
	/* 
	function loadComments() {
	    const boardNo = $("#boardNo").val();
	    // 실제 서버 API 주소로 변경해야 합니다. (예: /api/comment/list?boardId=...)
	    const listUrl = "${cpath}/api/comment/list?boardId=" + boardNo;
	    
	    $.ajax({
	        url: listUrl,
	        type: "GET",
	        dataType: "json",
	        success: function(comments) {
	            let html = '';
	            
	            // 댓글이 없을 경우
	            if (comments.length === 0) {
	                html = '<p class="text-muted text-center">아직 댓글이 없습니다.</p>';
	            } else {
	                // 댓글 목록을 순회하며 HTML을 생성합니다.
	                comments.forEach(function(comment) {
	                    // 서버에서 받은 댓글 DTO 구조에 맞게 필드명을 수정하세요.
	                    const dateStr = new Date(comment.created_at).toLocaleString('ko-KR');

	                    html += `
	                        <div class="card card-body bg-light mb-2">
	                            <div class="d-flex justify-content-between align-items-center">
	                                <strong class="text-primary">${comment.user_id}</strong>
	                                <span class="text-muted small">${dateStr}</span>
	                            </div>
	                            <p class="mb-0 mt-1" style="white-space: pre-wrap;">${comment.content}</p>
	                        </div>
	                    `;
	                });
	            }
	            
	            $("#comment-count").text(`댓글 ${comments.length}개`);
	            $("#comment-list").html(html);
	        },
	        error: function(xhr, status, error) {
	            console.error("댓글 목록 로드 실패:", error);
	            $("#comment-list").html('<p class="text-danger text-center">댓글 목록을 불러오지 못했습니다.</p>');
	        }
	    });
	} */
</script>
<%@ include file="../include/footer.jsp"%>