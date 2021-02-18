package bean;

public class Productreviews {
	private int bno;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String bimg;
	private int breview;
	private String date;
	
	public Productreviews() {
		
	}

	public Productreviews(int bno, String btitle, String bwriter, String bcontent, String bimg, int breview,
			String date) {
		
		this.bno = bno;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bcontent = bcontent;
		this.bimg = bimg;
		this.breview = breview;
		this.date = date;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Productreviews [bno=" + bno + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bcontent=" + bcontent
				+ ", bimg=" + bimg + ", breview=" + breview + ", date=" + date + "]";
	}
	
	
	
	
	

}
