<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%if (session.getAttribute("alert")!=null){%>

<script>alert("<%=session.getAttribute("alert")%>");</script>

<%
session.setAttribute("alert", null);
}
%>