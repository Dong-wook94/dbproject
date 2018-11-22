<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<body>
<%
try (BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\shin\\Downloads\\score.csv"))) {
	String line;
	while ((line = br.readLine()) != null) {
		String[] ls = line.split(",");
		for (String s : ls) {
			System.out.print(s + "\t\t");
		}
		System.out.println();
	}
} catch (FileNotFoundException e) {
	e.printStackTrace();
} catch (IOException e) {
	e.printStackTrace();
}
%>
</body>
</html>