<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="jdbc.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String fail = "";
	try{
		if(Integer.parseInt(request.getParameter("success")) == 0)
			fail = "���̵� ���ų� ��й�ȣ�� Ʋ���ϴ�.";
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
	ID: <input id="id" type="text"/><p>
	Password: <input id="pw" type="text"/><p>
	<button onclick="login(0)">�л��α���</button>
	<button onclick="login(1)">�������α���</button><p>
	<%=fail%><p>
</body>
</html>