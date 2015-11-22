package org.iiitb.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.model.*;
import org.iiitb.dbhandler.*;

public class EditprofileAction extends ActionSupport implements ModelDriven<SignupModel>,SessionAware {
	
	SignupModel sm = new SignupModel();
	DBHandler dbh = new DBHandler();

	
	public String execute() throws Exception
	{
		
		String U_ID = (String) session.get("U_ID");
		String result = dbh.Editprofile(sm, U_ID );
		System.out.println("Shan bhai"+U_ID);
		if(result.equalsIgnoreCase("success"))
		{
			return "success";
		}
		else
		{
			return "error";
		}
	}
	
	@Override
	public SignupModel getModel() {
		// TODO Auto-generated method stub
		return sm;
	}
	
	Map<String, Object> session = ActionContext.getContext().getSession();

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

}
