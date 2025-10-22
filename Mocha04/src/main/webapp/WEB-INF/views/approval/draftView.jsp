<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approval.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/approvalView.js"></script>
<%@ include file="./approvalMenu.jsp"%>
<!-- section start -->
<td id="section">
	<table>
		<tr>

			<!-- contents start-->
			<br>
			<td>
				<h4 class="mb-3">기안 내용 확인</h4>

				<div class="card shadow-sm mb-3">
					<div class="card-body">

						<!-- 1) 기본 정보 -->
						<table class="table mb-4">
							<tbody>
								<tr>
									<th scope="row">작성자</th>
									<td>${approval.name}</td>
								</tr>
								<tr>
									<th scope="row">부서</th>
									<td>${approval.dept_name}</td>
								</tr>
								<tr>
									<th scope="row">직급</th>
									<td>${approval.user_rank}</td>
								</tr>
								<tr>
									<th scope="row">작성일</th>
									<td><fmt:formatDate value="${approval.created_at}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</tbody>
						</table>



						<!-- 2) 결재 입력 -->
						<table class="table mb-4">
							<tbody>
								<tr>
									<th scope="row">결재종류</th>
									<td><select class="form-select"
										aria-label="Default select example">
											<option selected>--선택--</option>
											<option value="1">연차신청</option>
											<option value="2">업무지원요청</option>
											<option value="3">예산신청</option>
											<option value="4">출장신청</option>
									</select></td>
								</tr>

								<tr>
									<th scope="row">${ item.approval_title }</th>
									<td><input class="form-control" value="여름휴가" readonly></td>
								</tr>

								<tr>
									<th scope="row">${ item.created_at }</th>
									<td>
										<div class="d-flex align-items-center gap-2">
											<div class="input-group">
												<input type="date" class="form-control input-date"
													id="startDate" required>
											</div>
											<span>~</span>
											<div class="input-group">
												<input type="date" class="form-control input-date"
													id="endDate" required>
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<th scope="row">내용</th>
									<td><textarea class="form-control" rows="4" readonly>${ item.approval_note }  
              </textarea></td>
								</tr>

								<tr>
									<th scope="row">첨부파일</th>
									<td><input type="file" id="bf-file" class="form-control"
										multiple>

										<div id="bf-file-list" class="mt-2"></div>

										<div id="bf-file-hint" class="form-text mt-1"></div></td>
								</tr>
							</tbody>
						</table>
						<!-- 3) 결재선 -->
						<h2 class="mb-3">결재선</h2>
						<div class="table-responsive">
							<table class="table table-hover table-group-divider mb-3">
								<thead>
									<tr>
										<th scope="col">단계</th>
										<th scope="col">직급</th>
										<th scope="col">결재자</th>
										<th scope="col">상태</th>
										<th scope="col">일시</th>
										<th scope="col">의견</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>팀장</td>
										<td>김철수</td>
										<td>결재대기</td>
										<td>-</td>
										<td>-</td>
									</tr>
									<tr>
										<td>2</td>
										<td>팀장</td>
										<td>김철수</td>
										<td>결재예정</td>
										<td>-</td>
										<td>-</td>
									</tr>
									<tr>
										<td>3</td>
										<td>팀장</td>
										<td>김철수</td>
										<td>결재예정</td>
										<td>-</td>
										<td>-</td>
									</tr>
								</tbody>
							</table>
						</div>



					</div>
					<!-- 4) 액션 버튼: 테이블 제거 -->
					<div class="board-actions mb-4 d-flex justify-content-center">
						<div>
							<a
								href="${pageContext.request.contextPath}/approval/reDraftWrite"
								class="btn btn-outline-dark">재상신</a> <a
								href="${pageContext.request.contextPath}/approval/draftList"
								class="btn btn-outline-dark">목록</a> <a
								href="${pageContext.request.contextPath}/approval/draftModify"
								class="btn btn-outline-dark">수정</a>

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