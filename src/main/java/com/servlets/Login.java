package com.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JDBC.JDBCUtils;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Login() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("un");
		String pwd = request.getParameter("pwd");
		String sql = "select isAdmin from Users where Uname=? and pwd=?";
		HttpSession session = request.getSession(true);
		try {
			ArrayList<Object> arr = JDBCUtils.fetchOne(sql, username, pwd);
			if (arr != null) {
				Boolean isAdmin = (Boolean) arr.get(0);
				session.setAttribute("un", username);
				session.setAttribute("isAdmin", isAdmin);
				response.sendRedirect("manage.jsp");
			} else {
				session.setAttribute("alert", "用户名或密码错误");
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().append("jdbc failed");
		}
	}

}
