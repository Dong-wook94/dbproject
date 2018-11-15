<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		int result;
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("driver found");
		} catch (ClassNotFoundException e) {
			System.err.println("error: " + e.getMessage());
			return;
		}
		
		try {
			conn = DriverManager.getConnection(url, "kdhong", "kdhong");
		} catch (SQLException e) {
			System.err.println("sql error: " + e.getMessage());
			return;
		}
		
		try {
			conn.setAutoCommit(false);
			
			Statement stmt = conn.createStatement();
			
			String sqlq = "select * from " + request.getParameter("q");
			ResultSet rs = stmt.executeQuery(sqlq);
			while (rs.next()) {
				String pageprint = rs.getString(request.getParameter("s")) + "\n";
				%>
				<%= pageprint %><p>
				<%
			}
			rs.close();
		
			conn.rollback();
			conn.setAutoCommit(true);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			System.err.println("sql error: " + e.getMessage());
		}
%>
</body>
</html>