<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="g.jsp" method="GET">
	table: <input name="q" type="text"/><p>
	col: <input name="s" type="text"/><p>
	<button type="submit">select</button><p>
</form>
<% OracleJDBC_Assignment.start(); %>
</body>
</html>