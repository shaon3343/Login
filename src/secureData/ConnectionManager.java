package secureData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con; 
	static String url; 
	
	public static Connection getConnection(){
		
		try{
			// MY DATASOURCE NAME
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

			Class.forName("oracle.jdbc.OracleDriver");
			
			// MY SQL SERVER PASS: 
			try {
				con = DriverManager.getConnection(url,"people","people");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		return con;
	}
}
