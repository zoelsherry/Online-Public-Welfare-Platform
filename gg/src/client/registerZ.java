package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class registerZ extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public registerZ() {
		super();
	}
	public void destroy(){
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		
		//boolean IsByDonor=false;
		try
		{
			DB db=new DB();
			String Mail = new String(request.getParameter("Mail").getBytes("ISO-8859-1"),"gb2312");
			System.out.println(Mail);
			String selectID = "select * from organizer where UserID=(select MAX(UserID) from organizer)";
			java.sql.ResultSet rf=null;
			rf=db.select(selectID);
			rf.next();
			int UserIDs=rf.getInt("UserID")+1;
			
			System.out.println(UserIDs);
	
		
			String Name=new String(request.getParameter("Name").getBytes("ISO-8859-1"),"utf-8");
			System.out.println(Name);
			String Class=new String(request.getParameter("Class").getBytes("ISO-8859-1"),"utf-8");
			System.out.println(Class);
			String Tel=new String(request.getParameter("Tel").getBytes("ISO-8859-1"),"gb2312");
			System.out.println(Tel);
			String CityS=new String(request.getParameter("City").getBytes("ISO-8859-1"),"utf-8");
			System.out.println(CityS);
			int Number=Integer.parseInt(request.getParameter("Number"));
			System.out.println(Number);
			String AdminName=new String(request.getParameter("AdminName").getBytes("ISO-8859-1"),"utf-8");
			
			String Cover=new String(request.getParameter("Cover").getBytes("ISO-8859-1"),"gb2312");
			String Intro=new String(request.getParameter("Intro").getBytes("ISO-8859-1"),"utf-8");
			String Remark=new String((request.getParameter("Remark")+request.getParameter("Link")).getBytes("ISO-8859-1"),"utf-8");
			
		
			HttpSession session = request.getSession(false);
			String selects = "select * from organizer where UserMail='"+session.getAttribute("UserMail")+"'";
			java.sql.ResultSet rf1=null;
			rf1=db.select(selects);
			
			if(!rf1.next())
			{
			String insertUser ="insert into organizer values('"+UserIDs+"','"+Mail+"','"+Name+"','"+Class+"','"+Tel+"','"+CityS+"','"+Number+"','"+AdminName+"','"+Cover+"','"+Intro+"','"+Remark+"')";
			java.sql.ResultSet rs=null;
		
			db.insert(insertUser);
			String selectUsers = "select UserMail from organizer where UserMail ='"+Mail+"'";
			rs=db.select(selectUsers);
			rs.next();
			//HttpSession session = request.getSession();
			//session.setAttribute("UserMail",rs.getString("UserMail"));
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>申请主办方</TITLE></HEAD>");
			out.println("  <BODY>欢迎，主办方申请成功！");
			out.println("<meta http-equiv='Refresh' content='2;url=../index.jsp'> </HEAD>");
			}
			else
			{
				out.println("<HTML>");
				out.println("  <HEAD><TITLE>申请主办方</TITLE></HEAD>");
				out.println("  <BODY>你已经是主办方，不能重复申请！");
				out.println("<meta http-equiv='Refresh' content='2;url=../index.jsp'> </HEAD>");
			}
		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
}
