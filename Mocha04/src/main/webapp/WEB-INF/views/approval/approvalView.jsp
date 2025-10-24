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
				<h4 class="mb-3">결재 내용 확인</h4>

				<div class="card shadow-sm mb-3">
					<div class="card-body">

						<!-- 1) 기본 정보 -->
						<table class="table mb-4">
							<tbody>
								<tr>
								<input type="hidden" name="item" value="${item}" />
									<th scope="row">작성자</th>
									<td>${ item.name }</td>
								</tr>
								<tr>
									<th scope="row">부서</th>
									<td>${ item.dept_name }</td>
								</tr>
								<tr>
									<th scope="row">직급</th>
									<td>${ item.user_rank }</td>
								</tr>
								<tr>
									<th scope="row">작성일</th>
									<td>${ item.created_at }</td>
								</tr>
							</tbody>
						</table>



						<!-- 2) 결재 입력 -->
						<table class="table mb-4">
							<tbody>
								<tr>
									<th scope="row">결재종류</th>
									<td><select class="form-select" disabled="disabled"
										aria-label="Default select example">
											<option selected>--선택--</option>
											<option value="1" ${item.approval_kind == 1 ? 'selected' : ''}>연차신청</option>
											<option value="2" ${item.approval_kind == 2 ? 'selected' : ''}>업무지원요청</option>
											<option value="3" ${item.approval_kind == 3 ? 'selected' : ''}>예산신청</option>
											<option value="4" ${item.approval_kind == 4 ? 'selected' : ''}>출장신청</option>
									</select></td>
								</tr>

								<tr>
									<th scope="row">결재명</th>
									<td><input class="form-control" value="여름휴가" readonly></td>
								</tr>

								<tr>
									<th scope="row">기간</th>
									<td>
										<div class="d-flex align-items-center gap-2">
											<div class="input-group">
												<input type="date" class="form-control input-date"
													id="startDate" required value="${item.created_at}">
											</div>
											<span>~</span>
											<div class="input-group">
												<input type="date" class="form-control input-date"
													id="endDate" required value="${item.end_at}">
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<th scope="row">내용</th>
									<td><textarea class="form-control" rows="4" readonly>${item.approval_note}</textarea></td>
								</tr>

								<tr>
									<th scope="row">첨부파일</th>
									<td><input type="file" disabled="disabled" id="bf-file" class="form-control"
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
									<form action="" method="post">
										<c:forEach var="applover" items="${apploverList}" varStatus="status">
											<c:if test="${status.index == 0}">
												<input name="approver_no" type="hidden" value="${applover.approver_no}">
											</c:if>
											<tr>
												<td>${status.count}</td>
												<td>${applover.user_rank}</td>
												<td>${applover.user_name}</td>
												<c:choose>
													<c:when test="${applover.approval_status == 'IN_PROGRESS'}">
														<td>
															<select <c:if test="${sessionScope.login.user_id == applover.user_id}">name="approval_status"</c:if>>
																<option value="IN_PROGRESS" selected>진행중</option>
																<option value="APPROVED">승인</option>
																<option value="REJECTED">반려</option>
															</select>
														</td>
													</c:when>
													<c:when test="${applover.approval_status == 'APPROVED'}">
														<td>
															<select <c:if test="${sessionScope.login.user_id == applover.user_id}">name="approval_status"</c:if>>
																<option value="IN_PROGRESS">진행중</option>
																<option value="APPROVED" selected>승인</option>
																<option value="REJECTED">반려</option>
															</select>
														</td>
													</c:when>
													<c:otherwise>
														<td>
															<select <c:if test="${sessionScope.login.user_id == applover.user_id}">name="approval_status"</c:if>>
																<option value="IN_PROGRESS">진행중</option>
																<option value="APPROVED">승인</option>
																<option value="REJECTED" selected>반려</option>
															</select>
														</td>
													</c:otherwise>
												</c:choose>
												
												<td>${applover.approval_at}</td>
												<c:choose>
													<c:when test="${sessionScope.login.user_id == applover.user_id}">
														<td><input name="approval_comment" class="form-control" value="${applover.approval_comment}"></td>
														<td><button type="submit"
															class="btn btn-outline-dark">등록</button></td>
													</c:when>
													<c:otherwise>
														<td>${applover.approval_comment}</td>
														<td></td>
													</c:otherwise>
												</c:choose>
												
											</tr>
										</c:forEach>
									</form>
								</tbody>
							</table>
						</div>



					</div>
					<!-- 4) 액션 버튼: 테이블 제거 -->
					<div class="board-actions mb-4 d-flex justify-content-center">
						<div>
							<a
								href="${pageContext.request.contextPath}/approval/approvalList"
								class="btn btn-outline-dark md-3">목록</a> <a
								href="${pageContext.request.contextPath}/approval/approvalList"
								class="btn btn-outline-dark">확인</a>
						</div>
					</div>
				</div>

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