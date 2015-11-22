package org.iiitb.model;

import java.util.ArrayList;

public class GetTestTopicModel {
	
	private int Standard;
	public int getStandard() {
		return Standard;
	}
	public void setStandard(int standard) {
		Standard = standard;
	}
	public String getSub() {
		return Sub;
	}
	public void setSub(String sub) {
		Sub = sub;
	}
	public String getTopic() {
		return Topic;
	}
	public void setTopic(String topic) {
		Topic = topic;
	}
	private String Sub;
	private String Topic;
private ArrayList<String> test_topiclist;
public ArrayList<String> getTest_topiclist() {
	return test_topiclist;
}
public void setTest_topiclist(ArrayList<String> test_topiclist) {
	this.test_topiclist = test_topiclist;
}

	
	
}