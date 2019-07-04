package spring.model.notice;

public class NoticeDTO {
	private String id;
	private String title;
	private String content;
	private int viewcnt;
	private String category;
	private String rdate;
	private int nno;

	@Override
	public String toString() {
		return "NoticeDTO [id=" + id + ", title=" + title + ", content=" + content + ", viewcnt=" + viewcnt
				+ ", category=" + category + ", rdate=" + rdate + ", nno=" + nno + "]";
	}

	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(String id, String title, String content, int viewcnt, String category, String rdate, int nno) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.viewcnt = viewcnt;
		this.category = category;
		this.rdate = rdate;
		this.nno = nno;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

}