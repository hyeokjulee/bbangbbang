package com.spring.board;

public class Board {
	private int bid;
	private String btitle, bcontent, bregdate, bupdate;
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
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
	
	public Board() {
	}
	
	public Board(int bid, String btitle, String bcontent, String bregdate, String bupdate) {
		this.bid = bid;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bregdate = bregdate;
		this.bupdate = bupdate;
	}

	
	
}
