package forum.teledu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.Action;

import db.Dbconnect;

public class LoadAction implements Action {

	private Map<Integer,String> sch = new LinkedHashMap<Integer,String>(); 
	private Map<Integer,Integer> cla = new LinkedHashMap<Integer,Integer>();
	private Map<Integer,String> sub = new LinkedHashMap<Integer,String>();
	private Map<Integer,String> tag1 = new LinkedHashMap<Integer,String>();
	private Map<Integer,String> tag2 = new LinkedHashMap<Integer,String>();
	public Map<Integer, String> getTag1() {
		return tag1;
	}

	public void setTag1(Map<Integer, String> tag1) {
		this.tag1 = tag1;
	}

	public Map<Integer, String> getTag2() {
		return tag2;
	}

	public void setTag2(Map<Integer, String> tag2) {
		this.tag2 = tag2;
	}

	public int getSubId() {
		return subId;
	}

	public void setSubId(int subId) {
		this.subId = subId;
	}

	public int getTag1Id() {
		return tag1Id;
	}

	public void setTag1Id(int tag1Id) {
		this.tag1Id = tag1Id;
	}

	private int schoolId = 0;
	private int classId = 0;
	private int subId = 0;
	private int tag1Id = 0;
	
	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public Map<Integer, String> getSch() {
		return sch;
	}

	public void setSch(Map<Integer, String> sch) {
		this.sch = sch;
	}

	public String execute() throws SQLException
	{
		Dbconnect db = new Dbconnect();
		Connection conn = db.getConnection();
		
		System.out.println("Tanay.."+conn);
	
		String sql = "select SH_ID,SH_NAME from SCHOOL ";
		java.sql.PreparedStatement stmt = conn.prepareStatement(sql.toUpperCase());
		ResultSet rs = stmt.executeQuery() ;
		while(rs.next())
		sch.put(rs.getInt(1),rs.getString(2));
		
		if(schoolId != 0)
		{
			sql = "select class_id,CLASS from class where shc_id = ? ";
			stmt = conn.prepareStatement(sql.toUpperCase());
			stmt.setInt(1, schoolId);;
			rs = stmt.executeQuery();
			while(rs.next())
			cla.put(rs.getInt(1),rs.getInt(2));
			
		}
		
		if(classId !=0)
		{
			sql = "select tags_id,name from TAGS where class_id = ? ";
			stmt = conn.prepareStatement(sql.toUpperCase());
			stmt.setInt(1, classId);;
			rs = stmt.executeQuery();
			while(rs.next())
			sub.put(rs.getInt(1),rs.getString(2));
			
			System.out.println(sub);
			
		}
		
		if(subId !=0)
		{
			sql = "select level1_id,name from level1_tag where tags_id = ? ";
			stmt = conn.prepareStatement(sql.toUpperCase());
			stmt.setInt(1, subId);;
			rs = stmt.executeQuery();
			while(rs.next())
			tag1.put(rs.getInt(1),rs.getString(2));
			
			System.out.println(sub);
			
		}
		
		if(tag1Id !=0)
		{
			sql = "select level_2_id,name from level_2_tag where level_1_id = ? ";
			stmt = conn.prepareStatement(sql.toUpperCase());
			stmt.setInt(1, tag1Id);;
			rs = stmt.executeQuery();
			while(rs.next())
			tag2.put(rs.getInt(1),rs.getString(2));
			
			System.out.println(sub);
			
		}
		
		conn.close();

		System.out.println("BAba");
		return SUCCESS;
	}

	public Map<Integer, String> getSub() {
		return sub;
	}

	public void setSub(Map<Integer, String> sub) {
		this.sub = sub;
	}

	public Map<Integer, Integer> getCla() {
		return cla;
	}

	public void setCla(Map<Integer, Integer> cla) {
		this.cla = cla;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

}
