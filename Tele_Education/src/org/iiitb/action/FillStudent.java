package org.iiitb.action;

import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBHandler;
import org.iiitb.model.*;

import antlr.collections.List;

public class FillStudent extends ActionSupport implements ModelDriven<AddStudentModel>,SessionAware{


AddStudentModel asm=new AddStudentModel();


	public String execute() throws Exception
	{
		
		DBHandler DBH=new DBHandler();
		Map<String, Object> session=ActionContext.getContext().getSession();
		String U_ID=(String) session.get("U_ID");
		
		System.out.println("new session in fill student="+U_ID);
		DBH.addStudent(asm,U_ID);
		
		
		//System.out.println(asm.getRollnumber()+"  "+asm.getName()+"   "+asm.getAddress());
		
		return "success";
	}

	@Override
	public AddStudentModel getModel() {
		// TODO Auto-generated method stub
		return asm;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	
}
