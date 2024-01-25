package com.spring.board;

import lombok.Data;

@Data
public class Board {
	private int bid;
	private String bpid, btitle, bcontent, bwriter, bregdate, bupdate, bview;
}
