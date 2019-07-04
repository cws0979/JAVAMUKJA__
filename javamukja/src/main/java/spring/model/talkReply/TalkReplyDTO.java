package spring.model.talkReply;

public class TalkReplyDTO {
	private int trno;
	private String id;
	private int tno;
	private String rdate;
	private String content;
	public TalkReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TalkReplyDTO(int trno, String id, int tno, String rdate, String content) {
		super();
		this.trno = trno;
		this.id = id;
		this.tno = tno;
		this.rdate = rdate;
		this.content = content;
	}
	@Override
	public String toString() {
		return "TalkReplyDTO [trno=" + trno + ", id=" + id + ", tno=" + tno + ", rdate=" + rdate + ", content="
				+ content + "]";
	}
	public int getTrno() {
		return trno;
	}
	public void setTrno(int trno) {
		this.trno = trno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
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
	

}
