<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.common.Common" %>
<%
if (session.getAttribute("un")==null)
	{
		out.println("未登录");
		response.sendRedirect(Common.indexPage);
		return;
	}
%>