package org.iiitb.action;
import java.util.ArrayList;

import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.*;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class Load_request extends ActionSupport implements ModelDriven<LoadModel> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	LoadModel lm = new LoadModel();
	DBHandler dbh = new DBHandler();
	ArrayList<LoadModel> alm = new ArrayList<LoadModel>();

	public LoadModel getLm() {
		return lm;
	}

	public void setLm(LoadModel lm) {
		this.lm = lm;
	}

	public ArrayList<LoadModel> getAlm() {
		return alm;
	}

	public void setAlm(ArrayList<LoadModel> alm) {
		this.alm = alm;
	}

	public String execute() throws Exception 
	{
		alm = dbh.Load_Request();
		return "success";
	}

	@Override
	public LoadModel getModel() {
		// TODO Auto-generated method stub
		return lm;
	}

}
