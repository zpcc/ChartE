package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JDBC.JDBCUtils;
import com.common.Common;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		if (session.getAttribute("un") == null) {
			response.sendRedirect(Common.indexPage);
			return;
		} else {
			String username = session.getAttribute("un").toString();
			String opwd = request.getParameter("opwd");
			String npwd = request.getParameter("npwd");
			String delFlag2 = request.getParameter("del");
			boolean delF = (delFlag2 != null && delFlag2 != "");
			try {
				if (opwd != null) {
					if (delF) {
						// String sql = "delete from Users where Uname=? and pwd=?";
						// 还要处理articles，清除session
						// JDBCUtils.exUPD(sql, username, opwd);
						response.sendRedirect("settings.jsp");
					} else {
						if (npwd != null) {
							String sql = "update Users set pwd=? where Uname=? and pwd=?";
							if (JDBCUtils.exUPD(sql, npwd, username, opwd))
								response.sendRedirect("logout.jsp");
							else {
								session.setAttribute("alert", "原密码错误");
								response.sendRedirect("settings.jsp");
							}
						}
					}
				} else {
					response.getWriter().append("failed");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().append("jdbc failed");
			}
		}
	}

}
