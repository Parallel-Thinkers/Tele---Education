package org.iiitb.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport implements SessionAware {

		Map<String, Object> session = ActionContext.getContext().getSession();
	public String execute() throws SQLException 
	{
		String Uid= (String) session.get("U_ID");
		session.remove("email");
		session.clear();
		DBHandler dbh = new DBHandler();
		dbh.setlogout(Uid);
		return "logout";
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=session;
		
	}


}
