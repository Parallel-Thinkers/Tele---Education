package org.iiitb.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.ReportIssueModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReportIssue extends ActionSupport implements ModelDriven<ReportIssueModel>,SessionAware{

	/**
	 * @author: shan
	 */
	private static final long serialVersionUID = 1L;
	Map<String, Object> session = ActionContext.getContext().getSession();
	String U_ID = (String) session.get("U_ID");  
	
	ReportIssueModel ri = new ReportIssueModel();
	DBHandler dbh = new DBHandler();
	String message;
	private  ArrayList<String> issuelist = new ArrayList<String>();
	private  ArrayList<String> unresolvedissue = new ArrayList<String>();

	public String execute() throws Exception{
		System.out.println("Majnoo"+U_ID);
		
		message=dbh.insertissue(ri,U_ID);
		issuelist=dbh.getissuelist(U_ID);
		unresolvedissue=dbh.getunresolvedissue(U_ID);
		
		return "success";
	}

	
	@Override
	public ReportIssueModel getModel() {
		// TODO Auto-generated method stub
		return ri;
	}
//getters and setters
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public ArrayList<String> getIssuelist() {
		return issuelist;
	}
	public void setIssuelist(ArrayList<String> issuelist) {
		this.issuelist = issuelist;
	}


	public ArrayList<String> getUnresolvedissue() {
		return unresolvedissue;
	}


	public void setUnresolvedissue(ArrayList<String> unresolvedissue) {
		this.unresolvedissue = unresolvedissue;
	}


	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	
	
}
