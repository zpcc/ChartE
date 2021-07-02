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
 * Servlet implementation class DeleteArticle
 */
@WebServlet("/DeleteArticle")
public class DeleteArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteArticle() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(true);
		String referer = request.getHeader("Referer");
		// todo: post/onclick verify
		String p = "";
		if (referer != null && referer.contains("/manage.jsp?p="))
			p = "?p=" + referer.split("/manage\\.jsp\\?p\\=")[1];
		if (session.getAttribute("un") == null) {
			response.sendRedirect(Common.indexPage);
			return;
		} else {
			String Ano = request.getParameter("id");
			String username = session.getAttribute("un").toString(); // necessary
			String sql = "delete from Articles where Ano=? and Uname=?";
			try {
				if (Ano != null)
					if (!JDBCUtils.exUPD(sql, Integer.parseInt(Ano), username))
						session.setAttribute("alert", "删除失败");
				response.sendRedirect("manage.jsp" + p);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().append("jdbc failed");
			}
		}
	}

}
