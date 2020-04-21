package lol;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginAdmin() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, HeadlessException {
		
		String uname = request.getParameter("RegID");
		String pwd = request.getParameter("Pass_word");
		
		String url = "jdbc:mysql://localhost:3306/miniproject";
		String username = "root";
		String password = "root";

		try {
			
			String sql = "select * from admin where username ='" + uname + "' and pwd ='" + pwd + "'";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			HttpSession session = request.getSession();
			if (rs.next()) {
				
				session.setAttribute("RegID",uname);
				session.setAttribute("me",uname);
				session.setAttribute("sdate",null);
				session.setAttribute("edate",null);
				response.sendRedirect("Admin.jsp");
				
			} else{
				
				response.sendRedirect("LoginAdmin.jsp");
				

		} }catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();

		
	}}

}
