package org.iiitb.model;

import java.sql.Date;

public class TestDetailModel {
	
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
public int getMaxMarks() {
	return maxMarks;
}
public void setMaxMarks(int maxMarks) {
	this.maxMarks = maxMarks;
}
public Date getTest_date() {
	return test_date;
}
public void setTest_date(Date test_date) {
	this.test_date = test_date;
}



String Subject;
String Topic;
int maxMarks;
Date test_date;
public String getTest_topic() {
	return test_topic;
}
public void setTest_topic(String test_topic) {
	this.test_topic = test_topic;
}



String test_topic;






}
