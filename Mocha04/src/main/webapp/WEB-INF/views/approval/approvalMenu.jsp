<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- menu start -->
<td id="menu">
	<div>
		<span class="menu-title">전자결재</span> <a
			href="${pageContext.request.contextPath}/approval/draftWrite"
			class="btn btn-outline-light">새 결재 진행</a> <br />
		<br />
		<h2>내 문서함</h2>
		<br>
		<ul>
			<!-- 결재문서함 -->
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/approval/approvalList"
					class="d-block link-light text-decoration-none py-1">결재문서함</a></li>
				<li><a
					href="${pageContext.request.contextPath}/approval/draftList"
					class="d-block link-light text-decoration-none py-1">기안문서함</a></li>
			</ul>
		</ul>
		<br>
		<br>
		<h2>관리자 문서함</h2>
		<br>
		<ul>
			<!-- 결재문서함 -->
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/resources/admin/adminApprovalList"
					class="d-block link-light text-decoration-none py-1">전체문서관리</a></li>
			</ul>
		</ul>
		<br>
	</div>
</td>
<!-- menu end -->
