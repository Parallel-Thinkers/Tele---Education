package org.iiitb.action;

import java.util.ArrayList;

import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.IssueHAModel;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SH_Issues extends ActionSupport implements ModelDriven<IssueHAModel>{

	/**
	 * @author shan
	 */
	private static final long serialVersionUID = 1L;
	IssueHAModel obj = new IssueHAModel();
	DBHandler dbh = new DBHandler();
	ArrayList<IssueHAModel> list = new ArrayList<IssueHAModel>();
	

	public String execute(){
		System.out.println("inside SH_Issues::"+obj.getSchool());
		dbh.getissuedetails(obj,list);
		return "success";
	}


	@Override
	public IssueHAModel getModel() {
		// TODO Auto-generated method stub
		return obj;
	}

	public ArrayList<IssueHAModel> getList() {
		return list;
	}
	public void setList(ArrayList<IssueHAModel> list) {
		this.list = list;
	}


}
