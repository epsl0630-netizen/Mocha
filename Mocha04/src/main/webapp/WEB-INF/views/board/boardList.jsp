<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/config.jsp"%>
<%@ include file="./boardMenu.jsp"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${cpath}/resources/css/board.css" />

<!-- section start -->
<td id="section">
	<table class="container">
		<tr>
			<td><br />
				<h4 class="mb-3">게시판</h4> <!-- 검색 -->
				<form method="get" action="${cpath}/board/boardList" class="search-wrap"
					style="display: flex; gap: 8px; align-items: center;">
					<select name="type" class="form-select form-select-sm"
						style="width: 120px;">
						<option value="title" ${type=='title'   ? 'selected' : ''}>제목</option>
						<option value="writer" ${type=='writer'  ? 'selected' : ''}>작성자</option>
						<option value="kind" ${type=='kind'    ? 'selected' : ''}>유형</option>
						<option value="created" ${type=='created' ? 'selected' : ''}>기안일</option>
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
					<a href="${cpath}/board/boardList" class="btn btn-outline-dark btn-sm">전체</a>
					<a href="${cpath}/board/boardList?kind=공지" class="btn btn-outline-dark btn-sm">공지</a> 
					<a href="${cpath}/board/boardList?kind=자유" class="btn btn-outline-dark btn-sm">자유</a>
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
									<c:forEach var="b" items="${list}">
										<tr>
											<th scope="row">${b.board_no}</th>
											<td><a href="${cpath}/board/${b.board_no}"
												class="table-link"> <c:out value="${b.board_title}" />
											</a></td>
											<td><c:out value="${b.user_id}" /></td>
											<td><c:out value="${b.created_at}" /></td>
											<td><c:choose>
													<c:when test="${not empty b.view_cnt}">${b.view_cnt}</c:when>
													<c:otherwise>0</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>

									<c:if test="${empty list}">
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
									href="${cpath}/board/list?page=${p}&size=${size}&type=${type}&keyword=${keyword}">${p}</a>
								</li>
							</c:forEach>

							<!-- 다음 -->
							<li class="page-item ${page == totalPages ? 'disabled' : ''}">
								<a class="page-link"
								href="${cpath}/board/list?page=${page+1}&size=${size}&type=${type}&keyword=${keyword}">›</a>
							</li>
						</ul>
					</nav>
				</c:if></td>
		</tr>
	</table>
</td>
<!-- section end -->
<%@ include file="../include/footer.jsp"%>
