package org.iiitb.action;
import org.iiitb.model.*;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.components.ActionMessage;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import org.iiitb.dbhandler.*;

public class LoginAction extends ActionSupport implements ModelDriven<LoginModel>, SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	LoginModel lm = new LoginModel();
	DBHandler dbh = new DBHandler();


	Map<String, Object> session = ActionContext.getContext().getSession();

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub

	}
	public ArrayList<PersonalMessageModel> arrAllPersonalMessageModel=new ArrayList<PersonalMessageModel>();
	public ArrayList<AddBroadcastModel> arrAddBroadcastModel=new ArrayList<AddBroadcastModel>();
	public String execute() throws Exception
	{ 
		String Role ;
		String str;
		ArrayList<String> Role1 = new ArrayList<String>();
		Role1 =  dbh.Verify(lm);

		Role = Role1.get(0);
		if(Role.equals("invalid"))
		{					
			System.out.println("invalid user");
			addActionError("Invalid Login");
			return "error";
		}
		else
		{
			session.put("U_ID", lm.getUserID());
			if(Role.equalsIgnoreCase("SC"));
			{
				str = Role1.get(1);
				dbh.FetchMessage(arrAddBroadcastModel,lm.getUserID());
				if(str.equalsIgnoreCase("false"))
				{
					addActionMessage("Warning....! Please Upload Data Within Three Days" );
				}
			}
			if(Role.equalsIgnoreCase("TI")){

				dbh.FetchAllPersonalMessage(arrAllPersonalMessageModel, lm.getUserID());

			}

			return Role;
		}
	}
	@Override
	public LoginModel getModel() {
		// TODO Auto-generated method stub
		return lm;
	}

}
