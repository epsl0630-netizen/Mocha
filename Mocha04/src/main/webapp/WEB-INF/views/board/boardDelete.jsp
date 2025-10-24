<!--  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/config.jsp"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="./boardMenu.jsp"%>

<style>
.delete-container {
	max-width: 480px;
	margin: 60px auto;
	padding: 30px;
	border: 1px solid #ddd;
	border-radius: 12px;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
	background-color: #fff;
}

.delete-container h3 {
	font-weight: 600;
	margin-bottom: 20px;
}

.delete-container p {
	margin-bottom: 30px;
	color: #555;
}

.btn-group {
	display: flex;
	justify-content: center;
	gap: 12px;
}
</style>

<div class="delete-container">
	<h3>게시글 삭제</h3>
	<p>
		정말로 <strong>이 게시글</strong>을 삭제하시겠습니까?
	</p>

	<form action="${pageContext.request.contextPath}/board/deleteConfirm"
		method="post">
		<input type="hidden" name="board_no" value="${param.board_no}" />
		<div class="btn-group">
			<button type="submit" class="btn btn-danger">삭제</button>
			<a href="${pageContext.request.contextPath}/board/boardList"
				class="btn btn-secondary">취소</a>
		</div>
	</form>
</div>

<%@ include file="../include/footer.jsp"%>
-->