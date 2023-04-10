package com.bbang.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	
	@Autowired
	ReviewRepository reviewRepository ;

	@Override
	public List<Review> getReviewById(String sid) {
		return reviewRepository.getReviewById(sid);
	}

}
