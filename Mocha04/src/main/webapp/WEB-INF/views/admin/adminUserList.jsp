<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminUserList.css"/>
<script src="${pageContext.request.contextPath}/resources/js/adminUserList.js"></script>
<%@ include file="./adminMenu.jsp" %>
      <!-- section start -->
      <td id="section">
        <table>
          <tr>
            <td>
              <table class="HRD-container">
                <tr>
                  <td colspan="2">
                    <div>
                      <br>
                      <h4 class="mb-3">사원관리 목록</h4>
                      <div class="search-container">
                        <select id="select_user_kind" name="select_user_kind" class="select_search form-select">
                          <option value="1">일반</option>
                          <option value="2">관리</option>
                        </select>
                        <select id="select_user_depart" name="select_user_depart" class="select_search form-select">
                          	<option value="0">부서선택</option>
                          	<option value="1">경영지원팀</option>
                     		<option value="2">디자인팀</option>
                     		<option value="3">인사지원팀</option>
                        </select>
                        <label class="search-input">
                          <input type="text" id="user-search" class="form-control" placeholder="사원번호, 이름">
                          <button class="search-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#1f1f1f"><path d="M784-120 532-372q-30 24-69 38t-83 14q-109 0-184.5-75.5T120-580q0-109 75.5-184.5T380-840q109 0 184.5 75.5T640-580q0 44-14 83t-38 69l252 252-56 56ZM380-400q75 0 127.5-52.5T560-580q0-75-52.5-127.5T380-760q-75 0-127.5 52.5T200-580q0 75 52.5 127.5T380-400Z"/>
                            </svg>
                          </button>
                        </label>
                        <button class="btn btn-outline-dark btn-right addUser-modalBtn" data-bs-toggle="modal" data-bs-target="#addUser-modal">사원 등록</button>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td class="HRD-table-container">
                    <table class="HRD-table" id="adminHRD">
                      <tr>
                        <td>사원번호</td>
                        <td>부서</td>
                        <td>이름</td>
                      </tr>
                      <c:forEach begin="0" end="${total}" var="item" items="${list}"  varStatus="status">
                      	<c:choose>
                      		<c:when test="${requestScope.user_id != null && requestScope.user_id != ''}">
                      			<tr id="subTR" class="<c:if test="${requestScope.user_id == item.user_id}">selected</c:if>">
                      		</c:when>
                      		<c:otherwise>
		                    	<tr id="subTR" class="<c:if test="${status.index == 0}">selected</c:if>">
                      		</c:otherwise>
                      	</c:choose>
	                        <td>
	                        	<c:out value="${item.user_id}"/>
	                        </td>
	                        <td><c:out value="${item.dept_id}"/></td>
	                        <td><c:out value="${item.name}"/></td>
	                      </tr>
                      </c:forEach>
                    </table>
                  </td>
                  <td class="user-info-container">
                    <form id="user-info-change-frm" method="post" action="${pageContext.request.contextPath}/admin/adminUserModify" onsubmit="">
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
                          <td>이름</td>
                          <td>
                          	<input id="name" type="text" name="name" class="form-control form-control-sm" value="
                          		<c:out value="${userInfo.name}"/>"
                         	>
						  </td>
                          <td>부서</td>
                          <td>
                            <select id="user_kind" name="user_kind" class="select_user_kind form-select form-select-sm">
                              <option value="1">경영지원팀</option>
                              <option value="2">디자인팀</option>
                              <option value="3">인사지원팀</option>
                            </select>
                          </td>
                          </tr>
                          <tr>
                            <td>사원번호</td>
                            <td><span id="user_id"></span></td>
                            <td>내선번호</td>
                            <td><span id="user_phone"></span></td>
                          </tr>
                          <tr>
                            <td>이메일</td>
                            <td><input id="email" name="email" type="text" class="form-control form-control-sm" value="hong@email.com"></td>
                            <td>휴대전화</td>
                            <td>
                            	<input id="mobile1" name="mobile1" class="phone-input form-control form-control-sm" type="tel" value="" maxlength="3"> - <input id="mobile2" name="mobile2" class="phone-input form-control form-control-sm" type="tel" value="" maxlength="4"> - <input id="mobile3" name="mobile3" class="phone-input form-control form-control-sm"  type="tel" value="" maxlength="4"></td>
                          </tr>
                          <tr>
                            <td colspan="4">비밀번호
                              <button class="btn btn-outline-dark btn-right" id="admin-pw-change-btn">비밀번호 변경</button>
                            </td>
                          </tr>
                          <tr name="user_pw" class="admin-pw-change">
                            <td>새 비밀번호</td>
                            <td><input type="text" class="form-control form-control-sm"></td>
                          </tr>
                          <tr class="admin-pw-change">
                            <td>새 비밀번호 확인</td>
                            <td><input type="text" name="user_pw_ck" class="form-control form-control-sm"></td>
                          </tr>
                        </table>
                      </div>
                      <fieldset class="border rounded-3 p-3">
                        <legend class="float-none w-auto px-3 fs-6">인적사항</legend>
                        <span class="sub-title">개인정보</span>
                        <table class="personal-info">
                          <tr>
                            <td>
                              생년월일
                            </td>
                            <td>
                              <input type="date" id="user_birth" name="user_birth" class="form-control form-control-sm" value="1443-10-13">
                            </td>
                            <td>
                              성별
                            </td>
                            <td>
                              <select id="user_gender" name="user_gender" class="form-select form-select-sm">
                                <option value="N">--</option>
                                <option value="M">남성</option>
                                <option value="F">여성</option>
                              </select>
                            </td>
                          </tr>  
                          <tr>
                            <td>
                              주소
                            </td>
                            <td colspan="3">
                              <input type="text" name="user_addr" class="form-control form-control-sm" value="충청도">
                            </td>
                          </tr>
                        </table>
                        <span class="sub-title">사원정보</span>
                        <table class="employee-info">
                          <tr>
                            <td>권한</td>
                            <td>
                              <select id="authority"  name="authority" class="form-select form-select-sm">
                                <option value="false">일반</option>
                                <option value="true">관리</option>
                              </select>
                            </td>
                            <td>직급</td>
                            <td>
                              <select id="user_rank" name="user_rank" class="form-select form-select-sm">
                                <option value="0">대표</option>
                                <option value="1">부장</option>
                                <option value="2">과장</option>
                                <option value="3">대리</option>
                                <option value="4">사원</option>
                              </select>
                            </td>
                          </tr>
                          <tr>
                            <td>입사일자</td>
                            <td><span id="created_at" name="created_at"></span></td>
                          </tr>
                        </table>
                      </fieldset>
                      <div class="user-info-button">
                            <button type="submit" class="btn btn-outline-dark">저장</button>
                            <button class="btn btn-outline-dark">취소</button>
                      </div>
                    </form>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <!-- section end -->
