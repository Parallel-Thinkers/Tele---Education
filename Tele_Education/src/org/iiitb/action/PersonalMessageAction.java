package org.iiitb.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.PersonalMessageModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PersonalMessageAction extends ActionSupport implements
SessionAware,ModelDriven<PersonalMessageModel>{
	private static final long serialVersionUID = -1270845103421772663L;
	PersonalMessageModel personalMessageModel =new PersonalMessageModel();
	public ArrayList<PersonalMessageModel> arrPersonalMessageModel=new ArrayList<PersonalMessageModel>();
	Map session;
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	//String uid=(String)session.get("U_ID");
	public String execute() throws Exception {

		try {
			DBHandler dBHandler = new DBHandler();
			String uid=(String)session.get("U_ID");

			dBHandler.InsertPersonalMessage(personalMessageModel,uid); 
		dBHandler.FetchPersonalMessage(arrPersonalMessageModel,personalMessageModel,uid);
			return "success";

		} catch (Exception e) {
			// TODO: handle exception
			return "failure";
		}
	}
	@Override
	public PersonalMessageModel getModel() {
		// TODO Auto-generated method stub
		return personalMessageModel;
	}

}
