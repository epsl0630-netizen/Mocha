<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/config.jsp"%>
<%@ include file="./boardMenu.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css" />

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<td id="section">
	<table class="container gadget-container">
		<tr>
			<td>
				<table class="table mb-4">
					<tbody>
						<tr>
							<th scope="row">작성자</th>
							<td><c:out value="${item.user_id}" /></td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td><c:choose>
									<c:when test="${item.created_at != null}">
										<div>${item.created_at}</div>
									</c:when>
									<c:otherwise>
										<c:out value="${item.created_at}" />
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<th scope="row">글번호</th>
							<td><c:out value="${item.board_no}" /></td>
						</tr>
					</tbody>
				</table>

				<table class="table mb-4">
					<tbody>
						<tr>
							<th scope="row">게시글 종류</th>
							<td>
								<div class="d-flex flex-wrap align-items-center">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" disabled
											<c:if test="${item.board_kind == '0'}">checked</c:if> /> <label
											class="form-check-label">공지사항</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" disabled
											<c:if test="${item.board_kind == '1'}">checked</c:if> /> <label
											class="form-check-label">자유게시판</label>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row">제목</th>
							<td><strong><c:out value='${item.board_title}' /></strong></td>
						</tr>

						<tr>
							<th scope="row">내용</th>
							<td>
								<div class="p-2 border rounded"
									style="min-height: 150px; white-space: pre-wrap;">
									<c:out value="${item.board_note}" />
								</div>
							</td>
						</tr>

						<tr>
							<th scope="row">첨부파일</th>
							<td><c:choose>
									<c:when test="${not empty atts}">
										<ul class="mb-0 list-unstyled">
											<c:forEach var="a" items="${atts}">
												<li><a href="/upload${a.path}/${a.pname}"
													download="${a.fname}"> <c:out value="${a.fname}" />
												</a> <span class="text-muted small"> (<c:out
															value="${a.mime_type}" /> / <c:out
															value="${a.file_size}" /> bytes)
												</span></li>
											</c:forEach>
										</ul>
									</c:when>
									<c:otherwise>
										<div class="form-text">첨부파일 없음</div>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</tbody>
				</table>

				<div class="justify-content-center text-center">
					<a href="${cpath}/board/boardList" class="btn btn-outline-dark">목록</a>

					<c:if test="${sessionScope.loggedUser.user_id == item.user_id}">
						<a href="${cpath}/board/boardModify?id=${item.board_no}"
							class="btn btn-outline-dark">수정</a>

						<button type="button" class="btn btn-danger"
							onclick="deleteBoard(${item.board_no})">삭제</button>
					</c:if>
				</div>

				<div class="comment-area mt-4">
					<h6 class="mb-3 border-bottom pb-2" id="comment-count">댓글 0개</h6>
					<div class="comment-list mb-4" id="comment-list"></div>
					<h6 class="mb-3">댓글 작성</h6>
					<form class="d-flex gap-2" id="comment-form"
						onsubmit="return false;">
						<input type="text" class="form-control form-control-lg"
							id="comment-input" placeholder="댓글을 입력하세요" required>
						<button type="submit" class="btn btn-outline-dark flex-shrink-0">작성</button>
					</form>
				</div>
			</td>
		</tr>
	</table>
</td>

<script>
	/**
	 * 게시글 삭제 처리를 위한 POST 요청을 동적으로 생성하고 제출하는 함수
	 * @param {string} boardNo - 삭제할 게시글 번호
	 */
	function deleteBoard(boardNo) {
		// 사용자에게 정말 삭제할 것인지 확인
		if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
			
			// 1. 폼(Form)을 동적으로 생성
			const form = document.createElement('form');
			form.setAttribute('method', 'post');
			form.setAttribute('action', '${cpath}/board/boardDelete'); 
	
			// 2. 게시글 번호를 Hidden 필드로 추가
			const idField = document.createElement('input');
			idField.setAttribute('type', 'hidden');
			idField.setAttribute('name', 'id'); // Controller에서 받을 파라미터 이름
			idField.setAttribute('value', boardNo);
			form.appendChild(idField);
	
			// 3. 폼을 문서에 추가하고 제출 (POST 요청 발생)
			document.body.appendChild(form);
			form.submit();
		}
	}
</script>
<%@ include file="../include/footer.jsp"%>