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
	String employee = request.getParameter("employee");
	String eid = request.getParameter("eid");

	if(id!=null && name!=null && employee!=null)
		db.DMLCustomQuery("insert into emp values (" +id+ ", '" + name+ "', '"+employee+"', '1234')");
	
	%>
	<script>
	window.location.href="EmployeeMain.jsp?eid="+<%=eid%>;
		</script>
	
</body>
</html>
