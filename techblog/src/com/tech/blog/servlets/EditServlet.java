package com.tech.blog.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.*;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig

public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		 
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
			
	// fetch all data
		String userfname= request.getParameter("user_fname");
		String userlname= request.getParameter("user_lname");
		String userDob= request.getParameter("dob");
		String userEmail= request.getParameter("user_email");
		String userPassword= request.getParameter("user_password");
		String userAbout= request.getParameter("user_about");
		Part part=request.getPart("user_image");
		String imageName=part.getSubmittedFileName();
	
	// get the user from session
		
		HttpSession s= request.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setFirst_name(userfname);
		user.setLast_name(userlname);
		user.setBdate(userDob);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile=user.getProfile();
		user.setProfile(imageName);
		
	//update database.....
		
		UserDao userDao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userDao.updateUser(user);
		if (ans)
		{
			
			String path=request.getRealPath("/")+"profile_pics"+File.separator+user.getProfile();
			
			/*Delete File Code.... */
			String pathOldFile=request.getRealPath("/")+"profile_pics"+File.separator+oldFile;
			
			if(!oldFile.equals("default.jsp"))
			{
				Helper.deleteFile(pathOldFile);
			}
			
			if(Helper.saveFile(part.getInputStream(), path))
			{
				out.println("Profile Updated....");
				Message msg = new Message("Profile Details Updated...","success","alert-success");
				s.setAttribute("msg", msg);
			}
			else
			{
				out.println("Somthing Went Wrong...");
				Message msg = new Message("Somthing Went Wrong...","error","alert-danger");
				s.setAttribute("msg", msg);
			
			}
			
		}
		else
		{
			out.println("not updated to db");
		    Message msg = new Message("Somthing Went Wrong...","error","alert-danger");
			s.setAttribute("msg", msg);
		}
		
		response.sendRedirect("profile.jsp");
		
		
		
		
		
		
}
		
		
		
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
