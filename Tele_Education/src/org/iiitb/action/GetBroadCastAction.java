package org.iiitb.action;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.AddBroadcastModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetBroadCastAction extends ActionSupport implements SessionAware,
ModelDriven<AddBroadcastAction> {
	/**
	 * 
	 */
	Map session;
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}
	
	private static final long serialVersionUID = 1L;
	public ArrayList<AddBroadcastModel> arrAddBroadcastModel=new ArrayList<AddBroadcastModel>(); 
	//AddBroadcastAction addBroadcastAction = new AddBroadcastAction();
	public String execute() throws FileNotFoundException{
		try {
			DBHandler dBHandler = new DBHandler();
			String uid=(String)session.get("U_ID");
			dBHandler.FetchMessage(arrAddBroadcastModel,uid);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "failure";
		}
	}
	@Override
	public AddBroadcastAction getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
