package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		
		
		//fetch all form data
		String check=request.getParameter("check");
		if(check == null) 
		{
			out.println("Box Not Checked");
		}
		else 
		{
			//remaing data is here
			
			String first_name=request.getParameter("f_name");
			String last_name=request.getParameter("l_name");
			String bdate=request.getParameter("dob");
			String email=request.getParameter("u_email");
			String password=request.getParameter("u_pass");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
			//create a user object and set all data to that object..
			User user=new User(first_name,last_name,bdate,email,password,gender,about);
			
			//create a user Dao object..
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if (dao.saveUser(user))
			{
				out.println("done");
			}
			else
			{
				out.println("Error");
			}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
