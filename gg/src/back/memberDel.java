package back;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;
public class memberDel extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public memberDel() {
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
				String UN=new String(request.getParameter("UserID").getBytes("ISO-8859-1"),"utf-8");
				String delete = "delete * from users where UserID='"+UN+"'";
				db.delete(delete);
			
				out.println("<HTML>");
				out.println("  <HEAD><TITLE>删除会员</TITLE></HEAD>");
				out.println("  <BODY>删除会员成功！");
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



