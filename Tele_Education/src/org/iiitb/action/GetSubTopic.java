package org.iiitb.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.GetSubjectModel;
import org.iiitb.model.GetSubjectTopicModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetSubTopic extends ActionSupport implements ModelDriven<GetSubjectTopicModel>,SessionAware {
	
	
	GetSubjectTopicModel gstm= new GetSubjectTopicModel();
	public GetSubjectTopicModel getGstm() {
		return gstm;
	}

	public void setGstm(GetSubjectTopicModel gstm) {
		this.gstm = gstm;
	}

	public String execute() throws Exception
	{
		DBHandler DBH= new DBHandler();
		//gstm.setGstm(DBH.getSubjectTopicModel(gstm));
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in fill student="+U_ID);
		
		gstm.setGstm_array(DBH.getSubjectTopicModel(gstm,U_ID));
		//System.out.println("standard in gstm="+gstm.getStandard());
		//System.out.println("subject in gstm="+gstm.getTag());
		
		return "success";
	}

	@Override
	public GetSubjectTopicModel getModel() {
		// TODO Auto-generated method stub
		return gstm;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

}
