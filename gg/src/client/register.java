package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;

public class register extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public register() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		
		DB db=new DB();
		try{
		String Mail = new String(request.getParameter("mail").getBytes("ISO-8859-1"),"gb2312");
		////
		String selectIDs = "select * from users where UserID=(select MAX(UserID) from users)";
		java.sql.ResultSet rf=null;
		rf=db.select(selectIDs);
		rf.next();
		////
		System.out.println("2222");
		////
		int UserIDs=rf.getInt("UserID")+1;
	
		System.out.println(UserIDs);

		String PassWord=new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");
		String Name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		String Sex=new String(request.getParameter("sex").getBytes("ISO-8859-1"),"utf-8");
		String Tel=new String(request.getParameter("phone").getBytes("ISO-8859-1"),"gb2312");
		String City=new String(request.getParameter("city").getBytes("ISO-8859-1"),"utf-8");
		String Cover=new String(request.getParameter("cover").getBytes("ISO-8859-1"),"gb2312");
	

		String inserts ="insert into users values('"+UserIDs+"','"+Mail+"','"+PassWord+"','"+Name+"','"+Sex+"','"+Tel+"','"+City+"','"+Cover+"')";
		String selects = "select UserMail from users where UserMail = '"+Mail+"'";
		java.sql.ResultSet rs=null;

			db.insert(inserts);
			rs=db.select(selects);
			rs.next();
			/////
			System.out.println("111111111");
			/////
			HttpSession session = request.getSession();
			session.setAttribute("UserMail",rs.getString("UserMail"));
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>注册</TITLE></HEAD>");
			out.println("  <BODY>欢迎，注册成功！");
			out.println("<meta http-equiv='Refresh' content='2;url=../index.jsp'> </HEAD>");
			//response.sendRedirect(request.getContextPath()+"/index.jsp");
		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
}
