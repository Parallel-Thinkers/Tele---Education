package org.iiitb.action;

import java.sql.SQLException;
import java.util.Map;

import javax.websocket.Session;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.FillMarksModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FillMarks extends ActionSupport implements ModelDriven<FillMarksModel>,SessionAware  {
	
	
	FillMarksModel fmm=new FillMarksModel();
	public FillMarksModel getFmm() {
		return fmm;
	}

	public void setFmm(FillMarksModel fmm) {
		this.fmm = fmm;
	}

	public String execute () throws SQLException
	{
		DBHandler DBH=new DBHandler();
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in GET SUbject="+U_ID);

		
		
		String Standard=(String) session.get("Standard");
		String Subject=(String)session.get("Subject");
		String Topic=(String)session.get("Topic");
		String Test_Topic=(String)session.get("Test_Topic");
		
		//Map<String,Object> Session;
		//String Standard=(String) Session.get("Standard");
		
		System.out.println("session data="+Standard);
		
		
		DBH.insertMarks(fmm,U_ID,Standard,Subject,Topic,Test_Topic);
		
		
		
		
		
		
		return "success";
	}

	@Override
	public FillMarksModel getModel() {
		// TODO Auto-generated method stub
		return fmm;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	
}
