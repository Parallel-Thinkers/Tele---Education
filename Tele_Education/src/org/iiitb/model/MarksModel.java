package org.iiitb.model;

import java.util.ArrayList;

public class MarksModel {
	
	
	int Standard;
	public int getStandard() {
		return Standard;
	}
	public void setStandard(int standard) {
		Standard = standard;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getTopic() {
		return Topic;
	}
	public void setTopic(String topic) {
		Topic = topic;
	}
	public String getTest_topic() {
		return test_topic;
	}
	public void setTest_topic(String test_topic) {
		this.test_topic = test_topic;
	}
	String Subject;
	String Topic;
	String test_topic;
	ArrayList<String> StudentName= new ArrayList<String>();
	public ArrayList<String> getStudentName() {
		return StudentName;
	}
	public void setStudentName(ArrayList<String> studentName) {
		StudentName = studentName;
	}

}
