package org.iiitb.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.*;

public class ApproveAction extends ActionSupport implements ModelDriven<LoadModel> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	LoadModel lm = new LoadModel();
	DBHandler dbh = new DBHandler();
	
	
	
	public String execute() throws Exception
	{
		String res = null;
		
		res = dbh.approve();
		return res;
	}

	@Override
	public LoadModel getModel() {
		// TODO Auto-generated method stub
		return lm;
	}
	

}
