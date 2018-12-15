<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="jdbc.*"
	import = "java.util.*"%>

<%
	Database db = new Database();
	db.connectDriver();
	int success =0;
	
	int mode = Integer.parseInt(request.getParameter("mode"));
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	switch(mode){
	case 0:
		ArrayList<Student> stList= db.SelectStudentQuery("select * from student where stid ="+id +"and stpass = '"+ pw+"'");
		if(stList.isEmpty()){
			success =0;
		}
		else{
			success =1;
		}
		break;
	case 1:
		ArrayList<Employee> eList= db.SelectEmployeeQuery("select * from emp where eid ="+id +"and epass = '"+ pw+"'");
		if(eList.isEmpty()){
			success =0;
		}
		else{
			success =1;
		}
		break;
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