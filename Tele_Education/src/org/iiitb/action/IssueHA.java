package org.iiitb.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.IssueHAModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class IssueHA extends ActionSupport implements SessionAware {

	/**
	 * @author shan
	 */
	private static final long serialVersionUID = 1L;
	Map<String, Object> session = ActionContext.getContext().getSession();
	String U_ID = (String) session.get("U_ID");  
	
	DBHandler dbh = new DBHandler();
	ArrayList<String> schoollist = new ArrayList<String>();

	public String execute(){
		schoollist=dbh.getschoollist(U_ID);

		return "success";
	}
	
	public ArrayList<String> getSchoollist() {
		return schoollist;
	}
	public void setSchoollist(ArrayList<String> schoollist) {
		this.schoollist = schoollist;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}




}
