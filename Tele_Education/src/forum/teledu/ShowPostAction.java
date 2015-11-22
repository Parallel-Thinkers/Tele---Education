package forum.teledu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.Action;

import db.Dbconnect;

public class ShowPostAction implements Action {
	
	
	
	private ArrayList<PostBean> posts = new ArrayList<PostBean>() ;
	
	
	public String execute() throws SQLException{
		
		Dbconnect db = new Dbconnect();
		Connection conn = db.getConnection();
		String sql = "select a.ANSWERS,a.UP_VOTE,a.DOWN_VOTE,b.TEXT_ID,b.question,b.post_id,b.TAG_ID,b."
				+ "LEVEL1_TAG_ID,b.LEVEL2_TAG_ID,b.REFRENCES,b.TI_ID from ANSWERS a,(select t.TEXT_ID,"
				+ "t.question,p.post_id,p.TAG_ID,p.LEVEL1_TAG_ID,p.LEVEL2_TAG_ID,p.REFRENCES,p.TI_ID,p."
				+ "TIME_STAMP from TEXT t,  (select post_id,TAG_ID,LEVEL1_TAG_ID,LEVEL2_TAG_ID,REFRENCES"
				+ ",TI_ID,TIME_STAMP from post ) p where t.POST_ID = p.post_id) b where a.text_id = b."
				+ "text_id order by b.time_stamp desc";
		
		PreparedStatement ps = conn.prepareStatement(sql.toUpperCase());
	 ResultSet rs =	ps.executeQuery();
	while(rs.next())
	{
		PostBean p = new PostBean();
		p.setAnswer(rs.getString(1));
		p.setUpvote(rs.getInt(2));
		p.setDownvote(rs.getInt(3));
		p.setTextid(rs.getInt(4));
		p.setQuestion(rs.getString(5));
		p.setPostid(rs.getInt(6));
		p.setTag(rs.getInt(7));
		p.setTag1(rs.getInt(8));
		p.setTag2(rs.getInt(9));
		p.setRef(rs.getString(10));
		p.setTiid(rs.getInt(11));
		posts.add(p);
		
	}
	 
	 
		return SUCCESS;
	}


	public ArrayList<PostBean> getPosts() {
		return posts;
	}


	public void setPosts(ArrayList<PostBean> posts) {
		this.posts = posts;
	}

}
