<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:forEach begin="0" var="item"  items="${scheduleList}" varStatus="status">
	<tr>
		<td class="text-center"><input class="form-check-input"
			type="checkbox" name="selectDoc"></td>
		<th scope="row">${status.count}</th>
		<td>${item.start_at}</td>
		<td>${item.end_at}</td>
		<td>${item.dept_name}</td>
		<td>
			<c:choose>
				<c:when test="${item.schedule_kind=='team'}">
					팀 일정
				</c:when>
				<c:when test="${item.schedule_kind=='personal'}">
					개인 일정
				</c:when>
				<c:otherwise>
					기타
				</c:otherwise>
			</c:choose>
		</td>
		<td>${item.schedule_title}</td>
		<td>${item.name}</td>
		<td>${item.created_at}</td>
	</tr>
</c:forEach>	