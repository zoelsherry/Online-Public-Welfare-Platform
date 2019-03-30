package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;

public class modify extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public modify() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String Mail = new String(request.getParameter("mail").getBytes("ISO-8859-1"),"gb2312");
		String Password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");
		String Name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		//String Sex = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"utf-8");
		String Tel = new String(request.getParameter("phone").getBytes("ISO-8859-1"),"gb2312");
		String City = new String(request.getParameter("city").getBytes("ISO-8859-1"),"utf-8");
		String Cover= new String(request.getParameter("cover").getBytes("ISO-8859-1"),"gb2312");
		System.out.println(Mail);
		System.out.println(Password);
		System.out.println(Name);
		System.out.println(Tel);
		System.out.println(City);
		System.out.println(Cover);
		DB db=new DB();
		String updates="update users set UserMail='"+Mail+"',Password='"+Password+"',UserName='"+Name+"',Tel='"+Tel+"',City='"+City+"',UserCover='"+Cover+"' where UserMail ='"+session.getAttribute("UserMail")+"'";
		db.update(updates);
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>修改个人信息</TITLE></HEAD>");
		out.println("  <BODY>修改成功！");
		out.println("<meta http-equiv='Refresh' content='2;url=../index.jsp'> </HEAD>");
		out.print(session.getAttribute("UserMail"));
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		}
		
		public void init() throws ServletException {
		
		}
}
