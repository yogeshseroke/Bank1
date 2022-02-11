<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Are you sure, you want to delete the record?</h1>
<%
if(request.getParameter("q")!=null)
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1","root","");
    Statement st=conn.createStatement();
    ResultSet res=st.executeQuery("SELECT * FROM bankinfo1 WHERE bankid='"+request.getParameter("q")+"'");

    if(res.next())
    {
 %>   	

<form action="Bank1DeleteSer" method="post">
<table border="2">
<tr><td><p>ID</p></td><td><input type="number" name="txtid" value="<%= res.getString(1)%>" /></td></tr>
<tr><td><p>Branch name</p></td><td><input type="text" name="txtbranchname" value="<%= res.getString(2)%>" /></td></tr>
<tr><td><p>Total SubBranch</p></td><td><input type="number" name="txttotalsubbranch" value="<%= res.getString(3)%>" /></td></tr>
<tr><td colspan="2"><input type="submit" name="btnsubmit" value="Delete" /></td></tr>
</table>
</form>
<%
}
    }
%>
</body>
</html>