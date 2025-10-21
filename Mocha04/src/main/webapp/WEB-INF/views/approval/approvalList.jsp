<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="./approvalMenu.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/approval.css" />
<script>
	
    const btnFilterAll = document.getElementById('btn-filter-all');
    const btnFilterINPROGRESS = document.getElementById('btn-filter-inprogress');
    const btnFilterAPPROVAL = document.getElementById('btn-filter-approval');
    const btnFilterREJECT = document.getElementById('btn-filter-reject');
    
    
	let currentFilter = 'all'; 

	function changeFilter(filterType) {
        currentFilter = filterType;
        updateFilterButtons();
        
        // ⚠️ 실제로 링크를 클릭한 것처럼 처리해야 합니다.
        // 예를 들어: window.location.href = `${pageContext.request.contextPath}/approval/approvalList?kind=${filterType}`;
	}

	function updateFilterButtons() {
       
	    const filterBtns = [btnFilterAll, btnFilterINPROGRESS, btnFilterAPPROVAL, btnFilterREJECT];

	    filterBtns.forEach(btn => {
	        if (btn) { 
                btn.classList.remove('btn-primary');
                btn.classList.add('btn-outline-dark'); //
            }
	    });
	
    
        let selectedBtn;
        switch(currentFilter) {
            case 'all': selectedBtn = btnFilterAll; break;
            case 'inprogress': selectedBtn = btnFilterINPROGRESS; break;
            case 'approved': selectedBtn = btnFilterAPPROVAL; break; 
            case 'rejected': selectedBtn = btnFilterREJECT; break;    
        }

        if (selectedBtn) {
            selectedBtn.classList.remove('btn-outline-dark');
            selectedBtn.classList.add('btn-dark'); 
        }
        
	}
    
   
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        let kind = urlParams.get('kind');
        
        /
        if (kind) {
            kind = kind.replace(/'/g, '').toLowerCase(); 
           
            currentFilter = kind === 'in_progress' ? 'inprogress' : kind;
        } else {
             currentFilter = 'all';
        }
        
        if (btnFilterAll) {
            btnFilterAll.addEventListener('click', () => changeFilter('all'));
            btnFilterINPROGRESS.addEventListener('click', () => changeFilter('in_progress')); 
            btnFilterAPPROVAL.addEventListener('click', () => changeFilter('approved'));   
            btnFilterREJECT.addEventListener('click', () => changeFilter('rejected'));    
        }

        updateFilterButtons();
    };
	
</script>
<!-- section start -->
<td id="section">
	<div class="container">

		<!-- 결재 대진행중 문서 -->
		<br>
		<h4 class="mb-3">결재 문서함</h4>

		<div class="search-wrap">
			<select class="form-select form-select-sm" style="width: 120px;">
				<option selected>제목</option>
				<option>작성자</option>
				<option>유형</option>
				<option>결재일</option>
			</select>

			<div class="input-group input-group-sm" style="width: 360px;">
				<input type="search" class="form-control" placeholder="검색어">
				<button class="btn btn-outline-secondary" type="button" title="검색">
					<span class="material-symbols-outlined"
						style="font-size: 18px; vertical-align: middle;">search</span>
				</button>
			</div>
		</div>
		<div>
			<a
				href="${pageContext.request.contextPath}/approval/approvalList?kind='ALL'"
				class="btn btn-outline-dark" id="btn-filter-all">전체</a> <a
				href="${pageContext.request.contextPath}/approval/approvalList?kind='IN_PROGRESS'"
				class="btn btn-outline-dark" id="btn-filter-inprogress">진행</a> <a
				href="${pageContext.request.contextPath}/approval/approvalList?kind='APPROVED'"
				class="btn btn-outline-dark" id="btn-filter-approval" >승인</a> <a
				href="${pageContext.request.contextPath}/approval/approvalList?kind='REJECTED'"
				class="btn btn-outline-dark" id="btn-filter-reject" >반려</a>
		</div>

		<hr>
		<div class="card shadow-sm mb-3">
			<div class="card-body p-0">
				<div class="table-responsive">
					<table class="table table-hover mb-0">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">기안일</th>
								<th scope="col">마감일</th>
								<th scope="col">결재종류</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">결재상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
							<tr>
								<th scope="row">${ item.approval_no }</th>
								<td>${ item.created_at }</td>
								<td>${ item.created_at }</td>
								<td>${ item.approval_kind }</td>
								<td><a
									href="${pageContext.request.contextPath}/approval/approvalView?no=${ item.approval_no}"
									class="table-link"> ${item.approval_title } </a></td>
								<td>${ item.user_id }</td>
								<td>
					                <c:choose>
					                    <c:when test="${item.approval_status eq 'INPROGRESS'}">
					                        <span class="btn btn-sm btn-outline-success">진행</span>
					                    </c:when>
					                    <c:when test="${item.approval_status eq 'APPROVED'}">
					                        <span class="btn btn-sm btn-outline-primary">승인</span>
					                    </c:when>
					                    <c:when test="${item.approval_status eq 'REJECTED'}">
					                        <span class="btn btn-sm btn-outline-danger">반려</span>
					                    </c:when>
					                </c:choose>
					            </td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="report-controls">
			<nav aria-label="pagination">
				<ul class="pagination pagination-sm my-1">
					<li class="page-item disabled"><span class="page-link">‹</span></li>
					<li class="page-item active"><span class="page-link">1</span></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">…</a></li>
					<li class="page-item"><a class="page-link" href="#">10</a></li>
					<li class="page-item"><a class="page-link" href="#">›</a></li>
				</ul>
			</nav>
		</div>
</td>

<!-- contents end-->
</tr>
</table>
</td>
<!-- section end -->
</tr>
<tr>
	<td colspan="3" id="footer">Copyright © Mocha company</td>
</tr>
</table>
</body>
</html>