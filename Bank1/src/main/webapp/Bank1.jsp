<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<center>
<table border="1" bgcolor="orange">
<tr>
<td bgcolor="lightpink">Bankid</td>
<td bgcolor="lightblue">Branchname</td>
<td bgcolor="yellow">Total Sub-branch</td>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1","root","");
Statement st=conn.createStatement();
ResultSet res=st.executeQuery("SELECT * FROM bankinfo1");
while(res.next())
{%>

<tr>
<td><%= res.getString(1) %></td><td><%= res.getString(2) %></td><td><%= res.getString(3) %></td><td><a href="Bank1Edit.jsp?q=<%= res.getString(1)  %>" bgcolor="yellow">Edit</a></td><td><a href="Bank1Delete.jsp?q=<%= res.getString(1)  %>">Delete</a></td>
</tr>	
<% }%>

<form action="Bank1Ser" method="post">
<tr >
<td ><input type="number" name="txtid" /></td>
<td><input type="text" name="txtbranchname" /></td>
<td><input type="number" name="txttotalsubbranch" /></td>

<td><input type="submit" name="btnsubmit" /></td>
</tr>

</form>

<% 
if(request.getParameter("q")!=null)
{
    out.print(request.getParameter("q"));     	
}
%>
</table>
</center>
</body>
</html>