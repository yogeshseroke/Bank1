package scs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Bank1Ser
 */
@WebServlet("/Bank1Ser")
public class Bank1Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bank1Ser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1","root","");
            Statement st=conn.createStatement();
            ResultSet res=st.executeQuery("SELECT * FROM bankinfo1 WHERE bankid='"+request.getParameter("txtid")+"'");
		
		if(res.next())
		{
			response.sendRedirect("Bank1.jsp?q= This is already exists");
		}
		else
		{
			int x=st.executeUpdate("INSERT INTO `bankinfo1` (`bankid` , `branchname`, `total subbranch`) VALUES('"+request.getParameter("txtid")+"','"+request.getParameter("txtbranchname")+"','"+request.getParameter("txttotalsubbranch")+"')");
			
			if(x!=0)
			{
				response.sendRedirect("Bank1.jsp");
			}
			else
			{
				response.sendRedirect("Bank1.jsp?q=Data not inserted successfully");
			}
		}
		}
		catch(Exception ex)
		{
			out.println(ex.getMessage().toString());
		}
	}

}
