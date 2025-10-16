<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- menu start -->
<td id="menu">
<div>
  <span class="menu-title">일정관리</span>
  
  <a href="${pageContext.request.contextPath}/schedule/scheduleWrite" class="btn btn-outline-light">일정등록</a>
  <br><br>
  <ul>
    <li><a href="${pageContext.request.contextPath}/schedule" class="d-block link-light text-decoration-none py-1">
    일정목록
    </a></li>
  </ul>
   <br><br>
  <span class="menu-title">관리자 일정관리</span>
  <br>
    <ul>
      <li><a href="${pageContext.request.contextPath}/admin/adminScheduleList"  class="d-block link-light text-decoration-none py-1">전체일정관리</a></li>
    </ul>
  <br> 
</div>
</td>
<!-- menu end -->