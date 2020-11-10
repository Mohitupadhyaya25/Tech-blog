package com.tech.blog.entities;

public class Category 
{
	private int idcategories;
	private String name;
	private String description;
	
	/**
	 * @param idcategories
	 * @param name
	 * @param description
	 * @param pic
	 */
	public Category(int idcategories, String name, String description) 
	{
		super();
		this.idcategories = idcategories;
		this.name = name;
		this.description = description;
	
	}
	/**
	 * 
	 */
	public Category() 
	{
		super();
	}
	
	
	/**
	 * @param cid
	 * @param description
	 * @param pic
	 */
	public Category(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}
	
	
	/* Getter and Setters  */
	
	
	
	/**
	 * @return the id categories
	 */
	public int getIdcategories() {
		return idcategories;
	}
	/**
	 * @param idcategories the idcategories to set
	 */
	public void setIdcategories(int idcategories) {
		this.idcategories = idcategories;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	
	
	
	
	

}
