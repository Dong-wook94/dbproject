<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="jdbc.*"
	import = "java.util.*"%>

<%
	Database db = new Database();
	db.connectDriver();
	int success =0;
	
	int mode = Integer.parseInt(request.getParameter("mode"));
	String id = request.getParameter("id");
	String old_pw = request.getParameter("old_pw");
	String new_pw = request.getParameter("new_pw");
	
	switch(mode){
	case 0:
		ArrayList<Student> stList= db.SelectStudentQuery("select * from student where stid ="+id +"and stpass = '"+ old_pw+"'");
		if(stList.isEmpty()){
			success=0;
		}
		else{
			success=1;
			db.DMLCustomQuery("update student set stpass = "+new_pw+"where stid = "+id);
		}
		break;
	case 1:
		ArrayList<Employee> eList= db.SelectEmployeeQuery("select * from emp where eid ="+id +"and epass = '"+ old_pw+"'");
		if(eList.isEmpty()){
			success =0;
		}
		else{
			success =1;
			db.DMLCustomQuery("update emp set epass = "+new_pw+"where eid = "+id);
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
		alert("비밀번호가 틀렸습니다.");
	}
	else{
		alert("비밀번호 변경이 완료되었습니다.");
	}
	
	switch(<%=mode%>) {
		case 0:
			window.location.href = "StudentMain.jsp?stid="+<%=id%>;
			break;
		case 1:
			window.location.href = "EmployeeMain.jsp?eid="+<%=id%>;
			break;
	}
	</script>
</body>
</html>