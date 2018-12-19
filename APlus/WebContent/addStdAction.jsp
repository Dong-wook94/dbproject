<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
import="jdbc.*"
import="java.util.*" %>
<html>
<head>
</head>
<body>

<%
	Database db = new Database();


	db.connectDriver();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String year = request.getParameter("year");
	String eid = request.getParameter("eid");

	if(id!=null && name!=null && major!=null)
		db.DMLCustomQuery("insert into student values (" +id+ ",'" + name+ "', '1234', '"+major+"', '"+year+"',0)");
	
	%>
	<script>
	window.location.href="EmployeeMain.jsp?eid="+<%=eid%>;
		</script>
	
</body>
</html>