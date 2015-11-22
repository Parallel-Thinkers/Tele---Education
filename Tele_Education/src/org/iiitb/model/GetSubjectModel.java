package org.iiitb.model;

import java.util.ArrayList;

public class GetSubjectModel {

	int Subject;
	private ArrayList<String> tag_id=new ArrayList<String>();

	public ArrayList<String> getTag_id() {
		return tag_id;
	}

	public void setTag_id(ArrayList<String> tag_id) {
		this.tag_id = tag_id;
	}

	public int getSubject() {
		return Subject;
	}

	public void setSubject(int subject) {
		Subject = subject;
	}
	
	

	
	
	
}
