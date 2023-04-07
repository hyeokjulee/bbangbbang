package com.bbang.store;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Store {

	private int sid ;  
	private String sname, saddr, stel, sphoto, sphoto2, sopen, smenu, sprice ;
	private MultipartFile sphotoFile;
}