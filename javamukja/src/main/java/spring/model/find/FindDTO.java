package spring.model.find;

public class FindDTO {
	private int fno;
	private String fstr;
	private int fcnt;
	private String fdate;
	
	
	@Override
	public String toString() {
		return "FindDTO [fno=" + fno + ", fstr=" + fstr + ", fcnt=" + fcnt + ", fdate=" + fdate + "]";
	}
	
	public FindDTO() {
		super();
	}
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFstr() {
		return fstr;
	}
	public void setFstr(String fstr) {
		this.fstr = fstr;
	}
	public int getFcnt() {
		return fcnt;
	}
	public void setFcnt(int fcnt) {
		this.fcnt = fcnt;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
}
