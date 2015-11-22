package org.iiitb.model;

import java.sql.Timestamp;

public class AddBroadcastModel {
	private String MESSAGE_BODY;
	private Timestamp TIMESTAMP;
	private int TI_ID;
	
	public String getMESSAGE_BODY() {
		return MESSAGE_BODY;
	}
	public void setMESSAGE_BODY(String mESSAGE_BODY) {
		MESSAGE_BODY = mESSAGE_BODY;
	}
	public Timestamp getTIMESTAMP() {
		return TIMESTAMP;
	}
	public void setTIMESTAMP(Timestamp tIMESTAMP) {
		TIMESTAMP = tIMESTAMP;
	}
	public int getTI_ID() {
		return TI_ID;
	}
	public void setTI_ID(int tI_ID) {
		TI_ID = tI_ID;
	}
	
}
