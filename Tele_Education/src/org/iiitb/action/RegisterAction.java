package org.iiitb.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.*;


public class RegisterAction extends ActionSupport implements ModelDriven<SignupModel>,ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	DBHandler dbh = new DBHandler();
	SignupModel sm = new SignupModel();
	ArrayList<SignupModel> asmm = new ArrayList<SignupModel>();
	ArrayList<SignupModel> asmm2 = new ArrayList<SignupModel>();
	
	
		public ArrayList<SignupModel> getAsmm2() {
		return asmm2;
	}

	public void setAsmm2(ArrayList<SignupModel> asmm2) {
		this.asmm2 = asmm2;
	}

		public DBHandler getDbh() {
		return dbh;
	}

	public void setDbh(DBHandler dbh) {
		this.dbh = dbh;
	}

	public SignupModel getSm() {
		return sm;
	}

	public void setSm(SignupModel sm) {
		this.sm = sm;
	}

	public ArrayList<SignupModel> getAsmm() {
		return asmm;
	}

	public void setAsmm(ArrayList<SignupModel> asmm) {
		this.asmm = asmm;
	}
		private HttpServletRequest servletRequest;
	
	
	
	
	public String execute() throws Exception
	{
		dbh.add(sm);
		System.out.println(sm);
		return "success";
	}
	
	public String Load_Taluq() throws Exception
	{
		asmm = dbh.Load_Taluq();
		
		return "Success";
	}
	
	
	public String Load_School() throws Exception
	{
		//ArrayList<SignupModel> Asm2 = new ArrayList<SignupModel>();
		//HttpServletRequest request = ServletActionContext.getRequest();
		
		asmm2 = dbh.Load_School();
		System.out.println(asmm2);
		//request.setAttribute("School", Asm2);
		System.out.println("Mujahid");
		addActionMessage("Your Request has been sent for approval!");
		return "Success";
		
	}
	
	@Override
	public SignupModel getModel() {
		// TODO Auto-generated method stub
		return sm;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.servletRequest = servletRequest;
		// TODO Auto-generated method stub
		
	}
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	

}
