package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
///
import java.util.*;
import java.text.*;
////
import client.DB;

public class donation extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public donation() {
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
			HttpSession session = request.getSession();
			java.sql.ResultSet rs=null;
	  		String select="select * from users where UserMail ='"+session.getAttribute("UserMail")+"'";
	  		rs=db.select(select);
	  		rs.next();
	  		
			System.out.println("222");
			String selectIDs = "select * from donation where ID=(select MAX(ID) from donation)";
			java.sql.ResultSet rf=null;
			rf=db.select(selectIDs);
			rf.next();
			int ID=rf.getInt("ID")+1;
			System.out.println(ID);
	  		int DonorID =rs.getInt("UserID");
	  		////
	  		System.out.println(DonorID);
	  		/////////
	  		//String RecipientID1=new String(request.getParameter("recipientID").getBytes("ISO-8859-1"),"gb2312");
	  		int RecipientID=Integer.parseInt(request.getParameter("recipientID"));
	  		System.out.println(RecipientID);
	  		//String Amount1=new String(request.getParameter("amount").getBytes("ISO-8859-1"),"gb2312");
	  		int Amount=Integer.parseInt(request.getParameter("amount"));
	  		System.out.println(Amount);
	  		String Time=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); 
	  		System.out.println(Time);
	  		
	  		String DonorName=new String(request.getParameter("donorName").getBytes("ISO-8859-1"),"utf-8");
	  		System.out.println(DonorName);
	  		String DonorTel=new String(request.getParameter("donorTel").getBytes("ISO-8859-1"),"gb2312");
	  		System.out.println(DonorTel);
	  		String Remark=new String(request.getParameter("remark").getBytes("ISO-8859-1"),"gb2312");
	  		System.out.println(Remark);
        /////////////////////////////user
	  		String inser="insert into donation values('"+ID+"','"+DonorID+"','"+RecipientID+"','"+Amount+"','"+Time+"','"+DonorName+"','"+DonorTel+"','"+Remark+"')";
			db.insert(inser);
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>捐助</TITLE></HEAD>");
			out.println("  <BODY>捐助成功！");
			out.println("<meta http-equiv='Refresh' content='2;url=../jk-index.jsp'> </HEAD>");
			//response.sendRedirect(request.getContextPath()+"/jk-submit.jsp");
		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
}

