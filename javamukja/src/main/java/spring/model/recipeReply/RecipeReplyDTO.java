package spring.model.recipeReply;

public class RecipeReplyDTO {
	private int rrno;
	private String id;
	private int rno;
	private String rdate; 
	private String content;
	
	public int getRrno() {
		return rrno;
	}
	public void setRrno(int rrno) {
		this.rrno = rrno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public RecipeReplyDTO(int rrno, String id, int rno, String rdate, String content) {
		super();
		this.rrno = rrno;
		this.id = id;
		this.rno = rno;
		this.rdate = rdate;
		this.content = content;
	}
	public RecipeReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RecipeReplyDTO [rrno=" + rrno + ", id=" + id + ", rno=" + rno + ", rdate=" + rdate + ", content="
				+ content + "]";
	}
}