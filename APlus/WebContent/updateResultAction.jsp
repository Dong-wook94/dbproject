<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="jdbc.*" import="java.util.*"%>

<%
	Database db = new Database();
	db.connectDriver();
	int success = 0;

	int id = Integer.parseInt(request.getParameter("id"));
	String suid = request.getParameter("suid");
	String stid = request.getParameter("stid");
	String semester = request.getParameter("semester");
	String grade = request.getParameter("grade");

	ArrayList<Subject> sbList = db.SelectSubjectQuery(
			"select * from subject where semester = '" + semester + "' and suid='" + suid + "'");
	if (sbList.isEmpty()) {
		success = 0;//과목 잘못입력
	} else {
		success = 1;
	}

	ArrayList<Student> stList = db.SelectStudentQuery("select * from student where stid = " + stid);

	if (success == 1 && !stList.isEmpty()) {
		success = 1;
	} else {
		success = -1;//학번이 없는경우
	}

	if (success == 1) {
		ArrayList<Result> rsList = db.SelectResultQuery("select * from results where suid='" + suid + "' and stid = " + stid);
		if (rsList.isEmpty()) {
			//성적없음 이러면 무조건 재이수가 아님
			db.DMLCustomQuery("insert into results values ("+stid+",'"+suid+"','"+semester+"','"+grade+"',0)");
		} else {
			//성적있음 재이수 일수도있고 아닐수도있고
			if (rsList.get(0).getSemester().equals(semester)) {//학기가 일치하는 경우
				if(rsList.get(0).getRetry()==1){//재이수인경우 하지만 기존에 성적은 입력되어있음
					if(grade.toString().equals("A+")||grade.toString().equals("A0")||grade.toString().equals("A-")){
						db.DMLCustomQuery("update results set grade = 'B+' where stid=" + stid + " and suid = '" + suid + "'");
					}else{
						db.DMLCustomQuery("update results set grade = '" + grade
								+ "'where stid=" + stid + " and suid = '" + suid + "'");
					}
				}else{//아닌경우
					db.DMLCustomQuery("update results set grade = '" + grade
							+ "'where stid=" + stid + " and suid = '" + suid + "'");
				}
			} else {//학기가 일치하지 않는 경우 무조건 재이수 하지만 이번하기 성적은 입력되지 않음
				db.DMLCustomQuery("update results set semester = '" + semester + "',grade = '" + grade
						+ "',retry=1 where stid=" + stid + " and suid = '" + suid + "'");
			}
		}
	}
%>
<html>
<head>
</head>
<body>
	<script>
		if (<%=success%>== 1) {
			window.location.href = "EmployeeMain.jsp?eid="+<%=id%>;
		} else if (<%=success%>== 0) {
			window.location.href = "StudentMain.jsp?stid=" +<%=id%>;
		} else if(<%=success%>== -1) {
			window.location.href = "EmployeeMain.jsp?eid=" +<%=id%>;
		}
		
	</script>
</body>
</html>