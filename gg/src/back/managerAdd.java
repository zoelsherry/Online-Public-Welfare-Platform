package back;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.DB;

public class managerAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public managerAdd() {
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
			String UserName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");
			String PassWord=new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");
			String Role=new String(request.getParameter("role").getBytes("ISO-8859-1"),"gb2312");
			String insert ="insert into admin values('"+UserName+"','"+PassWord+"','"+Role+"')";
			db.insert(insert);
			out.println("<HTML>");
			out.println("  <HEAD><TITLE>添加新管理员</TITLE></HEAD>");
			out.println("  <BODY>添加新管理员成功！");
			out.println("<meta http-equiv='Refresh' content='2;url=../back-index.jsp'> </HEAD>");


		}catch(Exception e){}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
}
