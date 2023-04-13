package com.spring.board;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AddBoard {
	private int bid;
	private String bpid, bwriter, bregdate, bupdate, bview;
	
	@NotBlank(message = "제목을 입력해주세요.")
	private String btitle;

	@NotBlank(message = "내용을 입력해주세요.")
	private String bcontent;
}
