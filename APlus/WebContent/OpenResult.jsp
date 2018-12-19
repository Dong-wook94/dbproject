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
			onclick="history.back(-1)">뒤로가기</button>
	</div>
	<div class="card align-middle" style="width: 900px; border-radius: 20px;">
		<div class="card-title" style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">APLUS</h2>
		</div>
		<div class="card-body form-inline" style="margin: auto; width:95%">
			<div>
				<select id="semester" class="form-control">
					<option value="">학기</option>
					<option value="1">1학기</option>
					<option value="2">2학기</option>
					<option value="S">계절학기</option>
				</select>
			</div>
			
			<div style="margin-left: 16px;">
				<select id="category" class="form-control">
					<option value="">구분</option>
					<option value="%EA%B3%B5%ED%95%99%EC%A0%84%EA%B3%B5">공학전공</option>
					<option value="%EC%A0%84%EA%B3%B5%EA%B8%B0%EB%B0%98">전공기반</option>
					<option value="%EA%B8%B0%EB%B3%B8%EC%86%8C%EC%96%91">기본소양</option>
					<option value="%EA%B5%90%EC%96%91">교양</option>
				</select>
			</div>
			
			<div style="margin-left: 16px;">
				<select id="grade" class="form-control">
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
			</div>

			<div style="margin-left: auto;">
				<button class="btn btn-primary" style="width:96px;" onclick="search()">검색</button>
			</div>
		</div>
	
		<div style="margin: auto; text-align:center; margin-bottom: 16px;">
			<table class="table" style="margin: auto; width:90%">
				<thead>
					<tr>
						<th scope="cols">학번</th>
						<th scope="cols">강의번호</th>
						<th scope="cols" width="400">강의명</th>
						<th scope="cols" width="300">구분</th>
						<th scope="cols">학기</th>
						<th scope="cols">성적</th>
						<th scope="cols">재수강­</th>
					</tr>
				</thead>
				<tbody>
				<%
					request.setCharacterEncoding("utf-8");
					String filterSemester = request.getParameter("semester");
					String filterCategory = request.getParameter("category");
					String filterGrade = request.getParameter("grade");
				
					Database db = new Database();
					db.connectDriver();
					
					String stid = request.getParameter("stid");
					
					String query = "select * from results r,subject s where r.suid = s.suid AND r.semester=s.semester and r.stid = " + stid;
					
					if (filterSemester != null) {
						if (filterSemester.equals("S")) {
							query = query + " and (r.semester like '%' || 'S' or r.semester like '%' || 'W')";
						} else {
							query = query + " and r.semester like '%' || '" + filterSemester + "'";
						}
					}
					if (filterCategory != null){
						query = query + " and s.sufield = '" + filterCategory + "'";
					}
					if (filterGrade != null) {
						query = query + " and r.grade = '" + filterGrade + "'";
					}
					
					ArrayList<JoinResultSubject> result = db.SelectJoinResultSubjectQuery(query);
					
					for (JoinResultSubject r : result) {
						%>
						<tr>
							<th scopre="row"> <%= r.getStid() %> </th>
							<th scopre="row"> <%= r.getSuid() %> </th>
							<th scopre="row"> <%= r.getSuname() %> </th>
							<th scopre="row"> <%= r.getSufield() %> </th>
							<th scopre="row"> <%= r.getSemester() %> </th>
							<th scopre="row"> <%= r.getGrade() %> </th>
							<th scopre="row"> <%= ((r.getRetry() == 0) ? "X" : "O") %> </th>
						</tr>
						<%
					}
					
					if (result.size() == 0) {
						%>
						<tr>
							<th scopre="row" colspan=6>검색 결과가 없습니다.</th>
						</tr>
						<%
					}
					
					/* get avg. grade from student table
					Object rawAvgGrade = db.GetFirstRowFirstColObjectFromQuery("select avg_grade from student where stid=" + stid);
					float avgGrade = (rawAvgGrade instanceof Float) ? (float)rawAvgGrade : 0f;
					*/
					float avgGrade = 0f;
					int cntGrade = 0;
					int totalCredit = 0;
					if (result.size() != 0) {
						for (JoinResultSubject r : result) {
							if (r.getGrade().equals("A+")) avgGrade += 4.3f;
							else if (r.getGrade().equals("A0")) avgGrade += 4.0f;
							else if (r.getGrade().equals("A-")) avgGrade += 3.7f;
							else if (r.getGrade().equals("B+")) avgGrade += 3.3f;
							else if (r.getGrade().equals("B0")) avgGrade += 3.0f;
							else if (r.getGrade().equals("B-")) avgGrade += 2.7f;
							else if (r.getGrade().equals("C+")) avgGrade += 2.3f;
							else if (r.getGrade().equals("C0")) avgGrade += 2.0f;
							else if (r.getGrade().equals("C-")) avgGrade += 1.7f;
							cntGrade++;
						}
						avgGrade = avgGrade / cntGrade;

						ArrayList<String> fsuid = new ArrayList<String>();
						//fsuid.clear();
						for (JoinResultSubject r : result) {
							fsuid.add(r.getSuid());
						}
						totalCredit = db.GetTotalCredit(fsuid);
					}
				%>
				</tbody>
			</table>
		</div>
		<div style="margin-bottom: 16px; margin-right: 24px; text-align: right;">
			총 학점: <%= totalCredit %>, 평점: <%= String.format("%.1f", avgGrade) %>
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
	else window.location.href = "StudentMain.jsp?stid=" + id;
}

// filter option recovery
<%
	String pSemester = request.getParameter("semester");
	String pCategory = request.getParameter("category");
	String pGrade = request.getParameter("grade");
	if (pSemester == null) pSemester = "0";
	if (pSemester.equals("S")) pSemester = "3";
	if (pCategory == null) pCategory = "";
	if (pGrade == null) pGrade = "";
%>
var sSemester = document.getElementById("semester");
var sCategory = document.getElementById("category");
var sGrade = document.getElementById("grade");

sSemester.selectedIndex = <%= pSemester %>;

for (var i = 0; i < sCategory.options.length; i++) {
	if (sCategory.options[i].text === "<%= pCategory %>") {
		sCategory.selectedIndex = i;
		break;
	}
}

for (var i = 0; i < sGrade.options.length; i++) {
	if (sGrade.options[i].text === "<%= pGrade %>") {
		sGrade.selectedIndex = i;
		break;
	}
}

</script>
</body>
</html>