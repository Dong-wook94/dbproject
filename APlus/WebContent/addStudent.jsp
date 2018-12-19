<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
import="jdbc.*"
import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<style>
	html {
		height: 100%;
	}

	body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding-bottom: 40px;
		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
		background-repeat: no-repeat;
		background: linear-gradient(to bottom right, #0098FF, #6BA8D1);
	}

	.card {
		margin: 0 auto; /* Added */
		float: none; /* Added */
		margin-bottom: 10px; /* Added */
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
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
</style>
<meta charset="utf-8">
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
crossorigin="anonymous">
<title>학생 추가 페이지</title>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
width="100%" height="100%" align="center">
<div align="right" style="width: 100%">
	<button class="btn btn-primary" style="position: relative; right: 0"
	onclick="chPW()">비밀번호변경</button>
	<button class="btn btn-primary" style="position: relative; right: 0"
			onclick="history.back(-1)">뒤로가기</button>
</div>
<div class="card align-middle"
style="width: 20rem; border-radius: 20px;">
<div class="card-title" style="margin-top: 30px;">
	<h2 class="card-title text-center" style="color: #113366;">APLUS</h2>
</div>
<div class="card-body">
	<h5 class="form-signin-heading">학생 추가</h5><BR>
	<label for="inputEmail" class="sr-only">학번 또는 교직원 번호</label>

	<input
	type="text" id="id" class="form-control" name="username"
	placeholder="학번" required autofocus><BR>

	<input
	type="text" id="name" class="form-control" name="username"
	placeholder="이름" required autofocus><BR>

	<input
	type="text" id="major" class="form-control" name="username"
	placeholder="전공" required autofocus><BR>

	<input
	type="text" id="year" class="form-control" name="username"
	placeholder="학년" required autofocus><BR>

	
	<button class="btn btn-lg btn-primary btn-block"
	onclick="insertStudent()">학생 추가</button>

	<form name="frm" method="post" action=""></form>
	



</div>
</div>

</body>
<script>
	



	function insertStudent(){
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		var major = document.getElementById("major").value;
		var year = document.getElementById("year").value;
		
		frm.target="_self"
		frm.action="addStdAction.jsp?eid="+<%=request.getParameter("eid")%>+"&id="+id+"&name="+name+"&major="+major+"&year="+year;
		frm.submit();

		
	}
</script>
</html>