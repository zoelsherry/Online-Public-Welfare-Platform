package back;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.DB;

public class accountAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public accountAdd() {
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
		
		DB db=new DB();
		try{
			String UserID=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"gb2312");
			String AccountNumber=new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");
			String AccountName=new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");
			String insert ="insert into admin values('"+UserID+"','"+AccountNumber+"','"+AccountName+"')";
			db.insert(insert);


		}catch(Exception e){}
	}
	public void init() throws ServletException {
	}
}
