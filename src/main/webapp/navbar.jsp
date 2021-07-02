<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.common.Common"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
		<%
		Object username2 = session.getAttribute("un");
				if (username2 != null) {
		%>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#bs-example-navbar-collapse-1">
		<span class="navbar-toggler-icon"></span>
	</button>
	<%
	}
	%>
	<a class="navbar-brand" href="<%=Common.indexPage%>">主页</a>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<%
		if (username2 != null) {
		%>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="manage.jsp">管理</a></li>
			<li class="nav-item"><a class="nav-link"
				href="settings.jsp">设置</a></li>
		</ul>
		<ul class="navbar-nav ml-md-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
				data-toggle="dropdown"><%=username2.toString()%></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="logout.jsp">注销</a>
				</div></li>
		</ul>
		<%
		}
		%>
	</div>
</nav>