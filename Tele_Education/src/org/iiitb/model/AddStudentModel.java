package org.iiitb.model;

import java.util.ArrayList;

public class AddStudentModel {
	
	public int cls;
	
	
	 public int getCls() {
		return cls;
	}
	public void setCls(int cls) {
		this.cls = cls;
	}
	public ArrayList<String> getRollnumber() {
		return rollnumber;
	}
	public void setRollnumber(ArrayList<String> rollnumber) {
		this.rollnumber = rollnumber;
	}
	public ArrayList<String> getName() {
		return name;
	}
	public void setName(ArrayList<String> name) {
		this.name = name;
	}
	public ArrayList<String> getAddress() {
		return address;
	}
	public void setAddress(ArrayList<String> address) {
		this.address = address;
	}
	ArrayList<String> rollnumber=new ArrayList<String>();
	 ArrayList<String> name=new ArrayList<String>();
	 ArrayList<String> address=new ArrayList<String>();
	
	
	

}
