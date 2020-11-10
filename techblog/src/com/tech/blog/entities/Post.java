package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post 
{
	private int idposts;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private int userId;
	/**
	 * 
	 */
	public Post() {
		super();
	}
	/**
	 * @param idposts
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPic
	 * @param pDate
	 * @param catId
	 */
	public Post(int idposts, String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId) {
		super();
		this.idposts = idposts;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId=userId;
	}
	/**
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPic
	 * @param pDate
	 * @param catId
	 */
	public Post(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId, int userId) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId=userId;
	}
	
	
	
	
	/* Getters and setters */
	
	
	/**
	 * @return the idposts
	 */
	public int getIdposts() {
		return idposts;
	}
	/**
	 * @param idposts the idposts to set
	 */
	public void setIdposts(int idposts) {
		this.idposts = idposts;
	}
	/**
	 * @return the pTitle
	 */
	public String getpTitle() {
		return pTitle;
	}
	/**
	 * @param pTitle the pTitle to set
	 */
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	/**
	 * @return the pContent
	 */
	public String getpContent() {
		return pContent;
	}
	/**
	 * @param pContent the pContent to set
	 */
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	/**
	 * @return the pCode
	 */
	public String getpCode() {
		return pCode;
	}
	/**
	 * @param pCode the pCode to set
	 */
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	/**
	 * @return the pPic
	 */
	public String getpPic() {
		return pPic;
	}
	/**
	 * @param pPic the pPic to set
	 */
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	/**
	 * @return the pDate
	 */
	public Timestamp getpDate() {
		return pDate;
	}
	/**
	 * @param pDate the pDate to set
	 */
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	/**
	 * @return the catId
	 */
	public int getCatId() {
		return catId;
	}
	/**
	 * @param catId the catId to set
	 */
	public void setCatId(int catId) {
		this.catId = catId;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	

}
