package back;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.DB;

public class orgAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public orgAdd() {
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

			String Mail=null;
			String PassWord=null;
			String Name=null;
			String Class=null;
			String Tel=null;
			String City=null;
			Integer Number=null;
			String AdminName=null;
			String Cover=null;
			String Intro=null;
			String Remark=null;
			boolean IsByDonor=false;
		try
		{
			DB db=new DB();
			Mail = new String(request.getParameter("mail").getBytes("ISO-8859-1"),"gb2312");
			String selectID = "select UserID from organizer where UserMail = '"+Mail+"'";
			java.sql.ResultSet rf=null;
			rf=db.select(selectID);
			int UserID=rf.getInt("UserID");
			PassWord=new String(request.getParameter("Password").getBytes("ISO-8859-1"),"gb2312");
			Name=new String(request.getParameter("Name").getBytes("ISO-8859-1"),"gb2312");
			Class=new String(request.getParameter("Class").getBytes("ISO-8859-1"),"gb2312");
			Tel=new String(request.getParameter("Tel").getBytes("ISO-8859-1"),"gb2312");
			City=new String(request.getParameter("City").getBytes("ISO-8859-1"),"gb2312");
			Number=new Integer("Number");
			AdminName=new String(request.getParameter("adminName").getBytes("ISO-8859-1"),"gb2312");
			int AccountID=UserID;
			Cover=new String(request.getParameter("Cover").getBytes("ISO-8859-1"),"gb2312");
			Intro=new String(request.getParameter("Intro").getBytes("ISO-8859-1"),"gb2312");
			Remark=new String((request.getParameter("Remark")+request.getParameter("Link")).getBytes("ISO-8859-1"),"gb2312");
			int ActID=UserID;
		
		String insertUser ="insert into organizer values('"+Mail+"','"+PassWord+"','"+Name+"','"+Class+"','"+Tel+"','"+City+"','"+Number+"','"+AdminName+"','"+AccountID+"','"+Cover+"','"+Intro+"','"+Remark+"','"+IsByDonor+"','"+ActID+"')";	
			db.insert(insertUser);

		}catch(Exception e){}

	}
	public void init() throws ServletException {
	}
}
