package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class actRectify extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public actRectify() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		String ActClass = new String(request.getParameter("actClass").getBytes("ISO-8859-1"),"gb2312");
		String StartTime = new String(request.getParameter("startTime").getBytes("ISO-8859-1"),"gb2312");
		String EndTime = new String(request.getParameter("endTime").getBytes("ISO-8859-1"),"gb2312");
		String Address = new String(request.getParameter("address").getBytes("ISO-8859-1"),"gb2312");
		String Intro= new String(request.getParameter("intro").getBytes("ISO-8859-1"),"gb2312");
		
		DB db=new DB();
		String update="update activity set ActClass='"+ActClass+"',StartTime='"+StartTime+"',EndTime='"+EndTime+
		"',Address='"+Address+"',Intro='"+Intro+"' where ActName ='"+session.getAttribute("ActName")+"'";
		db.update(update);
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<meta http-equiv='Refresh' content='5;url=../userCenter.jsp'> </HEAD>");
		out.println("  <BODY>");
		out.print(session.getAttribute("UserMail"));
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		}
		
	public void init() throws ServletException {
	}
}
