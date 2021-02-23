package bean;

import org.hibernate.validator.constraints.Length;

public class Productreviews {
	private int bno;
	
	@Length(min = 5, max = 15, message = "제목은 5글자 이상 10글자 이하여야 합니다.")
	private String btitle;
	private String bwriter;
	
	@Length(min = 10, max = 50, message = "내용은 10글자 이상 50글자 이하여야 합니다.")
	private String bcontent;
	private String bimg;
	private int breview;
	private String bregdate;
	
	public Productreviews() {
		
	}

	public Productreviews(int bno, String btitle, String bwriter, String bcontent, String bimg, int breview,
			String bregdate) {
		
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bcontent = bcontent;
		this.bimg = bimg;
		this.breview = breview;
		this.bregdate = bregdate;
	}

	@Override
	public String toString() {
		return "Productreviews [bno=" + bno + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bcontent=" + bcontent
				+ ", bimg=" + bimg + ", breview=" + breview + ", regdate=" + bregdate + "]";
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBimg() {
		return bimg;
	}

	public void setBimg(String bimg) {
		this.bimg = bimg;
	}

	public int getBreview() {
		return breview;
	}

	public void setBreview(int breview) {
		this.breview = breview;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}

}