<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>APLUS</title>
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
  </head>
 <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">APLUS</h2>
		</div>
		<div class="card-body">
              <h5 class="form-signin-heading">로그인</h5>
              <label for="inputEmail" class="sr-only">학번 또는 교직원 번호</label>
              <input type="text" id="id" class="form-control" name="username" placeholder="학번 또는 교직원 번호" required autofocus><BR>
              <label for="inputPassword" class="sr-only">비밀번호</label>
              <input type="password" id="pw" class="form-control" name="password" placeholder="비밀번호" required><br>

              <button class="btn btn-lg btn-primary btn-block" onclick="login(0)" >학생 로그인</button>
                   <button  class="btn btn-lg btn-primary btn-block" onclick="login(1)">교직원 로그인</button>
                   
	
      
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
function login(mode) {
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	
	if (mode == 0) {
		window.location.href = "LoginAction.jsp?mode=0&id=" + id + "&pw=" + pw;
	} else {
		window.location.href = "LoginAction.jsp?mode=1&id=" + id + "&pw=" + pw;
	}
}
</script>
<h5 style="text-align:center; color:white"><%=fail%></h5>
</body>
</html>