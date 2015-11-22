package org.iiitb.dbhandler;

import java.sql.*;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.iiitb.model.*;

import antlr.collections.List;


public class DBHandler implements SessionAware{

	Map Session;

    public Map getSession() {
		return Session;
	}

	public void setSession(Map session) {
		Session = session;
	}

	
	DBConnection dbc = new DBConnection();
	Connection con =  dbc.createConnection();
	private Statement st;

	//Check email as USER_ID and password, if matches then return role else wrong email or pass  

	public ArrayList<String> Verify(LoginModel lm) throws SQLException
	{
		ArrayList<String> Role1 = new ArrayList<String>();
		ArrayList<String> Role2 = new ArrayList<String>();
		Role2.add("invalid");
		String Role = null;
		int flag = 0;
		int SC_flag = 1;

		st = con.createStatement();

		String sql = "SELECT USER_ID,PASSWORD,ROLE,APPROVED FROM USER";

		ResultSet rs = null;
		rs = st.executeQuery(sql);

		while(rs.next())
		{
			if(rs.getString("USER_ID").equalsIgnoreCase(lm.getUserID()) && rs.getString("PASSWORD").equals(lm.getPassword()) && rs.getString("APPROVED").equalsIgnoreCase("TRUE"))
			{
				Role = rs.getString("ROLE");
				String sqlts = "UPDATE TELE_EDU_DB.USER SET LOGOUT_TIMESTAMP='0001-01-01 00:00:00', LOGIN_TIMESTAMP='"+getCurrentTimeStamp()+"' WHERE USER_ID='"+lm.getUserID()+"'";
				PreparedStatement prep22 =con.prepareStatement(sqlts);
				int k= prep22.executeUpdate();
			
				Role1.add(Role);
				flag = 1;
				Role1.add("True");
				
				if(Role.equalsIgnoreCase("SC"))
				{
					int SHC_ID;
					String sql2 = "select SHC_ID from TELE_EDU_DB.SC where USER_ID='"+lm.getUserID()+"'";
					PreparedStatement prep2 =con.prepareStatement(sql2);
					ResultSet rs1 = prep2.executeQuery();
					
					while(rs1.next())
					{
						SHC_ID =  rs1.getInt("SHC_ID");
						System.out.println("SHC_id "+SHC_ID);
						
						if(SHC_ID != 0)
						{
							String sql3 = "SELECT CLASS_ID FROM TELE_EDU_DB.CLASS where SHC_ID='"+SHC_ID+"'";
							
							PreparedStatement prep3 =con.prepareStatement(sql3);
							ResultSet rs2 = prep3.executeQuery();
							
							while(rs2.next())
							{
								int Class_id = rs2.getInt("CLASS_ID");
								System.out.println("Class "+Class_id);
								
								if(Class_id != 0)
								{
									String sql4 ="SELECT TEST_ID FROM TELE_EDU_DB.TEST WHERE CLASS_ID='"+Class_id+"'";
									PreparedStatement prep4 =con.prepareStatement(sql4);
									ResultSet rs3 = prep4.executeQuery();
									
									while(rs3.next())
									{
										int Test_id = rs3.getInt("TEST_ID");
										System.out.println("Test_id "+Test_id);
										if(Test_id != 0)
										{
											String sql5 = "SELECT MARKS_ID FROM TELE_EDU_DB.MARKS WHERE TEST_ID='"+Test_id+"'";
											PreparedStatement prep5 =con.prepareStatement(sql5);
											ResultSet rs4 = prep5.executeQuery();
											if(rs4.next()==false)
											{
												SC_flag=0;
												Role1.set(1, "false");
											}
											while(rs4.next())
											{
												int Marks_id = rs4.getInt("MARKS_ID");
												System.out.println("Marks_ID "+Marks_id);
												
											}
													
										}
										
									}
											
								}
								
							}
							
						}
					}
					
				}
			}
		}
		if(flag==1)
			return Role1;
		else

			return Role2;

	}
	
