package secureData;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.google.gson.Gson;

/**
 * Servlet implementation class UserData
 */
@WebServlet("/UserData")
public class UserData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<UserBean> userList = UserDao.getAllRegistered();
	//	System.out.println("############################$$$$$$$$$$$$"+userList.size());
		ArrayList<String> userNames = new ArrayList<String>();
		for(int i=0;i<userList.size();i++){
			userNames.add(userList.get(i).getUsername());
		}
		Gson gson = new Gson();
		String toJSON = gson.toJson(userList);
		/*String text = "TOTAL USER: ";

	    response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
	    response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
	    response.getWriter().write(text+" "+userList.size());*/
	    
	    response.setContentType("application/json");
	 // Get the printwriter object from response to write the required json object to the output stream      
	 PrintWriter out = response.getWriter();
	 // Assuming your json object is **jsonObject**, perform the following, it will return your json object  
	 out.print(toJSON);
	 out.flush();
	    
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
