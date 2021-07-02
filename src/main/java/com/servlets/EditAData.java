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
 * Servlet implementation class EditAData
 */
@WebServlet("/EditAData")
public class EditAData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAData() {
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
			String Ano = request.getParameter("id");
			String data = request.getParameter("data");
			String isPub_ = request.getParameter("isPub");
			boolean isPub = (isPub_ != null && isPub_ != "");
			String sql = "update Articles set b64data=?, isPub=? where Ano=? and Uname=?";
			try {
				if (Ano != null && data != null) {
					String b64data = Base64.getEncoder().encodeToString(data.getBytes("utf-8"));
					if (!JDBCUtils.exUPD(sql, b64data, isPub, Integer.parseInt(Ano), username))
						session.setAttribute("alert", "编辑失败");
					else
						session.setAttribute("alert", "提交成功");
					String referer = request.getHeader("Referer");
					if (referer == null)
						referer = "manage.jsp";
					response.sendRedirect(referer);
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
