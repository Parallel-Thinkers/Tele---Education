package forum.teledu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.opensymphony.xwork2.Action;

import db.Dbconnect;

public class LoadFilterAction implements Action {
	
	
	private Map<Integer,String> sub = new LinkedHashMap<Integer,String>();
	
	public Map<Integer, String> getSub() {
		return sub;
	}

	public void setSub(Map<Integer, String> sub) {
		this.sub = sub;
	}

	public String execute() throws SQLException
	{
		Dbconnect db = new Dbconnect();
		Connection conn = db.getConnection();
		String sql = "select tags_id,name from tags" ;
		
		PreparedStatement ps = conn.prepareStatement(sql.toUpperCase());
		ResultSet rs = ps.executeQuery();
		while(rs.next())
			sub.put(rs.getInt(1),rs.getString(2));
		
		System.out.println(sub);
		
		conn.close();
		return SUCCESS;
	}
	

}
