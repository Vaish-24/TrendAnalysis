package com.bendthetrend.signupservlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bendthetrend.userbean.UserBean;
import com.bendthetrend.userdao.UserDao;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet(description = "For signing up information", urlPatterns = { "/SignUpServlet" })
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
		String dob = request.getParameter("yearDOB")+"-"+request.getParameter("monthDOB")+"-"+request.getParameter("dateDOB");
        UserBean ub = new UserBean(request.getParameter("userName"), request.getParameter("emailId"), request.getParameter("userPass"), request.getParameter("userGender"),dob,request.getParameter("userMaritalStatus"));
        System.out.println(ub+" ");
        UserDao ud = new UserDao();
        int flag = ud.setValues(ub);
        if(flag>0)
        {
        	RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
        }
        else
        {
        	
        	response.sendRedirect("SignUp.jsp");
        }
	}

}
