package org.iiitb.model;

import java.util.ArrayList;

public class SignupModel {

	private String Taluq;
	private String School;
	private String User_id;
	private String Name;
	private String Mobile;
	private String Address;
	private String Password;
	private String Role;
	private String Approved = "False";

	
	
	
	
	
	public String getUser_id() {
		return User_id;
	}

	public void setUser_id(String user_id) {
		User_id = user_id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getMobile() {
		return Mobile;
	}

	public void setMobile(String mobile) {
		Mobile = mobile;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getRole() {
		return Role;
	}

	public void setRole(String role) {
		Role = role;
	}

	public String getApproved() {
		return Approved;
	}

	public void setApproved(String approved) {
		Approved = approved;
	}

	
	

	public String getSchool() {
		return School;
	}

	public void setSchool(String school) {
		School = school;
	}

	public String getTaluq() {
		return Taluq;
	}

	public void setTaluq(String taluq) {
		Taluq = taluq;
	}

	}
