package org.iiitb.model;

public class ReportIssueModel {
	
	private String issuetitle;
	private String issuedesc;
	private String issuestatus;
	private int sc_id;
	
	
	public String getIssuetitle() {
		return issuetitle;
	}
	public void setIssuetitle(String issuetitle) {
		this.issuetitle = issuetitle;
	}
	public String getIssuedesc() {
		return issuedesc;
	}
	public void setIssuedesc(String issuedesc) {
		this.issuedesc = issuedesc;
	}
	public String getIssuestatus() {
		return issuestatus;
	}
	public void setIssuestatus(String issuestatus) {
		this.issuestatus = issuestatus;
	}
	public int getSc_id() {
		return sc_id;
	}
	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}

}
