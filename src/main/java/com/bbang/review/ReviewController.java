package com.bbang.review;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bbang.store.StoreService;



@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@ResponseBody
	@PostMapping("update")
	public void updateReviewAjax(@RequestParam Map<String, Object> map ) {
		
		System.out.println(map.get("rid")); 
		System.out.println(map.get("rscore")); 
		System.out.println(map.get("rcontent")); 
		
		reviewService.updateReview(map);
	}

	@ResponseBody
	@PostMapping("delete")
	public void deleteReviewAjax(@RequestParam ("rid") String rid) {
		
		System.out.println(rid);
		 
		reviewService.deleteReview(rid);
	}
	
	@ResponseBody
	@PostMapping("insert")
	public void insertReview(@RequestParam Map<String, Object> map) {
		
		System.out.println(map.get("sid"));
		map.put("sid", map.get("sid")) ;
		 
		System.out.println(map.get("uid"));
		System.out.println(map.get("rcontent"));
		System.out.println(map.get("rscore"));

		 
		reviewService.insertReview(map);
	}
	
}
