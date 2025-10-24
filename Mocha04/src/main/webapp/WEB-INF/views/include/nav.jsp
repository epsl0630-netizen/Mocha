<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<tr>
	<!-- nav start -->
	<td id="nav">
		<ul>
			<li><a href="#" class="nav-btn"> <i class="bi bi-list"></i>
			</a> <input type="button" id="nav-menu-btn"></li>
			<li><a href="${pageContext.request.contextPath}/"
				class="nav-btn" id="home_nav">
					<div class="nav-icon">
						<i class="bi bi-house-door"></i>
					</div> 홈
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/approval/approvalList"
				class="nav-btn" id="approval_nav">
					<div class="nav-icon">
						<i class="bi bi-clipboard-check"></i>
					</div> 결재
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/schedule/scheduleList"
				class="nav-btn" id="schedule_nav">
					<div class="nav-icon">
						<i class="bi bi-calendar4-week"></i>
					</div> 일정
			</a></li>
			<li><a href="${pageContext.request.contextPath}/board/boardList"
				class="nav-btn" id="board_nav">
					<div class="nav-icon">
						<i class="bi bi-file-text"></i>
					</div> 게시판
				</a>
			</li>
			<c:if test="${sessionScope.login.authority == true}">
				<li><a href="${pageContext.request.contextPath}/admin"
					class="nav-btn" id="admin_nav">
						<div class="nav-icon admin">
							<i class="bi bi-person-gear"></i>
						</div> 관리자
				</a></li>
			</c:if>
		</ul>
	</td>
	<!-- nav end -->