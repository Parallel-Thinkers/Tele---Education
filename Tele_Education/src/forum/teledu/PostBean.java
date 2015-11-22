package forum.teledu;

public class PostBean {
	
	private int postid;
	private int upvote;
	private int downvote;
	private String question;
	private String answer;
	private int textid;
	private int tiid;
	private String ref;
	private int tag;
	private int tag1;
	private int tag2;
	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public int getTag1() {
		return tag1;
	}
	public void setTag1(int tag1) {
		this.tag1 = tag1;
	}
	public int getTag2() {
		return tag2;
	}
	public void setTag2(int tag2) {
		this.tag2 = tag2;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public int getTiid() {
		return tiid;
	}
	public void setTiid(int tiid) {
		this.tiid = tiid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public int getUpvote() {
		return upvote;
	}
	public void setUpvote(int upvote) {
		this.upvote = upvote;
	}
	public int getDownvote() {
		return downvote;
	}
	public void setDownvote(int downvote) {
		this.downvote = downvote;
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
	public int getTextid() {
		return textid;
	}
	public void setTextid(int textid) {
		this.textid = textid;
	}
	

}
