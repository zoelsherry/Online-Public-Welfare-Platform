package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;

public class activityAdd extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public activityAdd() {
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
			String selectID = "select * from activity where ActID=(select MAX(ActID) from activity)";
			java.sql.ResultSet rf=null;
			rf=db.select(selectID);
			rf.next();
			int UserIDs=rf.getInt("ActID")+1;
			System.out.println(UserIDs);
			String OrgName = new String(request.getParameter("orgName").getBytes("ISO-8859-1"),"utf-8");	
			System.out.println(OrgName);
			String ActName=new String(request.getParameter("actName").getBytes("ISO-8859-1"),"utf-8");
			System.out.println(ActName);
			String ActClass=new String(request.getParameter("class").getBytes("ISO-8859-1"),"utf-8");
			System.out.println(ActClass);
			String StartTime=new String(request.getParameter("startTime").getBytes("ISO-8859-1"),"gb2312");
			System.out.println(StartTime);
			String EndTime=new String(request.getParameter("endTime").getBytes("ISO-8859-1"),"gb2312");
			System.out.println(EndTime);
			String Address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
			String Intro=new String(request.getParameter("intro").getBytes("ISO-8859-1"),"utf-8");
			String Cover=new String(request.getParameter("cover").getBytes("ISO-8859-1"),"gb2312");
			String insert ="insert into activity values('"+UserIDs+"','"+OrgName+"','"+ActName+"','"+ActClass+"','"+StartTime+"','"+EndTime+"','"+Address+"','"+Intro+"','"+Cover+"')";
			//String select = "select ActName from activity where ActName = '"+ActName+"'";
			//java.sql.ResultSet rs=null;

			db.insert(insert);
			//rs=db.select(select);
			//rs.next();
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>创建一个同城活动</TITLE></HEAD>");
			out.println("<meta http-equiv='Refresh' content='2;url=../hd-index.jsp'> </HEAD>");
			out.println("  <BODY>创建同城活动成功！");
		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
}
