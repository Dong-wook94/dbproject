<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="jdbc.*"
    import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>�й�</th>
					<th>���ǹ�ȣ</th>
					<th>�б�</th>
					<th>����</th>
					<th>�����</th>
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