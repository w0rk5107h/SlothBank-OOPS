<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	session.setAttribute("logged_in", "false");
	session.setAttribute("logged_in_as", null);
	response.sendRedirect("index.jsp");
%>