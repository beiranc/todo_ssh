package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
	public Connection getconn() throws SQLException{
		//�������ݿ�
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/todolistsystem?characterEncoding=utf-8";
		//characterEncoding=utf8 ��Ϊ�˷�ֹ���ݲ���ʱ��������
		String user="root";
		String password="1234";
		//�������ݿ�
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection conn=DriverManager.getConnection(url,user,password);
		return conn;		
	}
}
