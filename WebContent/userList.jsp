<%@page contentType="application/json; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="secureData.UserDao"%>
<%@page import="secureData.UserBean"%>
<%@page import="secureData.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%
	try{
	ArrayList<UserBean> userList = UserDao.getAllRegistered();
	//out.println(userList);
//	UserBean user = userList.get(0);
 //   JSONObject json = new JSONObject();
	
    JSONArray jsonAraay = new JSONArray(userList);
    
  /* json.put("Name",user.getUsername());
    json.put("EMAIL",user.getEmail());
    json.put("ADDRESS",user.getAddress());
    
    */
    
    out.print(jsonAraay);
    out.flush();
	} catch(Exception e){
    	
    	
    }
    /*
         String jString = JSONObject.toJSONString(json);
            PrintWriter out = response.getWriter();
        out.println(jString); 
    out.close();*/
    
   
%>