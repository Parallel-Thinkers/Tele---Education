package forum.teledu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import db.Dbconnect;

public class PostAction  {
	
	private int subject ;
	private int school;
	private int classsch;
	private int topic;
	private int subtopic;
	private String question;
	private String answer;
	private String ref;
	
	
	public int getSchool() {
		return school;
	}


	public void setSchool(int school) {
		this.school = school;
	}


	public int getClasssch() {
		return classsch;
	}


	public void setClasssch(int classsch) {
		this.classsch = classsch;
	}


	public int getTopic() {
		return topic;
	}


	public void setTopic(int topic) {
		this.topic = topic;
	}


	public int getSubtopic() {
		return subtopic;
	}


	public void setSubtopic(int subtopic) {
		this.subtopic = subtopic;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getRef() {
		return ref;
	}


	public void setRef(String ref) {
		this.ref = ref;
	}


	public int getSubject() {
		return subject;
	}


	public void setSubject(int subject) {
		this.subject = subject;
	}


	public String execute() throws SQLException{
		
		Dbconnect db = new Dbconnect();
		
		Connection conn = db.getConnection();
		
		String sql = "insert into post (time_stamp,tag_id,ti_id,shc_id,refrences,s_id,level1_tag_id,level2_tag_id) values (?,?,?,?,?,?,?,?) " ;
		
		PreparedStatement ps = conn.prepareStatement(sql.toUpperCase(), Statement.RETURN_GENERATED_KEYS);
		System.out.println("karn  "+sql);
		java.util.Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		ps.setTimestamp(1, timestamp);
		ps.setInt(2, subject);
		ps.setInt(3, 1);//
		ps.setInt(4, school);
		ps.setString(5,ref );
		ps.setInt(6, 1);//
		ps.setInt(7, topic);
		ps.setInt(8, subtopic);
		
		ResultSet rs ; 
		int  i = ps.executeUpdate();
		 if(i== 1)
		  {
			 rs = ps.getGeneratedKeys(); 
			 rs.next();
			 i = rs.getInt(1);
		  }
		
		System.out.println(i);
		System.out.println("you got itt");
		
		ps.close();
		
		sql = "insert into text (question,post_id) values (?,?)";
		PreparedStatement ps1 = conn.prepareStatement(sql.toUpperCase(), Statement.RETURN_GENERATED_KEYS);
		
		
		ps1.setString(1, question);
		ps1.setInt(2, i);
		
		ps1.executeUpdate();
		
		rs = ps1.getGeneratedKeys();
		rs.next();
		i = rs.getInt(1);
		
		ps1.close();
		sql = "insert into answers (answers,up_vote,down_vote,text_id,user_id) values (?,?,?,?,?)";
		PreparedStatement ps2 = conn.prepareStatement(sql.toUpperCase(), Statement.RETURN_GENERATED_KEYS);
		
		ps2.setString(1, answer);
		ps2.setInt(2, 0);
		ps2.setInt(3, 0);
		ps2.setInt(4, i);
		ps2.setString(5, "1");
		
		ps2.executeUpdate();
		ps2.close();
		
		conn.close();
		
		return "success";
	}

}
