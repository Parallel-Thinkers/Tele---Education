package org.iiitb.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.ReportIssueModel;
import org.iiitb.model.SolveIssueModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SolveIssue extends ActionSupport implements ModelDriven<SolveIssueModel>,SessionAware{

	/**
	 * @author shan
	 */
	Map<String, Object> session = ActionContext.getContext().getSession();
	String U_ID = (String) session.get("U_ID");  
	private static final long serialVersionUID = 1L;
	DBHandler dbh = new DBHandler();
	SolveIssueModel si = new SolveIssueModel();
	String message;
	private  ArrayList<String> issuelist = new ArrayList<String>();
	private  ArrayList<String> unresolvedissue = new ArrayList<String>();
	
	
	
	public String execute() throws Exception{
		message=dbh.issuestatus(si,U_ID);
		issuelist=dbh.getissuelist(U_ID);
		unresolvedissue=dbh.getunresolvedissue(U_ID);
		
		
		return "success";
	}
	@Override
	public SolveIssueModel getModel() {
		// TODO Auto-generated method stub
		return si;
	}
//getter and setter	
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
