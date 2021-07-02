<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.common.Common"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>

<p>isNew=<%=session.isNew()%></p>
<%
session.invalidate();
%>
<p>You have logged out.</p>
<a href="<%=Common.indexPage%>"><b>Homepage</b></a>

<%
response.sendRedirect(Common.indexPage);
%>

</body>
</html>