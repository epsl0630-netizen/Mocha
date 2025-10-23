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
							<form id="scheduleSearchFrm" onsubmit="return ShowSchedule();" method="get">
								<div class="card-body">
										<div class="row mb-3 align-items-center">
											<label for="search-date" class="col-md-2 col-form-label">검색
												기간
											</label>
											<div class="col-md-4">
												<div class="input-group">
													<input type="date" class="form-control" id="start-date" name="start_at"> <span class="input-group-text">~</span>
													<input type="date" class="form-control" id="end-date" name="end_at">
												</div>
											</div>
										</div>
										<div class="row mb-3 align-items-center">
											<label for="approval-form" class="col-md-2 col-form-label">일정
												구분</label>
											<div class="col-md-4">
												<select class="form-select" id="schedule_kind" name="schedule_kind">
													<option value="all">전체</option>
													<option value="personal">내일정</option>
													<option value="team">팀일정</option>
												</select>
											</div>
										</div>
										<div class="row mb-3">
											<label for="drafter" class="col-md-2 col-form-label">작성자</label>
											<div class="col-md-10">
												<input type="text" class="form-control" name="name">
											</div>
										</div>
										<div class="row mb-3">
											<label for="drafter-dept" class="col-md-2 col-form-label">부서</label>
											<div class="col-md-4">
												<select class="form-select" id="drafter-dept" name="dept_id">
														<option value="0">전체</option>
													<c:forEach begin="0" var="item" items="${departList}"  varStatus="status">
			                          					<option value="${item.dept_id}">${item.dept_name} 팀</option>
		                        					</c:forEach>
												</select>
											</div>
										</div>
										<div class="row mb-3">
											<label for="title" class="col-md-2 col-form-label">제목</label>
											<div class="col-md-10">
												<input type="text" class="form-control" id="title" name="schedule_title">
											</div>
										</div>
								</div>
								<div class="card-footer text-center mt-5">
									<button type="submit" class="btn btn-primary me-2">조회</button>
									<button type="reset"  class="btn btn-secondary">초기화</button>
								</div>
							</form>
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
												<th scope="col">부서</th>
												<th scope="col">유형</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">등록일시</th>
											</tr>
										</thead>
										<tbody id="adminScheduleList">
										
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