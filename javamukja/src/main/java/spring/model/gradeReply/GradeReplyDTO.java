package spring.model.gradeReply;

public class GradeReplyDTO {
	private int grno	;
	private String content ;
	private String rdate ;
	private String id 	;
	private int gno 	;
	
	
	public GradeReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public GradeReplyDTO(int grno, String content, String rdate, String id, int gno) {
		super();
		this.grno = grno;
		this.content = content;
		this.rdate = rdate;
		this.id = id;
		this.gno = gno;
	}
	 
	@Override
	public String toString() {
		return "GradeReplyDTO [grno=" + grno + ", content=" + content + ", rdate=" + rdate + ", id=" + id + ", gno="
				+ gno + "]";
	}
	
	public int getGrno() {
		return grno;
	}
	public void setGrno(int grno) {
		this.grno = grno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	
	
}
