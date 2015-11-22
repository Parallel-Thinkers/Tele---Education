package org.iiitb.action;

import java.util.ArrayList;

import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.SignupModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction1 extends ActionSupport implements ModelDriven<SignupModel> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	SignupModel sm = new SignupModel();
	public SignupModel getSm() {
		return sm;
	}

	public void setSm(SignupModel sm) {
		this.sm = sm;
	}

	public DBHandler getDbh() {
		return dbh;
	}

	public void setDbh(DBHandler dbh) {
		this.dbh = dbh;
	}

	public ArrayList<SignupModel> getAsmm() {
		return asmm;
	}

	public void setAsmm(ArrayList<SignupModel> asmm) {
		this.asmm = asmm;
	}

	DBHandler dbh = new DBHandler();
	ArrayList<SignupModel> asmm = new ArrayList<SignupModel>();
	
	
	public String execute() throws Exception
	{
	
		asmm = dbh.Load_Taluq();
		
		return "Success";
	}
	
	@Override
	public SignupModel getModel() {
		// TODO Auto-generated method stub
		return sm;
	}

}
