package org.iiitb.model;

public class PersonalMessageModel {
	private int MESSAGE_ID;
	private int RECIVER_ID;
	private String STATUS;
	private String MESSAGE_BODY;
	private String RECIVER_NAME;
	private String SENDER_NAME;
	public int getMESSAGE_ID() {
		return MESSAGE_ID;
	}
	public void setMESSAGE_ID(int mESSAGE_ID) {
		MESSAGE_ID = mESSAGE_ID;
	}
	public int getRECIVER_ID() {
		return RECIVER_ID;
	}
	
	public void setRECIVER_ID(int rECIVER_ID) {
		RECIVER_ID = rECIVER_ID;
	}
	
	public String getSTATUS() {
		return STATUS;
	}
	
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getMESSAGE_BODY() {
		return MESSAGE_BODY;
	}
	public void setMESSAGE_BODY(String mESSAGE_BODY) {
		MESSAGE_BODY = mESSAGE_BODY;
	}
	public String getRECIVER_NAME() {
		return RECIVER_NAME;
	}
	public void setRECIVER_NAME(String rECIVER_NAME) {
		RECIVER_NAME = rECIVER_NAME;
	}
	public String getSENDER_NAME() {
		return SENDER_NAME;
	}
	public void setSENDER_NAME(String sENDER_NAME) {
		SENDER_NAME = sENDER_NAME;
	}
	
}
