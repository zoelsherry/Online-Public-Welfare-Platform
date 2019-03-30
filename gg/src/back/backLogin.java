package back;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import client.DB;

public class backLogin extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public backLogin() {super();}
	public void destroy() {super.destroy();}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=gb2312");
		response.getWriter().println("<html>");
		response.getWriter().println("<head><title>登录</title></head>");
		response.getWriter().println("<body>");
		
		
		
	
	
		
		
		
	String userName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");	
	String password=new String(request.getParameter("password").getBytes("ISO-8859-1"),"gb2312");
	//服务器端打印信息    
	System.out.println("UserName="+userName);
	System.out.println("Password="+password);
		
	DB db=new DB();	
	String sql="select * from admin";

		try
		{ResultSet rs=db.select(sql);
		while(rs.next())
		{
		 if(userName!=null&&password!=null && userName.equals(rs.getString("UserName"))&&password.equals(rs.getString("Password")))
			{
			//将数据存储在request对象中，传递给下一个servlet使用  
	    HttpSession session = request.getSession();
		session.setAttribute("UserName",userName);
		session.setAttribute("Password",password);
		//session.setAttribute("UserName",rs.getString("UserName"));
		request.setAttribute("UserName",userName);
		
		//进行数据的转发
		response.getWriter().println("欢迎");
		response.sendRedirect(request.getContextPath()+"/back-index.jsp");}
			
		else{
			response.getWriter().println("用户名或密码错误！");
			//response.sendError(HttpServletResponse.SC_SERVICE_UNAVAILABLE,"用户名或密码错误");
			response.getWriter().println("<meta http-equiv='Refresh' content='2;url=../back-login.jsp'> </HEAD>");
			}
				
		}
			}catch(Exception e){}
		response.getWriter().println("</body>");
		response.getWriter().println("</html>");
	}
}
