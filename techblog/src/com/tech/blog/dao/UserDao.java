
package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;


public class UserDao {
	private Connection con;
	
	/**
	 * @param con
	 */
	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	//method to insert user to data base
	
	
	public boolean saveUser(User user )
	{
		boolean f = false;
		try 
		{
			//user --> database
			String query="insert into user(first_name,last_name,bdate,email,password,gender,about) values (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getFirst_name());
			pstmt.setString(2, user.getLast_name());
			pstmt.setString(3, user.getBdate());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getGender());
			pstmt.setString(7, user.getAbout());
			
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e)
		{
			
			
			e.printStackTrace();
		}
		
		return f;
		
		
	}
	
// get user by user email and user password
	
	public User getUserByEmailAndPassword(String email,String password ) {
		User user = null;
		
		try {
			
			
			String query="select * from user where email =? and password =?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			
			ResultSet set=pstmt.executeQuery();
			if(set.next())
			{
				user=new User();
				String f_name=set.getString("first_name");
				String l_name=set.getString("last_name");
				user.setFirst_name(f_name);
				user.setLast_name(l_name);
				
				
				user.setId(set.getInt("id"));
				user.setBdate(set.getString("bdate"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
				
				
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}
	
    public boolean updateUser(User user)
    {
    	boolean f=false;
    	try
    	{
    		String query="update user set first_name=? , last_name=? , bdate=? , email=? , password=? , about=? , profile=? where id=? ";
    		PreparedStatement p=con.prepareStatement(query);
    		p.setString(1, user.getFirst_name());
    		p.setString(2, user.getLast_name());
    		p.setString(3, user.getBdate());
    		p.setString(4, user.getEmail());
    		p.setString(5, user.getPassword());
    		p.setString(6, user.getAbout());
    		p.setString(7, user.getProfile());
    		p.setInt(8, user.getId());
    		
    		
    		p.executeUpdate();
    		f=true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return f;
    }
}
