<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"
    import="jdbc.*"
    import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>학생 페이지</title>
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
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">
	<div align="right" style="width: 100%">
		<button class="btn btn-primary" style="position: relative; right: 0"
			onclick="chPW()">비밀번호 변경</button>
	</div>
	<div class="card align-middle"
		style="width: 700px; border-radius: 20px;">
		<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">APLUS</h2>
		</div>
		<div class="card-body">
			<select id="semester" style="margin-left:50px">
				<option value="">학기</option>
				<option value="1">1학기</option>
				<option value="2">2학기</option>
				<option value="계절">계절학기</option>
			</select>
	
			<select id="category" style="margin-left:50px">
				<option value="">구분</option>
				<option value="공학전공">공학전공</option>
				<option value="전공기반">전공기반</option>
				<option value="기본소양">기본소양</option>
				<option value="교양">교양</option>
			</select>
	
			<select id="grade" style="margin-left:50px">
				<option value="">학점</option>
				<option value="A%2B">A+</option>
				<option value="A0">A0</option>
				<option value="A-">A-</option>
				<option value="B%2B">B+</option>
				<option value="B0">B0</option>
				<option value="B-">B-</option>
				<option value="C%2B">C+</option>
				<option value="C0">C0</option>
				<option value="C-">C-</option>
				<option value="F">F</option>
			</select>

		<button class="btn btn-primary" style="margin-left:100px"
		onclick = "search()">검색</button>
	</div>
	
	<div style="margin:0 auto">
		<table class="table" style="width:600px">
			<thead>
				<tr>
					<th scope="cols">학번</th>
					<th scope="cols">강의번호</th>
					<th scope="cols">학기</th>
					<th scope="cols">성적</th>
					<th scope="cols">재수강­</th>
				</tr>
			</thead>
			<tbody>
			<%
				String filterSemester = request.getParameter("semester");
				String filterCategory = request.getParameter("category");
				String filterGrade = request.getParameter("grade");
			
				Database db = new Database();
				db.connectDriver();
				
				String stid = request.getParameter("stid");
				
				String query = "select * from results where stid = " + stid;
				
				if (filterSemester != null) {
					query = query + " and semester = " + filterSemester;
				}
				
				ArrayList<Result> result = db.SelectResultQuery(query);
				
				ArrayList<String> fsuid = new ArrayList<String>();
				for (Result r : result) {
					fsuid.add(r.getSuid());
				}
				
				HashMap<String, String> itc = db.SelectCategoryFromResults(fsuid);
				
				if (filterCategory != null) {
					ArrayList<Result> nResult = new ArrayList<Result>();
					for (Result r : result) {
						if (itc.get(r.getSuid()).equals(filterCategory)) nResult.add(r);
					}
					result = nResult;
				}
				
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
	</div>
	<script>
function chPW() {
	var id = <%=request.getParameter("stid")%>;
	window.location.href = "changePassword.jsp?mode=0&id=" + id;
}
function search() {
	var id = <%=request.getParameter("stid")%>;
	
	var semester = document.getElementById("semester").value;
	var category = document.getElementById("category").value;
	var grade = document.getElementById("grade").value;
	
	var filterq = "&";
	
	if (semester !== "") {
		filterq = filterq + "semester=" + semester;
	}
	
	if (category !== "") {
		if (filterq !== "&") filterq = filterq + "&";
		filterq = filterq + "category=" + category;
	}
	
	if (grade !== "") {
		if (filterq !== "&") filterq = filterq + "&";
		filterq = filterq + "grade=" + grade;
	}
	
	if (filterq !== "&") window.location.href = "StudentMain.jsp?stid=" + id + filterq;
}
</script>
</body>
</html>