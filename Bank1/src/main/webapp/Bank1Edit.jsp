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
 
 <form action="Bank1EditSer" method="post">
 
 <table border="1">
 <tr><td><p>ID</p><td><input type="number" name="txtid" value="<%= res.getString(1)%>" /></td></tr>
 <tr><td><p>Branch name</p><td><input type="text" name="txtbranchname" value="<%= res.getString(2)%>" /></td></tr>
 <tr><td><p>Total Branch</p><td><input type="number" name="txttotalsubbranch" value="<%= res.getString(3)%>" /></td></tr>
 <tr><td colspan="2" ><input type="submit" name="btnsubmit" value="Update"></td></tr>
 </table>
 
 </form>
 
 <% 
 }
}
%>
</body>
</html>