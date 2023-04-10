package com.bbang.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbang.store.StoreService;



@Controller
public class ReviewController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	
	
}
