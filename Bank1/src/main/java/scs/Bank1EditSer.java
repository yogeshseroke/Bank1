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
 * Servlet implementation class Bank1EditSer
 */
@WebServlet("/Bank1EditSer")
public class Bank1EditSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bank1EditSer() {
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
            int x=st.executeUpdate("UPDATE bankinfo1 SET branchname='"+request.getParameter("txtbranchname")+"',total subbranch='"+request.getParameter("txttotalsubbranch")+"' WHERE bankid='"+request.getParameter("txtid")+"'");
            conn.close();
            
            if(x!=0)
            {
            	response.sendRedirect("Bank1.jsp");
            }
            else
            {
            	response.sendRedirect("Bank1.jsp?q=Data not inserted successfully");
            }
		}
		catch(Exception ex) {
			out.println(ex.getMessage().toString());
		}
	}

}
