package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class activity extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public activity() {
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
		String Title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"gb2312");
		String Class=new String(request.getParameter("class").getBytes("ISO-8859-1"),"gb2312");
		String StartTime=new String(request.getParameter("startTime").getBytes("ISO-8859-1"),"gb2312");
		String EndTime=new String(request.getParameter("endTime").getBytes("ISO-8859-1"),"gb2312");
		String Address=new String((request.getParameter("city")+request.getParameter("address")).getBytes("ISO-8859-1"),"gb2312");
		String Intro=new String(request.getParameter("intro").getBytes("ISO-8859-1"),"gb2312");
		DB db=new DB();
		String insert ="insert into activity values('"+Class+"','"+Title+"','"+StartTime+"','"+EndTime+"','"+Address+"','"+Intro+"')";
		String select = "select ActName from activity where ActName = '"+Title+"'";
		java.sql.ResultSet rs=null;
		try
		{
			db.insert(insert);
			rs=db.select(select);
			rs.next();
			HttpSession session = request.getSession();
			session.setAttribute("UserMail",rs.getString("UserMail"));
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>创建一个同城活动</TITLE></HEAD>");
			out.println("<meta http-equiv='Refresh' content='5;> </HEAD>");
			out.println("  <BODY>"+Title+"活动创建成功！");
		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
}
