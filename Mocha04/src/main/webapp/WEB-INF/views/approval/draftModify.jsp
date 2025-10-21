<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp"%>
<%-- JSTL 사용을 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 포맷팅을 위한 fmt taglib 추가 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approval.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approvalWirte.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/approvalWrite.js"></script>
<%@ include file="./approvalMenu.jsp"%>
<!-- section start -->
<td id="section">
	<table>
		<tr>
			<!-- contents start-->
			<br>
			<td>
				<form name="approvalForm" method="post" action="${pageContext.request.contextPath}/approval/update" enctype="multipart/form-data">
					<%--  어떤 게시글을 수정할지 식별하기 위한 approval_no를 hidden input으로 추가합니다. --%>
					<input type="hidden" name="approval_no" value="${approval.approval_no}">

				
					<h4 class="mb-3">결재 수정</h4>

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
										<td>${approval.deptName}</td>
									</tr>
									<tr>
										<th scope="row">직급</th>
										<td>${approval.rankName}</td>
									</tr>
                                    <tr>
										<th scope="row">작성일</th>
										<td><fmt:formatDate value="${approval.created_at}" pattern="yyyy-MM-dd" /></td>
									</tr>
									<input type="hidden" name="user_id" value="${approval.user_id}" />
								</tbody>
							</table>

							<!-- 2) 결재 입력 -->
							<table class="table mb-4">
								<tbody>
									<tr>
										<th scope="row">결재종류</th>
										<td><select class="form-select" name="approval_kind"
											aria-label="Default select example">
												<%-- [수정] 5. approval 객체의 approval_kind 값과 일치하는 옵션을 'selected' 처리합니다. --%>
												<option>--선택--</option>
												<option value="1" ${approval.approval_kind == 1 ? 'selected' : ''}>연차신청</option>
												<option value="2" ${approval.approval_kind == 2 ? 'selected' : ''}>업무지원요청</option>
												<option value="3" ${approval.approval_kind == 3 ? 'selected' : ''}>예산신청</option>
												<option value="4" ${approval.approval_kind == 4 ? 'selected' : ''}>출장신청</option>
										</select></td>
									</tr>

									<tr>
										<th scope="row">결재명</th>
										<%-- [수정] 6. value 값에 기존 결재명을 채워넣습니다. --%>
										<td><input class="form-control" name="approval_title" value="${approval.approval_title}"></td>
									</tr>

									<tr>
										<th scope="row">기간</th>
										<td>
											<div class="d-flex align-items-center gap-2">
												<div class="input-group"> --%>
													<input type="date" class="form-control input-date"
														id="startDate" name="startDate" value="<fmt:formatDate value="${approval.startDate}" pattern="yyyy-MM-dd" />" required>
												</div>
												<span>~</span>
												<div class="input-group">
													<input type="date" class="form-control input-date"
														id="endDate" name="endDate" value="<fmt:formatDate value="${approval.endDate}" pattern="yyyy-MM-dd" />" required>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row">내용</th>
										<td><textarea class="form-control" name="approval_note" rows="4">${approval.approval_note}</textarea></td>
									</tr>

									<tr>
										<th scope="row">첨부파일</th>
										<td>%>
                                            <div id="existing-files" class="mb-2">
                                                <c:forEach items="${approval.fileList}" var="file">
                                                    <div class="existing-file-item">
                                                        <span>${file.original_name} (${file.file_size} KB)</span>
                                                     
                                                        <button type="button" class="btn btn-sm btn-outline-danger ms-2">삭제</button>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            
                                            <input type="file" id="bf-file" name="files" class="form-control"
											multiple>
											<div id="bf-file-list" class="mt-2"></div>
											<div id="bf-file-hint" class="form-text mt-1">파일을 새로 추가하거나 변경할 수 있습니다.</div>
                                        </td>
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
										<c:forEach items="${approval.approverList}" var="approver" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${approver.rankName}</td>
												<td>${approver.name}</td>
												<td>${approver.status}</td>
												<td><fmt:formatDate value="${approver.processed_at}" pattern="yyyy-MM-dd" /></td>
												<td>${approver.comment}</td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

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
									<button type="submit" class="btn btn-primary">수정</button>
								</div>
							</div>
							
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
																<span class="me-1"></span> mocha Company
															</summary>
															<ul class="list-unstyled ps-3">
																<li><details open>
																		<summary>부서</summary>
																		<ul class="list-unstyled ps-3">
																			<li><details open>
																					<summary>경영지원팀</summary>
																					<ul class="list-unstyled ps-3">
																						<li class="d-flex align-items-center gap-2">
																							<input type="checkbox"
																							class="form-check-input person"
																							data-dept="경영지원팀" data-rank="팀장"
																							data-name="김철수"> <span>김철수팀장</span>
																						</li>
																						<li class="d-flex align-items-center gap-2">
																							<input type="checkbox"
																							class="form-check-input person"
																							data-dept="경영지원팀" data-rank="부장"
																							data-name="오지현"> <span>오지현부장</span>
																						</li>
																						<li class="d-flex align-items-center gap-2">
																							<input type="checkbox"
																							class="form-check-input person"
																							data-dept="경영지원팀" data-rank="사원"
																							data-name="홍길동"> <span>홍길동사원</span>
																						</li>
																					</ul>
																				</details></li>
																			<li><details>
																					<summary>디자인팀</summary>
																					<ul class="list-unstyled ps-3">
																						<li class="d-flex align-items-center gap-2">
																							<input type="checkbox"
																							class="form-check-input person"
																							data-dept="디자인팀" data-rank="팀장"
																							data-name="박다은"> <span>박다은팀장</span>
																						</li>
																					</ul>
																				</details></li>
																			<li><details>
																					<summary>인사지원팀</summary>
																					<ul class="list-unstyled ps-3">
																						<li class="d-flex align-items-center gap-2">
																							<input type="checkbox"
																							class="form-check-input person"
																							data-dept="인사지원팀" data-rank="대리"
																							data-name="이수진"> <span>이수진대리</span>
																						</li>
																					</ul>
																				</details></li>
																		</ul>
																	</details></li>
																			</ul>
																		</details></li>
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

