package client;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	public DB()
	{
		super();
	}

	public  ResultSet select(String sql)
	{
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=GY";
		String userName="sa";
		String password="sa";
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");}
		catch(ClassNotFoundException e){System.err.print("连接数据库失败");}
		try
		{System.out.println("lianjiechengg");
			conn=DriverManager.getConnection(url,userName,password);
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			////
			//rs.next();
			/////
			return rs;
		}catch(SQLException e){System.out.println("查询失败");}
		return rs;
	}
	public void insert(String sql)
	{
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=GY";
		String userName="sa";
		String password="sa";
		Connection conn=null;
		Statement stmt=null;
		try{Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");}
		catch(ClassNotFoundException e){System.err.print("连接数据库失败");}
		try
		{
			conn=DriverManager.getConnection(url,userName,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			conn.close();   
		}catch(SQLException e){System.out.println("插入失败");}
	}
	
	public void update(String sql)
	{
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=GY";
		String userName="sa";
		String password="sa";
		Connection conn=null;
		Statement stmt=null;
		try{Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");}
		catch(ClassNotFoundException e){System.err.print("连接数据库失败");}
		try
		{
			conn=DriverManager.getConnection(url,userName,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			conn.close();   
		}catch(SQLException e){System.out.println("修改失败");}
	}
	
	public void delete(String sql)
	{
		String url="jdbc:sqlserver://localhost:1433;DatabaseName=GY";
		String userName="sa";
		String password="sa";
		Connection conn=null;
		Statement stmt=null;
		try{Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");}
		catch(ClassNotFoundException e){System.err.print("连接数据库失败");}
		try
		{
			conn=DriverManager.getConnection(url,userName,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			conn.close();   
		}catch(SQLException e){System.out.println("删除失败");}
	}
}







