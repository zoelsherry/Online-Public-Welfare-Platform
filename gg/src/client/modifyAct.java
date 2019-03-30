package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;

public class modifyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public modifyAct() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("444");
		HttpSession session = request.getSession(false);
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		System.out.println("444");
		try{
		String OrgName = new String(request.getParameter("orgName").getBytes("ISO-8859-1"),"utf-8");
		String ActName = new String(request.getParameter("actName").getBytes("ISO-8859-1"),"utf-8");
		String Class = new String(request.getParameter("class").getBytes("ISO-8859-1"),"utf-8");
		String StartTime= new String(request.getParameter("startTime").getBytes("ISO-8859-1"),"gb2312");
		String EndTime= new String(request.getParameter("endTime").getBytes("ISO-8859-1"),"gb2312");
		String Address = new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
		String Intro = new String(request.getParameter("intro").getBytes("ISO-8859-1"),"utf-8");
		String Cover= new String(request.getParameter("cover").getBytes("ISO-8859-1"),"gb2312");
		System.out.println("444");
		System.out.println(OrgName);
		System.out.println(ActName);
		System.out.println(Class);
		System.out.println(StartTime);
		System.out.println(EndTime);
		System.out.println(Address);
		System.out.println(Intro);
		System.out.println(Cover);
		DB db=new DB();
		String sel="select * from organizer where UserMail ='"+session.getAttribute("UserMail")+"'";
		ResultSet tb=null;
		tb=db.select(sel);
		tb.next();
		String updates="update activity set ActName='"+ActName+"',ActClass='"+Class+"',StartTime='"+StartTime+"',EndTime='"+EndTime+"',Address='"+Address+"',Intro='"+Intro+"',Cover='"+Cover+"' where OrgName ='"+tb.getString("UserName")+"' and ActName ='"+ActName+"'";
		db.update(updates);
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>修改发布的活动信息</TITLE></HEAD>");
		out.println("  <BODY>修改发布的活动信息成功！");
		out.println("<meta http-equiv='Refresh' content='2;url=../hd-index.jsp'> </HEAD>");
		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		}
		
		public void init() throws ServletException {
		
		}

}
