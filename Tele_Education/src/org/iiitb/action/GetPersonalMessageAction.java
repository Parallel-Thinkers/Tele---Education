package org.iiitb.action;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.PersonalMessageModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetPersonalMessageAction extends ActionSupport implements
SessionAware,ModelDriven<PersonalMessageModel>{
	Map session;
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
//	String uid=(String)session.get("U_ID");

	PersonalMessageModel pm = new PersonalMessageModel();
	private static final long serialVersionUID = 1L;
	public ArrayList<PersonalMessageModel> arrPersonalMessageModel=new ArrayList<PersonalMessageModel>(); 
	//AddBroadcastAction addBroadcastAction = new AddBroadcastAction();
	public String execute() throws FileNotFoundException{
		try {
			
			DBHandler dBHandler = new DBHandler();
			String uid=(String)session.get("U_ID");

			System.out.println("r name in getpma="+pm.getRECIVER_NAME());
			dBHandler.FetchPersonalMessage(arrPersonalMessageModel,pm,uid);
			//System.out.println("rid from getpm"+pm.getRECIVER_ID());
			for(int j=0;j<arrPersonalMessageModel.size();j++){
				System.out.println(arrPersonalMessageModel.get(j).getMESSAGE_BODY());
			}
			return "success";
		} catch (Exception e) {
			return "failure";
		}
	}
	@Override
	
	public PersonalMessageModel getModel() {
		// TODO Auto-generated method stub
		return pm;
	}

}
