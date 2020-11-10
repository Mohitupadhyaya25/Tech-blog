package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
public class PostDao 
{
	Connection con;

	/**
	 * @param con
	 */
	public PostDao(Connection con) 
	{
		super();
		this.con = con;
	}
	
	
	
	public ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> list= new ArrayList<>();
		
		
		try {
			
			String q="select * from categories";
			Statement st =this.con.createStatement();
			ResultSet set=st.executeQuery(q);
			while(set.next())
			{
				int cid=set.getInt("idcategories");
				String name=set.getString("categories name");
				String description=set.getString("categories description");
				
				Category c=new Category(cid,name,description);
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	public boolean savePost(Post p)

	{
		boolean f=false;
		
		
		try 
		{
			String q="insert into posts(pTitle,pContent,pcode,pPic,catId,pUserId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt= con.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

		
/* get all the post */
	public List<Post> getAllPosts()
	{
		List<Post> list=new ArrayList<>();
		/* fetch all the post */
		try 
		{
			PreparedStatement p=con.prepareStatement("select * from posts order by idposts desc ");
			
			ResultSet set=p.executeQuery();
			while(set.next())
			{
				int pid=set.getInt("idposts");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp pdate=set.getTimestamp("pDate");
				int catId=set.getInt("catId");
				int userId=set.getInt("pUserId");
				Post post=new Post(pid, pTitle, pContent, pCode, pPic, pdate, catId, userId);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Post> getPostByCatId(int catid)
	{
		List<Post> list=new ArrayList<>();
		/* fetch all post by id */
		try 
		{
			PreparedStatement p=con.prepareStatement("select * from posts where catid=?");
			p.setInt(1,catid);
			
			ResultSet set=p.executeQuery();
			while(set.next())
			{
				int pid=set.getInt("idposts");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp pdate=set.getTimestamp("pDate");
				
				int userId=set.getInt("pUserId"); 
				Post post=new Post(pid, pTitle, pContent, pCode, pPic, pdate, catid, userId);
				
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
