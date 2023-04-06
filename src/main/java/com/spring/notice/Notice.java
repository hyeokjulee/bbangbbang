package com.spring.notice;

public class Notice {

	private int nid;
	private String ntitle, ncontent, nregdate, nupdate;
	
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
	
	public Notice() {
	}
	
	public Notice(int nid, String ntitle, String ncontent, String nregdate, String nupdate) {
		this.nid = nid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nregdate = nregdate;
		this.nupdate = nupdate;
	}
	
	
	
}
