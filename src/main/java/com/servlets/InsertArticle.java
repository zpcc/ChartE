package com.servlets;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.JDBC.JDBCUtils;
import com.common.Common;

/**
 * Servlet implementation class InsertArticle
 */
@WebServlet("/InsertArticle")
public class InsertArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertArticle() {
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
		String referer = request.getHeader("Referer");
		String p = "";
		if (referer != null && referer.contains("/manage.jsp?p="))
			p = "?p=" + referer.split("/manage\\.jsp\\?p\\=")[1];
		if (session.getAttribute("un") == null) {
			response.sendRedirect(Common.indexPage);
			return;
		} else {
			String username = session.getAttribute("un").toString();
			String title = request.getParameter("title");
			String sql = "insert into Articles(title, Uname) values (?, ?)";
			try {
				if (title != null) {
					String b64title = Base64.getEncoder().encodeToString(title.getBytes("utf-8"));
					if (b64title.length() <= 100) {
						if (!JDBCUtils.exUPD(sql, b64title, username))
							session.setAttribute("alert", "添加失败");
					} else
						session.setAttribute("alert", "标题过长");
				}
				response.sendRedirect("manage.jsp" + p);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.getWriter().append("jdbc failed");
			}
		}
	}

}
