<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<%@ include file="getAlert.jsp" %>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>设置</title>
	<link rel="icon" href="static/favicon.png">

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-sha256@0.9.0/src/sha256.min.js"></script>
	<link rel="stylesheet" href="static/table.css">
</head>

<body>
	<%@ include file="jspchecksession.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<%@ include file="navbar.jsp" %>
				<div class="col-md-8 m-auto">
					<form id="sForm" method="POST" action="EditUser">
						<h1 class="h3 mb-3 font-weight-normal">设置</h1>
						<input type="password" id="inputP1" class="form-control" placeholder="旧密码" required autofocus>
						<input id="pwdH1" type="hidden" name="opwd" />
						<input type="password" id="inputP2" class="form-control" placeholder="新密码" required>
						<input id="pwdH2" type="hidden" name="npwd" />
						<input type="password" id="inputP3" class="form-control" placeholder="确认密码" required>
						<div class="checkbox my-2">
							<label>
								<input id="cbox" type="checkbox"> 密码明文显示
							</label>
						</div>
						<button class="btn btn-lg btn-primary btn-block" type="submit">提交</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="static/settings.js"></script>

</html>