<%@ include file="../include/footer.jsp" %>
	<!-- Modal addUser Start-->
	<div class="modal fade" id="addUser-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
	      	<form id="addUserFrm" method="post" action="${pageContext.request.contextPath}/admin/adminUserWrite">
				<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="staticBackdropLabel">사원 등록</h5>
		        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		     		</div>
		      		<div class="modal-body user-info-container">
			     		<div class="user-info">
			            	<table>
				              	<tr>
				                  <td>사원번호</td>
				                  <td><input type="text" name="user_id" class="form-control form-control-sm" ></td>
				                </tr>
				              	<tr>
				                  <td colspan="2">
				                  	<span class="idCheck-phrase">아이디 중복체크</span>
				                  </td>
				                </tr>
				                 <tr>
				                  <td>비밀번호</td>
				                  <td><input type="password" name="user_pw" class="form-control form-control-sm" ></td>
				                </tr>
				                <tr>
				                  <td>비밀번호 확인</td>
				                  <td><input type="password" name="user_pwcheck" class="form-control form-control-sm" ></td>
				                </tr>
				                <tr>
				                  <td>이름</td>
				                  <td>
				                    <input type="text" name="name" class="form-control form-control-sm" >
				                  </td>
				                </tr>
			              		<tr>
			                		<td>부서</td>
									<td>
										<select name="dept_id" class="select_user_kind form-select form-select-sm">
									    	<option value="0">부서 선택</option>
										    <option value="1">경영지원팀</option>
										    <option value="2">디자인팀</option>
										    <option value="3">인사지원팀</option>
									  	</select>
									</td>
			              		</tr>
			              		<tr>
			                		<td>성별</td>
									<td>
										<select name="user_gender" class="select_user_kind form-select form-select-sm">
			                                <option>--</option>
			                                <option value="M">남성</option>
			                                <option value="F">여성</option>
									  	</select>
									</td>
			              		</tr>
				                <tr>
				                	<td>생년월일</td>
				                	<td><input type="date" name="user_birth" class="form-control form-control-sm" /></td>
				                </tr>
				                <tr>
				                	<td>이메일</td>
				                	<td><input type="text" name="email" class="form-control form-control-sm" /></td>
				                </tr>
			            	</table>
			          	</div>
		      		</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-outline-dark" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-outline-dark" >등록</button>
					</div>
		    	</div>
      		</form>
	  	</div>
	</div>
	 <!-- Modal addUser End-->