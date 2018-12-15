<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"
import="jdbc.*"
import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
	html {
		height: 100%;
	}
	
	body {
		width:100%;
		height:100%;
		margin: 0;
		padding-top: 80px;
		padding-bottom: 40px;
		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
		background-repeat: no-repeat;
		background:linear-gradient(to bottom right, #0098FF, #6BA8D1);
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
</style>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>교직원 추가 페이지</title>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<div align="right" style="width: 100%">
		<button class="btn btn-primary" style="position: relative; right: 0"
		onclick="chPW()">비밀번호변경</button>
	</div>
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">APLUS</h2>
		</div>
		<div class="card-body">
			<h5 class="form-signin-heading">교직원 추가</h5><BR>

			<input type="text" id="id" class="form-control" name="username" placeholder="교직원 ID" required autofocus><BR>

			<input type="text" id="name" class="form-control" name="username" placeholder="이름" required autofocus><BR>

			<select id="employee">
				<option selected="selected" value="교수">교수</option>
				<option value="교직원">교직원</option>
			</select><BR>


			<button class="btn btn-lg btn-primary btn-block" onclick="insertEmployee()" >추가</button>

			<form name="frm" method="post" action=""></form>



		</div>
	</div>

	<div class="modal">
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
	<%
	String fail = "";
	try{

	if(Integer.parseInt(request.getParameter("success")) == 0)
	fail = "아이디가 없거나 비밀번호가 틀립니다.";
}catch(Exception e){}
%>
<script>
<%
	Database db = new Database();
	db.connectDriver();


	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String employee = request.getParameter("employee");

	if(id!=null && name!=null && employee!=null)
		db.DMLCustomQuery("insert into emp values (" +id+ ", '" + name+ "', '"+employee+"', '1234')");

	%>

	function chPw() {
		var old_pw = document.getElementById("old_pw").value;
		var new_pw = document.getElementById("new_pw").value;
		var new_pw2 = document.getElementById("new_pw2").value;

		if(new_pw == new_pw2)
			window.location.href = "changePasswordAction.jsp?mode="+<%=request.getParameter("mode")%>+"&id=" + <%=request.getParameter("id")%> + "&new_pw=" + new_pw+"&old_pw="+old_pw;
		else{
			alert("새 비밀번호가 일치하지 않습니다.");
		}
		

	}

	function insertEmployee(){
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		var select = document.getElementById("employee");
		var employee = select.options[select.selectedIndex].value;

		frm.target="por"
		frm.action="addEmp.jsp?id="+id+"&name="+name+"&employee="+employee;
		frm.submit();
	}
</script>
<h5 style="text-align:center; color:white"><%=fail%></h5>
</body>
</html>