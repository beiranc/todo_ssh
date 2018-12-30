package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
	public Connection getconn() throws SQLException{
		//连接数据库
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/todolistsystem?characterEncoding=utf-8";
		//characterEncoding=utf8 是为了防止数据插入时中文乱码
		String user="root";
		String password="1234";
		//加载数据库
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection conn=DriverManager.getConnection(url,user,password);
		return conn;		
	}
}
