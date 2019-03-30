package back;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;

public class adminRec extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public adminRec() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String oldPass = new String(request.getParameter("oldPass").getBytes("ISO-8859-1"),"gb2312");
		String Password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");


		DB db=new DB();
		String updates="update users set UserMail='"+Password+"' where UserMail ='"+session.getAttribute("UserName")+"'";
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


