package spring.model.grade;

public class GradeDTO {
	private String id;
	private String title;
	private String content;
	private String rdate;
	private String gno;
	
	
	@Override
	public String toString() {
		return "GradeDTO [id=" + id + ", title=" + title + ", content=" + content + ", rdate=" + rdate + ", gno=" + gno
				+ "]";
	}


	public GradeDTO() {
		super();
	}
	
	
	public String getGno() {
		return gno;
	}

	public void setGno(String gno) {
		this.gno = gno;
	}

	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
}
