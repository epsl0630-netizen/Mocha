<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- menu start -->
      <td id="menu">
        <div>
          <span class="menu-title"><a href="${pageContext.request.contextPath}/admin">관리자 페이지</a></span>
          <ul>
            <li><a href="${pageContext.request.contextPath}/admin/adminUserList">사원 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminApprovalList">결재 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminScheduleList">일정 목록</a></li>
          </ul>
        </div>
      </td>
<!-- menu end -->