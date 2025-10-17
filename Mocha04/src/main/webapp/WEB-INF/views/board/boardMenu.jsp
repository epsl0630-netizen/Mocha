<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- menu start -->
<td id="menu">
  <div>
    <span class="menu-title">게시판</span>
    
    <a href="${pageContext.request.contextPath}/board/boardWrite" class="btn btn-outline-light">게시글 등록</a>
    <br/><br/>
     <h2>게시판</h2>
    <br>
    <ul>
      <!-- 결재문서함 -->
      <ul>
        <li><a href="${pageContext.request.contextPath}/board/boardList"  class="d-block link-light text-decoration-none py-1">게시판</a></li>
        
      </ul>
    </ul>
  </div>
</td>
<!-- menu end -->