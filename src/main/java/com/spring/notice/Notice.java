package com.spring.notice;

import lombok.Data;

@Data
public class Notice {
	private int nid, nview;
	private String ntitle, ncontent, nupdate, nwriter, nregdate;

}
