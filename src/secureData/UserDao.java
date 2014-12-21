package secureData;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

public class UserDao {
	static Connection currentCon = null;
	static ResultSet rs = null;
	public static ArrayList<UserBean> getAllRegistered(){
		
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		try {
			Statement stmt = null;
			currentCon = ConnectionManager.getConnection();
		
			stmt = currentCon.createStatement();
		
			String query = "Select * FROM PEOPLES";
			rs = stmt.executeQuery(query);
			while(rs.next()){
				
				UserBean user = new UserBean();
				user.setEmail(rs.getString("EMAIL"));
				user.setRegisterdate(rs.getTimestamp("REGISTERDATE"));
				user.setAddress(rs.getString("ADDRESS"));
				user.setUsername(rs.getString("NAME"));
				
				userList.add(user);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return userList;
		
	}
	public static UserBean login(UserBean bean){
		Statement stmt = null;
		
		String email = bean.getEmail();
		String password = bean.getPassword();
		
		String searchQuery = "SELECT * FROM PEOPLES WHERE EMAIL='"
				+email
				+"' AND PASSWORD='"
				+password
				+"'";
		
		String query = "SELECT * FROM PEOPLES WHERE EMAIL='"
				+email+"'";
		 // "System.out.println" prints in the console; Normally used to trace the process
	      
	      System.out.println("Query: "+searchQuery);
	      
	      try{
	    	  currentCon = ConnectionManager.getConnection();
	    	  stmt = currentCon.createStatement();
	    	  rs = stmt.executeQuery(searchQuery);
	    	  boolean more = rs.next();
	    	  
	    	
	    	
	    	  
	    	  if(!more){
	    		  rs = stmt.executeQuery(query);
		    	  if(rs.next())
		    		  bean.setValid(1);
		          else
		        	  bean.setValid(0);
	    	  }
	    	  else if(more){
	    		  String name = rs.getString("NAME");
	    		  
	    		  String address = rs.getString("ADDRESS");
	    		  Timestamp date = rs.getTimestamp("registerdate");
	    		  
	    		  bean.setUsername(name);
	    		  bean.setAddress(address);
	    		  bean.setRegisterdate(date);
	    		  
	    		  System.out.println("Your user name is " + name);          
	    	      System.out.println("Your Email is " + email);
	    	      System.out.println("Your Reg Date is " + date);
	    	      
	    		  bean.setValid(2); //// 2 is Logged in ,  0 not Registered , 1 is registered but password mismatch
	    	  }
	    	 
	      }catch(Exception e){
	    	  e.printStackTrace();
	      }
	      finally{
	    	  
	    	  if(rs!=null){
	    		  
	    		  try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					stmt=null;
				}
	    		  
	    		  
	    	  }
	    	  
	      }
	      
	      if(currentCon !=null){
	    	  
	    	  try {
				currentCon.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	  
	    	 currentCon = null;
	    	  
	      }
		return bean;
		
	}
	
}
