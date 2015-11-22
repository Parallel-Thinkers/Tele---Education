package org.iiitb.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.dbhandler.DBConnection;
import org.iiitb.model.LoginModel;

import com.opensymphony.xwork2.ActionContext;

public class StatusAction implements SessionAware {
	Map<String, Object> session = ActionContext.getContext().getSession();

	String U_ID = (String) session.get("U_ID");
	public ArrayList<String> a1=new ArrayList<String>();

	public String execute() throws SQLException{
		DBConnection dbc = new DBConnection();
		Connection con =  dbc.createConnection();
		 Statement st;

		//Check email as USER_ID and password, if matches then return role else wrong email or pass  

		
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Calendar cal = Calendar.getInstance();
		 System.out.println(dateFormat.format(cal.getTime()));
		 String s=dateFormat.format(cal.getTime());
		 String[] s1=s.split(" ");
		
			int flag = 0;

			st = con.createStatement();

//			String sql = "SELECT LOGOUT_TIMESTAMP FROM USER  WHERE DATE(LOGOUT_TIMESTAMP) <> '1993-03-04' ";
		//	String sql = "SELECT S.SH_NAME FROM USER AS U,TI AS T,SCHOOL AS S,SC AS S1 WHERE (DATE(U.LOGIN_TIMESTAMP) <>"+s1[0];//+"OR DATE(LOGOUT_TIMESTAMP)="+s1[0]+")"; //AND T.USER_ID='1'";// AND T.TALUQ_ID=S.TALUQ_ID AND S.SHC_ID=S1.SHC_ID AND S1.USER_ID=U.USER_ID";
			String sql = "SELECT S.SH_NAME FROM USER AS U,TI AS T,SCHOOL AS S,SC AS S1 WHERE  T.USER_ID='"+U_ID+"' AND T.TALUQ_ID=S.TALUQ_ID AND S.SHC_ID=S1.SHC_ID AND S1.USER_ID=U.USER_ID AND (DATE(U.LOGOUT_TIMESTAMP) ='"+s1[0]+"' OR DATE(U.LOGIN_TIMESTAMP) <>'"+s1[0]+"')";
			ResultSet rs = null;
			rs = st.executeQuery(sql);
			
     String f = null;
			while(rs.next()){
			
			a1.add(rs.getString("SH_NAME"));
				
			}
			System.out.println(a1+"shan");
		return "success";
	
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
