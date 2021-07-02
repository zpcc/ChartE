<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<%@ include file="getAlert.jsp" %>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>管理</title>
	<link rel="icon" href="static/favicon.png">

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-base64@3.6.1/base64.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/dompurify@2.2.9/dist/purify.min.js"></script>
	<link rel="stylesheet" href="static/table.css">
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<%@ include file="navbar.jsp" %>
				<div class="col-md-12">
					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th>标题</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<%@ include file="table_articles.jsp" %>
							</tbody>
						</table>
					</div>
					<nav>
						<ul class="pagination" id="pages">
							<li class="page-item">
								<a class="page-link" href="?p=1">首页</a>
							</li>
							<li id="prevLink" class="page-item">
								<a class="page-link" href="#">上一页</a>
							</li>
						</ul>
					</nav>
					<hr>
					<form method="POST" action="InsertArticle" class="card p-2">
						<div class="input-group">
							<input name="title" type="text" class="form-control" placeholder="输入新标题">
							<div class="input-group-append">
								<button type="submit" class="btn btn-primary">添加</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="static/pages.js"></script>

<script type="text/javascript" src="static/manage.js"></script>

</html>