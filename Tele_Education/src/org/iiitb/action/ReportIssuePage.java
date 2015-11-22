package org.iiitb.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;

public class ReportIssuePage extends ActionSupport implements SessionAware{
	/**
	 * @author: shan mehrotra
	 */
	private static final long serialVersionUID = 1L;
	Map<String, Object> session = ActionContext.getContext().getSession();
	String U_ID = (String) session.get("U_ID");  
	
	
	private ArrayList<String> issuelist = new ArrayList<String>();
	private ArrayList<String> unresolvedissue = new ArrayList<String>();
	DBHandler dbh = new DBHandler();

	public String execute() throws Exception{
//		System.out.println("action ::report issue page");
		issuelist=dbh.getissuelist(U_ID);
		unresolvedissue=dbh.getunresolvedissue(U_ID);
//		System.out.println(issuelist);

		return "success";
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
