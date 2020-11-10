package com.tech.blog.entities;

import java.sql.*;


public class User {
	private int id;
	private String first_name;
	private String last_name;
	private String bdate;
	private String email;
	private String password;
	private String gender;
	private String about;
	private Timestamp dateTime;
	private String profile;
	/**
	 * @param id
	 * @param first_name
	 * @param last_name
	 * @param bdate
	 * @param email
	 * @param password
	 * @param gender
	 * @param about
	 * @param dateTime
	 */
	public User(int id, String first_name, String last_name, String bdate, String email, String password,
			String gender, String about, Timestamp dateTime) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.bdate = bdate;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
	}
	
	
	
	/**
	 * 
	 */
	public User() {
		super();
	}



	/**
	 * @param first_name
	 * @param last_name
	 * @param bdate
	 * @param email
	 * @param password
	 * @param gender
	 * @param about
	 
	 */
	public User(String first_name, String last_name, String bdate, String email, String password, String gender,
			String about) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.bdate = bdate;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		
	}
    
	
	
	
	/* Getters and setters */

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}



	/**
	 * @param string the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}



	/**
	 * @return the first_name
	 */
	public String getFirst_name() {
		return first_name;
	}



	/**
	 * @param first_name the first_name to set
	 */
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}



	/**
	 * @return the last_name
	 */
	public String getLast_name() {
		return last_name;
	}



	/**
	 * @param last_name the last_name to set
	 */
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}



	/**
	 * @return the bdate
	 */
	public String getBdate() {
		return bdate;
	}



	/**
	 * @param bdate the bdate to set
	 */
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}



	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}



	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}



	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}



	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}



	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}



	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}



	/**
	 * @return the about
	 */
	public String getAbout() {
		return about;
	}



	/**
	 * @param about the about to set
	 */
	public void setAbout(String about) {
		this.about = about;
	}



	/**
	 * @return the dateTime
	 */
	public Timestamp getDateTime() {
		return dateTime;
	}



	/**
	 * @param dateTime the dateTime to set
	 */
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}



	/**
	 * @return the profile
	 */
	public String getProfile() {
		return profile;
	}



	/**
	 * @param profile the profile to set
	 */
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	


	
   
}


