package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class joinZ extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public joinZ() {super();}
	public void destroy() {super.destroy();}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	HttpSession session = request.getSession(false);
	
	String Mail=(String)session.getAttribute("UserMail");
	if(Mail!=null)		
	{		
		try{
			DB db=new DB();
			String query="select UserName from users where UserMail='"+Mail+"'";
			ResultSet rs=db.select(query);
			String UserName=rs.getString("UserName");
			String updateAct="update actMember set UserMail='"+Mail+"',UserName='"+UserName+"',ActName='"+request.getParameter("actName")+
			"' where UserMail ='"+session.getAttribute("UserMail")+"'";
			String updateFollow="update followActZ set UserName='"+UserName+"',ActName='"+request.getParameter("actName")+"'";
			db.update(updateAct);
			db.update(updateFollow);
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
			}catch(Exception e){}
		}
	}
	public void init() throws ServletException {
	
	}
	
}
