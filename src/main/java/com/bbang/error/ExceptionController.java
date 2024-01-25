package com.bbang.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionController {
	@RequestMapping("/errorcommon")
	public String errorCommon() {
		return "exception/errorCommon";
	}
}
