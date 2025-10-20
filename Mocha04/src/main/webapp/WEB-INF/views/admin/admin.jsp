<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css" />
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<%@ include file="./adminMenu.jsp"%>
<!-- section start -->
<td id="section">
	<table>
		<tr>
			<td>
				<h4 class="mb-3">관리자 페이지</h4> <!-- 대시보드 -->
				<div id="dashboard">
					<div class="dashboard-grid">
						<!-- 1. 파이 -->
						<div class="dashboard-card">
							<div class="card-title">결재 현황</div>
							<canvas id="chart-pie" width="320" height="200"></canvas>
							<ul class="legend" id="legend-pie"></ul>

						</div>

						<!-- 2. 막대 -->
						<div class="dashboard-card">
							<div class="card-title">부서별 결재 현황</div>
							<canvas id="chart-bar" width="320" height="200"></canvas>
						</div>

						<!-- 3. KPI -->
						<div class="dashboard-card">
							<div class="card-title">이번달 보고서 제출 건수</div>
							<div class="dashboard-kpi" id="kpi-count">21</div>
						</div>

						<!-- 4. 라인 -->
						<div class="dashboard-card">
							<div class="card-title">월별 보고서 제출</div>
							<canvas id="chart-line" width="320" height="200"></canvas>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>
</td>
<!-- section end -->
<%@ include file="../include/footer.jsp"%>
