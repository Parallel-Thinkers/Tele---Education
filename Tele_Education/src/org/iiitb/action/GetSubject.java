package org.iiitb.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.GetSubjectModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class GetSubject extends ActionSupport implements ModelDriven<GetSubjectModel>,SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int Sub;
	//ArrayList<String> list=new  ArrayList<String>();
	private GetSubjectModel gsm=new GetSubjectModel();
	public String execute() throws Exception{
			System.out.println(gsm.getSubject());
			DBHandler DBH = new DBHandler();
			
			
			
			
		setSub(gsm.getSubject());
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in GET SUbject="+U_ID);
		
		 gsm.setTag_id(DBH.getSubject(gsm,U_ID));
			//list=DBH.getSubject(gsm);
		//	System.out.println("list="+list);
			
		return "success";
	}



	public GetSubjectModel getGsm() {
		return gsm;
	}



	public void setGsm(GetSubjectModel gsm) {
		this.gsm = gsm;
	}






	@Override
	public GetSubjectModel getModel() {
		// TODO Auto-generated method stub
		return gsm;
	}





	public int getSub() {
		return Sub;
	}



	public void setSub(int sub) {
		Sub = sub;
	}



	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

}
