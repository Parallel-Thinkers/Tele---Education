package org.iiitb.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.GetTestTopicModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetTestTopic extends ActionSupport implements ModelDriven<GetTestTopicModel>,SessionAware {

	GetTestTopicModel gttm=new GetTestTopicModel();
	





	public String execute() throws SQLException
	{
		System.out.println("in test topic");
		DBHandler DBH=new DBHandler();
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in fill student="+U_ID);
		//DBH.getTestTopic(gttm);
		//gttm.setTest_topiclist(DBH.getTestTopic(gttm,U_ID));
		gttm.setTest_topiclist(DBH.getTestTopic(gttm, U_ID));
		return "success";
	}
	
	
	

	public GetTestTopicModel getGttm() {
		return gttm;
	}





	public void setGttm(GetTestTopicModel gttm) {
		this.gttm = gttm;
	}
	
	@Override
	public GetTestTopicModel getModel() {
		
		// TODO Auto-generated method stub
		return gttm;
	}




	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	
	
	
	

}
