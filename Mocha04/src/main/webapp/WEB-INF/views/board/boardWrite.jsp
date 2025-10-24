<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="./boardMenu.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/boardWrite.js"></script>
>
<!-- ★ 추가 -->
<!-- section start -->
<td id="section">
	<table class="container gadget-container">
		<tr>
			<!-- contents start-->
			<td>
				<!-- 새 글 작성 화면 -->
				<div id="page-board-form">
					<div class="py-3">
						<h4 class="mb-3">새 게시글 작성</h4>

						<div class="border rounded-3 mt-3 me-4 p-3">
							<!-- ★ 서버 전송 설정 (action/method/enctype) -->
							<form id="board-form" class="small"
								action="${pageContext.request.contextPath}/board/boardWrite"
								method="post" enctype="multipart/form-data">

								<!-- 제목 -->
								<div class="mb-3">
									<label for="bf-title" class="form-label fw-semibold">제목</label>
									<!-- ★ name=board_title -->
									<input type="text" id="bf-title" name="board_title"
										class="form-control" placeholder="게시물 제목을 입력하세요." required>
								</div>

								<!-- 구분 -->
								<div class="mb-3">
									<div class="form-label fw-semibold">구분</div>
									<div class="d-flex align-items-center gap-3">
										<!-- ★ name=board_kind (0=공지, 1=자유) -->
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="board_kind" id="bf-notice" value="0"> <label
												class="form-check-label" for="bf-notice">전자 공지</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="board_kind" id="bf-free" value="1" checked> <label
												class="form-check-label" for="bf-free">자유 게시판</label>
										</div>
									</div>
								</div>

								<!-- 내용 -->
								<div class="mb-3">
									<label for="bf-content" class="form-label fw-semibold">내용</label>
									<!-- ★ name=board_note -->
									<textarea id="bf-content" name="board_note"
										class="form-control" rows="10" placeholder="내용을 입력하세요."
										required></textarea>
								</div>

								<!-- 첨부파일 -->
								<div class="mb-4">
									<div class="form-label fw-semibold">첨부 파일</div>
									<!-- ★ name=files (컨트롤러에서 MultipartFile[] files 로 받음) -->
									<input type="file" id="bf-file" name="files"
										class="form-control" multiple>
									<div id="bf-file-list" class="mt-2"></div>
									<div id="bf-file-hint" class="form-text mt-1">선택된 파일이 없음</div>
								</div>

								<!-- 서버 기본값 -->
								<input type="hidden" name="alarm_no" value="0" />

								<!-- 버튼 -->
								<div class="justify-content-center text-center">
									<a href="${pageContext.request.contextPath}/board/boardList"
										class="btn btn-outline-dark">목록</a> <a
										href="${pageContext.request.contextPath}/board/boardList"
										class="btn btn-outline-dark">취소</a>
									<!-- ★ 제출은 링크가 아니라 submit -->
									<button type="submit" class="btn btn-dark">완료</button>
								</div>

							</form>
						</div>
					</div>
				</div>
			</td>
			<!-- contents end-->
		</tr>
	</table>
</td>
<!-- section end -->
<%@ include file="../include/footer.jsp"%>