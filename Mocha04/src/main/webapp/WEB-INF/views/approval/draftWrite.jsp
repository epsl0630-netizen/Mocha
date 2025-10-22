<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp"%>
<%-- JSTL 사용을 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approval.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approvalWrite.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/approvalwrite.js"></script>
<%@ include file="./approvalMenu.jsp"%>
<!-- section start -->
<td id="section">
	<table>
		<tr>
			<!-- contents start-->
			<br>
			<td>
				<form name="approvalForm" method="post" action="${pageContext.request.contextPath}/approval/write" enctype="multipart/form-data">

					<h4 class="mb-3">새 결재 진행</h4>

					<div class="card shadow-sm mb-3">
						<div class="card-body">

							<!-- 1) 기본 정보 -->
							<table class="table mb-4">
								<tbody>
									<tr>
										<th scope="row">작성자</th>
										<td>${sessionScope.loginUser.name}</td>
									</tr>
									<tr>
										<th scope="row">부서</th>
										<td>${sessionScope.loginUser.dept_name}</td>
									</tr>
									<tr>
										<th scope="row">직급</th>
										<td>${sessionScope.loginUser.user_rank}</td>
									</tr>
									<input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}" />
								</tbody>
							</table>

							<!-- 2) 결재 입력 -->
							<table class="table mb-4">
								<tbody>
									<tr>
										<th scope="row">결재종류</th>
										<td><select class="form-select" name="approval_kind"
											aria-label="Default select example">
												<option selected>--선택--</option>
												<option value="1">연차신청</option>
												<option value="2">업무지원요청</option>
												<option value="3">예산신청</option>
												<option value="4">출장신청</option>
										</select></td>
									</tr>

									<tr>
										<th scope="row">결재명</th>
										<td><input class="form-control" name="approval_title" value=""></td>
									</tr>

									<tr>
										<th scope="row">기간</th>
										<td>
											<div class="d-flex align-items-center gap-2">
												<div class="input-group">
													<input type="date" class="form-control input-date"
														id="startDate" name="startDate" required>
												</div>
												<span>~</span>
												<div class="input-group">
													<input type="date" class="form-control input-date"
														id="endDate" name="endDate" required>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row">내용</th>
										<td><textarea class="form-control" name="approval_note" rows="4"></textarea></td>
									</tr>

									<tr>
										<th scope="row">첨부파일</th>
										<td><input type="file" id="bf-file" name="files" class="form-control"
											multiple>

											<div id="bf-file-list" class="mt-2"></div>

											<div id="bf-file-hint" class="form-text mt-1">파일을 여러 개
												선택할 수 있습니다.</div></td>
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
											<th></th>
										</tr>
									</thead>
									<tbody id="mainApprovalTableBody">
									</tbody>
								</table>
							</div>

							<!-- 4) 액션 버튼 -->
							<div class="board-actions mb-4 d-flex justify-content-between">
								<div>
									<a href="#" class="btn btn-outline-dark"
										data-bs-toggle="modal" data-bs-target="#approvalLineModal">
										결재선추가 </a>
								</div>

								<div>
									<a href="${pageContext.request.contextPath}/approval/draftList"
										class="btn btn-outline-dark">목록</a> 
									<a href="${pageContext.request.contextPath}/approval/draftList"
										class="btn btn-outline-dark">취소</a>
									<a href="${pageContext.request.contextPath}/approval/draftView"
										class="btn btn-outline-dark">완료</a>
								</div>
							</div>
							
							<%-- 결재선 추가 Modal --%>
							<div class="modal fade" id="approvalLineModal" tabindex="-1"
								aria-labelledby="approvalLineModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-fullscreen-sm-down">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="approvalLineModalLabel">결재선
												추가</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
	
										<div class="modal-body">
											<div class="p-3 rounded-3"
												style="background-color: #f8f9fa;">
												<h6 class="fw-semibold mb-3">결재선</h6>
												<div class="row g-3">
	
													<div class="col-md-6">
														<div class="border rounded-3 p-3 bg-white h-100">
															<div class="d-flex align-items-center gap-2 mb-3">
																<span class="material-symbols-outlined" style="vertical-align: middle;">search</span> <input
																	type="text" class="form-control form-control-sm"
																	id="treeSearch" placeholder="검색">
															</div>
	
															<div class="approval-tree small approval-scroll"
																id="orgTreeContainer">
																<ul class="list-unstyled ms-0" id="orgTree">
																<li class="tree-item"><details open>
																<summary>
																	<span class="me-1"></span> Mocha Company
																</summary>
																<ul class="list-unstyled ps-3">
																	<li><details open>
																			<summary>부서</summary>
																		<ul class="list-unstyled ps-3">
																																				
																			<li><details open>
																			<c:forEach var="dept" items="${dept}">
																			<c:choose>
																					
																					<c:when test="${dept.dept_name == '경영지원'}">
																					<summary>${dept.dept_name}</summary>
																						<ul class="list-unstyled ps-3">
																							<li class="d-flex align-items-center gap-2">
																								<input type="checkbox"
																								class="form-check-input person"
																								data-dept="${dept.dept_name}" data-rank="${position.position_name}"
																								data-name="${user.name}"> 
																								<span>${user.name}${user.user_rank}</span>
																							</li>
																						</ul>
																						</c:when>
																						<c:when test="${dept.dept_name == '디자인'}">
																						<summary>${dept.dept_name}</summary>
																						<ul class="list-unstyled ps-3">
																							<li class="d-flex align-items-center gap-2">
																								<input type="checkbox"
																								class="form-check-input person"
																								data-dept="${dept.dept_name}" data-rank="${position.position_name}"
																								data-name="${user.name}"> 
																								<span>${user.name}${user.user_rank}</span>
																							</li>
																						</ul>
																					</c:when>
																					<c:when test="${dept.dept_name == '인사관리'}">
																						<summary>${dept.dept_name}</summary>
																						<ul class="list-unstyled ps-3">
																							<li class="d-flex align-items-center gap-2">
																								<input type="checkbox"
																								class="form-check-input person"
																								data-dept="${dept.dept_name}" data-rank="${position.position_name}"
																								data-name="${user.name}"> 
																								<span>${user.name}${user.user_rank}</span>
																							</li>
																						</ul>
																					</c:when>
																			</c:choose>		
																			</c:forEach>		
																			</details></li>
																		
																			
																		</ul>
																	</details></li>
																</ul>
																</li>		
																</ul>
															</div>
														</div>
													</div>
	
													<div class="col-md-6">
														<div
															class="border rounded-3 p-3 bg-white h-100 d-flex flex-column">
	
															<div class="approval-scroll flex-grow-1"
																style="height: auto; min-height: 0; overflow-y: auto;">
																<table class="table table-sm align-middle mb-0">
																	<thead>
																		<tr>
																			<th style="width: 35%">부서</th>
																			<th style="width: 20%">직급</th>
																			<th style="width: 35%">이름</th>
																			<th style="width: 10%"></th>
																		</tr>
																	</thead>
																	<tbody id="selectedTableBody">
																	</tbody>
																</table>
															</div>
	
														</div>
													</div>
												</div>
											</div>
										</div>
	
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal" id="btnCancel">취소</button>
											<button type="button" class="btn btn-primary" id="btnOk">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</td>
			<!-- contents end-->
		</tr>
	</table>
</td>
<!-- section end -->
<%@ include file="../include/footer.jsp"%>

