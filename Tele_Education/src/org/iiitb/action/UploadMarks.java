package org.iiitb.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.MarksModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UploadMarks extends ActionSupport implements ModelDriven<MarksModel>,SessionAware {

	
	MarksModel mm=new MarksModel();
	
	public MarksModel getMm() {
		return mm;
	}




	public void setMm(MarksModel mm) {
		this.mm = mm;
	}




	public String execute() throws SQLException
	{
		DBHandler DBH=new DBHandler();
		
		
		
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in GET SUbject="+U_ID);
		mm.setStudentName(DBH.fillMarks(mm,U_ID));
		String Standard=String.valueOf(mm.getStandard());
		//Map<String, Object> sess1=ActionContext.getContext().getSession();
		//sess1.put(Standard, mm.getStandard());
		
		session.put("Standard", Standard);
		session.put("Subject", mm.getSubject());
		session.put("Topic", mm.getTopic());
		session.put("Test_Topic", mm.getTest_topic());
		//session.put(key, value)
		/*String Subject = null;
		session.put(Subject, mm.getSubject());
		String Topic = null;
		session.put(Topic, mm.getTopic());
		String Test_Topic = null;
		session.put(Test_Topic, mm.getTest_topic());
		*/
		
		
		
		
		
		//ArrayList<String> arl=DBH.fillMarks(mm);
		//System.out.println("in upload marks="+arl);
		
		
		return "success";
	}
	
	
	
	
	@Override
	public MarksModel getModel() {
		// TODO Auto-generated method stub
		return mm;
	}




	@Override
	public void setSession(Map<String, Object> arg0) {
		
		
		
	}
	
	

	

}
