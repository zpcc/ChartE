<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.JDBC.JDBCUtils,java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="zh-CN">

<%@ include file="getAlert.jsp" %>

<%
String Ano = request.getParameter("id");

if (Ano == null) {
	response.sendRedirect("manage.jsp");
	return;
}

String sql = "select b64data, isPub, Uname from Articles where Ano=?";

String b64data = null;
String Uname="";
boolean exists=false;
boolean isPub=false;

ArrayList<Object> arr = JDBCUtils.fetchOne(sql, Integer.parseInt(Ano));

if (arr!=null) {
	exists=true;
	b64data = (String)arr.get(0);
	Object isPub2=arr.get(1);
	if(isPub2!=null) isPub=(Boolean)isPub2;
	String Uname2=(String)arr.get(2);
	if(Uname2!=null) Uname=Uname2;
}

boolean isMine = Uname.equals(session.getAttribute("un"));

if(!exists||(!isMine&&!isPub)){
	response.sendRedirect("manage.jsp");
	return;
}

%>

<head>
	<script>
		var isMine = "<%=isMine%>";
		var isPub = "<%=isPub%>";
		var b64str = "<%=b64data%>";
	</script>
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
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.1.2/dist/echarts.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/echarts-stat@1.2.0/dist/ecStat.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/ace-builds@1.4.12/src-noconflict/ace.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/js-base64@3.6.1/base64.min.js"></script>
	<link rel="stylesheet" href="static/my.css">
	<script type="text/javascript" src="static/getOpt.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<%@ include file="navbar.jsp" %>
				<div id="mainDiv" class="row">
					<div class="col-md-6">
						<div id="chartDiv"></div>
					</div>
					<div class="col-md-6">
						<div id="editor"></div>
						<button id="preview" type="button" class="btn btn-secondary mt-1">预览</button>
						<form id="form" class="form card mt-2" method="POST" action="EditAData" role="form">
							<input type="hidden" name="id" value="<%=Ano%>" />
							<input id="dataH" type="hidden" name="data" />
							<div class="checkbox p-2">
								<label>
									<input id="cBox" name="isPub" type="checkbox" /> 任何人都能访问
								</label>
							</div>
							<button type="submit" class="btn btn-primary btn-block">提交</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="static/edit.js"></script>

</html>