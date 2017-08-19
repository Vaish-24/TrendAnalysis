package com.bendthetrend.addtowishlistservlet;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bendthetrend.connection.MyConnection;
import com.bendthetrend.userbean.UserBean;

/**
 * Servlet implementation class AddToWishList
 */
@WebServlet("/AddToWishList")
public class AddToWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToWishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		UserBean ub = (UserBean)session.getAttribute("userBean");
		int app_id = Integer.parseInt(request.getParameter("app_id"));
		System.out.println(session+" "+ub.getUserId()+" "+" "+app_id);
				
		try
		{
			Connection con = MyConnection.getConnection();
			PreparedStatement ps1 = con.prepareStatement("select * from wishlist where userId = ? and appId = ? and activeStatus = ?");
			ps1.setInt(1, ub.getUserId());
			ps1.setInt(2, app_id);
			ps1.setString(3, "Active");
			ResultSet rs = ps1.executeQuery();
			if(rs.next()==false)
			{
				PreparedStatement ps = con.prepareStatement("INSERT INTO wishlist(appId, userId, dateTimeStamp, activeStatus) VALUES (?,?,?,?)");
				
				LocalDate localDate = LocalDate.now();
			    String currDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
			    ps.setInt(1, app_id);
			    ps.setInt(2, ub.getUserId());
			    ps.setString(3, currDate);
			    ps.setString(4, "Active");
			    ps.execute();
				
			}

		    RequestDispatcher rd = request.getRequestDispatcher("displaywishlist.jsp");
		    rd.forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
