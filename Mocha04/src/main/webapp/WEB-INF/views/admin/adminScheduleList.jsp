<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval.css"/>
<script src="${pageContext.request.contextPath}/resources/js/adminScheduleList.js"></script>
<%@ include file="./adminMenu.jsp" %>
    <!-- section start -->
			<td id="section">
				<div class="container">
					<!-- 결재 대기 문서 -->
					<br>
					<h4 class="mb-3">관리자 일정관리</h4>
					<br>
					<div class="container py-4">
						<h2 class="mb-5">전체 일정 조회</h2>
						<div class="card shadow-sm">
							<div class="card-body">
								<div class="row mb-3 align-items-center">
									<label for="search-date" class="col-md-2 col-form-label">검색
										기간</label>
									<div class="col-md-4">
										<div class="input-group">
											<input type="date" class="form-control" id="start-date"
												value="2025-09-27"> <span class="input-group-text">~</span>
											<input type="date" class="form-control" id="end-date"
												value="2025-10-04">
										</div>
									</div>
								</div>
								<div class="row mb-3 align-items-center">
									<label for="approval-form" class="col-md-2 col-form-label">일정
										구분</label>
									<div class="col-md-4">
										<select class="form-select" id="approval-form">
											<option selected>선택</option>
											<option value="1">전체</option>
											<option value="2">내일정</option>
											<option option="3">팀일정</option>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="drafter" class="col-md-2 col-form-label">작성자</label>
									<div class="col-md-10">
										<input type="text" class="form-control" id="drafter" value="">
									</div>
								</div>
								<div class="row mb-3">
									<label for="drafter-dept" class="col-md-2 col-form-label">부서</label>
									<div class="col-md-10">
										<input type="text" class="form-control" id="drafter-dept">
									</div>
								</div>
								<div class="row mb-3">
									<label for="doc-num" class="col-md-2 col-form-label">글번호</label>
									<div class="col-md-10">
										<input type="text" class="form-control" id="doc-num">
									</div>
								</div>
								<div class="row mb-3">
									<label for="title" class="col-md-2 col-form-label">제목</label>
									<div class="col-md-10">
										<input type="text" class="form-control" id="title">
									</div>
								</div>
								<hr class="my-4">
								<div class="row mb-3">
									<label class="col-md-2 col-form-label">일정 구분</label>
									<div class="col-md-10 d-flex flex-wrap align-items-center pt-2">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" id="doc-all"
												value="All"> <label class="form-check-label"
												for="doc-all">전체</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox"
												id="doc-general" value="General"> <label
												class="form-check-label" for="doc-general">내 일정</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox"
												id="doc-receipt" value="Receipt"> <label
												class="form-check-label" for="doc-receipt">팀 일정</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer text-center">
							<button class="btn btn-primary me-2">조회</button>
							<button class="btn btn-secondary">초기화</button>
						</div>
						<div>
							<a href="approvalList.html" class="btn btn-outline-dark">삭제</a> <a
								href="approvalWaitList.html" class="btn btn-outline-dark">보기</a>
							<a href="approvalOkList.html" class="btn btn-outline-dark">수정</a>
						</div>
						<hr>
						<div class="card shadow-sm mb-3">
							<div class="card-body p-0">
								<div class="table-responsive">
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th scope="col" class="text-center" style="width: 50px;">
													<input class="form-check-input" type="checkbox"
													id="selectAll">
												</th>
												<th scope="col" style="width: 60px;">번호</th>
												<th scope="col">기안일</th>
												<th scope="col">마감일</th>
												<th scope="col">유형</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">등록일시</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-center"><input class="form-check-input"
													type="checkbox" name="selectDoc"></td>
												<th scope="row">1</th>
												<td>2025-09-17</td>
												<td>2025-09-17</td>
												<td>내일정</td>
												<td>주간회의</a></td>
												<td>홍길동</td>
												<td>2025.10.01 09:00</td>
											</tr>
											<tr>
												<td class="text-center"><input class="form-check-input"
													type="checkbox" name="selectDoc"></td>
												<th scope="row">2</th>
												<td>2025-09-17</td>
												<td>2025-09-17</td>
												<td>내일정</td>
												<td>예산신청</td>
												<td>홍길동</td>
												<td>2025.10.01 09:00</td>
											</tr>
											<tr>
												<td class="text-center"><input class="form-check-input"
													type="checkbox" name="selectDoc"></td>
												<th scope="row">3</th>
												<td>2025-09-18</td>
												<td>2025-09-18</td>
												<td>내일정</td>
												<td>연차신청서</td>
												<td>홍길동</td>
												<td>2025.10.01 09:00</td>
											</tr>
											<tr>
												<td class="text-center"><input class="form-check-input"
													type="checkbox" name="selectDoc"></td>
												<th scope="row">4</th>
												<td>2025-09-18</td>
												<td>2025-09-18</td>
												<td>내일정</td>
												<td>연차신청서</td>
												<td>홍길동</td>
												<td>2025.10.01 09:00</td>
											</tr>
											<tr>
												<td class="text-center"><input class="form-check-input"
													type="checkbox" name="selectDoc"></td>
												<th scope="row">5</th>
												<td>2025-09-18</td>
												<td>2025-09-18</td>
												<td>내일정</td>
												<td>연차신청서</td>
												<td>홍길동</td>
												<td>2025.10.01 09:00</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
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
		</tr>
		<!-- section end -->
<%@ include file="../include/footer.jsp" %>