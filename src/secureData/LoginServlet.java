package secureData;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			/*HttpSession session = request.getSession();
			UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
			
			if(currentUser!=null)
				response.sendRedirect("UserLogged.jsp");*/
			
			UserBean user = new UserBean();
			user.setEmail(request.getParameter("email"));
			
			String p = request.getParameter("password");
			
			String md5Hash = MD5generator.MD5(p);
			
			
			user.setPassword(md5Hash);
			
	//		user.setEmail(request.getParameter("email"));
		//	user.setAddress(request.getParameter("address"));
	//		user.setRegisterdate(new Date());
			
			user = UserDao.login(user);
			
			if(user.isValid()==2){ // 2 is Logged in ,  0 not Registered , 1 is registered but password mismatch
				
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser",user);
				response.sendRedirect("UserLogged.jsp");
			}
			else{
			//	response.sendRedirect("InvalidLogin.jsp");
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/InvalidLogin.jsp");
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser",user);
	            PrintWriter out= response.getWriter();
	            if(user.isValid()==1){
	            	
	            	/*HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser",user);*/
	            	out.println("<font color=red>Either email or password is wrong.</font>");
	            }
	            rd.include(request, response);
			}
		}catch(Throwable e){
		
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String logOut = request.getParameter("check");
	//	System.out.println("##############################"+request.getParameter("check"));
		if(logOut!=null && logOut.equals("l_out")){
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login.jsp");
		}
		
		/* NEW LOG IN start */
		try{
			/*HttpSession session = request.getSession();
			UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));
			
			if(currentUser!=null)
				response.sendRedirect("UserLogged.jsp");*/
			String login = request.getParameter("check");
			if(login!=null && login.equals("l_in"))
			{
				
				Thread.sleep(1000);
				
				UserBean user = new UserBean();
				user.setEmail(request.getParameter("email"));
				
				String p = request.getParameter("password");
				
				String md5Hash = MD5generator.MD5(p);
				
				
				user.setPassword(md5Hash);
				
		//		user.setEmail(request.getParameter("email"));
			//	user.setAddress(request.getParameter("address"));
		//		user.setRegisterdate(new Date());
				
				user = UserDao.login(user);
				
				if(user.isValid()==2){ // 2 is Logged in ,  0 not Registered , 1 is registered but password mismatch
					
					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser",user);
					
					String js_response = "logged in";
					PrintWriter out =response.getWriter(); 
					response.setContentType("text/plain");
					out.print(js_response);
				}
				else{
				
					/*
					 * //	response.sendRedirect("InvalidLogin.jsp");
					
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/InvalidLogin.jsp");
					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser",user);
		            PrintWriter out= response.getWriter();
		            if(user.isValid()==1){
		            	
		            	HttpSession session = request.getSession(true);
						session.setAttribute("currentSessionUser",user);
		            	out.println("<font color=red>Either email or password is wrong.</font>");
		            }
		            rd.include(request, response);
		            
		            */
					
					String js_response = "Unregistered User";
					if(user.isValid()==1){
						js_response = "Username or Password Mismatch";
						
					}
					PrintWriter out =response.getWriter(); 
					response.setContentType("text/plain");
					out.print(js_response);
				}
			}
		}catch(Throwable e){
		
			System.out.println(e);
		}
		
		/*New Log in END */
		
		
	}

}
