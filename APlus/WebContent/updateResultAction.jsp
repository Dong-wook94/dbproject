<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="jdbc.*"
	import = "java.util.*"%>

<%
	Database db = new Database();
	db.connectDriver();
	int success =0;
	
	int id = Integer.parseInt(request.getParameter("id"));
	String suid = request.getParameter("suid");
	String stid = request.getParameter("stid");
	String semester = request.getParameter("semester");
	String grade = request.getParameter("grade");
	
	
	ArrayList<Result> rsList= db.SelectResultQuery("select * from results where stid = "+stid+" and suid='"+suid+"'");
	if(rsList.isEmpty()){
		success = 0;
	}else{
		success = 1;
	}
	
	
	
%>
<html>
<head>
</head>
<body>
	<script>
	if(<%= success %> == 0)
	{
		window.location.href = "index.jsp?success=0";
	}
	else{
		if(<%= mode %> ==0){
			window.location.href = "StudentMain.jsp?stid="+<%=id%>;
		}
		else{
			window.location.href = "EmployeeMain.jsp?eid="+<%=id%>;
		}
	}
	</script>
</body>
</html>