<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<%@ include file="getAlert.jsp" %>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>ChartE</title>
	<link rel="icon" href="static/favicon.png">

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-sha256@0.9.0/src/sha256.min.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<%@ include file="navbar.jsp" %>
				<div class="row">
					<div class="col-md-4 mb-2">
						<div class="card">
							<img class="card-img-top" src="static/img/1.png" />
							<a target="_blank" href="edit.jsp?id=1">
								<h5 class="card-title text-center">直线图</h5>
							</a>
						</div>
					</div>
					<div class="col-md-4 mb-2">
						<div class="card">
							<img class="card-img-top" src="static/img/2.png" />
							<a target="_blank" href="edit.jsp?id=2">
								<h5 class="card-title text-center">线性回归</h5>
							</a>
						</div>
					</div>
					<div class="col-md-4 mb-2">
						<div class="card">
							<img class="card-img-top" src="static/img/3.png" />
							<a target="_blank" href="edit.jsp?id=3">
								<h5 class="card-title text-center">饼图</h5>
							</a>
						</div>
					</div>
				</div>
		<%
		if (session.getAttribute("un") == null) {
		%>
				<form method="post" action="Login" role="form" class="form-inline">
					<label class="ml-2 mt-2" for="unInput">
						用户名:&nbsp;
					</label>
					<input type="text" class="form-control mt-2" id="unInput" required />
					<label class="ml-2 mt-2" for="pwdInput">
						密码:&nbsp;
					</label>
					<input type="password" class="form-control mt-2" id="pwdInput" required />
					<input id="unH" type="hidden" name="un" />
					<input id="pwdH" type="hidden" name="pwd" />
					<button id="submitBtn" type="submit" class="btn btn-primary ml-2 mt-2">
						登录
					</button>
				</form>
		<%
		}
		%>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="static/index.js"></script>

</html>