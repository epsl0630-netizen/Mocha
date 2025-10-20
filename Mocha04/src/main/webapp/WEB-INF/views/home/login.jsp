<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/css/favicon.ico" />
<script
	src=${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<script src="<c:url value="/resources/js/main.js" />"></script>

</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css" />
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<body>
	<table id="wrap">
		<tr>
			<!-- section start -->
			<td id="section">
				<table>
					<tr>
						<td>

							<div class="login-container">
								<div class="login-img">
									<a href="/index"> <img
										src="${pageContext.request.contextPath}/resources/img/mocha_logo.png">
									</a>
								</div>
								<div class="login-input-container">
									<span class="h5"> 로그인 </span>
									<form id="login">
										<span>아이디</span> <input type="text" name="id"
											placeholder="아이디를 입력해주세요."> <span>비밀번호</span> <input
											type="password" name="pw" placeholder="비밀번호를 입력해주세요.">
										<button class="btn" id="login-btn">로그인</button>
									</form>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</td>
			<!-- section end -->
		</tr>
	</table>
</body>
</html>