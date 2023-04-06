package com.spring.notice;

public class Notice {

	private int nid;
	private String ntitle, ncontent, nwriter, nregdate, nupdate, nview;

	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNwriter() {
		return nwriter;
	}
	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}
	public String getNregdate() {
		return nregdate;
	}
	public void setNregdate(String nregdate) {
		this.nregdate = nregdate;
	}
	public String getNupdate() {
		return nupdate;
	}
	public void setNupdate(String nupdate) {
		this.nupdate = nupdate;
	}
	public String getNview() {
		return nview;
	}
	public void setNview(String nview) {
		this.nview = nview;
	}
	
	public Notice() {
	}
	
	public Notice(int nid, String ntitle, String ncontent, String nwriter, String nregdate, String nupdate,
			String nview) {
		this.nid = nid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nwriter = nwriter;
		this.nregdate = nregdate;
		this.nupdate = nupdate;
		this.nview = nview;
	}
	

	
	
}