	private static java.sql.Timestamp getCurrentTimeStamp() {
		 
		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());
	 
	}
	
	public String add(SignupModel sm) throws Exception
	{
		String query = "INSERT INTO USER(USER_ID,NAME,PASSWORD,ROLE,MOBILE,ADDRESS,APPROVED,LOGOUT_TIMESTAMP,LOGIN_TIMESTAMP) VALUES(?,?,?,?,?,?,?,?,?)";
		//String query2 = "INSERT INTO DELIVERY_DETAILS(U_ID,D_NAME,ADDRESS,CITY,STATE,PINCODE,PHONE_NO) VALUES(?,?,?,?,?,?,?)" ;
		PreparedStatement prep1 =con.prepareStatement(query);
		//PreparedStatement prep2 =con.prepareStatement(query2);  
		//Handel Approved
		
		prep1.setString(1, sm.getUser_id());
		prep1.setString(2,sm.getName());
		prep1.setString(3,sm.getPassword());
		prep1.setString(4,sm.getRole());
		prep1.setString(5,sm.getMobile());
		prep1.setString(6,sm.getAddress());
		prep1.setString(7,sm.getApproved());
		prep1.setTimestamp(8, getCurrentTimeStamp());
		prep1.setTimestamp(9, getCurrentTimeStamp());
		
		int k=prep1.executeUpdate();
		
		if(sm.getRole().equalsIgnoreCase("TI"))
		{
			int Taluq_Id = 0 ;
			String sqll = "SELECT TALUQ_ID from TALUQ where NAME = '" + sm.getTaluq()+"'";
			PreparedStatement prep2 =con.prepareStatement(sqll);
			ResultSet rs1 = prep2.executeQuery();
			
			while(rs1.next())
			{
				Taluq_Id =  rs1.getInt("TALUQ_ID");
			}
			
			String sql2 = "INSERT INTO TI(USER_ID,TALUQ_ID) VALUES(?,?)";
			PreparedStatement prep3 =con.prepareStatement(sql2);
			
			prep3.setString(1, sm.getUser_id());
			prep3.setInt(2, Taluq_Id);
			int tt = prep3.executeUpdate();
			
		}
		else
		{
			
			int School_id = 0;
			String sql3 = "SELECT SHC_ID FROM SCHOOL WHERE SH_NAME= '" +sm.getSchool()+"'";
			PreparedStatement prep4 =con.prepareStatement(sql3);
			ResultSet rs2 = prep4.executeQuery();
			
			while(rs2.next())
			{
				School_id = rs2.getInt("SHC_ID");
			}
			String sql4 = "INSERT INTO SC(SHC_ID,USER_ID) VALUES(?,?)";
			PreparedStatement prep5 =con.prepareStatement(sql4);
			prep5.setInt(1, School_id);
			prep5.setString(2, sm.getUser_id());
			
			int nn = prep5.executeUpdate();
			
			
		}
		
		if(k==1)
		{
			
			return "user";
		}
	else
		return "error";
	}
	
	public String Editprofile(SignupModel sm, String User_id) throws Exception
	{
		System.out.println(User_id);
		String str = null;
		str =  User_id.replace("\"", ""); 
		System.out.println(User_id);
		
		String sql = "UPDATE USER SET PASSWORD = ?, ADDRESS = ?, MOBILE = ?"
				+ " WHERE USER_ID ='"+User_id+"' ";
		PreparedStatement prep =con.prepareStatement(sql);
		prep.setString(1, sm.getPassword()); 
		prep.setString(2, sm.getAddress());
		prep.setString(3, sm.getMobile());
		//prep.setString(4, sm.getUser_id());
		
		
		int k= prep.executeUpdate();
		if(k>=1)
		{
		return "success";
		}
		else
			return "error";
	}
	
	public ArrayList<SignupModel> Load_Taluq() throws Exception
	{
		System.out.println("in signup model");
		//st = null;
		System.out.println("Mujahid");
		ArrayList<SignupModel> al = new ArrayList<SignupModel>();
		ArrayList<String> a2 = new ArrayList<String>();
		String sql = "SELECT NAME FROM TELE_EDU_DB.TALUQ";
		
		PreparedStatement prep =con.prepareStatement(sql);
		 
		ResultSet rs = prep.executeQuery(sql);
		
		while(rs.next())
		{
			String str1;
			SignupModel sm1 = new SignupModel();
			sm1.setTaluq(rs.getString("NAME"));
			str1 = rs.getString("NAME");
			System.out.println(rs.getString("NAME"));
			al.add(sm1);	
			a2.add(str1);
		}
		for(int i=0; i<al.size();i++)
		{
		//System.out.println(al.get(i).toString());
		System.out.println("Taluq == "+a2);
		}
		return al;
	}
	
	public ArrayList<SignupModel> Load_School() throws Exception
	{
		ArrayList<SignupModel> al = new ArrayList<SignupModel>();
		
		String sql2 = "SELECT SH_ID,SH_NAME FROM SCHOOL";
		PreparedStatement prep =con.prepareStatement(sql2);
		 
		ResultSet rs = prep.executeQuery(sql2);
		
	//	rs = st.executeQuery(sql2);
		while(rs.next())
		{
			SignupModel sm1 = new SignupModel();
			sm1.setSchool(rs.getString("SH_NAME"));
			System.out.println("Schoool..."+rs.getString("SH_NAME"));
			al.add(sm1);	
		}
		
		return al;
	}
	
	public ArrayList<LoadModel> Load_Request() throws Exception
	{
		ArrayList<LoadModel> alm = new ArrayList<LoadModel>();
		
		String sql = "SELECT USER_ID,NAME,ROLE FROM TELE_EDU_DB.USER WHERE APPROVED='False'";
		PreparedStatement prep =con.prepareStatement(sql); 
		ResultSet rs = prep.executeQuery(sql);
		int i=0;
		while(rs.next())
		{	i++;
			LoadModel lm = new LoadModel();
			lm.setUser_id(rs.getString(1));
			lm.setName(rs.getString(2));
			lm.setRole(rs.getString(3));
			lm.setI(i);
			
			alm.add(lm);
		}
		
		return alm;
	}
	
	public String approve() throws Exception
	{
		String sql = "UPDATE USER SET APPROVED = 'True' WHERE APPROVED = 'False' ";
		PreparedStatement prep = con.prepareStatement(sql);
		
		int k= prep.executeUpdate();
		
		if(k>=1)
		{
			return "success";
		}
		else
		{
		return "error";
		}
	}

	public void InsertBroadcast(AddBroadcastModel addBroadcastModel) {
		// TODO Auto-generated method stub
		
	}

	public void setlogout(String Uid) throws SQLException {
		// TODO Auto-generated method stub
		
		String sqlts = "UPDATE TELE_EDU_DB.USER SET LOGIN_TIMESTAMP='0001-01-01 00:00:00', LOGOUT_TIMESTAMP='"+getCurrentTimeStamp()+"' WHERE USER_ID='"+Uid+"'";
		PreparedStatement prep =con.prepareStatement(sqlts);
		int k= prep.executeUpdate();
		
		
	}
	
	// Ankit   Ratnawat's code
	
	public void addStudent(AddStudentModel asm,String U_ID) throws SQLException {
		
		st =con.createStatement();
		String sql = "INSERT INTO STUDENT(ROLLNO,NAME,CLASS_ID,ADDRESS)"+ "VALUES(?,?,?,?)";
		 PreparedStatement preparedStmt = con.prepareStatement(sql);
		
		// int USER_ID=2;
		 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID='"+U_ID+"' ";
		 ResultSet rs=st.executeQuery(QueryUser);
		 int SHC_ID=0;
		 while(rs.next())
		 {
			 SHC_ID=rs.getInt("SHC_ID");
			 break;
		 }
		 
		 System.out.println("shc_id new hamid="+SHC_ID);
		 
		int cls=asm.getCls();
		String query = "SELECT CLASS_ID FROM CLASS WHERE CLASS="+cls+"&& SHC_ID="+SHC_ID;
		ResultSet rs1 = st.executeQuery(query);
		int class_id=0;
			while(rs1.next())
			{
				class_id=rs1.getInt("CLASS_ID");
				break;
			}
		
		
		
		
		for(int i=0;i<asm.getRollnumber().size();i++)
		{
			String rollnumber=asm.getRollnumber().get(i);
			String name=asm.getName().get(i);
			String address=asm.getAddress().get(i);
			preparedStmt.setString(1, rollnumber);
			preparedStmt.setString(2, name);
			preparedStmt.setInt(3, class_id);
			
			
			preparedStmt.setString(4, address);
			preparedStmt.execute();
			//System.out.println("rno= "+rollnumber+"name= "+name+"address="+address);
			
		}
		
		con.close();
		
		// TODO Auto-generated method stub
		
	}
	

	
	
	
	public ArrayList<String> getSubject(GetSubjectModel gsm,String USER_ID)throws SQLException
	{
		st =con.createStatement();
		
		 //int USER_ID=2;
		 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID= '"+USER_ID+"' ";
		 ResultSet rs1=st.executeQuery(QueryUser);
		 int SHC_ID=0;
		 while(rs1.next())
		 {
			 SHC_ID=rs1.getInt("SHC_ID");
			 break;
		 }
		 
		 System.out.println("shc_id="+SHC_ID);
		
		
		int  subject_in_class=gsm.getSubject();
		System.out.println("class="+subject_in_class);
		String sql="SELECT NAME FROM CLASS,TAGS WHERE CLASS="+subject_in_class+"&& CLASS.TAGS_ID=TAGS.TAGS_ID &&"
				+ "SHC_ID="+SHC_ID+" ";
		 PreparedStatement preparedStmt = con.prepareStatement(sql);
		 ResultSet rs=st.executeQuery(sql);
		 
		 ArrayList<String> sub_name=new ArrayList<String>();
		 
		 	while(rs.next())
		 	{
		 		
		 		sub_name.add(rs.getString("NAME"));
		 		}
		 	
		 	for(int i=0;i<sub_name.size();i++)
		 			System.out.println("sub="+sub_name.get(i));
		 	return sub_name;
		 	
		 	
		 	}
	
	public ArrayList<String> getSubjectTopicModel (GetSubjectTopicModel gstm,String USER_ID)throws SQLException
	{
		st=con.createStatement();
		ArrayList<String> sub_topic=new ArrayList<String>();
		
		String subject=gstm.getTag();
		int Standard=gstm.getStandard();
		
		
		//int USER_ID=2;
		 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID= '"+USER_ID+"' ";
		 ResultSet rs1=st.executeQuery(QueryUser);
		 int SHC_ID=0;
		 while(rs1.next())
		 {
			 SHC_ID=rs1.getInt("SHC_ID");
			 break;
		 }
		 
		 System.out.println("shc_id="+SHC_ID);
		
		//String sql="SELECT LEVEL1_TAG.NAME FROM CLASS,TAGS,LEVEL1_TAG WHERE TAGS.NAME="?
			//	"&& TAGS.TAGS_ID=CLASS.TAGS_ID && CLASS.CLASS="+Standard+"&&CLASS.CLASS_ID=LEVEL1_TAG.CLASS_ID";
		
		String sql="SELECT LEVEL1_TAG.NAME FROM CLASS,TAGS,LEVEL1_TAG WHERE TAGS.NAME='"+subject+"' && "
				+ "TAGS.TAGS_ID=CLASS.TAGS_ID && CLASS.CLASS="+Standard+ "&&"
				+ " CLASS.CLASS_ID=LEVEL1_TAG.CLASS_ID && SHC_ID="+SHC_ID+"";
		
		PreparedStatement preparedStmt = con.prepareStatement(sql);
		//preparedStmt.setString(1, subject);
		//preparedStmt.setInt(2, Standard);
		
		ResultSet rs=st.executeQuery(sql);
		
		while(rs.next())
	 	{
	 		
	 		sub_topic.add(rs.getString("NAME"));
	 		}
		System.out.println("sub_topic="+sub_topic);
		
		
		return sub_topic;
	}
	
	
	public void fillTestDetail(TestDetailModel tdm,String USER_ID) throws SQLException
	{
		st=con.createStatement();
	int Standard=tdm.getStandard();
	String subject=tdm.getSubject();
	String topic=tdm.getTopic();
	String test_topic=tdm.getTest_topic();
	int maxMarks=tdm.getMaxMarks();
	Date test_date=tdm.getTest_date();
	
	//int USER_ID=2;
	 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID= '"+USER_ID+"' ";
	 ResultSet rs1=st.executeQuery(QueryUser);
	 int SHC_ID=0;
	 while(rs1.next())
	 {
		 SHC_ID=rs1.getInt("SHC_ID");
		 break;
	 }
	 
	 System.out.println("shc_id="+SHC_ID);
	
	
	
	
	String sql="INSERT INTO LEVEL2_TAG(LEVEL2_TAG.LEVEL1_TAG_ID,LEVEL2_TAG.NAME)"+"VALUES(?,?)";
		
	String sql1="SELECT LEVEL1_TAG.LEVEL1_TAG_ID,CLASS.CLASS_ID FROM  LEVEL1_TAG,CLASS,TAGS WHERE"
			+ " CLASS.CLASS="+Standard+"&& CLASS.TAGS_ID=TAGS.TAGS_ID && TAGS.NAME='"+subject+"'&& "
		   + "CLASS.CLASS_ID=LEVEL1_TAG.CLASS_ID &&"
		   + " LEVEL1_TAG.NAME='"+topic+"' && SHC_ID="+SHC_ID+"";
	
	//String sql1="SELECT LEVEL1_TAG.LEVEL1_TAG_ID,CLASS.CLASS_ID FROM LEVEL1_TAG,CLASS,TAGS WHERE CLASS.CLASS=6 and CLASS.TAGS_ID=TAGS.TAGS_ID AND	TAGS.NAME='maths' AND CLASS.CLASS_ID=LEVEL1_TAG.CLASS_ID AND LEVEL1_TAG.NAME='geometry'";
	
	PreparedStatement preparedStmt = con.prepareStatement(sql1);
	
	ResultSet rs=st.executeQuery(sql1);
	int level1_tag_id=0;
	int class_id=0;
		while(rs.next())
		{
			level1_tag_id=rs.getInt("LEVEL1_TAG.LEVEL1_TAG_ID");
			class_id=rs.getInt("CLASS.CLASS_ID");
			break;
		}
		
		
		preparedStmt=con.prepareStatement(sql);
		preparedStmt.setInt(1, level1_tag_id);
		preparedStmt.setString(2,test_topic);
		preparedStmt.execute();
		
		String sql2="SELECT LEVEL2_TAG_ID FROM LEVEL2_TAG WHERE LEVEL1_TAG_ID='"+level1_tag_id+"' && NAME='"+test_topic+"'";
		
		rs=st.executeQuery(sql2);
		int level2_tag_id=0;
		while(rs.next())
		{
			level2_tag_id=rs.getInt("LEVEL2_TAG_ID");
			break;
		}
		
		String sql3="INSERT INTO TEST(CLASS_ID,LEVEL2_TAGS_ID,MAX_MARKS,TEST_DATE)"+"VALUES(?,?,?,?)";
		preparedStmt=con.prepareStatement(sql3);
		preparedStmt.setInt(1, class_id);
		preparedStmt.setInt(2, level2_tag_id);
		preparedStmt.setInt(3, maxMarks);
		preparedStmt.setDate(4,test_date);
		preparedStmt.execute();
		
	
	}
	
	
	public ArrayList<String> getTestTopic(GetTestTopicModel gttm,String USER_ID) throws SQLException
	{
		String Subject=gttm.getSub();
		int Standard=gttm.getStandard();
		String Topic=gttm.getTopic();
		
		st=con.createStatement();
		
		//int USER_ID=2;
		 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID= '"+USER_ID+"' ";
		 ResultSet rs1=st.executeQuery(QueryUser);
		 int SHC_ID=0;
		 while(rs1.next())
		 {
			 SHC_ID=rs1.getInt("SHC_ID");
			 break;
		 }
		 
		 System.out.println("shc_id="+SHC_ID);
		
		//String sql="SELECT LEVEL2_TAG.NAME FROM CLASS, LEVEL2_TAG,TAGS,TEST WHERE CLASS.CLASS='"+Standard+"' "
			//	+ "&& CLASS.TAG_ID=TAGS.TAG_ID && TAGS.NAME='"+Subject+"' && CLASS.CLAA_ID=TEST.TEST.CLASS_ID && "
				//		+ "TEST.LEVEL2_TAGS_ID=LEVEL2_TAG.LEVEL2_TAG_ID ";
	//	System.out.println("gttm "+Standard+" "+Subject+" "+Topic);
		
		String sql="SELECT LEVEL2_TAG.NAME FROM CLASS, LEVEL2_TAG,TAGS,TEST,LEVEL1_TAG WHERE CLASS.CLASS='"+Standard+"'"
				+"&& CLASS.TAGS_ID=TAGS.TAGS_ID && TAGS.NAME='"+Subject+"' &&"
				+"CLASS.CLASS_ID=TEST.CLASS_ID &&"
				+"TEST.LEVEL2_TAGS_ID=LEVEL2_TAG.LEVEL2_TAG_ID"
				+"&& LEVEL1_TAG.NAME='"+Topic+"'"
				+"&& LEVEL2_TAG.LEVEL1_TAG_ID=LEVEL1_TAG.LEVEL1_TAG_ID"
				+ "&&CLASS.SHC_ID="+SHC_ID+"";
		
		
		ResultSet rs=st.executeQuery(sql);
		ArrayList<String > test_topiclist=new ArrayList<String>();
		while(rs.next())
		{
			test_topiclist.add(rs.getString("LEVEL2_TAG.NAME"));
			
		}
		
		System.out.println("test_topic="+test_topiclist);
		return test_topiclist;
	}
	
	
	
	public ArrayList<String> fillMarks(MarksModel mm,String USER_ID) throws SQLException
	{
		st=con.createStatement();
		
		//int USER_ID=2;
		 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID= '"+USER_ID+"' ";
		 ResultSet rs1=st.executeQuery(QueryUser);
		 int SHC_ID=0;
		 while(rs1.next())
		 {
			 SHC_ID=rs1.getInt("SHC_ID");
			 break;
		 }
		 
		 System.out.println("shc_id="+SHC_ID);
		 
		 int Standard=mm.getStandard();
		 String Student_Name="SELECT STUDENT.NAME FROM STUDENT,CLASS WHERE CLASS.SHC_ID="+SHC_ID+" &&"
		 		+ " CLASS.CLASS_ID=STUDENT.CLASS_ID && CLASS.CLASS="+Standard+"";
		 ArrayList<String> StudentName=new ArrayList<String>();
		 ResultSet rs=st.executeQuery(Student_Name);
		 while(rs.next())
		 {
			 StudentName.add(rs.getString("STUDENT.NAME"));
		 }
		  System.out.println("student name="+StudentName);
		  
		return StudentName;
	}
	
	





	public void insertMarks(FillMarksModel fmm,String USER_ID,String Standard,String Subject,String Topic,String Test_Topic ) throws SQLException {
		st=con.createStatement();
		
		//int USER_ID=2;
		 String QueryUser="SELECT SHC_ID FROM SC WHERE USER_ID= '"+USER_ID+"' ";
		 ResultSet rs1=st.executeQuery(QueryUser);
		 int SHC_ID=0;
		 while(rs1.next())
		 {
			 SHC_ID=rs1.getInt("SHC_ID");
			 break;
		 }
		 
		 System.out.println("shc_id="+SHC_ID);
		 rs1.close();
		 
	//	 int Standard=6;
		// String Subject="maths";
		// String topic="algebra";
		 //String test_topic="determinent";
		 
		 String Student_List="SELECT STUDENT.S_ID FROM STUDENT,CLASS WHERE CLASS.SHC_ID="+SHC_ID+" &&"
			 		+ " CLASS.CLASS_ID=STUDENT.CLASS_ID && CLASS.CLASS="+Standard+"";
			 ArrayList<Integer> S_ID=new ArrayList<Integer>();
			 ResultSet rs=st.executeQuery(Student_List);
			 while(rs.next())
			 {
				 S_ID.add(rs.getInt("STUDENT.S_ID"));
			 }
			  System.out.println("student ids="+S_ID);
		 
		 String sql="INSERT INTO MARKS(S_ID,TEST_ID,MARKS_OBTAINED)"+"VALUES(?,?,?)";
		 rs.close();
		// ResultSet rs2=st.executeQuery(Student_List);
		
		 
		// int TEST_ID=7;
		//int cls=6;
		 String Test="SELECT TEST_ID FROM TEST,LEVEL2_TAG,CLASS,SC,LEVEL1_TAG,TAGS WHERE SC.USER_ID='"+USER_ID+"' && SC.SHC_ID=CLASS.SHC_ID &&"
				 +" CLASS.CLASS='"+Standard+"' && CLASS.TAGS_ID=TAGS.TAGS_ID && TAGS.NAME='"+Subject+"' && CLASS.CLASS_ID=LEVEL1_TAG.CLASS_ID &&"
				 +"LEVEL1_TAG.NAME='"+Topic+"' && LEVEL1_TAG.LEVEL1_TAG_ID=LEVEL2_TAG.LEVEL1_TAG_ID &&"
				 +"LEVEL2_TAG.NAME='"+Test_Topic+"' && LEVEL2_TAG.LEVEL2_TAG_ID=TEST.LEVEL2_TAGS_ID";
		 
		 
		 ResultSet rs3=st.executeQuery(Test);
		 int TEST_ID=0;
		 	while(rs3.next())
		 	{
		 		System.out.println("in result set");
		 		TEST_ID=rs3.getInt("TEST.TEST_ID");
		 		break;
		 	}
		 
		 
		 System.out.println("test_id in new session="+TEST_ID);
		 
		 PreparedStatement preparedStmt = con.prepareStatement(sql);
		 
		 for(int i=0;i<S_ID.size();i++)
		 {
			 int sid=S_ID.get(i);
			 int marks=fmm.getMarks().get(i);
			 System.out.println("sid="+sid+"marks="+marks);
			 preparedStmt.setInt(1,sid );
			 preparedStmt.setInt(2, TEST_ID);
			 preparedStmt.setInt(3, marks);
			 preparedStmt.execute();
			 
			 
		 }

		con.close();
		
		
	}
	
	/********* @shan SC Report Issue Module *******/	
	public ArrayList<String> getissuelist(String U_ID) {
		
		ArrayList<String> issues;
		
		issues= new ArrayList<String>();
		try{
			st = con.createStatement();
			
			String issueQuery = "SELECT TITLE FROM TELE_EDU_DB.ISSUES where SC_ID in(SELECT SC_ID FROM TELE_EDU_DB.SC where USER_ID='"+U_ID+"');";		//get value of USER_ID from session
			ResultSet rs=st.executeQuery(issueQuery);
			while(rs.next())
			{
				 
				String inter = rs.getString("TITLE");
				issues.add(inter);
			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return issues;
	}

		public String insertissue(ReportIssueModel ri,String U_ID) throws SQLException {
			PreparedStatement stmt=null;
			Statement stmt2=null;
			
			String query2 = "SELECT SC_ID FROM SC WHERE USER_ID='"+U_ID+"'";
			stmt2= con.createStatement();
			System.out.println("before x");
			ResultSet rs1 = stmt2.executeQuery(query2);
			int x=0;
			while(rs1.next()){
			 x = rs1.getInt("SC_ID");
			 break;
			}
			System.out.println("sc_id in dbhandler="+x);
			
			String query;
			try
			{
				query="insert into TELE_EDU_DB.ISSUES(SC_ID,TITLE,DESCRIPTION,STATUS) values(?,?,?,?) ";
				stmt=con.prepareStatement(query);
			
				//School Coordinate(SC_ID) will be set by session
				ri.setSc_id(x);
				
				stmt.setInt(1,ri.getSc_id());
				stmt.setString(2,ri.getIssuetitle());
				stmt.setString(3, ri.getIssuedesc());
				ri.setIssuestatus("0");
				stmt.setString(4, ri.getIssuestatus());
				stmt.executeUpdate();
				stmt.close();
//				con.close();
				return "success";	
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return "failure";
			}
		}

		public ArrayList<String> getunresolvedissue(String U_ID) {
			ArrayList<String> issues;
			
			issues= new ArrayList<String>();
			try{
				st = con.createStatement();
				
				String issueQuery = "SELECT TITLE FROM TELE_EDU_DB.ISSUES where STATUS = '0' and SC_ID in(SELECT SC_ID FROM TELE_EDU_DB.SC where USER_ID='"+U_ID+"');";
				ResultSet rs=st.executeQuery(issueQuery);
				while(rs.next())
				{
					 
					String inter = rs.getString("TITLE");
					issues.add(inter);
				
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return issues;
		}

		public String issuestatus(SolveIssueModel si,String U_ID) {
			PreparedStatement stmt=null;
			String query;
			try
			{
				query = "UPDATE TELE_EDU_DB.ISSUES SET STATUS = 1 WHERE STATUS = '0' and SC_ID in(SELECT SC_ID FROM TELE_EDU_DB.SC where USER_ID='"+U_ID+"') and TITLE='"+si.getUrissueid()+"'; ";	//USER_ID value from session
				stmt=con.prepareStatement(query);
				stmt.executeUpdate();
				stmt.close();
				return "success";	
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return "failure";
			}
			
		}

		public ArrayList<String> getschoollist(String U_ID) {
			ArrayList<String> school = new ArrayList<String>();
			
			
			try{
				st = con.createStatement();
				
				String query = "SELECT SH_NAME FROM TELE_EDU_DB.SCHOOL where TALUQ_ID in (SELECT TALUQ_ID from TELE_EDU_DB.TI where TI_ID in(SELECT TI_ID FROM TELE_EDU_DB.TI where USER_ID='"+U_ID+"'));";	//TI_ID value get from session
				ResultSet rs=st.executeQuery(query);
				while(rs.next())
				{
					String str = rs.getString("SH_NAME");
					school.add(str);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			return school;
		}

		public void getissuedetails(IssueHAModel obj,
				ArrayList<IssueHAModel> list) {

			try{
				st = con.createStatement();
				
				String query1 = "SELECT SC_ID FROM TELE_EDU_DB.SC where SHC_ID in(SELECT SHC_ID FROM TELE_EDU_DB.SCHOOL where SH_NAME='"+obj.getSchool()+"');";
				ResultSet rs1=st.executeQuery(query1);
				while(rs1.next())
				{
					obj.setSc_id(rs1.getInt("SC_ID"));
//					school.add(str);
				}
				String query2 = "SELECT TITLE,DESCRIPTION,STATUS FROM TELE_EDU_DB.ISSUES where SC_ID='"+obj.getSc_id()+"';";
System.out.println(query2);
				ResultSet rs2=st.executeQuery(query2);
				while(rs2.next())
				{
					obj = new IssueHAModel();
					System.out.println("rahul");
					System.out.println(rs2.getString("TITLE")+" "+rs2.getString("DESCRIPTION")+" "+rs2.getString("STATUS"));
					obj.setItitle(rs2.getString("TITLE"));
					obj.setIdesc(rs2.getString("DESCRIPTION"));
					obj.setIstatus("UNRESOLVED");
					if(rs2.getString("STATUS").equalsIgnoreCase("1")){
						obj.setIstatus("RESOLVED");
					}
					list.add(obj);
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
			}

			
		//	return (List) list;
		}
		
		
		// Arpit's code
		public void InsertBroadcast(AddBroadcastModel addBroadcastModel,String uid) {
		// TODO Auto-generated method stub
		try {
			DBConnection db = new DBConnection();
			Connection con = db.createConnection();
			java.util.Date date = new java.util.Date();
			Timestamp time = new Timestamp(date.getTime());
			addBroadcastModel.setTIMESTAMP(time);
//			String uid = "mujahidali0611@gmail.com";
			//String uid=(String) Session.get("U_ID");
			System.out.println(uid);
			PreparedStatement preparedStatement1 = con
					.prepareStatement("SELECT TI_ID FROM TI WHERE USER_ID=?");
			preparedStatement1.setString(1, uid);
			ResultSet rs = preparedStatement1.executeQuery();

			while (rs.next()) {
				addBroadcastModel.setTI_ID(rs.getInt("TI_ID"));
			}

			PreparedStatement preparedStatement = con
					.prepareStatement("insert into BROADCAST (MESSAGE_BODY,TI_ID,TIMESTAMP) values(?,?,?)");
			preparedStatement.setString(1, addBroadcastModel.getMESSAGE_BODY());
			preparedStatement.setInt(2, addBroadcastModel.getTI_ID());
			preparedStatement.setTimestamp(3, addBroadcastModel.getTIMESTAMP());
			preparedStatement.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println("Error.." + e);
		}

	}

	public void FetchMessage(ArrayList<AddBroadcastModel> arrAddBroadcastModel,String uid)
			throws SQLException {
		// TODO Auto-generated method stub
		try {
			DBConnection db = new DBConnection();
			Connection con = db.createConnection();
			//String uid = "mujahidali0611@gmail.com";
			PreparedStatement preparedStatement1 = con
					.prepareStatement("SELECT SHC_ID FROM SC WHERE USER_ID=?");
			preparedStatement1.setString(1, uid);
			ResultSet rs = preparedStatement1.executeQuery();
			int SHC_ID = 0, TALUQ_ID = 0, TI_ID = 0, i = 0;
			while (rs.next()) {
				SHC_ID = rs.getInt("SHC_ID");
			}
			PreparedStatement preparedStatement2 = con
					.prepareStatement("SELECT TALUQ_ID FROM SCHOOL WHERE SHC_ID=?");
			preparedStatement2.setInt(1, SHC_ID);
			ResultSet rs1 = preparedStatement2.executeQuery();
			while (rs1.next()) {
				TALUQ_ID = rs1.getInt("TALUQ_ID");
			}

			PreparedStatement preparedStatement3 = con
					.prepareStatement("SELECT TI_ID FROM TI WHERE TALUQ_ID=?");
			preparedStatement3.setInt(1, TALUQ_ID);
			ResultSet rs2 = preparedStatement3.executeQuery();
			while (rs2.next()) {
				TI_ID = rs2.getInt("TI_ID");
			}

			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("SELECT MESSAGE_BODY FROM BROADCAST WHERE TI_ID=?");
			ps.setInt(1, TI_ID);
			ResultSet rs3 = ps.executeQuery();

			while (rs3.next()) {
				AddBroadcastModel ipm = new AddBroadcastModel();
				ipm.setMESSAGE_BODY(rs3.getString(1));
				arrAddBroadcastModel.add(i, ipm);
				i++;
			}
			System.out.println("hellogetmsg");
			for (int j = 0; j < arrAddBroadcastModel.size(); j++)
				System.out.println(arrAddBroadcastModel.get(j).getTI_ID());
			con.close();
		} catch (Exception e) {
			System.out.println("Error.." + e);
		}

	}

	public void InsertPersonalMessage(PersonalMessageModel personalMessageModel,String uid ) {
		// TODO Auto-generated method stub
		try {
			DBConnection db = new DBConnection();
			Connection con = db.createConnection();
			//String uid = "mujahidali0611@gmail.com";
			PreparedStatement preparedStatement1 = con
					.prepareStatement("SELECT TI_ID FROM TI WHERE USER_ID=?");
			preparedStatement1.setString(1, uid);
			ResultSet rs = preparedStatement1.executeQuery();

			while (rs.next()) {
				personalMessageModel.setMESSAGE_ID(rs.getInt("TI_ID"));
			}
System.out.println("mid"+personalMessageModel.getMESSAGE_ID()+"\nrid: "+personalMessageModel.getRECIVER_ID()+""
		+ "\nmessage body: "+personalMessageModel.getMESSAGE_BODY()+"Reciver name"+personalMessageModel.getRECIVER_NAME());
			PreparedStatement preparedStatement = con
					.prepareStatement("insert into PERSONAL_MESSAGE (MESSAGE_ID,RECIVER_ID,STATUS,MESSAGE_BODY) values(?,?,?,?)");
			preparedStatement.setInt(1, personalMessageModel.getMESSAGE_ID());
			preparedStatement.setInt(2, personalMessageModel.getRECIVER_ID());
			preparedStatement.setString(3,"sended");
			preparedStatement.setString(4,personalMessageModel.getMESSAGE_BODY());
			preparedStatement.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println("Error.." + e);
		}
	}

	public void FetchTI(ArrayList<TIModel> arrTIModel,String uid ) throws SQLException {
		// TODO Auto-generated method stub
		try {
			//String uid = "mujahidali0611@gmail.com";
			PreparedStatement preparedStatement1 = con
					.prepareStatement("SELECT TI_ID,NAME FROM TELE_EDU_DB.USER u ,TELE_EDU_DB.TI t where u.USER_ID=t.USER_ID  and u.USER_ID!=? ");
			preparedStatement1.setString(1, uid);
			ResultSet rs = preparedStatement1.executeQuery();
			int i = 0;
			while (rs.next()) {
				// personalMessageModel.setMESSAGE_ID(rs.getInt("TI_ID"));
				TIModel ipm = new TIModel();
				ipm.setTI_ID(rs.getInt("TI_ID"));
				ipm.setTI_NAME(rs.getString("NAME"));
				arrTIModel.add(i, ipm);
				i++;
			}
			for (int j = 0; j < arrTIModel.size(); j++)
				System.out.println(arrTIModel.get(j).getTI_NAME());

		} catch (Exception e) {
			System.out.println("Error.." + e);
		}
	}

	public void FetchPersonalMessage(
			ArrayList<PersonalMessageModel> arrPersonalMessageModel,
			PersonalMessageModel pm,String uid ) {
		// TODO Auto-generated method stub
		try {
			DBConnection db = new DBConnection();
			Connection con = db.createConnection();
			//String uid = "mujahidali0611@gmail.com";
			int message_id = 0;
			PreparedStatement preparedStatement1 = con
					.prepareStatement("SELECT TI_ID FROM TI WHERE USER_ID=?");
			preparedStatement1.setString(1, uid);
			ResultSet rs = preparedStatement1.executeQuery();
			  pm.setRECIVER_NAME(pm.getRECIVER_NAME());
			while (rs.next()) {
				message_id = rs.getInt("TI_ID");
			}
			PreparedStatement preparedStatement2 = con
					.prepareStatement(" select MESSAGE_ID,RECIVER_ID,MESSAGE_BODY FROM PERSONAL_MESSAGE WHERE MESSAGE_ID=? AND RECIVER_ID=? OR RECIVER_ID=? AND MESSAGE_ID=?;");
			preparedStatement2.setInt(1, message_id);
			preparedStatement2.setInt(2, pm.getRECIVER_ID());
			preparedStatement2.setInt(3, message_id);
			preparedStatement2.setInt(4, pm.getRECIVER_ID());
			ResultSet rs2 = preparedStatement2.executeQuery();
			int i = 0;
			while (rs2.next()) {
				PersonalMessageModel ipm = new PersonalMessageModel();
				ipm.setMESSAGE_BODY(rs2.getString("MESSAGE_BODY"));
				message_id=rs2.getInt("MESSAGE_ID");
				PreparedStatement preparedStatement3 = con
						.prepareStatement("SELECT NAME FROM TELE_EDU_DB.USER WHERE USER_ID = (SELECT USER_ID FROM TI WHERE TI_ID=? )");
				preparedStatement3.setInt(1, message_id);
				ResultSet rs3 = preparedStatement3.executeQuery();
				while (rs3.next()) {
					ipm.setSENDER_NAME(rs3.getString("NAME"));
				}
				arrPersonalMessageModel.add(i, ipm);
				i++;
			}
			con.close();
		} catch (Exception e) {
			System.out.println("Error.." + e);
		}
	}// end of FetchPersonalMessage

	public void FetchAllPersonalMessage(
			ArrayList<PersonalMessageModel> arrAllPersonalMessageModel,String uid) {
		// TODO Auto-generated method stub
		try {
			DBConnection db = new DBConnection();
			Connection con = db.createConnection();
			//String uid = "mujahidali0611@gmail.com";
			int message_id = 0;
			PreparedStatement preparedStatement1 = con
					.prepareStatement("SELECT TI_ID FROM TI WHERE USER_ID=?");
			preparedStatement1.setString(1, uid);
			ResultSet rs = preparedStatement1.executeQuery();

			while (rs.next()) {
				message_id = rs.getInt("TI_ID");
			}
			PreparedStatement preparedStatement2 = con
					.prepareStatement(" select MESSAGE_ID,RECIVER_ID,MESSAGE_BODY FROM PERSONAL_MESSAGE WHERE MESSAGE_ID=?  OR RECIVER_ID=? ");
			preparedStatement2.setInt(1, message_id);
			preparedStatement2.setInt(2, message_id);
			ResultSet rs2 = preparedStatement2.executeQuery();
			int i = 0;
			while (rs2.next()) {
				PersonalMessageModel ipm = new PersonalMessageModel();
				ipm.setMESSAGE_BODY(rs2.getString("MESSAGE_BODY"));
				ipm.setRECIVER_ID(rs2.getInt("RECIVER_ID"));
				message_id=rs2.getInt("MESSAGE_ID");

				PreparedStatement preparedStatement3 = con
						.prepareStatement("SELECT NAME FROM TELE_EDU_DB.USER WHERE USER_ID = (SELECT USER_ID FROM TI WHERE TI_ID=? )");
				preparedStatement3.setInt(1, message_id);
				ResultSet rs3 = preparedStatement3.executeQuery();
				while (rs3.next()) {
					ipm.setSENDER_NAME(rs3.getString("NAME"));
				}
				arrAllPersonalMessageModel.add(i, ipm);
				i++;
			}
			con.close();
			for (int j = 0; j < arrAllPersonalMessageModel.size(); j++)
				System.out.println(arrAllPersonalMessageModel.get(j).getMESSAGE_BODY());


		} catch (Exception e) {
			System.out.println("Error.." + e);
		}		
	}

	
		




	
}

