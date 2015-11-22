package org.iiitb.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.TestDetailModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SubmitTestDetail extends ActionSupport implements ModelDriven<TestDetailModel>,SessionAware{
	TestDetailModel tdm=new TestDetailModel();
	public String execute() throws SQLException
	{
		DBHandler DBH=new DBHandler();
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in SUBmit Test Detail="+U_ID);
		
		DBH.fillTestDetail(tdm,U_ID);
		
		
		System.out.println("Standard="+tdm.getStandard()+"Subject="+tdm.getSubject()+"topic="+tdm.getTopic()+"subtopic="+tdm.getTest_topic()+"maxmarks="+tdm.getMaxMarks()+"date="+tdm.getTest_date());
		
		
		
		return "success";
	}

	@Override
	public TestDetailModel getModel() {
		// TODO Auto-generated method stub
		return tdm;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	

}
