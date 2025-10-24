<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="./boardMenu.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/boardModify.js"></script>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<td id="section">
	<table class="container gadget-container">
		<tr>
			<td>
				<div id="page-board-form">
					<div class="py-3">
						<h4 class="mb-3">게시글 수정</h4>
						<div class="border rounded-3 mt-3 me-4 p-3">

							<form id="board-form" class="small" method="post"
								action="${pageContext.request.contextPath}/board/boardUpdate"
								enctype="multipart/form-data">

								<input type="hidden" name="board_no" value="${item.board_no}" />
								<input type="hidden" name="user_id" value="${item.user_id}" />

								<div class="mb-3">
									<label for="bf-title" class="form-label fw-semibold">제목</label>
									<input type="text" name="board_title" id="bf-title"
										class="form-control"
										value="<c:out value='${item.board_title}'/>"
										placeholder="게시물 제목을 입력하세요." required>
								</div>

								<div class="mb-3">
									<div class="form-label fw-semibold">구분</div>
									<div class="d-flex align-items-center gap-3">
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="board_kind" id="bf-free" value="1"
												${item.board_kind == '1' ? 'checked' : ''}> <label
												class="form-check-label" for="bf-free">자유 게시판</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="board_kind" id="bf-notice" value="0"
												${item.board_kind == '0' ? 'checked' : ''}> <label
												class="form-check-label" for="bf-notice">전자 공지</label>
										</div>

									</div>
								</div>

								<div class="mb-3">
									<label for="bf-content" class="form-label fw-semibold">내용</label>
									<textarea name="board_note" id="bf-content"
										class="form-control" rows="10" placeholder="내용을 입력하세요."
										required><c:out value="${item.board_note}" /></textarea>
								</div>

								<div class="mb-4">
									<div class="form-label fw-semibold">첨부 파일</div>
									<input type="file" name="files" id="bf-file"
										class="form-control" multiple>

									<div id="bf-file-list" class="mt-2">
										<c:if test="${not empty atts}">
											<p class="mb-1 fw-semibold small">현재 첨부된 파일:</p>
											<ul class="list-unstyled small">
												<c:forEach var="a" items="${atts}">
													<li><a href="/upload${a.path}/${a.pname}"
														download="${a.fname}"> <c:out value="${a.fname}" />
													</a></li>
												</c:forEach>
											</ul>
										</c:if>
									</div>
									<div id="bf-file-hint" class="form-text mt-1">새로운 파일을
										추가하거나 기존 파일을 삭제/교체할 수 있습니다.</div>
								</div>
						</div>
						<br>
						<div class="justify-content-center text-center">
							<a href="${cpath}/board/boardList" class="btn btn-outline-dark">목록</a>
							<a href="${cpath}/board/boardView?id=${item.board_no}"
								class="btn btn-outline-secondary">취소</a>
							<button type="submit" class="btn btn-primary">수정 완료</button>
						</div>
						</form>
					</div>
				</div>
			</td>
		</tr>
	</table>
</td>
<%@ include file="../include/footer.jsp"%>