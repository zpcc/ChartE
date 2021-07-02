package com.JDBC;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class JDBCUtils implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static Connection getConnection() throws SQLException, ClassNotFoundException {

		String URL = null;
		URL = "postgres://postgres:zas51d@127.0.0.1:5555/charte";
		// URL = "mysql://root:6FnctS@127.0.0.1:3306/charte";

		String noSSL = System.getenv("DATABASE_PG_NOSSL");

		URI dbUri = null;
		try {
			if (System.getenv("DATABASE_URL") != null)
				URL = System.getenv("DATABASE_URL");
			dbUri = new URI(URL);
			// dbUri = new URI("postgres://postgres:zas51d@127.0.0.1:5555/charte");
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String username = dbUri.getUserInfo().split(":")[0];
		String password = dbUri.getUserInfo().split(":")[1];

		String driverName = null;
		String dbUrl = null;
		if (dbUri.getScheme().equals("postgres")) {
			driverName = "org.postgresql.Driver";
			dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			if (dbUri.getHost().equals("127.0.0.1"))
				noSSL = "yes";
			if (noSSL == null || !noSSL.equals("yes"))
				dbUrl += "?sslmode=require";
		} else {
			driverName = "com.mysql.jdbc.Driver";
			// SQL数据库引擎为 mysql
			dbUrl = "jdbc:mysql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();
			dbUrl += "?useUnicode=true&characterEncoding=utf8";
		}

		// 加载Driver类，Driver类对象将自动被注册到DriverManager类中
		Class.forName(driverName);
		return DriverManager.getConnection(dbUrl, username, password);
	}

	public static ArrayList<Object> fetchOne(String sql, Object... args) throws Exception {
		ArrayList<Object> arr = new ArrayList<Object>();

		Connection conn = getConnection();

		PreparedStatement pst = conn.prepareStatement(sql);
		for (int i = 0; i < args.length; i++) {
			pst.setObject(i + 1, args[i]);
		}

		ResultSet rs = pst.executeQuery();
		try {
			// https://stackoverflow.com/questions/4507440/
			if (rs.next())
				for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
					Object a = rs.getObject(i + 1);
					arr.add(a);
				}
		} catch (Exception e) {
			// Error Handling
			e.printStackTrace();
		} finally {
			release(conn);
			release(pst);
			release(rs);
		}

		if (arr.size() == 0)
			arr = null;
		return arr;
	}

	public static long getCount(String sql, Object... args) throws Exception {
		ArrayList<Object> arr = fetchOne(sql, args);
		long cnt = (long) -1;
		if (arr != null)
			cnt = (long) arr.get(0);
		return cnt;
	}

	public static ArrayList<ArrayList<Object>> fetchAB(String sql, int A, int B, Object... args) throws Exception {
		ArrayList<ArrayList<Object>> result = new ArrayList<>();

		Connection conn = getConnection();

		PreparedStatement pst = conn.prepareStatement(sql);
		for (int i = 0; i < args.length; i++) {
			pst.setObject(i + 1, args[i]);
		}

		ResultSet rs = pst.executeQuery();
		try {
			int cnt = 0;
			while (cnt < A) {
				rs.next();
				cnt++;
			}
			while (cnt < B) {
				if (rs.next())
					cnt++;
				else
					break;

				ArrayList<Object> arr = new ArrayList<Object>();
				for (int i = 0; i < rs.getMetaData().getColumnCount(); i++) {
					Object a = rs.getObject(i + 1);
					arr.add(a);
				}
				result.add(arr);
			}
		} catch (Exception e) {
			// Error Handling
			e.printStackTrace();
		} finally {
			release(conn);
			release(pst);
			release(rs);
		}

		if (result.size() == 0)
			result = null;
		return result;
	}

	public static boolean exUPD(String sql) throws Exception {
		// 增加_c，修改_u，删除_d
		Connection conn = getConnection();
		Statement st = conn.createStatement();
		int num = st.executeUpdate(sql);
		return num >= 1 ? true : false; // 返回操作查询是否成功？
	}

	public static boolean exUPD(String sql, Object... args) throws Exception {
		// 增加_c，修改_u，删除_d
		Connection conn = getConnection();
		PreparedStatement pst = conn.prepareStatement(sql);
		pst = conn.prepareStatement(sql);
		for (int i = 0; i < args.length; i++) {
			pst.setObject(i + 1, args[i]);
		}
		boolean result = pst.executeUpdate() >= 1 ? true : false;
		release(conn);
		release(pst);
		return result; // 返回操作查询是否成功？
	}

	public static void release(Object o) {

		try {
			if (o instanceof Statement) {
				Statement t = (Statement) o;
				t.close();
			} else if (o instanceof PreparedStatement) {
				PreparedStatement t = (PreparedStatement) o;
				t.close();
			} else if (o instanceof Connection) {
				Connection t = (Connection) o;
				t.close();
			} else if (o instanceof ResultSet) {
				ResultSet t = (ResultSet) o;
				t.close();
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

	}

}
