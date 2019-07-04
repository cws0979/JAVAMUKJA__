package spring.model.recipe;

import org.springframework.web.multipart.MultipartFile;

public class RecipeDTO {
	private int rno;
	private String id;
	private String title;
	private String content;
	private int viewcnt;
	private int rcnt;
	private String fname;
	private String category;
	private String time;
	private String portion;
	private String ingredient;
	private String rdate;
	private MultipartFile fnameMF;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
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
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPortion() {
		return portion;
	}
	public void setPortion(String portion) {
		this.portion = portion;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	public MultipartFile getFnameMF() {
		return fnameMF;
	}
	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}
	public RecipeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RecipeDTO [rno=" + rno + ", id=" + id + ", title=" + title + ", content=" + content + ", viewcnt="
				+ viewcnt + ", rcnt=" + rcnt + ", fname=" + fname + ", category=" + category + ", time=" + time
				+ ", portion=" + portion + ", ingredient=" + ingredient + ", rdate=" + rdate + ", fnameMF=" + fnameMF
				+ "]";
	}
	public RecipeDTO(int rno, String id, String title, String content, int viewcnt, int rcnt, String fname,
			String category, String time, String portion, String ingredient, String rdate, MultipartFile fnameMF) {
		super();
		this.rno = rno;
		this.id = id;
		this.title = title;
		this.content = content;
		this.viewcnt = viewcnt;
		this.rcnt = rcnt;
		this.fname = fname;
		this.category = category;
		this.time = time;
		this.portion = portion;
		this.ingredient = ingredient;
		this.rdate = rdate;
		this.fnameMF = fnameMF;
	}
}
