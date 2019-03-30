package client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class join extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public join() {super();}
	public void destroy() {super.destroy();}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	HttpSession session = request.getSession(false);
	response.setContentType("text/html;charset=gb2312");
	PrintWriter out = response.getWriter();
	String Mail=(String)session.getAttribute("UserMail");
		try{
			DB db=new DB();
			String selectIDs = "select * from actMember where ActMemberID=(select MAX(ActMemberID) from actMember)";
			java.sql.ResultSet rf=null;
			rf=db.select(selectIDs);
			rf.next();
		
			int ActMemberIDs=rf.getInt("ActMemberID")+1;
			
			System.out.println(ActMemberIDs);
			
			String query="select UserName from users where UserMail='"+Mail+"'";
			ResultSet rs=db.select(query);
			rs.next();
			
			String ActNames=new String(request.getParameter("joinact").getBytes("ISO-8859-1"),"utf-8");
			String UserName=rs.getString("UserName");
			
			System.out.println(ActNames);
			System.out.println(UserName);
			
			String select= "select * from actMember where ActName='"+ActNames+"' and UserName='"+UserName+"' ";
			java.sql.ResultSet rf1=null;
			rf1=db.select(select);
			
			if(!(rf1.next()))
			{
				String Act="insert into actMember values('"+ActMemberIDs+"','"+ActNames+"','"+Mail+"','"+UserName+"')";
				db.insert(Act);
				out.println("<HTML>");
				out.println("  <HEAD><TITLE>参与</TITLE></HEAD>");
				out.println("  <BODY>谢谢，参与成功！");
				out.println("<meta http-equiv='Refresh' content='2;url=../hd-index.jsp'> </HEAD>");
			}
			else{
				out.println("<HTML>");
				out.println("  <HEAD><TITLE>参与</TITLE></HEAD>");
				out.println("  <BODY>对不起，你不能重复参与！");
				out.println("<meta http-equiv='Refresh' content='2;url=../hd-index.jsp'> </HEAD>");
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
