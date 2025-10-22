<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<!-- myinfo start -->
	<!-- Modal -->
	<div class="modal fade" id="myinfo-modal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">내 정보</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body user-info-container">
					<div class="user-info">
						<div class="profile-container">
							<div class="profile-square">
								<img class="profile-img">
							</div>
							<label class="profile-img-edit-btn" for="profile-img-file">
								<input type="file" name="profile-img-file" id="profile-img-file">
								<i class="bi bi-camera-fill"></i>
							</label>
						</div>
						<table>
							<tr>
								<td></td>
								<td><span>${sessionScope.login.name}</span></td>
							<tr>
								<td>부서</td>
								<td><span id="user_depart" name="user_depart"
									class="select_user_depart"> ${sessionScope.login.dept_name} </span></td>
							</tr>
							</tr>
							<tr>
								<td>사원번호</td>
								<td><span>${sessionScope.login.user_id}</span></td>
							</tr>
							<tr>
								<td>내선번호</td>
								<td><span>${sessionScope.login.user_id}</span></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td class="myinfo-change-off"><span>${sessionScope.login.email}</span></td>
								<td class="myinfo-change-on"><input value="${sessionScope.login.email}" /></td>
							</tr>
							<tr>
								<td>휴대전화</td>
								<td class="myinfo-change-off"><span>${sessionScope.login.mobile}</span></td>
								<td class="myinfo-change-on"><input value="${sessionScope.login.mobile}" /></td>
							</tr>
							<tr class="pw-change myinfo-change-on">
								<td>비밀번호</td>
								<td>
									<button class="btn btn-outline-dark btn-right pw-change-btn">비밀번호
										변경</button>
								</td>
							</tr>
							<tr class="pw-change">
								<td>현재 비밀번호</td>
								<td><input type="password"></td>
							</tr>
							<tr class="pw-change">
								<td>새 비밀번호</td>
								<td><input type="password"></td>
							</tr>
							<tr class="pw-change">
								<td>새 비밀번호 확인</td>
								<td><input type="password"></td>
							</tr>
						</table>
					</div>
					<fieldset class="border rounded-3 p-3">
						<legend class="float-none w-auto px-3 fs-6">인적사항</legend>
						<span class="sub-title">개인정보</span>
						<table class="personal-info">
							<tr>
								<td>생년월일</td>
								<td><span>${sessionScope.login.user_birth}</span></td>
								<td>성별</td>
								<td>
									<span>
										<c:choose>
										<c:when test="${sessionScope.login.user_gender == 'M'}">
											남성
										</c:when>
										<c:when test="${sessionScope.login.user_gender == 'F'}">
											여성
										</c:when>
										<c:otherwise>
											--
										</c:otherwise>
									</c:choose>
									
									</span>
								</td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="3" class="myinfo-change-off"><span>${sessionScope.login.user_addr}</span>
								</td>
								<td colspan="3" class="myinfo-change-on"><input type="text"
									value="${sessionScope.login.user_addr}" /></td>
							</tr>
						</table>
						<span class="sub-title">사원정보</span>
						<table class="employee-info">
							<tr>
								<td>구분</td>
								<td><span>
									<c:choose>
										<c:when test="${sessionScope.login.authority == false}">
											일반
										</c:when>
										<c:otherwise>
											관리
										</c:otherwise>
									</c:choose>
									</span>
								</td>
								<td>직급</td>
								<td><span>${sessionScope.login.dept_name}</span></td>
							</tr>
							<tr>
								<td>입사일자</td>
								<td><span> ${sessionScope.login.created_at} </span></td>
							</tr>
						</table>
					</fieldset>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
					<button type="button" class="btn btn-main myinfo-change-off"
						id="myinfo-change-btn">수정</button>
					<button type="button"
						class="btn btn-main myinfo-change-on profile-info-close-btn">취소</button>
					<button type="button" class="btn btn-main myinfo-change-on">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- myinfo end -->