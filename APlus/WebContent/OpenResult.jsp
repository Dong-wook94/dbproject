<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    import="jdbc.*"
    import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>학번</th>
					<th>강의번호</th>
					<th>학기</th>
					<th>성적</th>
					<th>재수강</th>
				</tr>
			</thead>
			<tbody>
			<%
				Database db = new Database();
				db.connectDriver();
				
				String stid = request.getParameter("stid");
				
				ArrayList<Result> result = db.SelectResultQuery("select * from results where stid = " + stid);
				
				for (Result r : result) {
					%>
					<tr>
						<th> <%= r.getStid() %> </th>
						<th> <%= r.getSuid() %> </th>
						<th> <%= r.getSemester() %> </th>
						<th> <%= r.getGrade() %> </th>
						<th> <%= r.getRetry() %> </th>
					</tr>
					<%
				}
			%>
			</tbody>
		</table>
	</div>
	<script>

</script>
</body>
</html>