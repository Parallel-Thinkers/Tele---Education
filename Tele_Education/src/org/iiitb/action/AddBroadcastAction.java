package org.iiitb.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.AddBroadcastModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AddBroadcastAction extends ActionSupport implements
SessionAware,ModelDriven<AddBroadcastModel>{
	Map session;
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	private static final long serialVersionUID = -1270845103421772663L;
	AddBroadcastModel addBroadcastModel =new AddBroadcastModel();
	public String execute() throws Exception {

		try {
			System.out.println("before uid");
			String uid=(String)session.get("U_ID");
		System.out.println("uid is"+uid);
		DBHandler dBHandler = new DBHandler();
		dBHandler.InsertBroadcast(addBroadcastModel,uid); 	

		return "success";
		
		} catch (Exception e) {
	
			return "failure";
		}
	}
	@Override
	public AddBroadcastModel getModel() {
		// TODO Auto-generated method stub
		return addBroadcastModel;
	}
	
	
}
