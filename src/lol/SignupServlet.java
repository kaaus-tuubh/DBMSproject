package lol;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signup")
public class SignupServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SignupServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String regid=request.getParameter("regid");
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String pwd=request.getParameter("pwd");
		String year=request.getParameter("admyear");
		
		String url = "jdbc:mysql://localhost:3306/miniproject";
	    String username = "root";
	    String password = "root";
	    
	    try {
	    	
			String sql = "insert into student(FirstName,MiddleName,LastName,RegID,Email,Contact,Pass_word,AdmissionYear) values('" + fname + "', '" + mname + "', '" + lname + "', '" + regid + "', '" + email + "', '" + contact +"', '" + pwd +"', '" + year +"')" ;                                                       
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection(url,username,password);
		    Statement st = con.createStatement();
		    st.executeUpdate(sql);
		    
    		response.sendRedirect("Login.jsp"); 
		   
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
			
		}
		
}
}