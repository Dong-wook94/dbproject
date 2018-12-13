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
<style>
	html {
		height: 100%;
	}
	
	body {
		/*width:100%;*/
		/*height:100%;*/
		/*margin: 0 auto;*/
		padding-top: 80px;
		padding-bottom: 40px;
		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
		background-repeat: no-repeat;
		/*background:linear-gradient(to bottom right, #0098FF, #6BA8D1);*/
	}
	
	.card {
		margin: 0 auto; /* Added */
		float: none; /* Added */
		margin-bottom: 10px; /* Added */
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
		position: relative;
		height: auto;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		padding: 10px;
		font-size: 16px;
	}

	table.type07 {
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
		border: 1px solid #ccc;
		margin: 20px 10px;
	}
	table thead {
		border-right: 1px solid #ccc;
		border-left: 1px solid #ccc;
		background: #2ECCFA;
	}
	table thead th {
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		color: #fff;
	}
	table tbody th {
		width: 150px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: #fcf1f4;
	}
	table td {
		width: 350px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}

	#wrapper{
		max-width: 1020px;
		margin : 0 auto;
	}
</style>
</head>
<body>
	<div align="right" style="width:100%">
		<button class="btn btn-primary" style="position:relative; right: 0"  onclick="chPW()">��й�ȣ ����</button>
	</div>
	
	<div style="width:100%">
	
	<select name="semester" style="margin-left:30px, width:200px">
			<option value="">�б�</option>
			<option value="1">1�б�</option>
			<option value="2">2�б�</option>
			<option value="����">�����б�</option>
		</select>

		<select name="category" style="margin-left:30px">
			<option value="">����</option>
			<option value="��������">��������</option>
			<option value="�������">�������</option>
			<option value="�⺻�Ҿ�">�⺻�Ҿ�</option>
			<option value="����">����</option>
		</select>

		<select name="grade" style="margin-left:30px">
			<option value="">����</option>
			<option value="��������">��������</option>
			<option value="�������">�������</option>
			<option value="�⺻�Ҿ�">�⺻�Ҿ�</option>
			<option value="����">����</option>
		</select>

		<button class="btn btn-primary" style="margin-left:30px">�˻�</button>
		
		</div>
	
	<div style="margin:0 auto">
		<table class="table" style="width:50%">
			<thead>
				<tr>
					<th scope="cols">�й�</th>
					<th scope="cols">���ǹ�ȣ</th>
					<th scope="cols">�б�</th>
					<th scope="cols">����</th>
					<th scope="cols">�������</th>
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
						<th scopre="row"> <%= r.getStid() %> </th>
						<th scopre="row"> <%= r.getSuid() %> </th>
						<th scopre="row"> <%= r.getSemester() %> </th>
						<th scopre="row"> <%= r.getGrade() %> </th>
						<th scopre="row"> <%= r.getRetry() %> </th>
					</tr>
					<%
				}
			%>
			</tbody>
		</table>
	</div>
	</div>
	<script>
function chPW() {
	var id = <%=request.getParameter("stid")%>;
	window.location.href = "changePassword.jsp?mode=0&id=" + id;
	
}
</script>
</body>
</html>