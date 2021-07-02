<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.JDBC.JDBCUtils,java.util.ArrayList"%>

<%@ include file="jspchecksession.jsp"%>

<%

String p2 = request.getParameter("p");

int eachP=5;

int p=-1;
if(p2==null) p=1;
else p=Integer.parseInt(p2);

String username = session.getAttribute("un").toString();

String sql1 = "select count(*) from Articles where Uname=?";

String sql2 = "select title, Ano from Articles where Uname=? ORDER BY Ano";

long total = JDBCUtils.getCount(sql1, username);

long totalP = ((total-1) / eachP) +1;

if(p<1) response.sendRedirect("manage.jsp?p=1");
else if (p>totalP) response.sendRedirect("manage.jsp?p="+String.valueOf(totalP));

int from = (p-1)* 5;

ArrayList<ArrayList<Object>> result = JDBCUtils.fetchAB(sql2, from, from+5, username);

if (result!=null) {

for (int i=0;i<result.size();i++) {
	ArrayList<Object> cols = result.get(i);
	String title = (String)cols.get(0);
	String Ano = String.valueOf(cols.get(1));
%>

<tr>
	<td><%=title%></td>
	<td><%=Ano%></td>
</tr>
<%
}
}
%>
<div>
	<script>
		var activeP = <%= p %>;
		const totalP = <%= totalP %>;
	</script>
</div>