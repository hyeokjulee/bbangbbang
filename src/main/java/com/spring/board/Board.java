package com.spring.board;

public class Board {
	private int bid;
	private String bpid, btitle, bcontent, bwriter, bregdate, bupdate, bview;
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBpid() {
		return bpid;
	}
	public void setBpid(String bpid) {
		this.bpid = bpid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBregdate() {
		return bregdate;
	}
	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}
	public String getBupdate() {
		return bupdate;
	}
	public void setBupdate(String bupdate) {
		this.bupdate = bupdate;
	}
	public String getBview() {
		return bview;
	}
	public void setBview(String bview) {
		this.bview = bview;
	}
	
	public Board() {
	}
	
	public Board(int bid, String bpid, String btitle, String bcontent, String bwriter, String bregdate, String bupdate,
			String bview) {
		this.bid = bid;
		this.bpid = bpid;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bregdate = bregdate;
		this.bupdate = bupdate;
		this.bview = bview;
	}
	
	
	
	
}
