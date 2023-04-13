package com.spring.notice;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AddNotice {
	private int nid, nview;
	private String nregdate;

	@NotBlank(message = "제목을 입력해주세요.")
	private String ntitle;

	@NotBlank(message = "내용을 입력해주세요.")
	private String ncontent;
}
