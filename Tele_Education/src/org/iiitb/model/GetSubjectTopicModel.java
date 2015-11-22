package org.iiitb.model;

import java.util.ArrayList;

public class GetSubjectTopicModel {
	
	
	private String tag;
	private int Standard;
	
	
	public int getStandard() {
		return Standard;
	}

	public void setStandard(int standard) {
		Standard = standard;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	private ArrayList<String> gstm_array= new  ArrayList<String>();


	public ArrayList<String> getGstm_array() {
		return gstm_array;
	}

	public void setGstm_array(ArrayList<String> gstm_array) {
		this.gstm_array = gstm_array;
	}

	
	
	
}
