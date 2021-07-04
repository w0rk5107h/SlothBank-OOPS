<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");		
	String url = "jdbc:mysql://localhost:3306/SlothBank";
	String username = "w0rk5107h";
	String password = "drockx";
	Connection con = DriverManager.getConnection(url,username,password);
	Statement st = con.createStatement();
%>